# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta

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

mutable struct AclStatusProto <: ProtoType
    owner::AbstractString
    group::AbstractString
    sticky::Bool
    entries::Base.Vector{AclEntryProto}
    permission::FsPermissionProto
    AclStatusProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AclStatusProto
const __req_AclStatusProto = Symbol[:owner,:group,:sticky]
meta(t::Type{AclStatusProto}) = meta(t, __req_AclStatusProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct AclEditLogProto <: ProtoType
    src::AbstractString
    entries::Base.Vector{AclEntryProto}
    AclEditLogProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AclEditLogProto
const __req_AclEditLogProto = Symbol[:src]
meta(t::Type{AclEditLogProto}) = meta(t, __req_AclEditLogProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ModifyAclEntriesRequestProto <: ProtoType
    src::AbstractString
    aclSpec::Base.Vector{AclEntryProto}
    ModifyAclEntriesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ModifyAclEntriesRequestProto
const __req_ModifyAclEntriesRequestProto = Symbol[:src]
meta(t::Type{ModifyAclEntriesRequestProto}) = meta(t, __req_ModifyAclEntriesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ModifyAclEntriesResponseProto <: ProtoType
    ModifyAclEntriesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ModifyAclEntriesResponseProto

mutable struct RemoveAclRequestProto <: ProtoType
    src::AbstractString
    RemoveAclRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveAclRequestProto
const __req_RemoveAclRequestProto = Symbol[:src]
meta(t::Type{RemoveAclRequestProto}) = meta(t, __req_RemoveAclRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RemoveAclResponseProto <: ProtoType
    RemoveAclResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveAclResponseProto

mutable struct RemoveAclEntriesRequestProto <: ProtoType
    src::AbstractString
    aclSpec::Base.Vector{AclEntryProto}
    RemoveAclEntriesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveAclEntriesRequestProto
const __req_RemoveAclEntriesRequestProto = Symbol[:src]
meta(t::Type{RemoveAclEntriesRequestProto}) = meta(t, __req_RemoveAclEntriesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RemoveAclEntriesResponseProto <: ProtoType
    RemoveAclEntriesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveAclEntriesResponseProto

mutable struct RemoveDefaultAclRequestProto <: ProtoType
    src::AbstractString
    RemoveDefaultAclRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveDefaultAclRequestProto
const __req_RemoveDefaultAclRequestProto = Symbol[:src]
meta(t::Type{RemoveDefaultAclRequestProto}) = meta(t, __req_RemoveDefaultAclRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RemoveDefaultAclResponseProto <: ProtoType
    RemoveDefaultAclResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveDefaultAclResponseProto

mutable struct SetAclRequestProto <: ProtoType
    src::AbstractString
    aclSpec::Base.Vector{AclEntryProto}
    SetAclRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetAclRequestProto
const __req_SetAclRequestProto = Symbol[:src]
meta(t::Type{SetAclRequestProto}) = meta(t, __req_SetAclRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SetAclResponseProto <: ProtoType
    SetAclResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetAclResponseProto

mutable struct GetAclStatusRequestProto <: ProtoType
    src::AbstractString
    GetAclStatusRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetAclStatusRequestProto
const __req_GetAclStatusRequestProto = Symbol[:src]
meta(t::Type{GetAclStatusRequestProto}) = meta(t, __req_GetAclStatusRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetAclStatusResponseProto <: ProtoType
    result::AclStatusProto
    GetAclStatusResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetAclStatusResponseProto
const __req_GetAclStatusResponseProto = Symbol[:result]
meta(t::Type{GetAclStatusResponseProto}) = meta(t, __req_GetAclStatusResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

export AclEntryProto_AclEntryScopeProto, AclEntryProto_AclEntryTypeProto, AclEntryProto_FsActionProto, AclEntryProto, AclStatusProto, AclEditLogProto, ModifyAclEntriesRequestProto, ModifyAclEntriesResponseProto, RemoveAclRequestProto, RemoveAclResponseProto, RemoveAclEntriesRequestProto, RemoveAclEntriesResponseProto, RemoveDefaultAclRequestProto, RemoveDefaultAclResponseProto, SetAclRequestProto, SetAclResponseProto, GetAclStatusRequestProto, GetAclStatusResponseProto
