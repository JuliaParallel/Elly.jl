# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

struct __enum_AclEntryProto_AclEntryScopeProto <: ProtoEnum
    ACCESS::Int32
    DEFAULT::Int32
    __enum_AclEntryProto_AclEntryScopeProto() = new(0,1)
end #struct __enum_AclEntryProto_AclEntryScopeProto
const AclEntryProto_AclEntryScopeProto = __enum_AclEntryProto_AclEntryScopeProto()

struct __enum_AclEntryProto_AclEntryTypeProto <: ProtoEnum
    USER::Int32
    GROUP::Int32
    MASK::Int32
    OTHER::Int32
    __enum_AclEntryProto_AclEntryTypeProto() = new(0,1,2,3)
end #struct __enum_AclEntryProto_AclEntryTypeProto
const AclEntryProto_AclEntryTypeProto = __enum_AclEntryProto_AclEntryTypeProto()

struct __enum_AclEntryProto_FsActionProto <: ProtoEnum
    NONE::Int32
    EXECUTE::Int32
    WRITE::Int32
    WRITE_EXECUTE::Int32
    READ::Int32
    READ_EXECUTE::Int32
    READ_WRITE::Int32
    PERM_ALL::Int32
    __enum_AclEntryProto_FsActionProto() = new(0,1,2,3,4,5,6,7)
end #struct __enum_AclEntryProto_FsActionProto
const AclEntryProto_FsActionProto = __enum_AclEntryProto_FsActionProto()

mutable struct AclEntryProto <: ProtoType
    _type::Int32
    scope::Int32
    permissions::Int32
    name::AbstractString
    AclEntryProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AclEntryProto
const __req_AclEntryProto = Symbol[:_type,:scope,:permissions]
meta(t::Type{AclEntryProto}) = meta(t, __req_AclEntryProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::AclEntryProto) = ProtoBuf.protohash(v)
isequal(v1::AclEntryProto, v2::AclEntryProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AclEntryProto, v2::AclEntryProto) = ProtoBuf.protoeq(v1, v2)

mutable struct AclStatusProto <: ProtoType
    owner::AbstractString
    group::AbstractString
    sticky::Bool
    entries::Vector{AclEntryProto}
    permission::FsPermissionProto
    AclStatusProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AclStatusProto
const __req_AclStatusProto = Symbol[:owner,:group,:sticky]
meta(t::Type{AclStatusProto}) = meta(t, __req_AclStatusProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::AclStatusProto) = ProtoBuf.protohash(v)
isequal(v1::AclStatusProto, v2::AclStatusProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AclStatusProto, v2::AclStatusProto) = ProtoBuf.protoeq(v1, v2)

mutable struct AclEditLogProto <: ProtoType
    src::AbstractString
    entries::Vector{AclEntryProto}
    AclEditLogProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AclEditLogProto
