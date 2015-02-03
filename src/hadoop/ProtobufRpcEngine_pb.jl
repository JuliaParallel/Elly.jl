using Compat
using ProtoBuf
import ProtoBuf.meta

type RequestHeaderProto
    methodName::AbstractString
    declaringClassProtocolName::AbstractString
    clientProtocolVersion::UInt64
    RequestHeaderProto() = (o=new(); fillunset(o); o)
end #type RequestHeaderProto
const __req_RequestHeaderProto = Symbol[:methodName,:declaringClassProtocolName,:clientProtocolVersion]
meta(t::Type{RequestHeaderProto}) = meta(t, __req_RequestHeaderProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

export RequestHeaderProto
