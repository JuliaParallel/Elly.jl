@doc doc"""
Default length (bytes) upto which to pre-fetch block metadata.
(10 blocks of default size)
""" ->
const HDFS_READER_WINDOW_LENGTH = uint64(64*1024*1024*10)

@doc doc"""
# HDFSFileReader
Provides Julia IO APIs for reading HDFS files.
Communicates with namenode for file metadata (through HDFSClient)
and to datanodes for file data (through HDFSBlockReader)
""" ->
type HDFSFileReader
    client::HDFSClient
    path::AbstractString
    size::UInt64
    block_sz::UInt64
    crc_check::Bool                         # whether to check CRC with file operations
    buffer::IOBuffer                        # to hold excess data read from HDFSBlockReader (should use a bucket brigade)
    fptr::UInt64                            # absolute offset in file we start (0:filesize. filesize => eof)
    blocks::Nullable{LocatedBlocksProto}    # block metadata around the current fptr (if connected)
    blk_reader::Nullable{HDFSBlockReader}   # current block reader (if connected)

    function HDFSFileReader(client::HDFSClient, path::AbstractString, offset::UInt64=uint64(0), check_crc::Bool=false)
        path = abspath(client, path)

        nfile_status = _get_file_info(client, path)
        isnull(nfile_status) && throw(HDFSException("File not found: $path"))
        file_status = get(nfile_status)
        (file_status.fileType == HdfsFileStatusProto_FileType.IS_FILE) || throw(HDFSException("Not a regular file: $path"))

        size = file_status.length
        block_sz = file_status.blocksize
        new(client, path, size, block_sz, check_crc, PipeBuffer(), offset, Nullable{LocatedBlocksProto}(), Nullable{HDFSBlockReader}())
    end
end

function URI(reader::HDFSFileReader, show_offset::Bool)
    ch = reader.client.channel
    user_spec = isempty(ch.user) ? ch.user : "$(ch.user)@"
    offset = show_offset ? "#$(reader.fptr)" : ""
    URI("hdfs://$(user_spec)$(ch.host):$(ch.port)$(reader.path)$(offset)")
end

show(io::IO, reader::HDFSFileReader) = println(io, "HDFSFileReader: $(URI(reader, true))")

#
# File pointer
eof(reader::HDFSFileReader) = (reader.fptr+1 > reader.size)
position(reader::HDFSFileReader) = reader.fptr
filesize(reader::HDFSFileReader) = reader.size
nb_available(reader::HDFSFileReader) = filesize(reader) - position(reader)

function seek(reader::HDFSFileReader, n::Integer)
    (n == reader.fptr) && return
    (0 <= n <= filesize(reader)) || throw(HDFSException("invalid seek position $n"))
    reader.fptr = n
    # TODO: do not disconnect if new fptr is still within the reach
    isconnected(reader) && disconnect(reader)
    nothing
end
seekend(reader::HDFSFileReader) = seek(reader, filesize(reader))
seekstart(reader::HDFSFileReader) = seek(reader, 0)
skip(reader::HDFSFileReader, n::Integer) = seek(reader, uint64(n+position(reader)))

_block_has_offset(block::LocatedBlockProto, offset::UInt64, block_sz::UInt64) = (block.offset <= offset < (block.offset + block_sz))

function _find_block(blocks::LocatedBlocksProto, offset::UInt64, block_sz::UInt64)
    if isfilled(blocks, :blocks)
        blockarr = blocks.blocks
        for block in blockarr
            if _block_has_offset(block, offset, block_sz)
                block.corrupt && throw(HDFSException("Corrupt block found at offset $(block.offset)"))
                return Nullable(block)
            end
        end
    end
    Nullable{LocatedBlockProto}()
end

function _current_window(reader::HDFSFileReader)
    isnull(reader.blocks) && (return 0:-1)
    blocks = get(reader.blocks)

    block = blocks.blocks[end]
    window_max = block.offset + block.b.numBytes
    window_min = blocks.blocks[1].offset
    window_min:(window_max-1)
end

