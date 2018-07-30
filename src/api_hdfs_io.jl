"""
Default length (bytes) upto which to pre-fetch block metadata.
(10 blocks of default size)
"""
const HDFS_READER_WINDOW_LENGTH = UInt64(64*1024*1024*10)

"""
# HDFSFileReader
Provides Julia IO APIs for reading HDFS files.
Communicates with namenode for file metadata (through HDFSClient)
and to datanodes for file data (through HDFSBlockReader)
"""
mutable struct HDFSFileReader <: IO
    client::HDFSClient
    path::AbstractString
    size::UInt64
    block_sz::UInt64
    crc_check::Bool                             # whether to check CRC with file operations
    buffer::IOBuffer                            # to hold excess data read from HDFSBlockReader (should use a bucket brigade)
    fptr::UInt64                                # absolute offset in file we start (0:filesize. filesize => eof)
    blocks::Union{Nothing,LocatedBlocksProto}   # block metadata around the current fptr (if connected)
    blk_reader::Union{Nothing,HDFSBlockReader}  # current block reader (if connected)

    function HDFSFileReader(client::HDFSClient, path::AbstractString, offset::UInt64=zero(UInt64), check_crc::Bool=false)
        path = abspath(client, path)

        file_status = _get_file_info(client, path)
        (file_status === nothing) && throw(HDFSException("File not found: $path"))
        (file_status.fileType == HdfsFileStatusProto_FileType.IS_FILE) || throw(HDFSException("Not a regular file: $path"))

        size = file_status.length
        block_sz = file_status.blocksize
        new(client, path, size, block_sz, check_crc, PipeBuffer(), offset, nothing, nothing)
    end
end

function URI(reader::HDFSFileReader, show_offset::Bool)
    ch = reader.client.nn_conn.channel
    user = username(ch.ugi)
    user_spec = isempty(user) ? user : "$(user)@"
    offset = show_offset ? "#$(reader.fptr)" : ""
    URI("hdfs://$(user_spec)$(ch.host):$(ch.port)$(reader.path)$(offset)")
end

show(io::IO, reader::HDFSFileReader) = println(io, "HDFSFileReader: $(URI(reader, true))")

#
# File pointer
eof(reader::HDFSFileReader) = (reader.fptr+1 > reader.size)
position(reader::HDFSFileReader) = reader.fptr
filesize(reader::HDFSFileReader) = reader.size
bytesavailable(reader::HDFSFileReader) = filesize(reader) - position(reader)

function seek(reader::HDFSFileReader, n::Integer)
    (n == reader.fptr) && return
    (0 <= n <= filesize(reader)) || throw(HDFSException("invalid seek position $n"))
    reader.fptr = n
    # TODO: do not disconnect if new fptr is still within the reach
    if isconnected(reader)
        reuse = (reader.blk_reader !== nothing) ? eof(reader.blk_reader) : false
        disconnect(reader, reuse)
    end
    nothing
end
seekend(reader::HDFSFileReader) = seek(reader, filesize(reader))
seekstart(reader::HDFSFileReader) = seek(reader, 0)
skip(reader::HDFSFileReader, n::Integer) = seek(reader, UInt64(n+position(reader)))

_block_has_offset(block::LocatedBlockProto, offset::UInt64, block_sz::UInt64) = (block.offset <= offset < (block.offset + block_sz))

function _find_block(blocks::LocatedBlocksProto, offset::UInt64, block_sz::UInt64)
    if isfilled(blocks, :blocks)
        blockarr = blocks.blocks
        for block in blockarr
            if _block_has_offset(block, offset, block_sz)
                block.corrupt && throw(HDFSException("Corrupt block found at offset $(block.offset)"))
                return block
            end
        end
    end
    nothing
end

function _current_window(reader::HDFSFileReader)
    (reader.blocks === nothing) && (return 0:-1)
    blocks = reader.blocks
    block = blocks.blocks[end]
    window_max = block.offset + block.b.numBytes
    window_min = blocks.blocks[1].offset
    window_min:(window_max-1)
end

isconnected(reader::HDFSFileReader) = (reader.blk_reader !== nothing)
function disconnect(reader::HDFSFileReader, reuse::Bool)
    @debug("disconnecting", uri=URI(reader,true), reuse=reuse)
    reader.blocks = nothing
    if reader.blk_reader !== nothing
        isconnected(reader.blk_reader) && disconnect(reader.blk_reader, reuse)
        reader.blk_reader = nothing
    end
    reader.buffer = PipeBuffer()
    nothing
end
 
