# Protocol implementations for:
# - Client - Namenode
# - Client - Datanode
# ref: https://wiki.apache.org/hadoop/HadoopRpc

const HRPC_HEADER               = convert(Vector{UInt8}, "hrpc")
const HRPC_VERSION              = 0x09
const HRPC_SERVICE_CLASS        = 0x00

const HRPC_AUTH_PROTOCOL_NONE   = 0x00
const HRPC_AUTH_PROTOCOL_SASL   = 0xdf # -33

const HRPC_AUTH_METHOD_SIMPLE   = 0x80
const HRPC_AUTH_METHOD_TOKEN    = 0x82

const HRPC_PROTOBUFF_TYPE       = RpcKindProto.RPC_PROTOCOL_BUFFER
const HRPC_FINAL_PACKET         = RpcRequestHeaderProto_OperationProto.RPC_FINAL_PACKET

const HRPC_CALL_ID_SASL         = Int32(-33)
const HRPC_CALL_ID_CONNCTX      = Int32(-3)
const HRPC_CALL_ID_NORMAL       = Int32(0)  # Post the handshake it cycles sequentially between 1:typemax(Int32)

const HRPC_PROTOCOLS = Dict(
    ClientNamenodeProtocolBlockingStub              => Dict(:id => "org.apache.hadoop.hdfs.protocol.ClientProtocol",            :ver => UInt64(1), :name => "HDFSClient"),
    ApplicationClientProtocolServiceBlockingStub    => Dict(:id => "org.apache.hadoop.yarn.api.ApplicationClientProtocolPB",    :ver => UInt64(1), :name => "YarnClient"),
    ApplicationMasterProtocolServiceBlockingStub    => Dict(:id => "org.apache.hadoop.yarn.api.ApplicationMasterProtocolPB",    :ver => UInt64(1), :name => "YarnAppMaster"),
    ContainerManagementProtocolServiceBlockingStub  => Dict(:id => "org.apache.hadoop.yarn.api.ContainerManagementProtocolPB",  :ver => UInt64(1), :name => "YarnNMClient")
)

"""
HadoopRpcException is thrown on Rpc interaction errors either with namenode or datanode.
Field `status` contains error code (enum) if received from the connected entity or just ERROR (1) to indicate failure.
Though HadoopRpcException is used while communicating with both namenodes and datanodes, SUCCESS and ERROR are coded
with the same values in both cases. Other specific error codes need knowledge of the context to interpret.
"""
mutable struct HadoopRpcException <: Exception
    status::Int32
    message::AbstractString
    function HadoopRpcException(header::RpcResponseHeaderProto)
        new(header.status, header.errorMsg)
    end
    function HadoopRpcException(msg::AbstractString)
        new(RpcResponseHeaderProto_RpcStatusProto.ERROR, msg)
    end
    function HadoopRpcException(status::Int32, message::AbstractString)
        new(status, message)
    end
end

# Utility methods
const crc32 = crc(CRC_32)
const crc32c = crc(CRC_32_C)

struct ChkSum{T} end
const ChkSumCRC32   =   ChkSum{ChecksumTypeProto.CHECKSUM_CRC32}
const ChkSumCRC32C  =  ChkSum{ChecksumTypeProto.CHECKSUM_CRC32C}

chksum(::Type{ChkSumCRC32}, c_data::Vector{UInt8}) = crc32(c_data)
chksum(::Type{ChkSumCRC32C}, c_data::Vector{UInt8}) = crc32c(c_data)
chksum(::Type{ChkSum{T}}, c_data::Vector{UInt8}) where {T} = throw(HadoopRpcException("Unknown CRC type $T"))
isvalid_chksum(::Type{ChkSumCRC32}) = true
isvalid_chksum(::Type{ChkSumCRC32C}) = true
isvalid_chksum(::Type{ChkSum{T}}) where {T} = false

function _len_uleb(x::T) where T <: Integer
    nw = 1
    while ((x >>>= 7) != 0)
        nw += 1
    end
    nw
end

function buffer_size_delimited(channelbuff::IOBuffer, obj)
    iob = IOBuffer()
    writeproto(iob, obj)

    data = take!(iob)
    len = write_bytes(channelbuff, data)
    @logmsg("$(typeof(obj)) -> $data")
    @logmsg("$(typeof(obj)) -> buffer. len $len")
    len
end

function send_buffered(buff::IOBuffer, sock::TCPSocket, delimited::Bool)
    data = take!(buff)
    len::UInt32 = 0
    if delimited
        datalen = UInt32(length(data))
        len = write(sock, hton(datalen))
    end
    len += write(sock, data)
    @logmsg("buffer -> sock. len $len")
    len
end

function recv_blockop(sock::TCPSocket)
    @logmsg("recv block read message")
    data_bytes = read_bytes(sock)
    @logmsg("block_resp <- sock. len $(length(data_bytes))")

    block_resp = BlockOpResponseProto()
    readproto(IOBuffer(data_bytes), block_resp)

    (block_resp.status == Status.SUCCESS) || throw(HadoopRpcException(block_resp.status, "Error in block operation: $(block_resp.message)"))
    return block_resp
end

#
# Hadoop RPC Channel
mutable struct HadoopRpcController <: ProtoRpcController
    debug::Bool
end

