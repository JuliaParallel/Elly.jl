# ref: https://wiki.apache.org/hadoop/HadoopRpc
const HRPC_HEADER = "hrpc"
const HRPC_VERSION = 0x09
const HRPC_SERVICE_CLASS = 0x00
const HRPC_AUTH_PROTOCOL_NONE = 0x00
const HRPC_PROTOBUFF_TYPE = RpcKindProto.RPC_PROTOCOL_BUFFER
const HRPC_FINAL_PACKET = RpcRequestHeaderProto_OperationProto.RPC_FINAL_PACKET
const HRPC_CLIENT_PROTOCOL = "org.apache.hadoop.hdfs.protocol.ClientProtocol"
const HRPC_CLIENT_PROTOCOL_VERSION = uint64(1)

# The call id is set to -3 during initial handshake. Post the handshake it cycles sequentially between 1:typemax(Int32)
const HRPC_CALL_ID_HANDSHAKE = -3
const HRPC_CALL_ID_NORMAL = 0

type HadoopRpcException <: Exception
    status::Int32
    message::AbstractString
    function HadoopRpcException(header::RpcResponseHeaderProto)
        new(header.status, header.errorMsg)
    end
    function HadoopRpcException(msg::AbstractString)
        new(RpcResponseHeaderProto_RpcStatusProto.ERROR, msg)
    end
end

# Utility methods
crc32 = crc(CRC_32)
crc32c = crc(CRC_32_C)

function _len_uleb{T <: Integer}(x::T)
    nw = 1
    while ((x >>>= 7) != 0)
        nw += 1
    end
    nw
end

function buffer_size_delimited(channelbuff::IOBuffer, obj)
    iob = IOBuffer()
    writeproto(iob, obj)

    data = takebuf_array(iob)
    len = write_bytes(channelbuff, data)
    logmsg("$(typeof(obj)) -> $data")
    logmsg("$(typeof(obj)) -> buffer. len $len")
    len
end

function send_buffered(buff::IOBuffer, sock::TCPSocket, delimited::Bool)
    data = takebuf_array(buff)
    len::UInt32 = 0
    if delimited
        len = write(sock, hton(uint32(length(data))))
    end
    len += write(sock, data)
    logmsg("buffer -> sock. len $len")
    len
end

function recv_blockop(channel::HadoopDataChannel)
    logmsg("recv block read message")
    data_bytes = read_bytes(get(channel.sock))
    logmsg("block_resp <- sock. len $(length(data_bytes))")

    block_resp = BlockOpResponseProto()
    readproto(IOBuffer(data_bytes), block_resp)

    (block_resp.status == Status.SUCCESS) || throw(HadoopRpcException("Error in block operation: $(block_resp.status): $(block_resp.message)"))
    return block_resp
end

#
# Hadoop RPC Channel
type HadoopRpcController <: ProtoRpcController
    debug::Bool
end

type HadoopRpcChannel <: ProtoRpcChannel
    host::AbstractString
    port::Integer
    call_id::Int32          # see: RpcRequestHeaderProto.callId
    sent_call_id::Int32     # set to the last call id sent for verification purpose
    clnt_id::ASCIIString    # string(Base.Random.uuid4())
    user::AbstractString
    iob::IOBuffer
    sock::Nullable{TCPSocket}

    function HadoopRpcChannel(host::AbstractString, port::Integer, user::AbstractString)
        call_id = HRPC_CALL_ID_HANDSHAKE
        clnt_id = string(Base.Random.uuid4())[1:16]
        new(host, port, call_id, call_id, clnt_id, user, IOBuffer(), Nullable{TCPSocket}())
    end
end

isconnected(channel::HadoopRpcChannel) = !isnull(channel.sock) # && !eof(get(channel.sock))
begin_send(channel::HadoopRpcChannel) = truncate(channel.iob, 0)
send_buffered(channel::HadoopRpcChannel, delimited::Bool) = send_buffered(channel.iob, get(channel.sock), delimited::Bool)

