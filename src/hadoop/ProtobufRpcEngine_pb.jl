using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

type RequestHeaderProto
    methodName::AbstractString
    declaringClassProtocolName::AbstractString
    clientProtocolVersion::UInt64
    RequestHeaderProto() = (o=new(); fillunset(o); o)
end #type RequestHeaderProto
const __req_RequestHeaderProto = Symbol[:methodName,:declaringClassProtocolName,:clientProtocolVersion]
meta(t::Type{RequestHeaderProto}) = meta(t, __req_RequestHeaderProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RequestHeaderProto) = ProtoBuf.protohash(v)
isequal(v1::RequestHeaderProto, v2::RequestHeaderProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RequestHeaderProto, v2::RequestHeaderProto) = ProtoBuf.protoeq(v1, v2)

export RequestHeaderProto