mutable struct HadoopRpcChannel <: ProtoRpcChannel
    host::AbstractString
    port::Integer
    protocol_attribs::Dict
    call_id::Int32          # see: RpcRequestHeaderProto.callId
    sent_call_id::Int32     # set to the last call id sent for verification purpose
    clnt_id::AbstractString # string(Base.Random.uuid4())
    ugi::UserGroupInformation
    iob::IOBuffer
    sock::Nullable{TCPSocket}

    function HadoopRpcChannel(host::AbstractString, port::Integer, ugi::UserGroupInformation, protocol::DataType)
        protocol = HRPC_PROTOCOLS[protocol]
        call_id = HRPC_CALL_ID_CONNCTX
        clnt_id = string(Base.Random.uuid4())[1:16]
        new(host, port, protocol, call_id, call_id, clnt_id, ugi, IOBuffer(), Nullable{TCPSocket}())
    end
end

function show(io::IO, ch::HadoopRpcChannel)
    user = username(ch.ugi)
    user_spec = isempty(user) ? user : "$(user)@"
    println(io, "$(user_spec)$(ch.host):$(ch.port)/")
    println(io, "    id: $(ch.clnt_id)")
    println(io, "    connected: $(isconnected(ch))")
    nothing
end

isconnected(channel::HadoopRpcChannel) = !isnull(channel.sock) && isopen(get(channel.sock))
begin_send(channel::HadoopRpcChannel) = Base.truncate(channel.iob, 0)
send_buffered(channel::HadoopRpcChannel, delimited::Bool) = send_buffered(channel.iob, get(channel.sock), delimited::Bool)

function next_call_id(channel::HadoopRpcChannel)
    id = channel.sent_call_id = channel.call_id

    if id == HRPC_CALL_ID_SASL
        channel.call_id = HRPC_CALL_ID_CONNCTX
    elseif id == HRPC_CALL_ID_CONNCTX
        channel.call_id = HRPC_CALL_ID_NORMAL
    elseif id < typemax(Int32)
        channel.call_id = id + Int32(1)
    else
        channel.call_id = HRPC_CALL_ID_NORMAL
    end
    id
end

function buffer_handshake(channel::HadoopRpcChannel, authprotocol::UInt8)
    write(channel.iob, [HRPC_HEADER, HRPC_VERSION, HRPC_SERVICE_CLASS, authprotocol;])
end

function buffer_connctx(channel::HadoopRpcChannel)
    protocol = channel.protocol_attribs[:id]
    connctx = protobuild(IpcConnectionContextProto, Dict(:userInfo => channel.ugi.userinfo, :protocol => protocol))

    buffer_size_delimited(channel.iob, connctx)
end

function buffer_reqhdr(channel::HadoopRpcChannel, call_id::Int32)
    hdr = protobuild(RpcRequestHeaderProto, Dict(:rpcKind => HRPC_PROTOBUFF_TYPE,
                :rpcOp => HRPC_FINAL_PACKET,
                :callId => call_id,
                #:retryCount => -1,
                :clientId => convert(Vector{UInt8}, channel.clnt_id)))

    buffer_size_delimited(channel.iob, hdr)
end

buffer_rpc_reqhdr(channel::HadoopRpcChannel) = buffer_reqhdr(channel, next_call_id(channel))
buffer_conctx_reqhdr(channel::HadoopRpcChannel) = (channel.sent_call_id = channel.call_id = HRPC_CALL_ID_CONNCTX; buffer_reqhdr(channel, HRPC_CALL_ID_CONNCTX))

function buffer_method_reqhdr(channel::HadoopRpcChannel, method::MethodDescriptor)
    protocol = channel.protocol_attribs[:id]
    protocol_ver = channel.protocol_attribs[:ver]
    hdr = protobuild(RequestHeaderProto, Dict(:methodName => method.name,
                :declaringClassProtocolName => protocol,
                :clientProtocolVersion => protocol_ver))

    buffer_size_delimited(channel.iob, hdr)
end

# Connect to the hadoop server and complete the handshake
function connect(channel::HadoopRpcChannel)
    # open connection
    @logmsg("connecting to HadoopRpcChannel $(channel.host):$(channel.port)")
    try
        sock = connect(channel.host, channel.port)
        channel.sock = Nullable{TCPSocket}(sock)

        # negotiate sasl authentication if ugi has appropriate tokens
        if !conditional_sasl_auth(channel)
            # else do a simple handshake
            begin_send(channel)
            buffer_handshake(channel, HRPC_AUTH_PROTOCOL_NONE)
            send_buffered(channel, false)
        end

        begin_send(channel)
        buffer_conctx_reqhdr(channel)
        buffer_connctx(channel)
        send_buffered(channel, true)
        @logmsg("connected to HadoopRpcChannel $(channel.host):$(channel.port)")
        channel.call_id = HRPC_CALL_ID_NORMAL
    catch ex
        @logmsg("exception connecting to $(channel.host):$(channel.port): $ex")
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
        @logmsg("exception while closing channel socket $ex")
    end
    channel.sock = Nullable{TCPSocket}()
    channel.call_id = HRPC_CALL_ID_CONNCTX
    channel.clnt_id = string(Base.Random.uuid4())[1:16]
end

function send_rpc_message(channel::HadoopRpcChannel, controller::HadoopRpcController, method::MethodDescriptor, params)
    isconnected(channel) || connect(channel)

    try
        @logmsg("send rpc message. method: $(method.name)")
        begin_send(channel)
        buffer_rpc_reqhdr(channel)
        buffer_method_reqhdr(channel, method)
        buffer_size_delimited(channel.iob, params)
        send_buffered(channel, true)
    catch ex
        @logmsg("exception sending to $(channel.host):$(channel.port): $ex")
        disconnect(channel)
        rethrow(ex)
    end
    nothing
end