function next_call_id(channel::HadoopRpcChannel)
    id = channel.sent_call_id = channel.call_id
    channel.call_id = (id == HRPC_CALL_ID_HANDSHAKE) ? HRPC_CALL_ID_NORMAL : 
                      (id < typemax(Int32)) ? (id + int32(1)) : 
                      HRPC_CALL_ID_NORMAL
    id
end

function buffer_handshake(channel::HadoopRpcChannel)
    write(channel.iob, [HRPC_HEADER.data, HRPC_VERSION, HRPC_SERVICE_CLASS, HRPC_AUTH_PROTOCOL_NONE])
end

function buffer_connctx(channel::HadoopRpcChannel)
    userinfo = UserInformationProto()
    set_field(userinfo, :effectiveUser, channel.user)

    connctx = IpcConnectionContextProto()
    set_field(connctx, :userInfo, userinfo)
    set_field(connctx, :protocol, HRPC_CLIENT_PROTOCOL)

    buffer_size_delimited(channel.iob, connctx)
end

function buffer_rpc_reqhdr(channel::HadoopRpcChannel)
    hdr = RpcRequestHeaderProto()
    set_field(hdr, :rpcKind, HRPC_PROTOBUFF_TYPE)
    set_field(hdr, :rpcOp, HRPC_FINAL_PACKET)
    set_field(hdr, :callId, next_call_id(channel))
    set_field(hdr, :clientId, channel.clnt_id.data)
    #set_field(hdr, :retryCount, int32(-1))

    buffer_size_delimited(channel.iob, hdr)
end

function buffer_method_reqhdr(channel::HadoopRpcChannel, method::MethodDescriptor)
    hdr = RequestHeaderProto()
    set_field(hdr, :methodName, method.name)
    set_field(hdr, :declaringClassProtocolName, HRPC_CLIENT_PROTOCOL)
    set_field(hdr, :clientProtocolVersion, HRPC_CLIENT_PROTOCOL_VERSION)

    buffer_size_delimited(channel.iob, hdr)
end

# Connect to the hadoop server and complete the handshake
function connect(channel::HadoopRpcChannel)
    # open connection
    logmsg("connecting to $(channel.host):$(channel.port)")
    try
        sock = connect(channel.host, channel.port)
        channel.sock = Nullable{TCPSocket}(sock)
 
        begin_send(channel)
        buffer_handshake(channel)
        send_buffered(channel, false)

        begin_send(channel)
        buffer_rpc_reqhdr(channel)
        buffer_connctx(channel)
        send_buffered(channel, true)
        logmsg("connected to $(channel.host):$(channel.port)")
    catch ex
        logmsg("exception connecting to $(channel.host):$(channel.port): $ex")
        disconnect(channel)
        rethrow(ex)
    end
    nothing
end

# Disconnect and reset the channel instance.
# Client Id is also reset and so this is in essence an entirely new channel.
function disconnect(channel::HadoopRpcChannel)
    try
        isconnected(channel) && close(get(channel.sock))
    catch ex
        logmsg("exception while closing channel socket $ex")
    end
    channel.sock = Nullable{TCPSocket}()
    channel.call_id = HRPC_CALL_ID_HANDSHAKE
    channel.clnt_id = string(Base.Random.uuid4())[1:16]
end

function send_rpc_message(channel::HadoopRpcChannel, controller::HadoopRpcController, method::MethodDescriptor, params)
    isconnected(channel) || connect(channel)

    try
        logmsg("send rpc message. method: $(method.name)")
        begin_send(channel)
        buffer_rpc_reqhdr(channel)
        buffer_method_reqhdr(channel, method)
        buffer_size_delimited(channel.iob, params)
        send_buffered(channel, true)
    catch ex
        logmsg("exception sending to $(channel.host):$(channel.port): $ex")
        disconnect(channel)
        rethrow(ex)
    end
    nothing
end

