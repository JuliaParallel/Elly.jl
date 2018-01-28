# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

mutable struct RequestHeaderProto <: ProtoType
    methodName::AbstractString
    declaringClassProtocolName::AbstractString
    clientProtocolVersion::UInt64
    RequestHeaderProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RequestHeaderProto
const __req_RequestHeaderProto = Symbol[:methodName,:declaringClassProtocolName,:clientProtocolVersion]
meta(t::Type{RequestHeaderProto}) = meta(t, __req_RequestHeaderProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::RequestHeaderProto) = ProtoBuf.protohash(v)
isequal(v1::RequestHeaderProto, v2::RequestHeaderProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RequestHeaderProto, v2::RequestHeaderProto) = ProtoBuf.protoeq(v1, v2)

export RequestHeaderProto