function recv_rpc_message(channel::HadoopRpcChannel, resp)
    try
        @logmsg("recv rpc message")
        msg_len = ntoh(read(get(channel.sock), UInt32))
        hdr_bytes = read_bytes(get(channel.sock))
        @logmsg("hdr <- sock. len $(length(hdr_bytes))")

        resp_hdr = RpcResponseHeaderProto()
        readproto(IOBuffer(hdr_bytes), resp_hdr)

        (resp_hdr.callId == reinterpret(UInt32, channel.sent_call_id)) || throw(HadoopRpcException("unknown callid. received:$(resp_hdr.callId) sent:$(channel.sent_call_id). status: $(resp_hdr.status)"))
        (resp_hdr.status == RpcResponseHeaderProto_RpcStatusProto.SUCCESS) || throw(HadoopRpcException(resp_hdr))

        if resp_hdr.status == RpcResponseHeaderProto_RpcStatusProto.SUCCESS
            hdr_len = UInt32(length(hdr_bytes))
            hdr_len += _len_uleb(hdr_len)
            if msg_len > hdr_len
                data_bytes = read_bytes(get(channel.sock))
                @logmsg("data <- sock. len $(length(data_bytes))")
                data_len = msg_len - hdr_len - _len_uleb(length(data_bytes))
                (length(data_bytes) == data_len) || throw(HadoopRpcException("unexpected response data length. expected:$(data_len) read:$(length(data_bytes))"))
                readproto(IOBuffer(data_bytes), resp)
            end
        end
    catch ex
        @logmsg("exception receiving from $(channel.host):$(channel.port): $ex")
        disconnect(channel)
        rethrow(ex)
    end
    nothing
end

function call_method(channel::HadoopRpcChannel, service::ServiceDescriptor, method::MethodDescriptor, controller::HadoopRpcController, params)
    @logmsg("call_method $(method.name)")
    send_rpc_message(channel, controller, method, params)
    resp_type = get_response_type(method)
    resp = resp_type()
    recv_rpc_message(channel, resp)
    resp
end


#
# Hadoop Data Channel. Base type for communicating with data nodes.

# Opcodes
const HDATA_VERSION             = Int16(28)
const HDATA_WRITE_BLOCK         = Int8(80)
const HDATA_READ_BLOCK          = Int8(81)
const HDATA_READ_METADATA       = Int8(82)
const HDATA_REPLACE_BLOCK       = Int8(83)
const HDATA_COPY_BLOCK          = Int8(84)
const HDATA_BLOCK_CHECKSUM      = Int8(85)
const HDATA_TRANSFER_BLOCK      = Int8(86)

"""
HadoopDataChannel is the connection to a datanode.
Also associated with it is a buffer to help in message preparation.
"""
mutable struct HadoopDataChannel
    host::AbstractString
    port::Integer
    iob::IOBuffer
    sock::Nullable{TCPSocket}

    HadoopDataChannel(host::AbstractString, port::Integer) = new(host, port, IOBuffer(), Nullable{TCPSocket}())
end

function connect(channel::HadoopDataChannel)
    @logmsg("connecting to HadoopDataChannel $(channel.host):$(channel.port)")
    try
        sock = connect(channel.host, channel.port)
        channel.sock = Nullable(sock)
    catch ex
        @logmsg("exception connecting to HadoopDataChannel $(channel.host):$(channel.port): $ex")
        rethrow(ex)
    end
    @logmsg("connected to HadoopDataChannel $(channel.host):$(channel.port)")
    nothing
end

function disconnect(channel::HadoopDataChannel)
    try
        isconnected(channel) && close(get(channel.sock))
    catch ex
        @logmsg("exception while closing HadoopDataChannel socket $ex")
    end
    channel.sock = Nullable{TCPSocket}()
    nothing
end

isconnected(channel::HadoopDataChannel) = !isnull(channel.sock) && isopen(get(channel.sock))
begin_send(channel::HadoopDataChannel) = Base.truncate(channel.iob, 0)
send_buffered(channel::HadoopDataChannel, delimited::Bool) = send_buffered(channel.iob, get(channel.sock), delimited::Bool)

function buffer_opcode(channel::HadoopDataChannel, opcode::Int8)
    hver = UInt16(HDATA_VERSION)
    len = write(channel.iob, hton(hver))
    len += write(channel.iob, opcode)
end

function _select_node_for_block(block::LocatedBlockProto)
    node_infos = DatanodeInfoProto[]
    for loc in block.locs
        (loc.adminState == DatanodeInfoProto_AdminState.NORMAL) && push!(node_infos, loc)
    end
    isempty(node_infos) && (return Nullable{DatanodeInfoProto}())
    # TODO: algo to select best node
    return Nullable(node_infos[1])
end


"""
HadoopDataChannelPool is a connection pool that holds connections to datanodes.
Connections are deemed stale after `keepalivesecs`.
"""
mutable struct HadoopDataChannelPool
    free::Dict{AbstractString,Vector}
    keepalivesecs::UInt64

    HadoopDataChannelPool(keepalivesecs::Integer) = new(Dict{AbstractString,Vector}(), keepalivesecs)
end

const _dcpool = HadoopDataChannelPool(30)
function _get(pool::HadoopDataChannelPool, host::AbstractString, port::Integer)
    dnid = "$host:$port"
    free = (dnid in keys(pool.free)) ? pool.free[dnid] : []

    timediff = _dcpool.keepalivesecs
    while !isempty(free) && (timediff >= _dcpool.keepalivesecs)
        channel,lastusetime = shift!(free)
        timediff = round(UInt64, time() - lastusetime)
    end

    (timediff < _dcpool.keepalivesecs) || (channel = HadoopDataChannel(host, port))
    @logmsg("return channel: $channel connected: $(isconnected(channel))")
    channel
end