function connect(reader::HDFSFileReader)
    @debug("connect if required", uri=URI(reader,true))
    eof(reader) && return
    isconnected(reader) && return

    @debug("connecting", uri=URI(reader,true))
    if !(reader.fptr in _current_window(reader))
        @debug("moving block window", uri=URI(reader,true))
        len = min(bytesavailable(reader), HDFS_READER_WINDOW_LENGTH)
        blocks = _get_block_locations(reader.client, reader.path, reader.fptr, len)
        (blocks === nothing) && throw(HDFSException("Could not get block metadata for $(URI(reader,true))"))
        reader.blocks = blocks
    else
        blocks = reader.blocks
    end

    block = _find_block(blocks, reader.fptr, reader.block_sz)
    (block === nothing) && throw(HDFSException("Could not get block metadata for $(URI(reader,true))"))
    block.corrupt && throw(HDFSException("Corrupt block found for $(URI(reader,true))"))

    node_info = _select_node_for_block(block)
    (node_info === nothing) && throw(HDFSException("Could not get a valid datanode for $(URI(reader,true))"))
    node = node_info.id

    block_len = block.b.numBytes
    offset_into_block = (reader.fptr % reader.block_sz)
    len = block_len - offset_into_block
    reader.blk_reader = HDFSBlockReader(node.ipAddr, node.xferPort, block, offset_into_block, len, reader.crc_check)
    nothing
end

function _read_and_buffer(reader::HDFSFileReader, out::Vector{UInt8}, offset::UInt64, len::UInt64)
    requested::UInt64 = len
    try
        # while data remains to be copied
        while len > 0
            # set/reset block reader if required
            if reader.blk_reader !== nothing
                blk_reader = reader.blk_reader
                if eof(blk_reader)
                    disconnect(blk_reader, true)
                    reader.blk_reader = nothing
                    connect(reader)
                end
            else
                connect(reader)
            end
            blk_reader = reader.blk_reader

            # read packet from reader
            ret = read_packet!(blk_reader, out, offset)                     # try to read directly into output
            if ret < 0
                pkt_len = len + UInt64(abs(ret))                            # bytes in this packet
                buff = Vector{UInt8}(undef, pkt_len)                        # allocate a temporary array
                @debug("allocated temporary array", size=pkt_len, len=len, ret=ret, offset=offset, bufflen=length(buff), outlen=length(out))
                ret = read_packet!(blk_reader, buff, UInt64(1))             # read complete packet
                copyto!(out, offset, buff, 1, len)                          # copy len bytes to output
                Base.write_sub(reader.buffer, buff, len+1, pkt_len-len)     # copy remaining data to buffer
                copylen = len
                len = 0                                                     # we definitely do not need to read any more
            else
                copylen = len - ret                                         # packet was read directly into output
                len = ret                                                   # we may still have to read more data
            end
            offset += copylen
            reader.fptr += copylen
        end
    catch ex
        if reader.blk_reader !== nothing
            blk_reader = reader.blk_reader
            channel = blk_reader.channel
            @debug("exception receiving from $(channel.host):$(channel.port)", ex=ex)
        else
            @debug("exception receiving", ex=ex)
        end
        disconnect(reader, false)
        rethrow(ex)
    end
    requested
end

function close(reader::HDFSFileReader)
    reuse = false
    if reader.blk_reader !== nothing
        blk_reader = reader.blk_reader
        reuse = eof(blk_reader)
    end
    disconnect(reader, reuse)
end

#
# File read
function read!(reader::HDFSFileReader, a::Vector{UInt8})
    remaining::UInt64 = length(a)*sizeof(UInt8)
    offset::UInt64 = 1
    # while not eof and remaining to be filled
    while !eof(reader) && (remaining > 0)
        if (reader.fptr == reader.size)
            reader.fptr += 1
            break
        end
        navlb = bytesavailable(reader.buffer)
        # if buffer empty, fill buffer
        if navlb == 0
            if (reader.fptr + remaining) > reader.size
                canread = reader.size - reader.fptr
                tb = Vector{UInt8}(undef, Int(canread/sizeof(UInt8)))
                nbytes = _read_and_buffer(reader, tb, UInt64(1), canread)
                copyto!(a, offset, tb, 1, length(tb))
            else
                nbytes = _read_and_buffer(reader, a, offset, remaining)
            end
        else
            nbytes = min(navlb, remaining)
            @debug("reading $nbytes from buffer", nbytes=nbytes, navlb=navlb, remaining=remaining, offset=offset)
            Base.read_sub(reader.buffer, a, offset, nbytes)
            reader.fptr += nbytes
        end
        # fill from buffer
        (nbytes == 0) && break
        remaining -= nbytes
        offset += nbytes
    end
    (remaining > 0) && throw(EOFError())
    a
end
const _a = Vector{UInt8}(undef, 1)
read(reader::HDFSFileReader, ::Type{UInt8}) = (read!(reader, _a); _a[1])
readbytes(reader::HDFSFileReader, nb::Integer) = read!(reader, Vector{UInt8}(undef, nb))
readall(reader::HDFSFileReader) = readbytes(reader, bytesavailable(reader))

"""
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
"""
mutable struct HDFSFileWriter <: IO
    client::HDFSClient
    path::AbstractString
    fptr::UInt64
    blk::Union{Nothing,LocatedBlockProto}
    blk_writer::Union{Nothing,HDFSBlockWriter}

    function HDFSFileWriter(client::HDFSClient, path::AbstractString)
        path = abspath(client, path)
        path_exists = exists(client, path)
        fs = _create_file(client, path, path_exists, zero(UInt32), zero(UInt64), DEFAULT_FILE_MODE, false)
        (fs === nothing) && throw(HDFSException("Error openeing $path for write"))
        new(client, path, 0, nothing, nothing)
    end
