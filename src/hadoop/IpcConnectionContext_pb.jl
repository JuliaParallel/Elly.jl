using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

type UserInformationProto
    effectiveUser::AbstractString
    realUser::AbstractString
    UserInformationProto() = (o=new(); fillunset(o); o)
end #type UserInformationProto
hash(v::UserInformationProto) = ProtoBuf.protohash(v)
isequal(v1::UserInformationProto, v2::UserInformationProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::UserInformationProto, v2::UserInformationProto) = ProtoBuf.protoeq(v1, v2)

type IpcConnectionContextProto
    userInfo::UserInformationProto
    protocol::AbstractString
    IpcConnectionContextProto() = (o=new(); fillunset(o); o)
end #type IpcConnectionContextProto
const __fnum_IpcConnectionContextProto = Int[2,3]
meta(t::Type{IpcConnectionContextProto}) = meta(t, ProtoBuf.DEF_REQ, __fnum_IpcConnectionContextProto, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::IpcConnectionContextProto) = ProtoBuf.protohash(v)
isequal(v1::IpcConnectionContextProto, v2::IpcConnectionContextProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::IpcConnectionContextProto, v2::IpcConnectionContextProto) = ProtoBuf.protoeq(v1, v2)

export UserInformationProto, IpcConnectionContextProto