function _put(pool::HadoopDataChannelPool, channel::HadoopDataChannel, reuse::Bool)
    isconnected(channel) || return
    @logmsg("keeping channel: $channel connected: $(isconnected(channel))")
    if !reuse
        try
            disconnect(channel)
        finally
            return
        end
    end
    dnid = "$(channel.host):$(channel.port)"
    free = dnid in keys(pool.free) ? pool.free[dnid] : (pool.free[dnid] = [])
    for (ch,tm) in free
        (object_id(channel) == object_id(ch)) && return
    end
    push!(free, (channel,time()))
end


#
# Begin Block Reader implementation to read data

"""
HDFSBlockReader reads one block of data from a datanode.
"""
mutable struct HDFSBlockReader
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

    initiated::Bool

    function HDFSBlockReader(host::AbstractString, port::Integer, block::LocatedBlockProto, offset::UInt64, len::UInt64, chk_crc::Bool)
        channel = _get(_dcpool, host, port)
        @logmsg("creating block reader for offset $offset at $host:$port for length $len")
        new(channel, block, offset, len,
            Nullable{BlockOpResponseProto}(), 0,
            Nullable{PacketHeaderProto}(), 0, 0,
            0, 0, 0, UInt8[],
            UInt32[], chk_crc, false)
    end
end

isconnected(reader::HDFSBlockReader) = isconnected(reader.channel)
function disconnect(reader::HDFSBlockReader, reuse::Bool)
    isconnected(reader.channel) && _put(_dcpool, reader.channel, reuse)

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
    reader.initiated = false
    nothing
end

function buffer_readblock(reader::HDFSBlockReader)
    channel = reader.channel
    block = reader.block
    offset = reader.offset
    len = reader.len

    token = TokenProto()
    for fld in (:identifier, :password, :kind, :service)
        set_field!(token, fld, get_field(block.blockToken, fld))
    end

    exblock = ExtendedBlockProto()
    for fld in (:poolId, :blockId, :generationStamp)
        set_field!(exblock, fld, get_field(block.b, fld))
    end

    basehdr = protobuild(BaseHeaderProto, Dict(:block => exblock, :token => token))
    hdr = protobuild(ClientOperationHeaderProto, Dict(:baseHeader => basehdr, :clientName => ELLY_CLIENTNAME))
    readblock = protobuild(OpReadBlockProto, Dict(:offset => offset, :len => len, :header => hdr))
    @logmsg("sending block read message for offset $offset len $len")

    buffer_size_delimited(channel.iob, readblock)
end

function buffer_client_read_status(reader::HDFSBlockReader, status::Int32)
    channel = reader.channel
    read_status = protobuild(ClientReadStatusProto, Dict(:status => status))
    buffer_size_delimited(channel.iob, read_status)
end

function send_block_read(reader::HDFSBlockReader)
    channel = reader.channel
    isconnected(channel) || connect(channel)

    try
        @logmsg("send block read message")
        begin_send(channel)
        buffer_opcode(channel, HDATA_READ_BLOCK)
        buffer_readblock(reader)
        send_buffered(channel, false)
    catch ex
        @logmsg("exception sending to $(channel.host):$(channel.port): $ex")
        disconnect(reader, false)
        rethrow(ex)
    end
    nothing
end

function send_read_status(reader::HDFSBlockReader, status::Int32=Status.SUCCESS)
    channel = reader.channel
    try
        @logmsg("send read status $status")
        buffer_client_read_status(reader, status)
        send_buffered(channel, false)
    catch ex
        @logmsg("exception sending to $(channel.host):$(channel.port): $ex")
        disconnect(reader, false)
        rethrow(ex)
    end
    nothing
end

function recv_blockop(reader::HDFSBlockReader)
    channel = reader.channel
    try
        block_resp = recv_blockop(get(channel.sock))
        checksum_type = block_resp.readOpChecksumInfo.checksum._type
        isvalid_chksum(ChkSum{checksum_type}) || throw(HadoopRpcException("Unknown checksum type $checksum_type"))
        reader.block_op_resp = Nullable(block_resp)
    catch ex
        @logmsg("exception receiving from $(channel.host):$(channel.port): $ex")
        disconnect(reader, false)
        rethrow(ex)
    end
    nothing
end

function recv_packet_hdr(reader::HDFSBlockReader)
    channel = reader.channel
    try
        @logmsg("recv block packet message")
        sock = get(channel.sock)

        pkt_len = ntoh(read(sock, UInt32))
        hdr_len = ntoh(read(sock, UInt16))
        hdr_bytes = Array{UInt8}(hdr_len)
        read!(sock, hdr_bytes)
        @logmsg("pkt_hdr <- sock. len $(hdr_len) (pkt_len: $pkt_len)")

        pkt_hdr = PacketHeaderProto()
        readproto(IOBuffer(hdr_bytes), pkt_hdr)

        data_len = pkt_hdr.dataLen
        block_op_resp = get(reader.block_op_resp)
        reader.chunk_len = block_op_resp.readOpChecksumInfo.checksum.bytesPerChecksum
        reader.chunk = Array{UInt8}(reader.chunk_len)
        reader.chunk_count = div(data_len + reader.chunk_len - 1, reader.chunk_len)    # chunk_len-1 to take care of chunks with partial data
        reader.chunks_read = 0
        @logmsg("received packet with $(reader.chunk_count) chunks of $(reader.chunk_len) bytes each in $data_len bytes of data")
        @logmsg("last packet: $(pkt_hdr.lastPacketInBlock)")

        checksums = Array{UInt32}(reader.chunk_count)
        read!(sock, checksums)
        @logmsg("checksums <- sock. len $(sizeof(checksums))")
        for idx in 1:length(checksums)
            checksums[idx] = ntoh(checksums[idx])
        end
        reader.packet_len = pkt_len
        #reader.packet_read = 4 + 2 + hdr_len + sizeof(checksums)
        reader.packet_read = 4 + sizeof(checksums)
        reader.pkt_hdr = Nullable(pkt_hdr)
        reader.checksums = checksums
        @logmsg("current read position pkt $(reader.packet_read)/$(reader.packet_len), block $(reader.total_read)/$(reader.len)")
        nothing
    catch ex
        @logmsg("exception receiving from $(channel.host):$(channel.port): $ex")
        disconnect(reader, false)
        rethrow(ex)
    end