isconnected(reader::HDFSFileReader) = !isnull(reader.blk_reader)
function disconnect(reader::HDFSFileReader)
    logmsg("disconnecting $(URI(reader,true))")
    if !isnull(reader.blocks)
        reader.blocks = Nullable{LocatedBlocksProto}()
    end
    if !isnull(reader.blk_reader) 
        blk_reader = get(reader.blk_reader)
        isconnected(blk_reader) && disconnect(blk_reader)
        reader.blk_reader = Nullable{HDFSBlockReader}()
    end
    reader.buffer = PipeBuffer()
    nothing
end
 
function connect(reader::HDFSFileReader)
    logmsg("connect if required $(URI(reader,true))")
    eof(reader) && return
    isconnected(reader) && return

    logmsg("connecting $(URI(reader,true))")
    if !(reader.fptr in _current_window(reader))
        logmsg("moving block window for  $(URI(reader,true))")
        len = min(nb_available(reader), HDFS_READER_WINDOW_LENGTH)
        nblocks = _get_block_locations(reader.client, reader.path, reader.fptr, len)
        isnull(nblocks) && throw(HDFSException("Could not get block metadata for $(URI(reader,true))"))
        blocks = get(nblocks)
        reader.blocks = blocks
    else
        blocks = get(reader.blocks)
    end

    nblock = _find_block(blocks, reader.fptr, reader.block_sz)
    isnull(nblock) && throw(HDFSException("Could not get block metadata for $(URI(reader,true))"))
    block = get(nblock)
    block.corrupt && throw(HDFSException("Corrupt block found for $(URI(reader,true))"))

    nnode,ndnode = _select_node_for_block(block)
    isnull(nnode) && throw(HDFSException("Could not get a valid datanode for $(URI(reader,true))"))
    node = get(nnode)

    block_len = block.b.numBytes
    offset_into_block = (reader.fptr % reader.block_sz)
    len = block_len - offset_into_block

    if !isnull(reader.blk_reader)
        logmsg("disconnecting old block reader")
        disconnect(get(reader.blk_reader))
    end
    logmsg("creating new block reader")
    reader.blk_reader = Nullable(HDFSBlockReader(node.ipAddr, node.xferPort, block, offset_into_block, len, reader.crc_check))
    nothing
end

function _read_and_buffer(reader::HDFSFileReader, out::Array{UInt8,1}, offset::UInt64, len::UInt64)
    requested = len
    # while data remains to be copied
    while len > 0
        # set/reset block reader if required
        if !isnull(reader.blk_reader)
            blk_reader = get(reader.blk_reader)
            if eof(blk_reader)
                disconnect(blk_reader)
                reader.blk_reader = Nullable{HDFSBlockReader}()
                connect(reader)
            end
        else
            connect(reader)
        end
        blk_reader = get(reader.blk_reader)
        # read chunk from reader
        chunk = read_chunk!(blk_reader)

        # copy into out and advance fptr
        chunk_len = length(chunk)
        copylen = min(len, chunk_len)
        for i in 1:copylen
            out[offset+i] = chunk[i]
        end
        offset += copylen
        reader.fptr += copylen
        len -= copylen
        
        # copy remaining data to buffer
        if copylen < chunk_len
            Base.write_sub(reader.buffer, chunk, copylen+1, chunk_len-copylen)
        end
    end
    requested - len
end

close(reader::HDFSFileReader) = disconnect(reader::HDFSFileReader)

#
# File read
function read!{T}(reader::HDFSFileReader, a::Array{T})
    remaining::UInt64 = length(a)*sizeof(T)
    offset::UInt64 = 0
    # while not eof and remaining to be filled
    while !eof(reader) && (remaining > 0)
        navlb = nb_available(reader.buffer)
        # if buffer empty, fill buffer
        if navlb == 0
            nbytes = _read_and_buffer(reader, a, offset, remaining)
        else
            nbytes = min(navlb, remaining)
            logmsg("reading $nbytes from buffer. navlb:$navlb remaining:$remaining, offset:$offset")
            Base.read_sub(reader.buffer, a, offset+1, nbytes)
        end
        # fill from buffer
        (nbytes == 0) && break
        remaining -= nbytes
        offset += nbytes
    end
    (remaining > 0) && throw(EOFError())
    a
end
readbytes(reader::HDFSFileReader, nb::Integer) = read!(reader, Array(Uint8, nb))
readall(reader::HDFSFileReader) = readbytes(reader, nb_available(reader))