end

function URI(writer::HDFSFileWriter, show_offset::Bool)
    ch = writer.client.nn_conn.channel
    user = username(ch.ugi)
    user_spec = isempty(user) ? user : "$(user)@"
    offset = show_offset ? "#$(writer.fptr)" : ""
    URI("hdfs://$(user_spec)$(ch.host):$(ch.port)$(writer.path)$(offset)")
end

show(io::IO, writer::HDFSFileWriter) = println(io, "HDFSFileWriter: $(URI(writer, true))")

function renewlease(writer::HDFSFileWriter)
    hdfs_renewlease(writer.client)
end

function _write(writer::HDFSFileWriter, data::T) where T<:Union{UInt8,Vector{UInt8}}
    rem_data = data
    L = rem_len = length(data)

    while rem_len > 0
        if writer.blk_writer === nothing
            blk = _add_block(LocatedBlockProto, writer.client, writer.path, writer.blk)
            blk_writer = HDFSBlockWriter(blk, _get_server_defaults(writer.client))
            writer.blk_writer = blk_writer
            writer.blk = blk
        else
            blk_writer = writer.blk_writer
        end

        rem_len -= write(blk_writer, rem_data)
        if rem_len > 0
            flush(blk_writer)
            disconnect(blk_writer, true)
            writer.blk_writer = nothing
            (T <: UInt8) || (rem_data = unsafe_wrap(Array, pointer(data, L-rem_len+1), rem_len))
        end
    end
    L
end
write(writer::HDFSFileWriter, data::UInt8) = _write(writer, data)
write(writer::HDFSFileWriter, data::Vector{UInt8}) = _write(writer, data)

function close(writer::HDFSFileWriter)
    if writer.blk_writer !== nothing
        blk_writer = writer.blk_writer
        flush(blk_writer)
        disconnect(blk_writer, true)
        _complete_file(writer.client, writer.path, blk_writer.block.b)
        writer.blk_writer = nothing
    end
    nothing
end

#
# File open
function open(client::HDFSClient, path::AbstractString, rd::Bool, wr::Bool, ff::Bool; 
                replication::UInt32=zero(UInt32), blocksz::UInt64=zero(UInt64), mode::UInt32=DEFAULT_FILE_MODE, 
                offset::UInt64=zero(UInt64), crc::Bool=false)
    if rd
        return HDFSFileReader(client, path, offset, crc)
    elseif wr
        if ff
            error("Not implemented")
        else
            return HDFSFileWriter(client, path)
        end
    else
        throw(ArgumentError("invalid open mode. read:$rd, write:$wr, append:$ff"))
    end
end
open(file::HDFSFile, rd::Bool, wr::Bool, ff::Bool; opts...) = open(file.client, file.path, rd, wr, ff; opts...)
open(client::HDFSClient, path::AbstractString; opts...) = open(client, path, true, false, false; opts...)
open(file::HDFSFile; opts...) = open(file.client, file.path; opts...)

function open(client::HDFSClient, path::AbstractString, open_mode::AbstractString; opts...)
    open_mode == "r"  ? open(client, path, true , false, false; opts...) :
    open_mode == "w"  ? open(client, path, false, true , false; opts...) :
    open_mode == "a"  ? open(client, path, false, true , true;  opts...) :
    throw(ArgumentError("invalid open mode: $mode"))
end
open(file::HDFSFile, open_mode::AbstractString; opts...) = open(file.client, file.path, open_mode; opts...)
function open(fn::Function, file::Union{HDFSFile,HDFSClient}, args...; kwargs...)
    io = nothing
    try
        io = open(file, args...; kwargs...)
        return fn(io)
    catch ex
        rethrow(ex)
    finally
        close(io)
    end
end

#
# File copy
function cp(frompath::Union{HDFSFile,AbstractString}, topath::Union{HDFSFile,AbstractString}; offset::UInt64=zero(UInt64), len::UInt64=zero(UInt64), crc::Bool=false)
    if isa(frompath, HDFSFile)
        fromfile = open(frompath.client, frompath.path, "r"; offset=offset, crc=crc)
    else
        fromfile = open(frompath, "r")
        (offset > 0) && skip(fromfile, offset)
    end

    if isa(topath, HDFSFile)
        tofile = open(topath.client, topath.path, "w")
    else
        tofile = open(topath, "w")
    end

    buff_sz = 64*1024*1024
    buff = Vector{UInt8}(undef, buff_sz)
    brem = btot = (len == 0) ? (filesize(fromfile)-offset) : len
    while brem > 0
        bread = min(brem, buff_sz)
        (bread == length(buff)) || resize!(buff, bread)
        read!(fromfile, buff)
        write(tofile, buff)
        brem -= bread
        @debug("remaining $brem/$btot")
    end
    close(fromfile)
    close(tofile)
    nothing
end