end

eofpacket(reader::HDFSBlockReader) = (reader.packet_read >= reader.packet_len)
eof(reader::HDFSBlockReader) = (reader.total_read >= reader.len)

function verify_pkt_checksums(reader::HDFSBlockReader, buff::Vector{UInt8})
    data_len = length(buff)
    @logmsg("verifying packet crc data_len: $data_len")
    (data_len > 0) || return

    block_op_resp = get(reader.block_op_resp)
    checksum_type = block_op_resp.readOpChecksumInfo.checksum._type
    C = ChkSum{checksum_type}
    if !isvalid_chksum(C)
        disconnect(reader, false)
        throw(HadoopRpcException("Unknown CRC type $checksum_type"))
    end
    verify_pkt_checksums(reader, buff, C)
end

function verify_pkt_checksums(reader::HDFSBlockReader, buff::Vector{UInt8}, C::Type{ChkSum{T}}) where T
    chunk_len = reader.chunk_len
    offset = 1
    checksums = reader.checksums
    for idx in 1:(length(checksums)-1)
        cs = chksum(C, unsafe_wrap(Array, pointer(buff, offset), chunk_len))
        (cs == checksums[idx]) || throw(HadoopRpcException("Checksum mismatch at chunk $(idx). Expected $(checksums[idx]), got $(cs)"))
        offset += chunk_len
    end

    cs = chksum(unsafe_wrap(Array, pointer(buff, offset), data_len-(offset-1)))
    (cs == checksums[end]) || throw(HadoopRpcException("Checksum mismatch at last chunk $(length(checksums)). Expected $(checksums[end]), got $(cs)"))
    nothing
end

function initiate(reader::HDFSBlockReader; retry=true)
    try
        isconnected(reader.channel) || connect(reader.channel)
        send_block_read(reader)
        recv_blockop(reader)
        reader.initiated = true
        return
    catch ex
        if retry
            @logmsg("retrying block reader initiation")
            disconnect(reader.channel)
            connect(reader.channel)
            return initiate(reader; retry=false)
        else
            rethrow()
        end
    end
end

"""
Read one packet into `inbuff` starting from `offset`.
If `inbuff` has insufficient space, returns the minimum additional space required in `inbuff` to read the packet as a negative number.
Otherwise, returns the number of bytes available in `inbuff` after reading the packet.
"""
function read_packet!(reader::HDFSBlockReader, inbuff::Vector{UInt8}, offset::UInt64)
    if !reader.initiated
        # initiate the stream
        initiate(reader)
        recv_packet_hdr(reader)
    elseif eofpacket(reader)
        # recv the next packet
        recv_packet_hdr(reader)
    end

    packet_remaining = reader.packet_len - reader.packet_read
    excess = Int64(length(inbuff)+1-offset) - Int64(packet_remaining)
    (excess >= 0) || return excess

    buff = unsafe_wrap(Array, pointer(inbuff, offset), packet_remaining)

    channel = reader.channel
    sock = get(channel.sock)

    read!(sock, buff)
    reader.packet_read += packet_remaining
    reader.total_read += packet_remaining
    @logmsg("recv $(packet_remaining) packet_read $(reader.packet_read), total_read $(reader.total_read)")

    # verify crc only if required
    reader.chk_crc && verify_pkt_checksums(reader, buff)

    # send the success block read status
    if eof(reader)
        @logmsg("recv last empty packet")
        recv_packet_hdr(reader)
        send_read_status(reader)
    end
    excess
end



#
# Begin Block Writer implementation for writing / appending data

"""
PipelinedPacket holds a packet of data while it is sent to datanodes and acknowledged.
The data bytes are reset once acks are received successfully to reduce memory usage.
"""
mutable struct PipelinedPacket
    seqno::Int64
    hdr::PacketHeaderProto
    bytes::Vector{UInt8}
    checksums::Vector{UInt32}
    acks::Vector{Int32}
end

"""
WriterPipeline holds all packets of data for a block and provides methods to maintain
their states. Pipeline `failed` status is set if any of the acks received is a failure.
Field `acked_bytes` contains the count of bytes successfully sent till an error is
encountered.
"""
mutable struct WriterPipeline
    pkt_prepared::Vector{PipelinedPacket}
    pkt_ackwait::Vector{PipelinedPacket}
    pkt_ackrcvd::Vector{PipelinedPacket}
    acked_bytes::UInt64
    failed::Bool
    triggers::Vector{Condition}
    flush::Bool

    WriterPipeline() = new(PipelinedPacket[], PipelinedPacket[], PipelinedPacket[], 0, false, [Condition(), Condition()], false)
end

function move(from::Vector{PipelinedPacket}, to::Vector{PipelinedPacket}, seqno::Int64)
    for idx in 1:length(from)
        pkt = from[idx]
        if pkt.seqno == seqno
            push!(to, splice!(from, idx))
            return pkt
        end
    end
    throw(HadoopRpcException("Packet seqno:$seqno not found in pipeline"))