function hdfs_cptolocal(client::HDFSClient, hdfs_path::AbstractString, local_path::AbstractString; offset::UInt64=uint64(0), len::UInt64=uint64(0))
    reader = open(client, hdfs_path, "r"; offset=offset)
    hdfs_cptolocal(reader, local_path::AbstractString; len=len)
end

function hdfs_cptolocal(reader::HDFSFileReader, local_path::AbstractString; len::UInt64=uint64(0))
    brem = btot = (len == 0) ? nb_available(reader) : len
    buff_sz = 128*1024
    buff = Array(UInt8, buff_sz)
    open(local_path, "w") do f
        while !eof(reader)
            bread = min(brem, buff_sz)
            (bread == length(buff)) || resize!(buff, bread)
            read!(reader, buff)
            write(f, buff)
            brem -= bread
            logmsg("remaining $brem/$btot")
        end
    end
    nothing
end

@doc doc"""
# HDFSFileWriter
Provides Julia IO APIs for writing HDFS files.

Steps:
- get datanodes to write onto from namenode
- break bytes into packets
- write packets into first datanode's data channel (datanode will mirror packets to downstream datanodes)
- when complete, confirm namenode with a blockReceived

On close call NameNode.complete to:
- remove lease
    lease is a write lock for file modification. no leases are required for reading files.
    leases are managed by namenode
    lease is added on file create or append
    dfs client should start thread to renew leases periodically
- change file from under construction to complete
""" ->
type HDFSFileWriter
    client::HDFSClient
    path::AbstractString
    fptr::UInt64
    blk_writer::Nullable{HDFSBlockWriter}

    function HDFSFileWriter(client::HDFSClient, path::AbstractString)
        path = abspath(client, path)
        new(client, path, 0, Nullable{HDFSBlockWriter}())
    end
end

function URI(writer::HDFSFileWriter, show_offset::Bool)
    ch = writer.client.channel
    user_spec = isempty(ch.user) ? ch.user : "$(ch.user)@"
    offset = show_offset ? "#$(writer.fptr)" : ""
    URI("hdfs://$(user_spec)$(ch.host):$(ch.port)$(writer.path)$(offset)")
end

show(io::IO, reader::HDFSFileWriter) = println(io, "HDFSFileWriter: $(URI(writer, true))")

function renewlease(writer::HDFSFileWriter)
    renewlease(writer.client)
end

function write(writer::HDFSFileWriter, data::Vector{UInt8})
    if isnull(writer.blk_writer)
        blk = _add_block(writer.client, writer.path)
        blk_writer = HDFSBlockWriter(blk, _get_server_defaults(writer.client))
        writer.blk_writer = Nullable(blk_writer)
    end
    nbytes = write(writer.blk_writer, data)
    if nbytes < length(data)
        flush(writer.blk_writer)
        close(writer.blk_writer)
    end
end

function flush(writer::HDFSFileWriter)
    if !isnull(writer.blk_writer)
        blk_writer = get(writer.blk_writer)
        flush(blk_writer)
        close(writer)
    end
    nothing
end

function close(writer::HDFSFileWriter)
    if !isnull(writer.blk_writer)
        blk_writer = get(writer.blk_writer)
        close(blk_writer)
        writer.blk_writer = Nullable{HDFSBlockWriter}()
    end
    nothing
end

#
# File open
function open(client::HDFSClient, path::AbstractString, rd::Bool, wr::Bool, ff::Bool; 
                replication::UInt32=uint32(0), blocksz::UInt64=uint64(0), mode::UInt32=uint32(0o644), 
                offset::UInt64=uint64(0), crc::Bool=false)
    if rd
        return HDFSFileReader(client, path, offset, crc)
    elseif wr
        if ff
        end
        error("Not implemented")
    else
        throw(ArgumentError("invalid open mode. read:$rd, write:$wr, append:$ff"))
    end
end
open(client::HDFSClient, path::AbstractString; opts...) = open(client, path, true, false, false; opts...)

function open(client::HDFSClient, path::AbstractString, open_mode::AbstractString; opts...)
    open_mode == "r"  ? open(client, path, true , false, false; opts...) :
    open_mode == "w"  ? open(client, path, false, true , false; opts...) :
    open_mode == "a"  ? open(client, path, false, true , true;  opts...) :
    throw(ArgumentError("invalid open mode: $mode"))
end