function recv_rpc_message(channel::HadoopRpcChannel, controller::HadoopRpcController, resp)
    try
        logmsg("recv rpc message")
        msg_len = ntoh(read(get(channel.sock), UInt32))
        hdr_bytes = read_bytes(get(channel.sock))
        logmsg("hdr <- sock. len $(length(hdr_bytes))")

        resp_hdr = RpcResponseHeaderProto()
        readproto(IOBuffer(hdr_bytes), resp_hdr)

        (resp_hdr.callId == channel.sent_call_id) || throw(HadoopRpcException("unknown callid. received:$(resp_hdr.callId) sent:$(channel.sent_call_id)"))
        (resp_hdr.status == RpcResponseHeaderProto_RpcStatusProto.SUCCESS) || throw(HadoopRpcException(resp_hdr))

        if resp_hdr.status == RpcResponseHeaderProto_RpcStatusProto.SUCCESS
            hdr_len = uint32(length(hdr_bytes))
            hdr_len += _len_uleb(hdr_len)
            if msg_len > hdr_len
                data_bytes = read_bytes(get(channel.sock))
                logmsg("data <- sock. len $(length(data_bytes))")
                data_len = msg_len - hdr_len - _len_uleb(length(data_bytes))
                (length(data_bytes) == data_len) || throw(HadoopRpcException("unexpected response data length. expected:$(data_len) read:$(length(data_bytes))"))
                readproto(IOBuffer(data_bytes), resp)
            end
        end
    catch ex
        logmsg("exception receiving from $(channel.host):$(channel.port): $ex")
        disconnect(channel)
        rethrow(ex)
    end
    nothing
end

function call_method(channel::HadoopRpcChannel, method::MethodDescriptor, controller::HadoopRpcController, params)
    logmsg("call_method $(method.name)")
    send_rpc_message(channel, controller, method, params)
    resp_type = get_response_type(method)
    resp = resp_type()
    recv_rpc_message(channel, controller, resp)
    resp
end


#
# Hadoop Data Channel. Base type for communicating with data nodes.

# Opcodes
const HDATA_VERSION             = int16(28)
const HDATA_WRITE_BLOCK         = int8(80)
const HDATA_READ_BLOCK          = int8(81)
const HDATA_READ_METADATA       = int8(82)
const HDATA_REPLACE_BLOCK       = int8(83)
const HDATA_COPY_BLOCK          = int8(84)
const HDATA_BLOCK_CHECKSUM      = int8(85)
const HDATA_TRANSFER_BLOCK      = int8(86)

type HadoopDataChannel
    host::AbstractString
    port::Integer
    iob::IOBuffer
    sock::Nullable{TCPSocket}

    HadoopDataChannel(host::AbstractString, port::Integer) = new(host, port, IOBuffer(), Nullable{TCPSocket}())
end

function connect(channel::HadoopDataChannel)
    logmsg("connecting to datanode $(channel.host):$(channel.port)")
    try
        sock = connect(channel.host, channel.port)
        channel.sock = Nullable{TCPSocket}(sock)
    catch ex
        logmsg("exception connecting to datanode $(channel.host):$(channel.port): $ex")
        rethrow(ex)
    end
    logmsg("connected to datanode $(channel.host):$(channel.port)")
    nothing
end

function disconnect(channel::HadoopDataChannel)
    try
        isconnected(channel) && close(get(channel.sock))
    catch ex
        logmsg("exception while closing channel socket $ex")
    end
    channel.sock = Nullable{TCPSocket}()
    nothing
end

isconnected(channel::HadoopDataChannel) = !isnull(channel.sock) # && !eof(get(channel.sock))
begin_send(channel::HadoopDataChannel) = truncate(channel.iob, 0)
send_buffered(channel::HadoopDataChannel, delimited::Bool) = send_buffered(channel.iob, get(channel.sock), delimited::Bool)

function buffer_opcode(channel::HadoopDataChannel, opcode::Int8)
    len = write(channel.iob, hton(uint16(HDATA_VERSION)))
    len += write(channel.iob, opcode)
end


function _select_node_for_block(block::LocatedBlockProto)
    nodes = DatanodeIDProto[]
    dnodes = DatanodeInfoProto[]
    for loc in block.locs
        (loc.adminState == DatanodeInfoProto_AdminState.NORMAL) || continue
        node_id = loc.id
        push!(nodes, node_id)
        push!(dnodes, loc)
    end
    isempty(nodes) && (return (Nullable{DatanodeIDProto}(), Nullable{DatanodeInfoProto}()))
    # TODO: algo to select best node
    return (Nullable{DatanodeIDProto}(nodes[1]), Nullable{DatanodeInfoProto}(dnodes[1]))
