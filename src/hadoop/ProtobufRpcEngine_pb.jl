# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta

mutable struct RequestHeaderProto <: ProtoType
    methodName::AbstractString
    declaringClassProtocolName::AbstractString
    clientProtocolVersion::UInt64
    RequestHeaderProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RequestHeaderProto
const __req_RequestHeaderProto = Symbol[:methodName,:declaringClassProtocolName,:clientProtocolVersion]
meta(t::Type{RequestHeaderProto}) = meta(t, __req_RequestHeaderProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

export RequestHeaderProto
