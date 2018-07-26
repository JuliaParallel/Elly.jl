# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta

struct __enum_RpcKindProto <: ProtoEnum
    RPC_BUILTIN::Int32
    RPC_WRITABLE::Int32
    RPC_PROTOCOL_BUFFER::Int32
    __enum_RpcKindProto() = new(0,1,2)
end #struct __enum_RpcKindProto
const RpcKindProto = __enum_RpcKindProto()

mutable struct RPCTraceInfoProto <: ProtoType
    traceId::Int64
    parentId::Int64
    RPCTraceInfoProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RPCTraceInfoProto

struct __enum_RpcRequestHeaderProto_OperationProto <: ProtoEnum
    RPC_FINAL_PACKET::Int32
    RPC_CONTINUATION_PACKET::Int32
    RPC_CLOSE_CONNECTION::Int32
    __enum_RpcRequestHeaderProto_OperationProto() = new(0,1,2)
end #struct __enum_RpcRequestHeaderProto_OperationProto
const RpcRequestHeaderProto_OperationProto = __enum_RpcRequestHeaderProto_OperationProto()

mutable struct RpcRequestHeaderProto <: ProtoType
    rpcKind::Int32
    rpcOp::Int32
    callId::Int32
    clientId::Array{UInt8,1}
    retryCount::Int32
    traceInfo::RPCTraceInfoProto
    RpcRequestHeaderProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RpcRequestHeaderProto
const __req_RpcRequestHeaderProto = Symbol[:callId,:clientId]
const __val_RpcRequestHeaderProto = Dict(:retryCount => -1)
const __wtype_RpcRequestHeaderProto = Dict(:callId => :sint32, :retryCount => :sint32)
meta(t::Type{RpcRequestHeaderProto}) = meta(t, __req_RpcRequestHeaderProto, ProtoBuf.DEF_FNUM, __val_RpcRequestHeaderProto, true, ProtoBuf.DEF_PACK, __wtype_RpcRequestHeaderProto, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

struct __enum_RpcResponseHeaderProto_RpcStatusProto <: ProtoEnum
    SUCCESS::Int32
    ERROR::Int32
    FATAL::Int32
    __enum_RpcResponseHeaderProto_RpcStatusProto() = new(0,1,2)
end #struct __enum_RpcResponseHeaderProto_RpcStatusProto
const RpcResponseHeaderProto_RpcStatusProto = __enum_RpcResponseHeaderProto_RpcStatusProto()

struct __enum_RpcResponseHeaderProto_RpcErrorCodeProto <: ProtoEnum
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
end #struct __enum_RpcResponseHeaderProto_RpcErrorCodeProto
const RpcResponseHeaderProto_RpcErrorCodeProto = __enum_RpcResponseHeaderProto_RpcErrorCodeProto()

mutable struct RpcResponseHeaderProto <: ProtoType
    callId::UInt32
    status::Int32
    serverIpcVersionNum::UInt32
    exceptionClassName::AbstractString
    errorMsg::AbstractString
    errorDetail::Int32
    clientId::Array{UInt8,1}
    retryCount::Int32
    RpcResponseHeaderProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RpcResponseHeaderProto
const __req_RpcResponseHeaderProto = Symbol[:callId,:status]
const __val_RpcResponseHeaderProto = Dict(:retryCount => -1)
const __wtype_RpcResponseHeaderProto = Dict(:retryCount => :sint32)
meta(t::Type{RpcResponseHeaderProto}) = meta(t, __req_RpcResponseHeaderProto, ProtoBuf.DEF_FNUM, __val_RpcResponseHeaderProto, true, ProtoBuf.DEF_PACK, __wtype_RpcResponseHeaderProto, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

struct __enum_RpcSaslProto_SaslState <: ProtoEnum
    SUCCESS::Int32
    NEGOTIATE::Int32
    INITIATE::Int32
    CHALLENGE::Int32
    RESPONSE::Int32
    WRAP::Int32
    __enum_RpcSaslProto_SaslState() = new(0,1,2,3,4,5)
end #struct __enum_RpcSaslProto_SaslState
const RpcSaslProto_SaslState = __enum_RpcSaslProto_SaslState()

mutable struct RpcSaslProto_SaslAuth <: ProtoType
    method::AbstractString
    mechanism::AbstractString
    protocol::AbstractString
    serverId::AbstractString
    challenge::Array{UInt8,1}
    RpcSaslProto_SaslAuth(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RpcSaslProto_SaslAuth
const __req_RpcSaslProto_SaslAuth = Symbol[:method,:mechanism]
meta(t::Type{RpcSaslProto_SaslAuth}) = meta(t, __req_RpcSaslProto_SaslAuth, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RpcSaslProto <: ProtoType
    version::UInt32
    state::Int32
    token::Array{UInt8,1}
    auths::Base.Vector{RpcSaslProto_SaslAuth}
    RpcSaslProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RpcSaslProto
const __req_RpcSaslProto = Symbol[:state]
meta(t::Type{RpcSaslProto}) = meta(t, __req_RpcSaslProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

export RpcKindProto, RPCTraceInfoProto, RpcRequestHeaderProto_OperationProto, RpcRequestHeaderProto, RpcResponseHeaderProto_RpcStatusProto, RpcResponseHeaderProto_RpcErrorCodeProto, RpcResponseHeaderProto, RpcSaslProto_SaslState, RpcSaslProto_SaslAuth, RpcSaslProto