end


#
# Block Reader to read data
type HDFSBlockReader
    channel::HadoopDataChannel

    # block and region assigned
    block::LocatedBlockProto
    offset::UInt64
    len::UInt64

    # protocol data
    block_op_resp::Nullable{BlockOpResponseProto}
    total_read::UInt64

    pkt_hdr::Nullable{PacketHeaderProto}
    packet_len::UInt64
    packet_read::UInt64

    chunk_len::UInt64
    chunk_count::UInt64
    chunks_read::UInt64
    chunk::Array{UInt8,1}

    checksums::Array{UInt32,1}
    chk_crc::Bool

    function HDFSBlockReader(host::AbstractString, port::Integer, block::LocatedBlockProto, offset::UInt64, len::UInt64, chk_crc::Bool)
        channel = HadoopDataChannel(host, port)
        logmsg("creating block reader for offset $offset at $host:$port for length $len")
        new(channel, block, offset, len,
            Nullable{BlockOpResponseProto}(), 0,
            Nullable{PacketHeaderProto}(), 0, 0, 
            0, 0, 0, UInt8[],
            UInt32[], chk_crc)
    end
end

isconnected(reader::HDFSBlockReader) = isconnected(reader.channel)
function disconnect(reader::HDFSBlockReader)
    isconnected(reader.channel) && disconnect(reader.channel)

    reader.block_op_resp = Nullable{BlockOpResponseProto}()
    reader.total_read = 0
    reader.pkt_hdr = Nullable{PacketHeaderProto}()
    reader.packet_len = 0
    reader.packet_read = 0
    reader.chunk_len = 0
    reader.chunk_count = 0
    reader.chunks_read = 0
    reader.chunk = UInt8[]
    reader.checksums = UInt32[]
    nothing
end

function buffer_readblock(reader::HDFSBlockReader)
    channel = reader.channel
    block = reader.block
    offset = reader.offset
    len = reader.len

    token = TokenProto()
    for fld in (:identifier, :password, :kind, :service)
        set_field(token, fld, get_field(block.blockToken, fld))
    end

    exblock = ExtendedBlockProto()
    for fld in (:poolId, :blockId, :generationStamp)
        set_field(exblock, fld, get_field(block.b, fld))
    end

    basehdr = BaseHeaderProto()
    set_field(basehdr, :block, exblock)
    set_field(basehdr, :token, token)
    
    hdr = ClientOperationHeaderProto()
    set_field(hdr, :baseHeader, basehdr)
    set_field(hdr, :clientName, ELLY_CLIENTNAME)

    readblock = OpReadBlockProto()
    set_field(readblock, :offset, offset)
    set_field(readblock, :len, len)
    set_field(readblock, :header, hdr)
    logmsg("sending block read message for offset $offset len $len")

    buffer_size_delimited(channel.iob, readblock)
end

function buffer_client_read_status(reader::HDFSBlockReader, status::Int32)
    channel = reader.channel
    read_status = ClientReadStatusProto()
    set_field(read_status, :status, Status.SUCCESS)
    buffer_size_delimited(channel.iob, read_status)
end

function send_block_read(reader::HDFSBlockReader)
    channel = reader.channel
    isconnected(channel) || connect(channel)

    try
        logmsg("send block read message")
        begin_send(channel)
        buffer_opcode(channel, HDATA_READ_BLOCK)
        buffer_readblock(reader)
        send_buffered(channel, false)
    catch ex
        logmsg("exception sending to $(channel.host):$(channel.port): $ex")
        disconnect(reader)
        rethrow(ex)
    end
    nothing
end

function send_read_status(reader::HDFSBlockReader, status::Int32=Status.SUCCESS)
    channel = reader.channel
    try
        logmsg("send read status $status")
        buffer_client_read_status(reader, status)
        send_buffered(channel, false)
    catch ex
        logmsg("exception sending to $(channel.host):$(channel.port): $ex")
        disconnect(reader)
        rethrow(ex)
    end
    nothing
