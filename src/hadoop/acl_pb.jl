using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

type __enum_AclEntryProto_AclEntryScopeProto <: ProtoEnum
    ACCESS::Int32
    DEFAULT::Int32
    __enum_AclEntryProto_AclEntryScopeProto() = new(0,1)
end #type __enum_AclEntryProto_AclEntryScopeProto
const AclEntryProto_AclEntryScopeProto = __enum_AclEntryProto_AclEntryScopeProto()

type __enum_AclEntryProto_AclEntryTypeProto <: ProtoEnum
    USER::Int32
    GROUP::Int32
    MASK::Int32
    OTHER::Int32
    __enum_AclEntryProto_AclEntryTypeProto() = new(0,1,2,3)
end #type __enum_AclEntryProto_AclEntryTypeProto
const AclEntryProto_AclEntryTypeProto = __enum_AclEntryProto_AclEntryTypeProto()

type __enum_AclEntryProto_FsActionProto <: ProtoEnum
    NONE::Int32
    EXECUTE::Int32
    WRITE::Int32
    WRITE_EXECUTE::Int32
    READ::Int32
    READ_EXECUTE::Int32
    READ_WRITE::Int32
    PERM_ALL::Int32
    __enum_AclEntryProto_FsActionProto() = new(0,1,2,3,4,5,6,7)
end #type __enum_AclEntryProto_FsActionProto
const AclEntryProto_FsActionProto = __enum_AclEntryProto_FsActionProto()

type AclEntryProto
    _type::Int32
    scope::Int32
    permissions::Int32
    name::AbstractString
    AclEntryProto() = (o=new(); fillunset(o); o)
end #type AclEntryProto
const __req_AclEntryProto = Symbol[:_type,:scope,:permissions]
meta(t::Type{AclEntryProto}) = meta(t, __req_AclEntryProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::AclEntryProto) = ProtoBuf.protohash(v)
isequal(v1::AclEntryProto, v2::AclEntryProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AclEntryProto, v2::AclEntryProto) = ProtoBuf.protoeq(v1, v2)

type AclStatusProto
    owner::AbstractString
    group::AbstractString
    sticky::Bool
    entries::Array{AclEntryProto,1}
    permission::FsPermissionProto
    AclStatusProto() = (o=new(); fillunset(o); o)
end #type AclStatusProto
const __req_AclStatusProto = Symbol[:owner,:group,:sticky]
meta(t::Type{AclStatusProto}) = meta(t, __req_AclStatusProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::AclStatusProto) = ProtoBuf.protohash(v)
isequal(v1::AclStatusProto, v2::AclStatusProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AclStatusProto, v2::AclStatusProto) = ProtoBuf.protoeq(v1, v2)

type AclEditLogProto
    src::AbstractString
    entries::Array{AclEntryProto,1}
    AclEditLogProto() = (o=new(); fillunset(o); o)
end #type AclEditLogProto
const __req_AclEditLogProto = Symbol[:src]
meta(t::Type{AclEditLogProto}) = meta(t, __req_AclEditLogProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::AclEditLogProto) = ProtoBuf.protohash(v)
isequal(v1::AclEditLogProto, v2::AclEditLogProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AclEditLogProto, v2::AclEditLogProto) = ProtoBuf.protoeq(v1, v2)

type ModifyAclEntriesRequestProto
    src::AbstractString
    aclSpec::Array{AclEntryProto,1}
    ModifyAclEntriesRequestProto() = (o=new(); fillunset(o); o)
end #type ModifyAclEntriesRequestProto
const __req_ModifyAclEntriesRequestProto = Symbol[:src]
meta(t::Type{ModifyAclEntriesRequestProto}) = meta(t, __req_ModifyAclEntriesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ModifyAclEntriesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ModifyAclEntriesRequestProto, v2::ModifyAclEntriesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ModifyAclEntriesRequestProto, v2::ModifyAclEntriesRequestProto) = ProtoBuf.protoeq(v1, v2)

type ModifyAclEntriesResponseProto
    ModifyAclEntriesResponseProto() = (o=new(); fillunset(o); o)
end #type ModifyAclEntriesResponseProto
hash(v::ModifyAclEntriesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ModifyAclEntriesResponseProto, v2::ModifyAclEntriesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ModifyAclEntriesResponseProto, v2::ModifyAclEntriesResponseProto) = ProtoBuf.protoeq(v1, v2)

type RemoveAclRequestProto
    src::AbstractString
    RemoveAclRequestProto() = (o=new(); fillunset(o); o)
end #type RemoveAclRequestProto
const __req_RemoveAclRequestProto = Symbol[:src]
meta(t::Type{RemoveAclRequestProto}) = meta(t, __req_RemoveAclRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RemoveAclRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveAclRequestProto, v2::RemoveAclRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveAclRequestProto, v2::RemoveAclRequestProto) = ProtoBuf.protoeq(v1, v2)

type RemoveAclResponseProto
    RemoveAclResponseProto() = (o=new(); fillunset(o); o)