const __req_AclEditLogProto = Symbol[:src]
meta(t::Type{AclEditLogProto}) = meta(t, __req_AclEditLogProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::AclEditLogProto) = ProtoBuf.protohash(v)
isequal(v1::AclEditLogProto, v2::AclEditLogProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AclEditLogProto, v2::AclEditLogProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ModifyAclEntriesRequestProto <: ProtoType
    src::AbstractString
    aclSpec::Vector{AclEntryProto}
    ModifyAclEntriesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ModifyAclEntriesRequestProto
const __req_ModifyAclEntriesRequestProto = Symbol[:src]
meta(t::Type{ModifyAclEntriesRequestProto}) = meta(t, __req_ModifyAclEntriesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::ModifyAclEntriesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ModifyAclEntriesRequestProto, v2::ModifyAclEntriesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ModifyAclEntriesRequestProto, v2::ModifyAclEntriesRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ModifyAclEntriesResponseProto <: ProtoType
    ModifyAclEntriesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ModifyAclEntriesResponseProto
hash(v::ModifyAclEntriesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ModifyAclEntriesResponseProto, v2::ModifyAclEntriesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ModifyAclEntriesResponseProto, v2::ModifyAclEntriesResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct RemoveAclRequestProto <: ProtoType
    src::AbstractString
    RemoveAclRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveAclRequestProto
const __req_RemoveAclRequestProto = Symbol[:src]
meta(t::Type{RemoveAclRequestProto}) = meta(t, __req_RemoveAclRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::RemoveAclRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveAclRequestProto, v2::RemoveAclRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveAclRequestProto, v2::RemoveAclRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct RemoveAclResponseProto <: ProtoType
    RemoveAclResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveAclResponseProto
hash(v::RemoveAclResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveAclResponseProto, v2::RemoveAclResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveAclResponseProto, v2::RemoveAclResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct RemoveAclEntriesRequestProto <: ProtoType
    src::AbstractString
    aclSpec::Vector{AclEntryProto}
    RemoveAclEntriesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveAclEntriesRequestProto
const __req_RemoveAclEntriesRequestProto = Symbol[:src]
meta(t::Type{RemoveAclEntriesRequestProto}) = meta(t, __req_RemoveAclEntriesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::RemoveAclEntriesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveAclEntriesRequestProto, v2::RemoveAclEntriesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveAclEntriesRequestProto, v2::RemoveAclEntriesRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct RemoveAclEntriesResponseProto <: ProtoType
    RemoveAclEntriesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveAclEntriesResponseProto
hash(v::RemoveAclEntriesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveAclEntriesResponseProto, v2::RemoveAclEntriesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveAclEntriesResponseProto, v2::RemoveAclEntriesResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct RemoveDefaultAclRequestProto <: ProtoType
    src::AbstractString
    RemoveDefaultAclRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveDefaultAclRequestProto
const __req_RemoveDefaultAclRequestProto = Symbol[:src]
meta(t::Type{RemoveDefaultAclRequestProto}) = meta(t, __req_RemoveDefaultAclRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::RemoveDefaultAclRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveDefaultAclRequestProto, v2::RemoveDefaultAclRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveDefaultAclRequestProto, v2::RemoveDefaultAclRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct RemoveDefaultAclResponseProto <: ProtoType
    RemoveDefaultAclResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveDefaultAclResponseProto
hash(v::RemoveDefaultAclResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveDefaultAclResponseProto, v2::RemoveDefaultAclResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveDefaultAclResponseProto, v2::RemoveDefaultAclResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct SetAclRequestProto <: ProtoType
    src::AbstractString
    aclSpec::Vector{AclEntryProto}
    SetAclRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetAclRequestProto
const __req_SetAclRequestProto = Symbol[:src]
meta(t::Type{SetAclRequestProto}) = meta(t, __req_SetAclRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::SetAclRequestProto) = ProtoBuf.protohash(v)
isequal(v1::SetAclRequestProto, v2::SetAclRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetAclRequestProto, v2::SetAclRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct SetAclResponseProto <: ProtoType
    SetAclResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetAclResponseProto
hash(v::SetAclResponseProto) = ProtoBuf.protohash(v)
isequal(v1::SetAclResponseProto, v2::SetAclResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetAclResponseProto, v2::SetAclResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetAclStatusRequestProto <: ProtoType
    src::AbstractString
    GetAclStatusRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetAclStatusRequestProto
const __req_GetAclStatusRequestProto = Symbol[:src]
meta(t::Type{GetAclStatusRequestProto}) = meta(t, __req_GetAclStatusRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::GetAclStatusRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetAclStatusRequestProto, v2::GetAclStatusRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetAclStatusRequestProto, v2::GetAclStatusRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetAclStatusResponseProto <: ProtoType
    result::AclStatusProto
    GetAclStatusResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetAclStatusResponseProto
const __req_GetAclStatusResponseProto = Symbol[:result]
meta(t::Type{GetAclStatusResponseProto}) = meta(t, __req_GetAclStatusResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::GetAclStatusResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetAclStatusResponseProto, v2::GetAclStatusResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetAclStatusResponseProto, v2::GetAclStatusResponseProto) = ProtoBuf.protoeq(v1, v2)

export AclEntryProto_AclEntryScopeProto, AclEntryProto_AclEntryTypeProto, AclEntryProto_FsActionProto, AclEntryProto, AclStatusProto, AclEditLogProto, ModifyAclEntriesRequestProto, ModifyAclEntriesResponseProto, RemoveAclRequestProto, RemoveAclResponseProto, RemoveAclEntriesRequestProto, RemoveAclEntriesResponseProto, RemoveDefaultAclRequestProto, RemoveDefaultAclResponseProto, SetAclRequestProto, SetAclResponseProto, GetAclStatusRequestProto, GetAclStatusResponseProto