end

function recv_blockop(reader::HDFSBlockReader)
    channel = reader.channel
    try
        block_resp = recv_blockop(channel)
        checksum_type = block_resp.readOpChecksumInfo.checksum._type
        (checksum_type == ChecksumTypeProto.CHECKSUM_CRC32) || (checksum_type == ChecksumTypeProto.CHECKSUM_CRC32C) || throw(HadoopRpcException("Unknown checksum type $checksum_type"))
        reader.block_op_resp = Nullable(block_resp)
    catch ex
        logmsg("exception receiving from $(channel.host):$(channel.port): $ex")
        disconnect(reader)
        rethrow(ex)
    end
    nothing
end

function recv_packet_hdr(reader::HDFSBlockReader)
    channel = reader.channel
    try
        #logmsg("recv block packet message")
        sock = get(channel.sock)

        pkt_len = ntoh(read(sock, UInt32))
        hdr_len = ntoh(read(sock, UInt16))
        hdr_bytes = Array(UInt8, hdr_len)
        read!(sock, hdr_bytes)
        #logmsg("pkt_hdr <- sock. len $(hdr_len) (pkt_len: $pkt_len)")

        pkt_hdr = PacketHeaderProto()
        readproto(IOBuffer(hdr_bytes), pkt_hdr)

        data_len = pkt_hdr.dataLen
        block_op_resp = get(reader.block_op_resp)
        reader.chunk_len = block_op_resp.readOpChecksumInfo.checksum.bytesPerChecksum
        reader.chunk = Array(UInt8, reader.chunk_len)
        reader.chunk_count = div(data_len + reader.chunk_len - 1, reader.chunk_len)    # chunk_len-1 to take care of chunks with partial data
        reader.chunks_read = 0
        logmsg("received packet with $(reader.chunk_count) chunks of $(reader.chunk_len) bytes each in $data_len bytes of data")

        checksums = Array(UInt32, reader.chunk_count)
        read!(sock, checksums)
        #logmsg("checksums <- sock. len $(sizeof(checksums))")
        for idx in 1:length(checksums)
            checksums[idx] = ntoh(checksums[idx])
        end
        reader.packet_len = pkt_len
        #reader.packet_read = 4 + 2 + hdr_len + sizeof(checksums)
        reader.packet_read = 4 + sizeof(checksums)
        reader.pkt_hdr = Nullable(pkt_hdr)
        reader.checksums = checksums
        logmsg("current read position pkt $(reader.packet_read)/$(reader.packet_len), block $(reader.total_read)/$(reader.len)")
        nothing
    catch ex
        logmsg("exception receiving from $(channel.host):$(channel.port): $ex")
        disconnect(reader)
        rethrow(ex)
    end
end

function verify_checksum(reader::HDFSBlockReader)
    block_op_resp = get(reader.block_op_resp)
    checksum_type = block_op_resp.readOpChecksumInfo.checksum._type
    chksum = reader.checksums[reader.chunks_read]
    chunk = reader.chunk
    chunk = copy(chunk)
    if checksum_type == ChecksumTypeProto.CHECKSUM_CRC32
        calc_chksum = crc32(chunk)
    elseif checksum_type == ChecksumTypeProto.CHECKSUM_CRC32C
        calc_chksum = crc32c(chunk)
    else
        throw(HDFSException("Unknown CRC type $checksum_type"))
    end
    (chksum == calc_chksum) || throw(HDFSException("Checksum mismatch at chunk $(reader.chunks_read). Expected $(chksum), got $(calc_chksum)"))
    nothing
end