end

# since these use condition variables that are edge triggered,
# take care to ensure atomicity of the methods (do not introduce anything that may yield)
wait_pkt(pipeline::WriterPipeline) = pipeline.flush || wait(pipeline.triggers[1])
wait_flushed(pipeline::WriterPipeline) = pipeline.failed || wait(pipeline.triggers[2])
trigger_pkt(pipeline::WriterPipeline) = notify(pipeline.triggers[1])
trigger_flushed(pipeline::WriterPipeline) = notify(pipeline.triggers[2])
function flush_and_wait(pipeline::WriterPipeline)
    pipeline.flush = true
    trigger_pkt(pipeline)
    wait_flushed(pipeline)
    pipeline.failed && throw(HadoopRpcException("Error flushing pipeline"))
    nothing
end

@inline function enqueue(pipeline::WriterPipeline, pkt::PipelinedPacket)
    push!(pipeline.pkt_prepared, pkt)
    nothing
end

function ackwait(pipeline::WriterPipeline, seqno::Int64)
    pkt = move(pipeline.pkt_prepared, pipeline.pkt_ackwait, seqno)
    pkt.bytes = UInt8[]
    pkt.checksums = UInt32[]
    nothing
end

function ackrcvd(pipeline::WriterPipeline, seqno::Int64, acks::Vector{Int32})
    pkt = move(pipeline.pkt_ackwait, pipeline.pkt_ackrcvd, seqno)
    pkt.acks = acks
    for ack in acks
        (ack == Status.SUCCESS) || (pipeline.failed = true)
    end
    if !pipeline.failed
        pipeline.acked_bytes += pkt.hdr.dataLen
    end
    nothing
end

function assert_no_failure(pipeline::WriterPipeline)
    if pipeline.failed
        throw(HadoopRpcException("Received failure ack from datanode. Pipeline proecssing has failed"))
    end
    nothing
end

pending(pipeline::WriterPipeline) = (length(pipeline.pkt_prepared) + length(pipeline.pkt_ackwait))

# TODO: write optimizations
# - schedule a block only after block is complete
# - schedule and manage multiple block streams to different nodes
# - select data node to write to based on whether it already has an active write to the datanode
# - maintain a list of IOBuffers and LocatedBlockProtos in HDFSFileWriters that are queued / being written to, with a max limit beyond which it needs to wait for blocks to be written.
# - close of HDFSFileWriter should wait for all blocks to be flushed
# - this can later be tweaked to incorporate node failover
"""
HDFSBlockWriter writes one block worth of data to a datanode.

The `write` method returns number of bytes accepted for writing into this block, which may be less than
what was requested if block is full.

Packets are sent and acks received as and when data being written exceed packet size limit.

The `close` operation flushes remaining data in the block and waits for all pending acks.
"""
mutable struct HDFSBlockWriter
    channel::HadoopDataChannel
    server_defaults::FsServerDefaultsProto

    block::LocatedBlockProto
    source_node::DatanodeInfoProto
    buffer::IOBuffer

    total_written::UInt64

    pkt_seq::Int64
    pkt_pipeline::WriterPipeline
    initiated::Bool
    pipeline_task::Task

    function HDFSBlockWriter(block::LocatedBlockProto, defaults::FsServerDefaultsProto)
        nnode_info = _select_node_for_block(block)
        isnull(nnode_info) && throw(HadoopRpcException("Could not get a valid datanode to write"))

        node_info = get(nnode_info)
        node = node_info.id
        host = node.ipAddr
        port = node.xferPort

        channel = _get(_dcpool, host, port)
        @logmsg("creating block writer for offset $(block.offset) at $host:$port")
        writer = new(channel, defaults, block, node_info, PipeBuffer(), 0, 0, WriterPipeline(), false)
        writer.pipeline_task = @async process_pipeline(writer)
        writer
    end
end

isconnected(writer::HDFSBlockWriter) = isconnected(writer.channel)
function disconnect(writer::HDFSBlockWriter, reuse::Bool)
    if !istaskdone(writer.pipeline_task)
        reuse = false
        trigger_pkt(writer.pkt_pipeline)
    end
    isconnected(writer.channel) && _put(_dcpool, writer.channel, reuse)
    writer.initiated = false
    nothing
end

function connect(writer::HDFSBlockWriter)
    connect(writer.channel)
    nothing
end

function check_write_buffer(writer::HDFSBlockWriter)
    defaults = writer.server_defaults
    max_buffer_pkt = div(defaults.blockSize, defaults.writePacketSize) + 1
    max_buffer_bytes = defaults.writePacketSize * max_buffer_pkt
    buffered_bytes = nb_available(writer.buffer)
    if ((buffered_bytes >= max_buffer_bytes) || (pending(writer.pkt_pipeline) >= max_buffer_pkt))
        @logmsg("slow pipeline. pending bytes:$(nb_available(writer.buffer)), packets:$(pending(writer.pkt_pipeline)). waiting...")
        trigger_pkt(writer.pkt_pipeline)
        wait_pkt(writer.pkt_pipeline)
    elseif buffered_bytes >= defaults.writePacketSize
        @logmsg("triggering pkt_pipeline. buffered:$(nb_available(writer.buffer)), pending packets:$(pending(writer.pkt_pipeline))")
        trigger_pkt(writer.pkt_pipeline)
        yield()
    end
end

# write only enough till blockSize
_can_write(writer::HDFSBlockWriter, n::Int) = min(writer.server_defaults.blockSize - writer.total_written - nb_available(writer.buffer), n)

