
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
function next_call_id(channel::HadoopRpcChannel)
    id = channel.sent_call_id = channel.call_id
    channel.call_id = (id == HRPC_CALL_ID_HANDSHAKE) ? HRPC_CALL_ID_NORMAL : 
                      (id < typemax(Int32)) ? (id + int32(1)) : 
                      HRPC_CALL_ID_NORMAL
    id
end

function _len_uleb{T <: Integer}(x::T)
    nw = 1
    while ((x >>>= 7) != 0)
        nw += 1
    end
    nw
end

function buffer_size_delimited(channel::HadoopRpcChannel, obj)
    iob = IOBuffer()
    writeproto(iob, obj)

    data = takebuf_array(iob)
    len = write_bytes(channel.iob, data)
    logmsg("$(typeof(obj)) -> $data")
    logmsg("$(typeof(obj)) -> buffer. len $len")
    len
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

    buffer_size_delimited(channel, connctx)
end

function buffer_rpc_reqhdr(channel::HadoopRpcChannel)
    hdr = RpcRequestHeaderProto()
    set_field(hdr, :rpcKind, HRPC_PROTOBUFF_TYPE)
    set_field(hdr, :rpcOp, HRPC_FINAL_PACKET)
    set_field(hdr, :callId, next_call_id(channel))
    set_field(hdr, :clientId, channel.clnt_id.data)
    #set_field(hdr, :retryCount, int32(-1))

    buffer_size_delimited(channel, hdr)
end

function buffer_method_reqhdr(channel::HadoopRpcChannel, method::MethodDescriptor)
    hdr = RequestHeaderProto()
    set_field(hdr, :methodName, method.name)
    set_field(hdr, :declaringClassProtocolName, HRPC_CLIENT_PROTOCOL)
    set_field(hdr, :clientProtocolVersion, HRPC_CLIENT_PROTOCOL_VERSION)

    buffer_size_delimited(channel, hdr)
end

function send_buffered(channel::HadoopRpcChannel, delimited::Bool)
    buff = takebuf_array(channel.iob)

    len::UInt32 = 0
    if delimited
        len = write(get(channel.sock), hton(uint32(length(buff))))
    end
    len += write(get(channel.sock), buff)
    logmsg("buffer -> sock. len $len")
    len
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
        buffer_size_delimited(channel, params)
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
        #msg_len = _read_fixed(get(channel.sock), uint32(0), 4)
        logmsg("recv rpc message")
        msg_len = ntoh(read(get(channel.sock), UInt32))
        hdr_bytes = read_bytes(get(channel.sock))

        resp_hdr = RpcResponseHeaderProto()
        readproto(IOBuffer(hdr_bytes), resp_hdr)

        (resp_hdr.callId == channel.sent_call_id) || throw(HadoopRpcException("unknown callid. received:$(resp_hdr.callId) sent:$(channel.sent_call_id)"))
        (resp_hdr.status == RpcResponseHeaderProto_RpcStatusProto.SUCCESS) || throw(HadoopRpcException(resp_hdr))

        if resp_hdr.status == RpcResponseHeaderProto_RpcStatusProto.SUCCESS
            hdr_len = uint32(length(hdr_bytes))
            hdr_len += _len_uleb(hdr_len)
            if msg_len > hdr_len
                data_bytes = read_bytes(get(channel.sock))
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