eofpacket(reader::HDFSBlockReader) = (reader.packet_read >= reader.packet_len)
eof(reader::HDFSBlockReader) = (reader.total_read >= reader.len)
function read_chunk!(reader::HDFSBlockReader)
    channel = reader.channel

    if !isconnected(channel)
        # initiate the stream
        send_block_read(reader)
        recv_blockop(reader)
        recv_packet_hdr(reader)
    elseif eofpacket(reader)
        # send success status
        recv_packet_hdr(reader)
    end

    try
        packet_remaining = reader.packet_len - reader.packet_read
        curr_chunk_len = min(packet_remaining, reader.chunk_len)
        #logmsg("recv $(curr_chunk_len) byte chunk# $(reader.chunks_read+1)/$(reader.chunk_count), pkt $(reader.packet_read)/$(reader.packet_len), block $(reader.total_read)/$(reader.len)")

        sock = get(channel.sock)
        reader.chunk = resize!(reader.chunk, curr_chunk_len)

        read!(sock, reader.chunk)
        reader.chunks_read += 1
        reader.packet_read += curr_chunk_len
        reader.total_read += curr_chunk_len

        # verify crc
        reader.chk_crc && verify_checksum(reader)

        # send the success block read status
        eof(reader) && send_read_status(reader)
        reader.chunk
    catch ex
        logmsg("exception receiving from $(channel.host):$(channel.port): $ex")
        disconnect(reader)
        rethrow(ex)
    end
end


#
# HDFSBlockWriter to write data
type PipelinedPacket
    seqno::UInt64
    hdr::PacketHeaderProto
    bytes::Vector{UInt8}
    checksums::Vector{UInt32}
    acks::Vector{Int32}
end

type WriterPipeline
    pkt_prepared::Vector{PipelinedPacket}
    pkt_ackwait::Vector{PipelinedPacket}
    pkt_ackrcvd::Vector{PipelinedPacket}
    failed::Bool

    WriterPipeline = new(PipelinedPacket[], PipelinedPacket[], PipelinedPacket[], false)
end

function move(from::Vector{PipelinedPacket}, to::Vector{PipelinesPacket}, seqno::UInt64)
    for idx in 1:length(from)
        pkt = from[idx]
        if pkt.seqno == seqno
            push!(to, splice!(from, idx))
            return pkt
        end
    end
    throw(HDFSException("Packet seqno:$seqno not found in pipeline"))
end

enqueue(pipeline::WriterPipeline, pkt::PipelinesPacket) = (push!(pipeline.pkt_prepared, pkt); nothing)

function ackwait(pipeline::WriterPipeline, seqno::UInt64)
    pkt = move(pipeline.pkt_prepared, pipeline.pkt_ackwait, seqno)
    pkt.bytes = UInt8[]
    pkt.checksums = UInt32[]
    nothing
end

function ackrcvd(pipeline::WriterPipeline, seqno::UInt64, acks::Vector{Int32})
    pkt = move(pipeline.pkt_ackwait, pipeline.pkt_ackrcvd, seqno)
    pkt.acks = acks
    for ack in acks
        (ack == Status.SUCCESS) || (pipeline.failed = true)
    end
    nothing
end

pending(pipeline::WriterPipeline) = !(isempty(pipeline.pkt_prepared) && isempty(pipeline.pkt_ackwait))

type HDFSBlockWriter
    channel::HadoopDataChannel
    server_defaults::FsServerDefaultsProto

    block::LocatedBlockProto
    source_node::DatanodeInfoProto
    buffer::IOBuffer

    total_written::UInt64

    pkt_seq::UInt64
    pkt_pipeline::WriterPipeline
    pipeline_task::Nullable{Task}

    function HDFSBlockWriter(block::LocatedBlockProto, defaults::FsServerDefaultsProto)
        nnode,ndnode = _select_node_for_block(writer.block)
        isnull(nnode) && throw(HDFSException("Could not get a valid datanode to write"))

        node = get(nnode)
        dnode = get(ndnode)
        host = node.ipAddr
        port = node.xferPort
        
        channel = HadoopDataChannel(host, port)
        logmsg("creating block writer for offset $(block.offset) at $host:$port")
        new(channel, defaults, block, ndnode, IOBuffer(), 0, 1, WriterPipeline(), Nullable{Task}())
    end
end

isconnected(writer::HDFSBlockWriter) = isconnected(writer.channel)
function disconnect(writer::HDFSBlockWriter)
    isconnected(writer.channel) && disconnect(writer.channel)
    nothing
end

function connect(writer::HDFSBlockWriter)
    connect(writer.channel)
    nothing