function write(writer::HDFSBlockWriter, x::UInt8)
    nbytes = _can_write(writer, 1)
    (nbytes > 0) && write(writer.buffer, x)
    check_write_buffer(writer)
    nbytes
end

function write(writer::HDFSBlockWriter, buff::Vector{UInt8})
    nbytes = _can_write(writer, length(buff))
    (nbytes > 0) && Base.write_sub(writer.buffer, buff, 1, nbytes)
    check_write_buffer(writer)
    nbytes
end

function flush(writer::HDFSBlockWriter)
    @logmsg("flush of block writer invoked")
    flush_and_wait(writer.pkt_pipeline)
end

function initiate(writer::HDFSBlockWriter; retry=true)
    try
        isconnected(writer.channel) || connect(writer.channel)
        send_block_write(writer)
        recv_blockop(writer)
        writer.initiated = true
        return
    catch ex
        if retry
            @logmsg("retrying block write initiation")
            disconnect(writer.channel)
            connect(writer.channel)
            return initiate(writer; retry=false)
        else
            rethrow()
        end
    end
end

function process_pipeline(writer::HDFSBlockWriter)
    @logmsg("process_pipeline: started")
    pipeline = writer.pkt_pipeline
    defaults = writer.server_defaults
    flushed = false
    failed = pipeline.failed

    loop_state = 0
    try
        readable_bytes = 0
        while !(failed || flushed)
            loop_state = 0
            if (nb_available(writer.buffer) < defaults.writePacketSize) &&
                isempty(pipeline.pkt_prepared) &&
                (isempty(pipeline.pkt_ackwait) || (readable_bytes == 0))
                wait_pkt(pipeline)
            end

            writer.initiated || initiate(writer)

            channel = writer.channel
            sock = get(channel.sock)
            readable_bytes = nb_available(sock)

            @logmsg("processing pipeline. pending $(nb_available(writer.buffer))bytes -> [$(length(pipeline.pkt_prepared)) -> $(length(pipeline.pkt_ackwait)) -> $(length(pipeline.pkt_ackrcvd))]pkts <- $(readable_bytes)bytes flush:$(flushed)")
            while nb_available(writer.buffer) >= defaults.writePacketSize
                prepare_packet(writer)
            end

            flushed = pipeline.flush

            if flushed
                while nb_available(writer.buffer) > 0
                    @logmsg("flushing remaining data packet...")
                    prepare_packet(writer)
                end
                @logmsg("preparing last empty packet...")
                prepare_packet(writer)
            end

            loop_state = 1
            @logmsg("writing packets...")
            while !isempty(pipeline.pkt_prepared)
                pkt = pipeline.pkt_prepared[1]
                write_packet(writer, pkt)
            end

            @logmsg("reading acks...")
            loop_state = 2
            while !failed && !isempty(pipeline.pkt_ackwait) && (flushed || (readable_bytes > 0))
                read_packet_ack(writer)
                failed = pipeline.failed
                readable_bytes = nb_available(sock)
            end
            @logmsg("processed pipeline. pending $(nb_available(writer.buffer))bytes -> [$(length(pipeline.pkt_prepared)) -> $(length(pipeline.pkt_ackwait)) -> $(length(pipeline.pkt_ackrcvd))]pkts <- $(readable_bytes)bytes flush:$(flushed)")
            trigger_pkt(pipeline)
        end
    catch ex
        channel = writer.channel
        extype = (loop_state == 1) ? "send" : (loop_state == 2) ? "read" : "unknown"
        @logmsg("pipeline for $(channel.host):$(channel.port) failed. stage $extype. $ex")
        disconnect(writer, false)
        failed = pipeline.failed = true
    end
    @logmsg("process_pipeline finished. failed: $(failed), flushed: $(flushed)")
    trigger_pkt(pipeline)
    trigger_flushed(pipeline)
end

function buffer_writeblock(writer::HDFSBlockWriter)
    channel = writer.channel
    block = writer.block
    defaults = writer.server_defaults

    token = TokenProto()
    for fld in (:identifier, :password, :kind, :service)
        set_field!(token, fld, get_field(block.blockToken, fld))
    end

    exblock = ExtendedBlockProto()
    for fld in (:poolId, :blockId, :generationStamp)
        set_field!(exblock, fld, get_field(block.b, fld))
    end
    set_field!(exblock, :numBytes, zero(UInt64))

    basehdr = protobuild(BaseHeaderProto, Dict(:block => exblock, :token => token))
    hdr = protobuild(ClientOperationHeaderProto, Dict(:baseHeader => basehdr, :clientName => ELLY_CLIENTNAME))
    chksum = protobuild(ChecksumProto, Dict(:_type => defaults.checksumType, :bytesPerChecksum => defaults.bytesPerChecksum))

    targets = DatanodeInfoProto[]
    for loc in block.locs
        (loc.id != writer.source_node.id) && push!(targets, loc)
    end

    writeblock = protobuild(OpWriteBlockProto, Dict(:header => hdr,
                    :targets => targets,
                    :source => writer.source_node,
                    :stage => OpWriteBlockProto_BlockConstructionStage.PIPELINE_SETUP_CREATE,
                    :pipelineSize => length(block.locs),
                    :minBytesRcvd => 0,
                    :maxBytesRcvd => 0,
                    :latestGenerationStamp => exblock.generationStamp,
                    :requestedChecksum => chksum))
    @logmsg("sending block write message for offset $(block.offset)")

    buffer_size_delimited(channel.iob, writeblock)
end

