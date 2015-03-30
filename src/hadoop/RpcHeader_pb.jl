using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

type __enum_RpcKindProto <: ProtoEnum
    RPC_BUILTIN::Int32
    RPC_WRITABLE::Int32
    RPC_PROTOCOL_BUFFER::Int32
    __enum_RpcKindProto() = new(0,1,2)
end #type __enum_RpcKindProto
const RpcKindProto = __enum_RpcKindProto()

type RPCTraceInfoProto
    traceId::Int64
    parentId::Int64
    RPCTraceInfoProto() = (o=new(); fillunset(o); o)
end #type RPCTraceInfoProto
hash(v::RPCTraceInfoProto) = ProtoBuf.protohash(v)
isequal(v1::RPCTraceInfoProto, v2::RPCTraceInfoProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RPCTraceInfoProto, v2::RPCTraceInfoProto) = ProtoBuf.protoeq(v1, v2)

type __enum_RpcRequestHeaderProto_OperationProto <: ProtoEnum
    RPC_FINAL_PACKET::Int32
    RPC_CONTINUATION_PACKET::Int32
    RPC_CLOSE_CONNECTION::Int32
    __enum_RpcRequestHeaderProto_OperationProto() = new(0,1,2)
end #type __enum_RpcRequestHeaderProto_OperationProto
const RpcRequestHeaderProto_OperationProto = __enum_RpcRequestHeaderProto_OperationProto()

type RpcRequestHeaderProto
    rpcKind::Int32
    rpcOp::Int32
    callId::Int32
    clientId::Array{UInt8,1}
    retryCount::Int32
    traceInfo::RPCTraceInfoProto
    RpcRequestHeaderProto() = (o=new(); fillunset(o); o)
end #type RpcRequestHeaderProto
const __req_RpcRequestHeaderProto = Symbol[:callId,:clientId]
const __val_RpcRequestHeaderProto = @compat Dict(:retryCount => -1)
const __wtype_RpcRequestHeaderProto = @compat Dict(:callId => :sint32, :retryCount => :sint32)
meta(t::Type{RpcRequestHeaderProto}) = meta(t, __req_RpcRequestHeaderProto, ProtoBuf.DEF_FNUM, __val_RpcRequestHeaderProto, true, ProtoBuf.DEF_PACK, __wtype_RpcRequestHeaderProto)
hash(v::RpcRequestHeaderProto) = ProtoBuf.protohash(v)
isequal(v1::RpcRequestHeaderProto, v2::RpcRequestHeaderProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RpcRequestHeaderProto, v2::RpcRequestHeaderProto) = ProtoBuf.protoeq(v1, v2)

type __enum_RpcResponseHeaderProto_RpcStatusProto <: ProtoEnum
    SUCCESS::Int32
    ERROR::Int32
    FATAL::Int32
    __enum_RpcResponseHeaderProto_RpcStatusProto() = new(0,1,2)
end #type __enum_RpcResponseHeaderProto_RpcStatusProto
const RpcResponseHeaderProto_RpcStatusProto = __enum_RpcResponseHeaderProto_RpcStatusProto()

type __enum_RpcResponseHeaderProto_RpcErrorCodeProto <: ProtoEnum
    ERROR_APPLICATION::Int32
    ERROR_NO_SUCH_METHOD::Int32
    ERROR_NO_SUCH_PROTOCOL::Int32
    ERROR_RPC_SERVER::Int32
    ERROR_SERIALIZING_RESPONSE::Int32
    ERROR_RPC_VERSION_MISMATCH::Int32
    FATAL_UNKNOWN::Int32
    FATAL_UNSUPPORTED_SERIALIZATION::Int32
    FATAL_INVALID_RPC_HEADER::Int32
    FATAL_DESERIALIZING_REQUEST::Int32
    FATAL_VERSION_MISMATCH::Int32
    FATAL_UNAUTHORIZED::Int32
    __enum_RpcResponseHeaderProto_RpcErrorCodeProto() = new(1,2,3,4,5,6,10,11,12,13,14,15)