end

function write(writer::HDFSBlockWriter, buff::Vector{UInt8})
    defaults = writer.server_defaults
    nbytes = min(defaults.writePacketSize - writer.total_written, length(buff))
    (nbytes > 0) && write_sub(writer.buffer, buff, 1, nbytes)
    #TODO: process_pipeline should be an async task
    process_pipeline(writer)
    writer.pkt_pipeline.failed && throw(HDFSException("Pipeline proecssing has failed"))
    nbytes
end

function flush(writer::HDFSBlockWriter)
    prepare_packet(writer)
    while pending(writer.pkt_pipeline)
        process_pipeline(writer)
        writer.pkt_pipeline.failed && throw(HDFSException("Pipeline proecssing has failed"))
    end
    nothing
end

function process_pipeline(writer::HDFSBlockWriter)
    pipeline = writer.pkt_pipeline
    channel = writer.channel
    sock = get(channel.sock)
    defaults = writer.defaults

    if !isconnected(writer)
        connect(writer)
        send_block_write(writer)
        recv_blockop(writer)
    end

    while !isempty(pipeline.pkt_ackwait) && (nb_available(sock) > 0)
        read_packet_ack(writer)
    end

    while nb_available(writer.buffer) >= defaults.writePacketSize
        prepare_packet(writer)
    end

    while !isempty(pipeline.pkt_prepared)
        pkt = pipeline.pkt_prepared[1]
        write_packet(writer, pkt)
    end
end

function buffer_writeblock(writer::HDFSBlockWriter)
    channel = writer.channel
    block = writer.block
    defaults = writer.server_defaults

    token = TokenProto()
    for fld in (:identifier, :password, :kind, :service)
        set_field(token, fld, get_field(block.blockToken, fld))
    end

    exblock = ExtendedBlockProto()
    for fld in (:poolId, :blockId, :generationStamp)
        set_field(exblock, fld, get_field(block.b, fld))
    end

    basehdr = BaseHeaderProto()
    set_field(basehdr, :block, exblock)
    set_field(basehdr, :token, token)
    
    hdr = ClientOperationHeaderProto()
    set_field(hdr, :baseHeader, basehdr)
    set_field(hdr, :clientName, ELLY_CLIENTNAME)

    chksum = ChecksumProto()
    chksum._type = defaults.checksumType
    chksum.bytesPerChecksum = defaults.bytesPerChecksum

    writeblock = OpWriteBlockProto()
    set_field(writeblock, :header, hdr)
    set_field(writeblock, :targets, block.locs)
    set_field(writeblock, :source, writer.source_node)
    set_field(writeblock, :stage, OpWriteBlockProto_BlockConstructionStage.PIPELINE_SETUP_CREATE)
    set_field(writeblock, :pipelineSize, uint32(length(block.locs)))
    set_field(writeblock, :minBytesRcvd, uint64(0))
    set_field(writeblock, :maxBytesRcvd, uint64(0))
    set_field(writeblock, :latestGenerationStamp, exblock.generationStamp)
    set_field(writeblock, :requestedChecksum, chksum)
    set_field(writeblock, :targetStorageTypes, block.storageTypes)
    logmsg("sending block write message for offset $offset")

    buffer_size_delimited(channel.iob, writeblock)
end

function send_block_write(writer::HDFSBlockWriter)
    isconnected(writer) || connect(writer)
    channel = writer.channel

    try
        logmsg("send block write message")
        begin_send(channel)
        buffer_opcode(channel, HDATA_WRITE_BLOCK)
        buffer_writeblock(writer)
        send_buffered(channel, false)
    catch ex
        logmsg("exception sending to $(channel.host):$(channel.port): $ex")
        disconnect(writer)
        rethrow(ex)
    end
    nothing
end

function recv_blockop(writer::HDFSBlockWriter)
    channel = writer.channel
    try
        block_resp = recv_blockop(channel)
        checksum_type = block_resp.readOpChecksumInfo.checksum._type
        (checksum_type == ChecksumTypeProto.CHECKSUM_CRC32) || (checksum_type == ChecksumTypeProto.CHECKSUM_CRC32C) || throw(HadoopRpcException("Unknown checksum type $checksum_type"))
        reader.block_op_resp = Nullable(block_resp)
    catch ex
        logmsg("exception receiving from $(channel.host):$(channel.port): $ex")
        disconnect(reader)
        rethrow(ex)
    end
    nothing