function send_block_write(writer::HDFSBlockWriter)
    isconnected(writer) || connect(writer)
    channel = writer.channel

    try
        @logmsg("send block write message")
        begin_send(channel)
        buffer_opcode(channel, HDATA_WRITE_BLOCK)
        buffer_writeblock(writer)
        send_buffered(channel, false)
    catch ex
        @logmsg("exception sending to $(channel.host):$(channel.port): $ex")
        disconnect(writer, false)
        rethrow(ex)
    end
    nothing
end

function recv_blockop(writer::HDFSBlockWriter)
    channel = writer.channel
    try
        recv_blockop(get(channel.sock))
    catch ex
        @logmsg("exception receiving from $(channel.host):$(channel.port): $ex")
        disconnect(writer, false)
        rethrow(ex)
    end
    nothing
end

populate_checksums(bytes::Vector{UInt8}, chunk_len::UInt32, checksums::Vector{UInt32}, checksum_type::Int32) = populate_checksums(bytes, chunk_len, checksums, ChkSum{checksum_type})
function populate_checksums(bytes::Vector{UInt8}, chunk_len::UInt32, checksums::Vector{UInt32}, C::Type{ChkSum{T}}) where T
    isvalid_chksum(C) || throw(HadoopRpcException("Unknown checksum type $T"))
    nbytes = length(bytes)
    nchunks = length(checksums)
    c_offset = 1
    for idx in 1:nchunks
        c_len = min(nbytes-c_offset+1, chunk_len)
        c_data = unsafe_wrap(Array, pointer(bytes, c_offset), c_len)
        checksums[idx] = hton(chksum(C, c_data))
        #@logmsg("chksum $(checksums[idx])")
        c_offset += c_len
    end
    nothing
end


function prepare_packet(writer::HDFSBlockWriter)
    defaults = writer.server_defaults

    #@logmsg("prepare block packet")
    bytes_in_packet = min(defaults.writePacketSize, nb_available(writer.buffer))

    last_pkt = (bytes_in_packet == 0)
    seq_no = Int64(writer.pkt_seq += 1)
    #@logmsg("packet seqno $seq_no with $(bytes_in_packet)/$(defaults.writePacketSize) bytes is last packet: $last_pkt")

    pkt_hdr = protobuild(PacketHeaderProto, Dict(:offsetInBlock => writer.total_written,
                    :seqno => seq_no,
                    :lastPacketInBlock => last_pkt,
                    :dataLen => bytes_in_packet))

    writer.total_written += bytes_in_packet

    if bytes_in_packet == nb_available(writer.buffer)
        bytes = take!(writer.buffer)
    else
        bytes = Array{UInt8}(bytes_in_packet)
        read!(writer.buffer, bytes)
    end

    chunk_len = defaults.bytesPerChecksum
    chunk_count = div(bytes_in_packet + chunk_len - 1, chunk_len)
    checksums = Array{UInt32}(chunk_count)
    populate_checksums(bytes, chunk_len, checksums, defaults.checksumType)

    enqueue(writer.pkt_pipeline, PipelinedPacket(seq_no, pkt_hdr, bytes, checksums, Int32[]))
    nothing
end

const hdr_iob = IOBuffer()
function write_packet(writer::HDFSBlockWriter, pkt::PipelinedPacket)
    #@logmsg("write block packet")
    channel = writer.channel

    sock = get(channel.sock)
    pkt_len = UInt32(4 + sizeof(pkt.checksums) + sizeof(pkt.bytes))

    seek(hdr_iob, 0)
    hdr_len = UInt16(writeproto(hdr_iob, pkt.hdr))

    write(sock, hton(pkt_len))
    write(sock, hton(hdr_len))
    unsafe_write(sock, pointer(hdr_iob.data), hdr_iob.size)
    write(sock, pkt.checksums)
    write(sock, pkt.bytes)

    ackwait(writer.pkt_pipeline, pkt.seqno)
    #@logmsg("sent packet to $(channel.host):$(channel.port). total_written:$(writer.total_written)")
    nothing
end

function read_packet_ack(writer::HDFSBlockWriter)
    #@logmsg("reading packet ack")
    channel = writer.channel

    sock = get(channel.sock)
    #@logmsg("recv packet ack message")
    data_bytes = read_bytes(sock)
    #@logmsg("ack <- sock. len $(length(data_bytes))")

    ack = PipelineAckProto()
    readproto(IOBuffer(data_bytes), ack)

    pipeline = writer.pkt_pipeline
    ackrcvd(pipeline, ack.seqno, ack.reply)

    exblk = writer.block.b
    set_field!(exblk, :numBytes, pipeline.acked_bytes)

    #@logmsg("received ack for seqno: $(ack.seqno), status: $(ack.reply) bytes acked: $(exblk.numBytes)")
    nothing
end

"""
HadoopRpcProtocol binds a channel and controller with a service protocol implementation.
Used by actual service implementations.
"""
mutable struct HadoopRpcProtocol{T<:AbstractProtoServiceStub}
    channel::HadoopRpcChannel
    controller::HadoopRpcController
    stub::T
end

function HadoopRpcProtocol{T}(host::AbstractString, port::Integer, ugi::UserGroupInformation=UserGroupInformation()) where T<:AbstractProtoServiceStub
    channel = HadoopRpcChannel(host, port, ugi, T)
    controller = HadoopRpcController(false)
    stub = T(channel)

    HadoopRpcProtocol{T}(channel, controller, stub)
end

function show(io::IO, client::HadoopRpcProtocol{T}) where T
    srvcname = (HRPC_PROTOCOLS[T])[:name]
    print(io, "$(srvcname): ")
    show(io, client.channel)
end

set_debug(protocol::HadoopRpcProtocol, debug::Bool) = (protocol.controller.debug = debug)