end #type __enum_RpcResponseHeaderProto_RpcErrorCodeProto
const RpcResponseHeaderProto_RpcErrorCodeProto = __enum_RpcResponseHeaderProto_RpcErrorCodeProto()

type RpcResponseHeaderProto
    callId::UInt32
    status::Int32
    serverIpcVersionNum::UInt32
    exceptionClassName::AbstractString
    errorMsg::AbstractString
    errorDetail::Int32
    clientId::Array{UInt8,1}
    retryCount::Int32
    RpcResponseHeaderProto() = (o=new(); fillunset(o); o)
end #type RpcResponseHeaderProto
const __req_RpcResponseHeaderProto = Symbol[:callId,:status]
const __val_RpcResponseHeaderProto = @compat Dict(:retryCount => -1)
const __wtype_RpcResponseHeaderProto = @compat Dict(:retryCount => :sint32)
meta(t::Type{RpcResponseHeaderProto}) = meta(t, __req_RpcResponseHeaderProto, ProtoBuf.DEF_FNUM, __val_RpcResponseHeaderProto, true, ProtoBuf.DEF_PACK, __wtype_RpcResponseHeaderProto)
hash(v::RpcResponseHeaderProto) = ProtoBuf.protohash(v)
isequal(v1::RpcResponseHeaderProto, v2::RpcResponseHeaderProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RpcResponseHeaderProto, v2::RpcResponseHeaderProto) = ProtoBuf.protoeq(v1, v2)

type __enum_RpcSaslProto_SaslState <: ProtoEnum
    SUCCESS::Int32
    NEGOTIATE::Int32
    INITIATE::Int32
    CHALLENGE::Int32
    RESPONSE::Int32
    WRAP::Int32
    __enum_RpcSaslProto_SaslState() = new(0,1,2,3,4,5)
end #type __enum_RpcSaslProto_SaslState
const RpcSaslProto_SaslState = __enum_RpcSaslProto_SaslState()

type RpcSaslProto_SaslAuth
    method::AbstractString
    mechanism::AbstractString
    protocol::AbstractString
    serverId::AbstractString
    challenge::Array{UInt8,1}
    RpcSaslProto_SaslAuth() = (o=new(); fillunset(o); o)
end #type RpcSaslProto_SaslAuth
const __req_RpcSaslProto_SaslAuth = Symbol[:method,:mechanism]
meta(t::Type{RpcSaslProto_SaslAuth}) = meta(t, __req_RpcSaslProto_SaslAuth, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RpcSaslProto_SaslAuth) = ProtoBuf.protohash(v)
isequal(v1::RpcSaslProto_SaslAuth, v2::RpcSaslProto_SaslAuth) = ProtoBuf.protoisequal(v1, v2)
==(v1::RpcSaslProto_SaslAuth, v2::RpcSaslProto_SaslAuth) = ProtoBuf.protoeq(v1, v2)

type RpcSaslProto
    version::UInt32
    state::Int32
    token::Array{UInt8,1}
    auths::Array{RpcSaslProto_SaslAuth,1}
    RpcSaslProto() = (o=new(); fillunset(o); o)
end #type RpcSaslProto
const __req_RpcSaslProto = Symbol[:state]
meta(t::Type{RpcSaslProto}) = meta(t, __req_RpcSaslProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RpcSaslProto) = ProtoBuf.protohash(v)
isequal(v1::RpcSaslProto, v2::RpcSaslProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RpcSaslProto, v2::RpcSaslProto) = ProtoBuf.protoeq(v1, v2)

export RpcKindProto, RPCTraceInfoProto, RpcRequestHeaderProto_OperationProto, RpcRequestHeaderProto, RpcResponseHeaderProto_RpcStatusProto, RpcResponseHeaderProto_RpcErrorCodeProto, RpcResponseHeaderProto, RpcSaslProto_SaslState, RpcSaslProto_SaslAuth, RpcSaslProto