end

function populate_checksums(bytes::Vector{UInt8}, chunk_len::UInt64, checksums::Vector{UInt32})
    nbytes = length(bytes)
    nchunks = length(checksums)
    c_offset = 1
    for idx in 1:nchunks
        c_len = (c_offset+chunk_len > nbytes) ? (nbytes-c_offset+1) : chunk_len
        c_ptr = pointer(bytes, c_offset)
        c_data = pointer_to_array(c_ptr+c_offset-1, c_len)
        checksums[idx] = crc32(c_data)
    end
    nothing
end

function prepare_packet(writer::HDFSBlockWriter)
    defaults = writer.server_defaults

    logmsg("prepare block packet")
    bytes_in_packet = min(defaults.writePacketSize, nb_available(writer.buffer))
    logmsg("bytes in packet $(bytes_in_packet). default pkt size: $(defaults.writePacketSize)")

    last_pkt = (bytes_in_packet < defaults.writePacketSize)
    seq_no = uint64(writer.pkt_seq += 1)

    pkt_hdr = PacketHeaderProto()
    set_field(pkt_hdr, :offsetInBlock, uint64(writer.block.offset + writer.total_written))
    set_field(pkt_hdr, :seqno, seq_no)
    set_field(pkt_hdr, :lastPacketInBlock, last_pkt)
    set_field(pkt_hdr, :dataLen, bytes_in_packet)

    writer.total_written += bytes_in_packet

    if bytes_in_packet == nb_available(writer.buffer)
        bytes = takebuf_array(writer.buffer)
    else
        bytes = Array(UInt8, bytes_in_packet)
        read!(writer.buffer, bytes)
    end

    chunk_len = defaults.bytesPerChecksum
    chunk_count = div(bytes_in_packet + chunk_len, chunk_len)
    checksums = Array(UInt32, chunk_count)
    populate_checksums(bytes, chunk_len, checksums)

    enqueue(writer.pkt_pipeline, PipelinedPacket(seq_no, pkt_hdr, bytes, checksums, Int32[]))
    nothing
end

function write_packet(writer::HDFSBlockWriter, pkt::PipelinedPacket)
    logmsg("write block packet")
    channel = writer.channel

    try
        sock = get(channel.sock)
        pkt_len = uint32(4 + sizeof(pkt.checksums) + sizeof(pkt.bytes))

        hdr_iob = IOBuffer()
        writeproto(hdr_iob, pkt.hdr)
        hdr_bytes = takebuf_array(hdr_iob)
        hdr_len = uint16(sizeof(hdr_bytes))

        write(sock, hton(pkt_len))
        write(sock, hton(hdr_len))
        write(sock, hdr_bytes)
        write(sock, pkt.checksums)
        write(sock, pkt.bytes)

        ackwait(writer.pkt_pipeline, pkt.seqno)
        logmsg("sent packet to $(channel.host):$(channel.port). total_written:$(writer.total_written)")
        nothing
    catch ex
        logmsg("exception sending to $(channel.host):$(channel.port): $ex")
        disconnect(writer)
        rethrow(ex)
    end
end

function read_packet_ack(writer::HDFSBlockWriter)
    logmsg("reading packet ack")
    channel = writer.channel

    try
        sock = get(channel.sock)
        logmsg("recv packet ack message")
        data_bytes = read_bytes(sock)
        logmsg("ack <- sock. len $(length(data_bytes))")

        ack = PipelineAckProto()
        readproto(IOBuffer(data_bytes), ack)
        ackrcvd(writer.pkt_pipeline, ack.seqno, ack.status)
        logmsg("received ack for seqno: $(ack.seqno), status: $(ack.status)")
        nothing
    catch ex
        logmsg("exception reading from $(channel.host):$(channel.port): $ex")
        disconnect(writer)
        rethrow(ex)
    end
end
