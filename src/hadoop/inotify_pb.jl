using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

type __enum_EventType <: ProtoEnum
    EVENT_CREATE::Int32
    EVENT_CLOSE::Int32
    EVENT_APPEND::Int32
    EVENT_RENAME::Int32
    EVENT_METADATA::Int32
    EVENT_UNLINK::Int32
    __enum_EventType() = new(0,1,2,3,4,5)
end #type __enum_EventType
const EventType = __enum_EventType()

type __enum_INodeType <: ProtoEnum
    I_TYPE_FILE::Int32
    I_TYPE_DIRECTORY::Int32
    I_TYPE_SYMLINK::Int32
    __enum_INodeType() = new(0,1,2)
end #type __enum_INodeType
const INodeType = __enum_INodeType()

type __enum_MetadataUpdateType <: ProtoEnum
    META_TYPE_TIMES::Int32
    META_TYPE_REPLICATION::Int32
    META_TYPE_OWNER::Int32
    META_TYPE_PERMS::Int32
    META_TYPE_ACLS::Int32
    META_TYPE_XATTRS::Int32
    __enum_MetadataUpdateType() = new(0,1,2,3,4,5)
end #type __enum_MetadataUpdateType
const MetadataUpdateType = __enum_MetadataUpdateType()

type EventProto
    _type::Int32
    contents::Array{UInt8,1}
    EventProto() = (o=new(); fillunset(o); o)
end #type EventProto
const __req_EventProto = Symbol[:_type,:contents]
meta(t::Type{EventProto}) = meta(t, __req_EventProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::EventProto) = ProtoBuf.protohash(v)
isequal(v1::EventProto, v2::EventProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::EventProto, v2::EventProto) = ProtoBuf.protoeq(v1, v2)

type CreateEventProto
    _type::Int32
    path::AbstractString
    ctime::Int64
    ownerName::AbstractString
    groupName::AbstractString
    perms::FsPermissionProto
    replication::Int32
    symlinkTarget::AbstractString
    overwrite::Bool
    CreateEventProto() = (o=new(); fillunset(o); o)
end #type CreateEventProto
const __req_CreateEventProto = Symbol[:_type,:path,:ctime,:ownerName,:groupName,:perms]
meta(t::Type{CreateEventProto}) = meta(t, __req_CreateEventProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CreateEventProto) = ProtoBuf.protohash(v)
isequal(v1::CreateEventProto, v2::CreateEventProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CreateEventProto, v2::CreateEventProto) = ProtoBuf.protoeq(v1, v2)

type CloseEventProto
    path::AbstractString
    fileSize::Int64
    timestamp::Int64
    CloseEventProto() = (o=new(); fillunset(o); o)
end #type CloseEventProto
const __req_CloseEventProto = Symbol[:path,:fileSize,:timestamp]
meta(t::Type{CloseEventProto}) = meta(t, __req_CloseEventProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CloseEventProto) = ProtoBuf.protohash(v)
isequal(v1::CloseEventProto, v2::CloseEventProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CloseEventProto, v2::CloseEventProto) = ProtoBuf.protoeq(v1, v2)

type AppendEventProto
    path::AbstractString
    AppendEventProto() = (o=new(); fillunset(o); o)
end #type AppendEventProto
const __req_AppendEventProto = Symbol[:path]
meta(t::Type{AppendEventProto}) = meta(t, __req_AppendEventProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::AppendEventProto) = ProtoBuf.protohash(v)
isequal(v1::AppendEventProto, v2::AppendEventProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AppendEventProto, v2::AppendEventProto) = ProtoBuf.protoeq(v1, v2)

type RenameEventProto
    srcPath::AbstractString
    destPath::AbstractString
    timestamp::Int64
    RenameEventProto() = (o=new(); fillunset(o); o)
end #type RenameEventProto
const __req_RenameEventProto = Symbol[:srcPath,:destPath,:timestamp]
meta(t::Type{RenameEventProto}) = meta(t, __req_RenameEventProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RenameEventProto) = ProtoBuf.protohash(v)
isequal(v1::RenameEventProto, v2::RenameEventProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RenameEventProto, v2::RenameEventProto) = ProtoBuf.protoeq(v1, v2)

type MetadataUpdateEventProto
    path::AbstractString
    _type::Int32
    mtime::Int64
    atime::Int64
    replication::Int32
    ownerName::AbstractString
    groupName::AbstractString
    perms::FsPermissionProto
    acls::Array{AclEntryProto,1}
    xAttrs::Array{XAttrProto,1}
    xAttrsRemoved::Bool
    MetadataUpdateEventProto() = (o=new(); fillunset(o); o)
end #type MetadataUpdateEventProto
const __req_MetadataUpdateEventProto = Symbol[:path,:_type]
meta(t::Type{MetadataUpdateEventProto}) = meta(t, __req_MetadataUpdateEventProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::MetadataUpdateEventProto) = ProtoBuf.protohash(v)
isequal(v1::MetadataUpdateEventProto, v2::MetadataUpdateEventProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::MetadataUpdateEventProto, v2::MetadataUpdateEventProto) = ProtoBuf.protoeq(v1, v2)

type UnlinkEventProto
    path::AbstractString
    timestamp::Int64
    UnlinkEventProto() = (o=new(); fillunset(o); o)
end #type UnlinkEventProto
const __req_UnlinkEventProto = Symbol[:path,:timestamp]
meta(t::Type{UnlinkEventProto}) = meta(t, __req_UnlinkEventProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::UnlinkEventProto) = ProtoBuf.protohash(v)
isequal(v1::UnlinkEventProto, v2::UnlinkEventProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::UnlinkEventProto, v2::UnlinkEventProto) = ProtoBuf.protoeq(v1, v2)

type EventsListProto
    events::Array{EventProto,1}
    firstTxid::Int64
    lastTxid::Int64
    syncTxid::Int64
    EventsListProto() = (o=new(); fillunset(o); o)
end #type EventsListProto
const __req_EventsListProto = Symbol[:firstTxid,:lastTxid,:syncTxid]
meta(t::Type{EventsListProto}) = meta(t, __req_EventsListProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::EventsListProto) = ProtoBuf.protohash(v)
isequal(v1::EventsListProto, v2::EventsListProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::EventsListProto, v2::EventsListProto) = ProtoBuf.protoeq(v1, v2)

export EventType, INodeType, MetadataUpdateType, EventProto, CreateEventProto, CloseEventProto, AppendEventProto, RenameEventProto, MetadataUpdateEventProto, UnlinkEventProto, EventsListProto