end #type RemoveAclResponseProto
hash(v::RemoveAclResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveAclResponseProto, v2::RemoveAclResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveAclResponseProto, v2::RemoveAclResponseProto) = ProtoBuf.protoeq(v1, v2)

type RemoveAclEntriesRequestProto
    src::AbstractString
    aclSpec::Array{AclEntryProto,1}
    RemoveAclEntriesRequestProto() = (o=new(); fillunset(o); o)
end #type RemoveAclEntriesRequestProto
const __req_RemoveAclEntriesRequestProto = Symbol[:src]
meta(t::Type{RemoveAclEntriesRequestProto}) = meta(t, __req_RemoveAclEntriesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RemoveAclEntriesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveAclEntriesRequestProto, v2::RemoveAclEntriesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveAclEntriesRequestProto, v2::RemoveAclEntriesRequestProto) = ProtoBuf.protoeq(v1, v2)

type RemoveAclEntriesResponseProto
    RemoveAclEntriesResponseProto() = (o=new(); fillunset(o); o)
end #type RemoveAclEntriesResponseProto
hash(v::RemoveAclEntriesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveAclEntriesResponseProto, v2::RemoveAclEntriesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveAclEntriesResponseProto, v2::RemoveAclEntriesResponseProto) = ProtoBuf.protoeq(v1, v2)

type RemoveDefaultAclRequestProto
    src::AbstractString
    RemoveDefaultAclRequestProto() = (o=new(); fillunset(o); o)
end #type RemoveDefaultAclRequestProto
const __req_RemoveDefaultAclRequestProto = Symbol[:src]
meta(t::Type{RemoveDefaultAclRequestProto}) = meta(t, __req_RemoveDefaultAclRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RemoveDefaultAclRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveDefaultAclRequestProto, v2::RemoveDefaultAclRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveDefaultAclRequestProto, v2::RemoveDefaultAclRequestProto) = ProtoBuf.protoeq(v1, v2)

type RemoveDefaultAclResponseProto
    RemoveDefaultAclResponseProto() = (o=new(); fillunset(o); o)
end #type RemoveDefaultAclResponseProto
hash(v::RemoveDefaultAclResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveDefaultAclResponseProto, v2::RemoveDefaultAclResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveDefaultAclResponseProto, v2::RemoveDefaultAclResponseProto) = ProtoBuf.protoeq(v1, v2)

type SetAclRequestProto
    src::AbstractString
    aclSpec::Array{AclEntryProto,1}
    SetAclRequestProto() = (o=new(); fillunset(o); o)
end #type SetAclRequestProto
const __req_SetAclRequestProto = Symbol[:src]
meta(t::Type{SetAclRequestProto}) = meta(t, __req_SetAclRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::SetAclRequestProto) = ProtoBuf.protohash(v)
isequal(v1::SetAclRequestProto, v2::SetAclRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetAclRequestProto, v2::SetAclRequestProto) = ProtoBuf.protoeq(v1, v2)

type SetAclResponseProto
    SetAclResponseProto() = (o=new(); fillunset(o); o)
end #type SetAclResponseProto
hash(v::SetAclResponseProto) = ProtoBuf.protohash(v)
isequal(v1::SetAclResponseProto, v2::SetAclResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetAclResponseProto, v2::SetAclResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetAclStatusRequestProto
    src::AbstractString
    GetAclStatusRequestProto() = (o=new(); fillunset(o); o)
end #type GetAclStatusRequestProto
const __req_GetAclStatusRequestProto = Symbol[:src]
meta(t::Type{GetAclStatusRequestProto}) = meta(t, __req_GetAclStatusRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetAclStatusRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetAclStatusRequestProto, v2::GetAclStatusRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetAclStatusRequestProto, v2::GetAclStatusRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetAclStatusResponseProto
    result::AclStatusProto
    GetAclStatusResponseProto() = (o=new(); fillunset(o); o)
end #type GetAclStatusResponseProto
const __req_GetAclStatusResponseProto = Symbol[:result]
meta(t::Type{GetAclStatusResponseProto}) = meta(t, __req_GetAclStatusResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetAclStatusResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetAclStatusResponseProto, v2::GetAclStatusResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetAclStatusResponseProto, v2::GetAclStatusResponseProto) = ProtoBuf.protoeq(v1, v2)

export AclEntryProto_AclEntryScopeProto, AclEntryProto_AclEntryTypeProto, AclEntryProto_FsActionProto, AclEntryProto, AclStatusProto, AclEditLogProto, ModifyAclEntriesRequestProto, ModifyAclEntriesResponseProto, RemoveAclRequestProto, RemoveAclResponseProto, RemoveAclEntriesRequestProto, RemoveAclEntriesResponseProto, RemoveDefaultAclRequestProto, RemoveDefaultAclResponseProto, SetAclRequestProto, SetAclResponseProto, GetAclStatusRequestProto, GetAclStatusResponseProto
