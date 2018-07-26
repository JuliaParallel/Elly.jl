# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta

mutable struct UserInformationProto <: ProtoType
    effectiveUser::AbstractString
    realUser::AbstractString
    UserInformationProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UserInformationProto

mutable struct IpcConnectionContextProto <: ProtoType
    userInfo::UserInformationProto
    protocol::AbstractString
    IpcConnectionContextProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct IpcConnectionContextProto
const __fnum_IpcConnectionContextProto = Int[2,3]
meta(t::Type{IpcConnectionContextProto}) = meta(t, ProtoBuf.DEF_REQ, __fnum_IpcConnectionContextProto, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

export UserInformationProto, IpcConnectionContextProto
