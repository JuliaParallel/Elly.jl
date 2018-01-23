# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

mutable struct UserInformationProto <: ProtoType
    effectiveUser::AbstractString
    realUser::AbstractString
    UserInformationProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UserInformationProto
hash(v::UserInformationProto) = ProtoBuf.protohash(v)
isequal(v1::UserInformationProto, v2::UserInformationProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::UserInformationProto, v2::UserInformationProto) = ProtoBuf.protoeq(v1, v2)

mutable struct IpcConnectionContextProto <: ProtoType
    userInfo::UserInformationProto
    protocol::AbstractString
    IpcConnectionContextProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct IpcConnectionContextProto
const __fnum_IpcConnectionContextProto = Int[2,3]
meta(t::Type{IpcConnectionContextProto}) = meta(t, ProtoBuf.DEF_REQ, __fnum_IpcConnectionContextProto, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::IpcConnectionContextProto) = ProtoBuf.protohash(v)
isequal(v1::IpcConnectionContextProto, v2::IpcConnectionContextProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::IpcConnectionContextProto, v2::IpcConnectionContextProto) = ProtoBuf.protoeq(v1, v2)

export UserInformationProto, IpcConnectionContextProto
