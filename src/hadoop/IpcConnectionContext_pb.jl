using Compat
using ProtoBuf
import ProtoBuf.meta

type UserInformationProto
    effectiveUser::AbstractString
    realUser::AbstractString
    UserInformationProto() = (o=new(); fillunset(o); o)
end #type UserInformationProto

type IpcConnectionContextProto
    userInfo::UserInformationProto
    protocol::AbstractString
    IpcConnectionContextProto() = (o=new(); fillunset(o); o)
end #type IpcConnectionContextProto
const __fnum_IpcConnectionContextProto = Int[2,3]
meta(t::Type{IpcConnectionContextProto}) = meta(t, ProtoBuf.DEF_REQ, __fnum_IpcConnectionContextProto, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

export UserInformationProto, IpcConnectionContextProto
