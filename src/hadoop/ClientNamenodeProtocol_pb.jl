# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta
import ..hadoop

struct __enum_CreateFlagProto <: ProtoEnum
    CREATE::Int32
    OVERWRITE::Int32
    APPEND::Int32
    LAZY_PERSIST::Int32
    NEW_BLOCK::Int32
    __enum_CreateFlagProto() = new(1,2,4,16,32)
end #struct __enum_CreateFlagProto
const CreateFlagProto = __enum_CreateFlagProto()

struct __enum_DatanodeReportTypeProto <: ProtoEnum
    ALL::Int32
    LIVE::Int32
    DEAD::Int32
    DECOMMISSIONING::Int32
    __enum_DatanodeReportTypeProto() = new(1,2,3,4)
end #struct __enum_DatanodeReportTypeProto
const DatanodeReportTypeProto = __enum_DatanodeReportTypeProto()

struct __enum_SafeModeActionProto <: ProtoEnum
    SAFEMODE_LEAVE::Int32
    SAFEMODE_ENTER::Int32
    SAFEMODE_GET::Int32
    __enum_SafeModeActionProto() = new(1,2,3)
end #struct __enum_SafeModeActionProto
const SafeModeActionProto = __enum_SafeModeActionProto()

struct __enum_RollingUpgradeActionProto <: ProtoEnum
    QUERY::Int32
    START::Int32
    FINALIZE::Int32
    __enum_RollingUpgradeActionProto() = new(1,2,3)
end #struct __enum_RollingUpgradeActionProto
const RollingUpgradeActionProto = __enum_RollingUpgradeActionProto()

struct __enum_CacheFlagProto <: ProtoEnum
    FORCE::Int32
    __enum_CacheFlagProto() = new(1)
end #struct __enum_CacheFlagProto
const CacheFlagProto = __enum_CacheFlagProto()

mutable struct GetBlockLocationsRequestProto <: ProtoType
    src::AbstractString
    offset::UInt64
    length::UInt64
    GetBlockLocationsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetBlockLocationsRequestProto
const __req_GetBlockLocationsRequestProto = Symbol[:src,:offset,:length]
meta(t::Type{GetBlockLocationsRequestProto}) = meta(t, __req_GetBlockLocationsRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetBlockLocationsResponseProto <: ProtoType
    locations::LocatedBlocksProto
    GetBlockLocationsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetBlockLocationsResponseProto

mutable struct GetServerDefaultsRequestProto <: ProtoType
    GetServerDefaultsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetServerDefaultsRequestProto

mutable struct GetServerDefaultsResponseProto <: ProtoType
    serverDefaults::FsServerDefaultsProto
    GetServerDefaultsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetServerDefaultsResponseProto
const __req_GetServerDefaultsResponseProto = Symbol[:serverDefaults]
meta(t::Type{GetServerDefaultsResponseProto}) = meta(t, __req_GetServerDefaultsResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CreateRequestProto <: ProtoType
    src::AbstractString
    masked::FsPermissionProto
    clientName::AbstractString
    createFlag::UInt32
    createParent::Bool
    replication::UInt32
    blockSize::UInt64
    cryptoProtocolVersion::Base.Vector{Int32}
    CreateRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CreateRequestProto
const __req_CreateRequestProto = Symbol[:src,:masked,:clientName,:createFlag,:createParent,:replication,:blockSize]
meta(t::Type{CreateRequestProto}) = meta(t, __req_CreateRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CreateResponseProto <: ProtoType
    fs::HdfsFileStatusProto
    CreateResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CreateResponseProto

mutable struct AppendRequestProto <: ProtoType
    src::AbstractString
    clientName::AbstractString
    flag::UInt32
    AppendRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AppendRequestProto
const __req_AppendRequestProto = Symbol[:src,:clientName]
meta(t::Type{AppendRequestProto}) = meta(t, __req_AppendRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct AppendResponseProto <: ProtoType
    block::LocatedBlockProto
    stat::HdfsFileStatusProto
    AppendResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AppendResponseProto

mutable struct SetReplicationRequestProto <: ProtoType
    src::AbstractString
    replication::UInt32
    SetReplicationRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetReplicationRequestProto
const __req_SetReplicationRequestProto = Symbol[:src,:replication]
meta(t::Type{SetReplicationRequestProto}) = meta(t, __req_SetReplicationRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SetReplicationResponseProto <: ProtoType
    result::Bool
    SetReplicationResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetReplicationResponseProto
const __req_SetReplicationResponseProto = Symbol[:result]
meta(t::Type{SetReplicationResponseProto}) = meta(t, __req_SetReplicationResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SetStoragePolicyRequestProto <: ProtoType
    src::AbstractString
    policyName::AbstractString
    SetStoragePolicyRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetStoragePolicyRequestProto
const __req_SetStoragePolicyRequestProto = Symbol[:src,:policyName]
meta(t::Type{SetStoragePolicyRequestProto}) = meta(t, __req_SetStoragePolicyRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SetStoragePolicyResponseProto <: ProtoType
    SetStoragePolicyResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetStoragePolicyResponseProto

mutable struct GetStoragePoliciesRequestProto <: ProtoType
    GetStoragePoliciesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetStoragePoliciesRequestProto

mutable struct GetStoragePoliciesResponseProto <: ProtoType
    policies::Base.Vector{BlockStoragePolicyProto}
    GetStoragePoliciesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetStoragePoliciesResponseProto

mutable struct SetPermissionRequestProto <: ProtoType
    src::AbstractString
    permission::FsPermissionProto
    SetPermissionRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetPermissionRequestProto
const __req_SetPermissionRequestProto = Symbol[:src,:permission]
meta(t::Type{SetPermissionRequestProto}) = meta(t, __req_SetPermissionRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SetPermissionResponseProto <: ProtoType
    SetPermissionResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetPermissionResponseProto

mutable struct SetOwnerRequestProto <: ProtoType
    src::AbstractString
    username::AbstractString
    groupname::AbstractString
    SetOwnerRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetOwnerRequestProto
const __req_SetOwnerRequestProto = Symbol[:src]
meta(t::Type{SetOwnerRequestProto}) = meta(t, __req_SetOwnerRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SetOwnerResponseProto <: ProtoType
    SetOwnerResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetOwnerResponseProto

mutable struct AbandonBlockRequestProto <: ProtoType
    b::ExtendedBlockProto
    src::AbstractString
    holder::AbstractString
    fileId::UInt64
    AbandonBlockRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AbandonBlockRequestProto
const __req_AbandonBlockRequestProto = Symbol[:b,:src,:holder]
const __val_AbandonBlockRequestProto = Dict(:fileId => 0)
meta(t::Type{AbandonBlockRequestProto}) = meta(t, __req_AbandonBlockRequestProto, ProtoBuf.DEF_FNUM, __val_AbandonBlockRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct AbandonBlockResponseProto <: ProtoType
    AbandonBlockResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AbandonBlockResponseProto

mutable struct AddBlockRequestProto <: ProtoType
    src::AbstractString
    clientName::AbstractString
    previous::ExtendedBlockProto
    excludeNodes::Base.Vector{DatanodeInfoProto}
    fileId::UInt64
    favoredNodes::Base.Vector{AbstractString}
    AddBlockRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AddBlockRequestProto
const __req_AddBlockRequestProto = Symbol[:src,:clientName]
const __val_AddBlockRequestProto = Dict(:fileId => 0)
meta(t::Type{AddBlockRequestProto}) = meta(t, __req_AddBlockRequestProto, ProtoBuf.DEF_FNUM, __val_AddBlockRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct AddBlockResponseProto <: ProtoType
    block::LocatedBlockProto
    AddBlockResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AddBlockResponseProto
const __req_AddBlockResponseProto = Symbol[:block]
meta(t::Type{AddBlockResponseProto}) = meta(t, __req_AddBlockResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetAdditionalDatanodeRequestProto <: ProtoType
    src::AbstractString
    blk::ExtendedBlockProto
    existings::Base.Vector{DatanodeInfoProto}
    excludes::Base.Vector{DatanodeInfoProto}
    numAdditionalNodes::UInt32
    clientName::AbstractString
    existingStorageUuids::Base.Vector{AbstractString}
    fileId::UInt64
    GetAdditionalDatanodeRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetAdditionalDatanodeRequestProto
const __req_GetAdditionalDatanodeRequestProto = Symbol[:src,:blk,:numAdditionalNodes,:clientName]
const __val_GetAdditionalDatanodeRequestProto = Dict(:fileId => 0)
meta(t::Type{GetAdditionalDatanodeRequestProto}) = meta(t, __req_GetAdditionalDatanodeRequestProto, ProtoBuf.DEF_FNUM, __val_GetAdditionalDatanodeRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetAdditionalDatanodeResponseProto <: ProtoType
    block::LocatedBlockProto
    GetAdditionalDatanodeResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetAdditionalDatanodeResponseProto
const __req_GetAdditionalDatanodeResponseProto = Symbol[:block]
meta(t::Type{GetAdditionalDatanodeResponseProto}) = meta(t, __req_GetAdditionalDatanodeResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CompleteRequestProto <: ProtoType
    src::AbstractString
    clientName::AbstractString
    last::ExtendedBlockProto
    fileId::UInt64
    CompleteRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CompleteRequestProto
const __req_CompleteRequestProto = Symbol[:src,:clientName]
const __val_CompleteRequestProto = Dict(:fileId => 0)
meta(t::Type{CompleteRequestProto}) = meta(t, __req_CompleteRequestProto, ProtoBuf.DEF_FNUM, __val_CompleteRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CompleteResponseProto <: ProtoType
    result::Bool
    CompleteResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CompleteResponseProto
const __req_CompleteResponseProto = Symbol[:result]
meta(t::Type{CompleteResponseProto}) = meta(t, __req_CompleteResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ReportBadBlocksRequestProto <: ProtoType
    blocks::Base.Vector{LocatedBlockProto}
    ReportBadBlocksRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReportBadBlocksRequestProto

mutable struct ReportBadBlocksResponseProto <: ProtoType
    ReportBadBlocksResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReportBadBlocksResponseProto

mutable struct ConcatRequestProto <: ProtoType
    trg::AbstractString
    srcs::Base.Vector{AbstractString}
    ConcatRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ConcatRequestProto
const __req_ConcatRequestProto = Symbol[:trg]
meta(t::Type{ConcatRequestProto}) = meta(t, __req_ConcatRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ConcatResponseProto <: ProtoType
    ConcatResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ConcatResponseProto

mutable struct TruncateRequestProto <: ProtoType
    src::AbstractString
    newLength::UInt64
    clientName::AbstractString
    TruncateRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct TruncateRequestProto
const __req_TruncateRequestProto = Symbol[:src,:newLength,:clientName]
meta(t::Type{TruncateRequestProto}) = meta(t, __req_TruncateRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct TruncateResponseProto <: ProtoType
    result::Bool
    TruncateResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct TruncateResponseProto
const __req_TruncateResponseProto = Symbol[:result]
meta(t::Type{TruncateResponseProto}) = meta(t, __req_TruncateResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RenameRequestProto <: ProtoType
    src::AbstractString
    dst::AbstractString
    RenameRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RenameRequestProto
const __req_RenameRequestProto = Symbol[:src,:dst]
meta(t::Type{RenameRequestProto}) = meta(t, __req_RenameRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RenameResponseProto <: ProtoType
    result::Bool
    RenameResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RenameResponseProto
const __req_RenameResponseProto = Symbol[:result]
meta(t::Type{RenameResponseProto}) = meta(t, __req_RenameResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Rename2RequestProto <: ProtoType
    src::AbstractString
    dst::AbstractString
    overwriteDest::Bool
    Rename2RequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Rename2RequestProto
const __req_Rename2RequestProto = Symbol[:src,:dst,:overwriteDest]
meta(t::Type{Rename2RequestProto}) = meta(t, __req_Rename2RequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Rename2ResponseProto <: ProtoType
    Rename2ResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Rename2ResponseProto

mutable struct DeleteRequestProto <: ProtoType
    src::AbstractString
    recursive::Bool
    DeleteRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DeleteRequestProto
const __req_DeleteRequestProto = Symbol[:src,:recursive]
meta(t::Type{DeleteRequestProto}) = meta(t, __req_DeleteRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct DeleteResponseProto <: ProtoType
    result::Bool
    DeleteResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DeleteResponseProto
const __req_DeleteResponseProto = Symbol[:result]
meta(t::Type{DeleteResponseProto}) = meta(t, __req_DeleteResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct MkdirsRequestProto <: ProtoType
    src::AbstractString
    masked::FsPermissionProto
    createParent::Bool
    MkdirsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MkdirsRequestProto
const __req_MkdirsRequestProto = Symbol[:src,:masked,:createParent]
meta(t::Type{MkdirsRequestProto}) = meta(t, __req_MkdirsRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct MkdirsResponseProto <: ProtoType
    result::Bool
    MkdirsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MkdirsResponseProto
const __req_MkdirsResponseProto = Symbol[:result]
meta(t::Type{MkdirsResponseProto}) = meta(t, __req_MkdirsResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetListingRequestProto <: ProtoType
    src::AbstractString
    startAfter::Array{UInt8,1}
    needLocation::Bool
    GetListingRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetListingRequestProto
const __req_GetListingRequestProto = Symbol[:src,:startAfter,:needLocation]
meta(t::Type{GetListingRequestProto}) = meta(t, __req_GetListingRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetListingResponseProto <: ProtoType
    dirList::DirectoryListingProto
    GetListingResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetListingResponseProto

mutable struct GetSnapshottableDirListingRequestProto <: ProtoType
    GetSnapshottableDirListingRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetSnapshottableDirListingRequestProto

mutable struct GetSnapshottableDirListingResponseProto <: ProtoType
    snapshottableDirList::SnapshottableDirectoryListingProto
    GetSnapshottableDirListingResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetSnapshottableDirListingResponseProto

mutable struct GetSnapshotDiffReportRequestProto <: ProtoType
    snapshotRoot::AbstractString
    fromSnapshot::AbstractString
    toSnapshot::AbstractString
    GetSnapshotDiffReportRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetSnapshotDiffReportRequestProto
const __req_GetSnapshotDiffReportRequestProto = Symbol[:snapshotRoot,:fromSnapshot,:toSnapshot]
meta(t::Type{GetSnapshotDiffReportRequestProto}) = meta(t, __req_GetSnapshotDiffReportRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetSnapshotDiffReportResponseProto <: ProtoType
    diffReport::SnapshotDiffReportProto
    GetSnapshotDiffReportResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetSnapshotDiffReportResponseProto
const __req_GetSnapshotDiffReportResponseProto = Symbol[:diffReport]
meta(t::Type{GetSnapshotDiffReportResponseProto}) = meta(t, __req_GetSnapshotDiffReportResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RenewLeaseRequestProto <: ProtoType
    clientName::AbstractString
    RenewLeaseRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RenewLeaseRequestProto
const __req_RenewLeaseRequestProto = Symbol[:clientName]
meta(t::Type{RenewLeaseRequestProto}) = meta(t, __req_RenewLeaseRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RenewLeaseResponseProto <: ProtoType
    RenewLeaseResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RenewLeaseResponseProto

mutable struct RecoverLeaseRequestProto <: ProtoType
    src::AbstractString
    clientName::AbstractString
    RecoverLeaseRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RecoverLeaseRequestProto
const __req_RecoverLeaseRequestProto = Symbol[:src,:clientName]
meta(t::Type{RecoverLeaseRequestProto}) = meta(t, __req_RecoverLeaseRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RecoverLeaseResponseProto <: ProtoType
    result::Bool
    RecoverLeaseResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RecoverLeaseResponseProto
const __req_RecoverLeaseResponseProto = Symbol[:result]
meta(t::Type{RecoverLeaseResponseProto}) = meta(t, __req_RecoverLeaseResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetFsStatusRequestProto <: ProtoType
    GetFsStatusRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetFsStatusRequestProto

mutable struct GetFsStatsResponseProto <: ProtoType
    capacity::UInt64
    used::UInt64
    remaining::UInt64
    under_replicated::UInt64
    corrupt_blocks::UInt64
    missing_blocks::UInt64
    missing_repl_one_blocks::UInt64
    GetFsStatsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetFsStatsResponseProto
const __req_GetFsStatsResponseProto = Symbol[:capacity,:used,:remaining,:under_replicated,:corrupt_blocks,:missing_blocks]
meta(t::Type{GetFsStatsResponseProto}) = meta(t, __req_GetFsStatsResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetDatanodeReportRequestProto <: ProtoType
    _type::Int32
    GetDatanodeReportRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetDatanodeReportRequestProto
const __req_GetDatanodeReportRequestProto = Symbol[:_type]
meta(t::Type{GetDatanodeReportRequestProto}) = meta(t, __req_GetDatanodeReportRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetDatanodeReportResponseProto <: ProtoType
    di::Base.Vector{DatanodeInfoProto}
    GetDatanodeReportResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetDatanodeReportResponseProto

mutable struct GetDatanodeStorageReportRequestProto <: ProtoType
    _type::Int32
    GetDatanodeStorageReportRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetDatanodeStorageReportRequestProto
const __req_GetDatanodeStorageReportRequestProto = Symbol[:_type]
meta(t::Type{GetDatanodeStorageReportRequestProto}) = meta(t, __req_GetDatanodeStorageReportRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct DatanodeStorageReportProto <: ProtoType
    datanodeInfo::DatanodeInfoProto
    storageReports::Base.Vector{StorageReportProto}
    DatanodeStorageReportProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DatanodeStorageReportProto
const __req_DatanodeStorageReportProto = Symbol[:datanodeInfo]
meta(t::Type{DatanodeStorageReportProto}) = meta(t, __req_DatanodeStorageReportProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetDatanodeStorageReportResponseProto <: ProtoType
    datanodeStorageReports::Base.Vector{DatanodeStorageReportProto}
    GetDatanodeStorageReportResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetDatanodeStorageReportResponseProto

mutable struct GetPreferredBlockSizeRequestProto <: ProtoType
    filename::AbstractString
    GetPreferredBlockSizeRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetPreferredBlockSizeRequestProto
const __req_GetPreferredBlockSizeRequestProto = Symbol[:filename]
meta(t::Type{GetPreferredBlockSizeRequestProto}) = meta(t, __req_GetPreferredBlockSizeRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetPreferredBlockSizeResponseProto <: ProtoType
    bsize::UInt64
    GetPreferredBlockSizeResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetPreferredBlockSizeResponseProto
const __req_GetPreferredBlockSizeResponseProto = Symbol[:bsize]
meta(t::Type{GetPreferredBlockSizeResponseProto}) = meta(t, __req_GetPreferredBlockSizeResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SetSafeModeRequestProto <: ProtoType
    action::Int32
    checked::Bool
    SetSafeModeRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetSafeModeRequestProto
const __req_SetSafeModeRequestProto = Symbol[:action]
const __val_SetSafeModeRequestProto = Dict(:checked => false)
meta(t::Type{SetSafeModeRequestProto}) = meta(t, __req_SetSafeModeRequestProto, ProtoBuf.DEF_FNUM, __val_SetSafeModeRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SetSafeModeResponseProto <: ProtoType
    result::Bool
    SetSafeModeResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetSafeModeResponseProto
const __req_SetSafeModeResponseProto = Symbol[:result]
meta(t::Type{SetSafeModeResponseProto}) = meta(t, __req_SetSafeModeResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SaveNamespaceRequestProto <: ProtoType
    SaveNamespaceRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SaveNamespaceRequestProto

mutable struct SaveNamespaceResponseProto <: ProtoType
    SaveNamespaceResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SaveNamespaceResponseProto

mutable struct RollEditsRequestProto <: ProtoType
    RollEditsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RollEditsRequestProto

mutable struct RollEditsResponseProto <: ProtoType
    newSegmentTxId::UInt64
    RollEditsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RollEditsResponseProto
const __req_RollEditsResponseProto = Symbol[:newSegmentTxId]
meta(t::Type{RollEditsResponseProto}) = meta(t, __req_RollEditsResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RestoreFailedStorageRequestProto <: ProtoType
    arg::AbstractString
    RestoreFailedStorageRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RestoreFailedStorageRequestProto
const __req_RestoreFailedStorageRequestProto = Symbol[:arg]
meta(t::Type{RestoreFailedStorageRequestProto}) = meta(t, __req_RestoreFailedStorageRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RestoreFailedStorageResponseProto <: ProtoType
    result::Bool
    RestoreFailedStorageResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RestoreFailedStorageResponseProto
const __req_RestoreFailedStorageResponseProto = Symbol[:result]
meta(t::Type{RestoreFailedStorageResponseProto}) = meta(t, __req_RestoreFailedStorageResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RefreshNodesRequestProto <: ProtoType
    RefreshNodesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RefreshNodesRequestProto

mutable struct RefreshNodesResponseProto <: ProtoType
    RefreshNodesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RefreshNodesResponseProto

mutable struct FinalizeUpgradeRequestProto <: ProtoType
    FinalizeUpgradeRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FinalizeUpgradeRequestProto

mutable struct FinalizeUpgradeResponseProto <: ProtoType
    FinalizeUpgradeResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FinalizeUpgradeResponseProto

mutable struct RollingUpgradeRequestProto <: ProtoType
    action::Int32
    RollingUpgradeRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RollingUpgradeRequestProto
const __req_RollingUpgradeRequestProto = Symbol[:action]
meta(t::Type{RollingUpgradeRequestProto}) = meta(t, __req_RollingUpgradeRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RollingUpgradeInfoProto <: ProtoType
    status::RollingUpgradeStatusProto
    startTime::UInt64
    finalizeTime::UInt64
    createdRollbackImages::Bool
    RollingUpgradeInfoProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RollingUpgradeInfoProto
const __req_RollingUpgradeInfoProto = Symbol[:status,:startTime,:finalizeTime,:createdRollbackImages]
meta(t::Type{RollingUpgradeInfoProto}) = meta(t, __req_RollingUpgradeInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RollingUpgradeResponseProto <: ProtoType
    rollingUpgradeInfo::RollingUpgradeInfoProto
    RollingUpgradeResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RollingUpgradeResponseProto

mutable struct ListCorruptFileBlocksRequestProto <: ProtoType
    path::AbstractString
    cookie::AbstractString
    ListCorruptFileBlocksRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ListCorruptFileBlocksRequestProto
const __req_ListCorruptFileBlocksRequestProto = Symbol[:path]
meta(t::Type{ListCorruptFileBlocksRequestProto}) = meta(t, __req_ListCorruptFileBlocksRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ListCorruptFileBlocksResponseProto <: ProtoType
    corrupt::CorruptFileBlocksProto
    ListCorruptFileBlocksResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ListCorruptFileBlocksResponseProto
const __req_ListCorruptFileBlocksResponseProto = Symbol[:corrupt]
meta(t::Type{ListCorruptFileBlocksResponseProto}) = meta(t, __req_ListCorruptFileBlocksResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct MetaSaveRequestProto <: ProtoType
    filename::AbstractString
    MetaSaveRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MetaSaveRequestProto
const __req_MetaSaveRequestProto = Symbol[:filename]
meta(t::Type{MetaSaveRequestProto}) = meta(t, __req_MetaSaveRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct MetaSaveResponseProto <: ProtoType
    MetaSaveResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MetaSaveResponseProto

mutable struct GetFileInfoRequestProto <: ProtoType
    src::AbstractString
    GetFileInfoRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetFileInfoRequestProto
const __req_GetFileInfoRequestProto = Symbol[:src]
meta(t::Type{GetFileInfoRequestProto}) = meta(t, __req_GetFileInfoRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetFileInfoResponseProto <: ProtoType
    fs::HdfsFileStatusProto
    GetFileInfoResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetFileInfoResponseProto

mutable struct IsFileClosedRequestProto <: ProtoType
    src::AbstractString
    IsFileClosedRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct IsFileClosedRequestProto
const __req_IsFileClosedRequestProto = Symbol[:src]
meta(t::Type{IsFileClosedRequestProto}) = meta(t, __req_IsFileClosedRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct IsFileClosedResponseProto <: ProtoType
    result::Bool
    IsFileClosedResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct IsFileClosedResponseProto
const __req_IsFileClosedResponseProto = Symbol[:result]
meta(t::Type{IsFileClosedResponseProto}) = meta(t, __req_IsFileClosedResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CacheDirectiveInfoExpirationProto <: ProtoType
    millis::Int64
    isRelative::Bool
    CacheDirectiveInfoExpirationProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CacheDirectiveInfoExpirationProto
const __req_CacheDirectiveInfoExpirationProto = Symbol[:millis,:isRelative]
meta(t::Type{CacheDirectiveInfoExpirationProto}) = meta(t, __req_CacheDirectiveInfoExpirationProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CacheDirectiveInfoProto <: ProtoType
    id::Int64
    path::AbstractString
    replication::UInt32
    pool::AbstractString
    expiration::CacheDirectiveInfoExpirationProto
    CacheDirectiveInfoProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CacheDirectiveInfoProto

mutable struct CacheDirectiveStatsProto <: ProtoType
    bytesNeeded::Int64
    bytesCached::Int64
    filesNeeded::Int64
    filesCached::Int64
    hasExpired::Bool
    CacheDirectiveStatsProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CacheDirectiveStatsProto
const __req_CacheDirectiveStatsProto = Symbol[:bytesNeeded,:bytesCached,:filesNeeded,:filesCached,:hasExpired]
meta(t::Type{CacheDirectiveStatsProto}) = meta(t, __req_CacheDirectiveStatsProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct AddCacheDirectiveRequestProto <: ProtoType
    info::CacheDirectiveInfoProto
    cacheFlags::UInt32
    AddCacheDirectiveRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AddCacheDirectiveRequestProto
const __req_AddCacheDirectiveRequestProto = Symbol[:info]
meta(t::Type{AddCacheDirectiveRequestProto}) = meta(t, __req_AddCacheDirectiveRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct AddCacheDirectiveResponseProto <: ProtoType
    id::Int64
    AddCacheDirectiveResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AddCacheDirectiveResponseProto
const __req_AddCacheDirectiveResponseProto = Symbol[:id]
meta(t::Type{AddCacheDirectiveResponseProto}) = meta(t, __req_AddCacheDirectiveResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ModifyCacheDirectiveRequestProto <: ProtoType
    info::CacheDirectiveInfoProto
    cacheFlags::UInt32
    ModifyCacheDirectiveRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ModifyCacheDirectiveRequestProto
const __req_ModifyCacheDirectiveRequestProto = Symbol[:info]
meta(t::Type{ModifyCacheDirectiveRequestProto}) = meta(t, __req_ModifyCacheDirectiveRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ModifyCacheDirectiveResponseProto <: ProtoType
    ModifyCacheDirectiveResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ModifyCacheDirectiveResponseProto

mutable struct RemoveCacheDirectiveRequestProto <: ProtoType
    id::Int64
    RemoveCacheDirectiveRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveCacheDirectiveRequestProto
const __req_RemoveCacheDirectiveRequestProto = Symbol[:id]
meta(t::Type{RemoveCacheDirectiveRequestProto}) = meta(t, __req_RemoveCacheDirectiveRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RemoveCacheDirectiveResponseProto <: ProtoType
    RemoveCacheDirectiveResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveCacheDirectiveResponseProto

mutable struct ListCacheDirectivesRequestProto <: ProtoType
    prevId::Int64
    filter::CacheDirectiveInfoProto
    ListCacheDirectivesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ListCacheDirectivesRequestProto
const __req_ListCacheDirectivesRequestProto = Symbol[:prevId,:filter]
meta(t::Type{ListCacheDirectivesRequestProto}) = meta(t, __req_ListCacheDirectivesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CacheDirectiveEntryProto <: ProtoType
    info::CacheDirectiveInfoProto
    stats::CacheDirectiveStatsProto
    CacheDirectiveEntryProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CacheDirectiveEntryProto
const __req_CacheDirectiveEntryProto = Symbol[:info,:stats]
meta(t::Type{CacheDirectiveEntryProto}) = meta(t, __req_CacheDirectiveEntryProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ListCacheDirectivesResponseProto <: ProtoType
    elements::Base.Vector{CacheDirectiveEntryProto}
    hasMore::Bool
    ListCacheDirectivesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ListCacheDirectivesResponseProto
const __req_ListCacheDirectivesResponseProto = Symbol[:hasMore]
meta(t::Type{ListCacheDirectivesResponseProto}) = meta(t, __req_ListCacheDirectivesResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CachePoolInfoProto <: ProtoType
    poolName::AbstractString
    ownerName::AbstractString
    groupName::AbstractString
    mode::Int32
    limit::Int64
    maxRelativeExpiry::Int64
    CachePoolInfoProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CachePoolInfoProto

mutable struct CachePoolStatsProto <: ProtoType
    bytesNeeded::Int64
    bytesCached::Int64
    bytesOverlimit::Int64
    filesNeeded::Int64
    filesCached::Int64
    CachePoolStatsProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CachePoolStatsProto
const __req_CachePoolStatsProto = Symbol[:bytesNeeded,:bytesCached,:bytesOverlimit,:filesNeeded,:filesCached]
meta(t::Type{CachePoolStatsProto}) = meta(t, __req_CachePoolStatsProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct AddCachePoolRequestProto <: ProtoType
    info::CachePoolInfoProto
    AddCachePoolRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AddCachePoolRequestProto
const __req_AddCachePoolRequestProto = Symbol[:info]
meta(t::Type{AddCachePoolRequestProto}) = meta(t, __req_AddCachePoolRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct AddCachePoolResponseProto <: ProtoType
    AddCachePoolResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AddCachePoolResponseProto

mutable struct ModifyCachePoolRequestProto <: ProtoType
    info::CachePoolInfoProto
    ModifyCachePoolRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ModifyCachePoolRequestProto
const __req_ModifyCachePoolRequestProto = Symbol[:info]
meta(t::Type{ModifyCachePoolRequestProto}) = meta(t, __req_ModifyCachePoolRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ModifyCachePoolResponseProto <: ProtoType
    ModifyCachePoolResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ModifyCachePoolResponseProto

mutable struct RemoveCachePoolRequestProto <: ProtoType
    poolName::AbstractString
    RemoveCachePoolRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveCachePoolRequestProto
const __req_RemoveCachePoolRequestProto = Symbol[:poolName]
meta(t::Type{RemoveCachePoolRequestProto}) = meta(t, __req_RemoveCachePoolRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RemoveCachePoolResponseProto <: ProtoType
    RemoveCachePoolResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveCachePoolResponseProto

mutable struct ListCachePoolsRequestProto <: ProtoType
    prevPoolName::AbstractString
    ListCachePoolsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ListCachePoolsRequestProto
const __req_ListCachePoolsRequestProto = Symbol[:prevPoolName]
meta(t::Type{ListCachePoolsRequestProto}) = meta(t, __req_ListCachePoolsRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CachePoolEntryProto <: ProtoType
    info::CachePoolInfoProto
    stats::CachePoolStatsProto
    CachePoolEntryProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CachePoolEntryProto
const __req_CachePoolEntryProto = Symbol[:info,:stats]
meta(t::Type{CachePoolEntryProto}) = meta(t, __req_CachePoolEntryProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ListCachePoolsResponseProto <: ProtoType
    entries::Base.Vector{CachePoolEntryProto}
    hasMore::Bool
    ListCachePoolsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ListCachePoolsResponseProto
const __req_ListCachePoolsResponseProto = Symbol[:hasMore]
meta(t::Type{ListCachePoolsResponseProto}) = meta(t, __req_ListCachePoolsResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetFileLinkInfoRequestProto <: ProtoType
    src::AbstractString
    GetFileLinkInfoRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetFileLinkInfoRequestProto
const __req_GetFileLinkInfoRequestProto = Symbol[:src]
meta(t::Type{GetFileLinkInfoRequestProto}) = meta(t, __req_GetFileLinkInfoRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetFileLinkInfoResponseProto <: ProtoType
    fs::HdfsFileStatusProto
    GetFileLinkInfoResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetFileLinkInfoResponseProto

mutable struct GetContentSummaryRequestProto <: ProtoType
    path::AbstractString
    GetContentSummaryRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContentSummaryRequestProto
const __req_GetContentSummaryRequestProto = Symbol[:path]
meta(t::Type{GetContentSummaryRequestProto}) = meta(t, __req_GetContentSummaryRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetContentSummaryResponseProto <: ProtoType
    summary::ContentSummaryProto
    GetContentSummaryResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContentSummaryResponseProto
const __req_GetContentSummaryResponseProto = Symbol[:summary]
meta(t::Type{GetContentSummaryResponseProto}) = meta(t, __req_GetContentSummaryResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SetQuotaRequestProto <: ProtoType
    path::AbstractString
    namespaceQuota::UInt64
    storagespaceQuota::UInt64
    storageType::Int32
    SetQuotaRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetQuotaRequestProto
const __req_SetQuotaRequestProto = Symbol[:path,:namespaceQuota,:storagespaceQuota]
meta(t::Type{SetQuotaRequestProto}) = meta(t, __req_SetQuotaRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SetQuotaResponseProto <: ProtoType
    SetQuotaResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetQuotaResponseProto

mutable struct FsyncRequestProto <: ProtoType
    src::AbstractString
    client::AbstractString
    lastBlockLength::Int64
    fileId::UInt64
    FsyncRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FsyncRequestProto
const __req_FsyncRequestProto = Symbol[:src,:client]
const __val_FsyncRequestProto = Dict(:lastBlockLength => -1, :fileId => 0)
const __wtype_FsyncRequestProto = Dict(:lastBlockLength => :sint64)
meta(t::Type{FsyncRequestProto}) = meta(t, __req_FsyncRequestProto, ProtoBuf.DEF_FNUM, __val_FsyncRequestProto, true, ProtoBuf.DEF_PACK, __wtype_FsyncRequestProto, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct FsyncResponseProto <: ProtoType
    FsyncResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FsyncResponseProto

mutable struct SetTimesRequestProto <: ProtoType
    src::AbstractString
    mtime::UInt64
    atime::UInt64
    SetTimesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetTimesRequestProto
const __req_SetTimesRequestProto = Symbol[:src,:mtime,:atime]
meta(t::Type{SetTimesRequestProto}) = meta(t, __req_SetTimesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SetTimesResponseProto <: ProtoType
    SetTimesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetTimesResponseProto

mutable struct CreateSymlinkRequestProto <: ProtoType
    target::AbstractString
    link::AbstractString
    dirPerm::FsPermissionProto
    createParent::Bool
    CreateSymlinkRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CreateSymlinkRequestProto
const __req_CreateSymlinkRequestProto = Symbol[:target,:link,:dirPerm,:createParent]
meta(t::Type{CreateSymlinkRequestProto}) = meta(t, __req_CreateSymlinkRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CreateSymlinkResponseProto <: ProtoType
    CreateSymlinkResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CreateSymlinkResponseProto

mutable struct GetLinkTargetRequestProto <: ProtoType
    path::AbstractString
    GetLinkTargetRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetLinkTargetRequestProto
const __req_GetLinkTargetRequestProto = Symbol[:path]
meta(t::Type{GetLinkTargetRequestProto}) = meta(t, __req_GetLinkTargetRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetLinkTargetResponseProto <: ProtoType
    targetPath::AbstractString
    GetLinkTargetResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetLinkTargetResponseProto

mutable struct UpdateBlockForPipelineRequestProto <: ProtoType
    block::ExtendedBlockProto
    clientName::AbstractString
    UpdateBlockForPipelineRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UpdateBlockForPipelineRequestProto
const __req_UpdateBlockForPipelineRequestProto = Symbol[:block,:clientName]
meta(t::Type{UpdateBlockForPipelineRequestProto}) = meta(t, __req_UpdateBlockForPipelineRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct UpdateBlockForPipelineResponseProto <: ProtoType
    block::LocatedBlockProto
    UpdateBlockForPipelineResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UpdateBlockForPipelineResponseProto
const __req_UpdateBlockForPipelineResponseProto = Symbol[:block]
meta(t::Type{UpdateBlockForPipelineResponseProto}) = meta(t, __req_UpdateBlockForPipelineResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct UpdatePipelineRequestProto <: ProtoType
    clientName::AbstractString
    oldBlock::ExtendedBlockProto
    newBlock::ExtendedBlockProto
    newNodes::Base.Vector{DatanodeIDProto}
    storageIDs::Base.Vector{AbstractString}
    UpdatePipelineRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UpdatePipelineRequestProto
const __req_UpdatePipelineRequestProto = Symbol[:clientName,:oldBlock,:newBlock]
meta(t::Type{UpdatePipelineRequestProto}) = meta(t, __req_UpdatePipelineRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct UpdatePipelineResponseProto <: ProtoType
    UpdatePipelineResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UpdatePipelineResponseProto

mutable struct SetBalancerBandwidthRequestProto <: ProtoType
    bandwidth::Int64
    SetBalancerBandwidthRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetBalancerBandwidthRequestProto
const __req_SetBalancerBandwidthRequestProto = Symbol[:bandwidth]
meta(t::Type{SetBalancerBandwidthRequestProto}) = meta(t, __req_SetBalancerBandwidthRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SetBalancerBandwidthResponseProto <: ProtoType
    SetBalancerBandwidthResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetBalancerBandwidthResponseProto

mutable struct GetDataEncryptionKeyRequestProto <: ProtoType
    GetDataEncryptionKeyRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetDataEncryptionKeyRequestProto

mutable struct GetDataEncryptionKeyResponseProto <: ProtoType
    dataEncryptionKey::DataEncryptionKeyProto
    GetDataEncryptionKeyResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetDataEncryptionKeyResponseProto

mutable struct CreateSnapshotRequestProto <: ProtoType
    snapshotRoot::AbstractString
    snapshotName::AbstractString
    CreateSnapshotRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CreateSnapshotRequestProto
const __req_CreateSnapshotRequestProto = Symbol[:snapshotRoot]
meta(t::Type{CreateSnapshotRequestProto}) = meta(t, __req_CreateSnapshotRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CreateSnapshotResponseProto <: ProtoType
    snapshotPath::AbstractString
    CreateSnapshotResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CreateSnapshotResponseProto
const __req_CreateSnapshotResponseProto = Symbol[:snapshotPath]
meta(t::Type{CreateSnapshotResponseProto}) = meta(t, __req_CreateSnapshotResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RenameSnapshotRequestProto <: ProtoType
    snapshotRoot::AbstractString
    snapshotOldName::AbstractString
    snapshotNewName::AbstractString
    RenameSnapshotRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RenameSnapshotRequestProto
const __req_RenameSnapshotRequestProto = Symbol[:snapshotRoot,:snapshotOldName,:snapshotNewName]
meta(t::Type{RenameSnapshotRequestProto}) = meta(t, __req_RenameSnapshotRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RenameSnapshotResponseProto <: ProtoType
    RenameSnapshotResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RenameSnapshotResponseProto

mutable struct AllowSnapshotRequestProto <: ProtoType
    snapshotRoot::AbstractString
    AllowSnapshotRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AllowSnapshotRequestProto
const __req_AllowSnapshotRequestProto = Symbol[:snapshotRoot]
meta(t::Type{AllowSnapshotRequestProto}) = meta(t, __req_AllowSnapshotRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct AllowSnapshotResponseProto <: ProtoType
    AllowSnapshotResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AllowSnapshotResponseProto

mutable struct DisallowSnapshotRequestProto <: ProtoType
    snapshotRoot::AbstractString
    DisallowSnapshotRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DisallowSnapshotRequestProto
const __req_DisallowSnapshotRequestProto = Symbol[:snapshotRoot]
meta(t::Type{DisallowSnapshotRequestProto}) = meta(t, __req_DisallowSnapshotRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct DisallowSnapshotResponseProto <: ProtoType
    DisallowSnapshotResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DisallowSnapshotResponseProto

mutable struct DeleteSnapshotRequestProto <: ProtoType
    snapshotRoot::AbstractString
    snapshotName::AbstractString
    DeleteSnapshotRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DeleteSnapshotRequestProto
const __req_DeleteSnapshotRequestProto = Symbol[:snapshotRoot,:snapshotName]
meta(t::Type{DeleteSnapshotRequestProto}) = meta(t, __req_DeleteSnapshotRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct DeleteSnapshotResponseProto <: ProtoType
    DeleteSnapshotResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DeleteSnapshotResponseProto

mutable struct CheckAccessRequestProto <: ProtoType
    path::AbstractString
    mode::Int32
    CheckAccessRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CheckAccessRequestProto
const __req_CheckAccessRequestProto = Symbol[:path,:mode]
meta(t::Type{CheckAccessRequestProto}) = meta(t, __req_CheckAccessRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CheckAccessResponseProto <: ProtoType
    CheckAccessResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CheckAccessResponseProto

mutable struct GetCurrentEditLogTxidRequestProto <: ProtoType
    GetCurrentEditLogTxidRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetCurrentEditLogTxidRequestProto

mutable struct GetCurrentEditLogTxidResponseProto <: ProtoType
    txid::Int64
    GetCurrentEditLogTxidResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetCurrentEditLogTxidResponseProto
const __req_GetCurrentEditLogTxidResponseProto = Symbol[:txid]
meta(t::Type{GetCurrentEditLogTxidResponseProto}) = meta(t, __req_GetCurrentEditLogTxidResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetEditsFromTxidRequestProto <: ProtoType
    txid::Int64
    GetEditsFromTxidRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetEditsFromTxidRequestProto
const __req_GetEditsFromTxidRequestProto = Symbol[:txid]
meta(t::Type{GetEditsFromTxidRequestProto}) = meta(t, __req_GetEditsFromTxidRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetEditsFromTxidResponseProto <: ProtoType
    eventsList::EventsListProto
    GetEditsFromTxidResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetEditsFromTxidResponseProto
const __req_GetEditsFromTxidResponseProto = Symbol[:eventsList]
meta(t::Type{GetEditsFromTxidResponseProto}) = meta(t, __req_GetEditsFromTxidResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

# service methods for ClientNamenodeProtocol
const _ClientNamenodeProtocol_methods = MethodDescriptor[
        MethodDescriptor("getBlockLocations", 1, hadoop.hdfs.GetBlockLocationsRequestProto, hadoop.hdfs.GetBlockLocationsResponseProto),
        MethodDescriptor("getServerDefaults", 2, hadoop.hdfs.GetServerDefaultsRequestProto, hadoop.hdfs.GetServerDefaultsResponseProto),
        MethodDescriptor("create", 3, hadoop.hdfs.CreateRequestProto, hadoop.hdfs.CreateResponseProto),
        MethodDescriptor("append", 4, hadoop.hdfs.AppendRequestProto, hadoop.hdfs.AppendResponseProto),
        MethodDescriptor("setReplication", 5, hadoop.hdfs.SetReplicationRequestProto, hadoop.hdfs.SetReplicationResponseProto),
        MethodDescriptor("setStoragePolicy", 6, hadoop.hdfs.SetStoragePolicyRequestProto, hadoop.hdfs.SetStoragePolicyResponseProto),
        MethodDescriptor("getStoragePolicies", 7, hadoop.hdfs.GetStoragePoliciesRequestProto, hadoop.hdfs.GetStoragePoliciesResponseProto),
        MethodDescriptor("setPermission", 8, hadoop.hdfs.SetPermissionRequestProto, hadoop.hdfs.SetPermissionResponseProto),
        MethodDescriptor("setOwner", 9, hadoop.hdfs.SetOwnerRequestProto, hadoop.hdfs.SetOwnerResponseProto),
        MethodDescriptor("abandonBlock", 10, hadoop.hdfs.AbandonBlockRequestProto, hadoop.hdfs.AbandonBlockResponseProto),
        MethodDescriptor("addBlock", 11, hadoop.hdfs.AddBlockRequestProto, hadoop.hdfs.AddBlockResponseProto),
        MethodDescriptor("getAdditionalDatanode", 12, hadoop.hdfs.GetAdditionalDatanodeRequestProto, hadoop.hdfs.GetAdditionalDatanodeResponseProto),
        MethodDescriptor("complete", 13, hadoop.hdfs.CompleteRequestProto, hadoop.hdfs.CompleteResponseProto),
        MethodDescriptor("reportBadBlocks", 14, hadoop.hdfs.ReportBadBlocksRequestProto, hadoop.hdfs.ReportBadBlocksResponseProto),
        MethodDescriptor("concat", 15, hadoop.hdfs.ConcatRequestProto, hadoop.hdfs.ConcatResponseProto),
        MethodDescriptor("truncate", 16, hadoop.hdfs.TruncateRequestProto, hadoop.hdfs.TruncateResponseProto),
        MethodDescriptor("rename", 17, hadoop.hdfs.RenameRequestProto, hadoop.hdfs.RenameResponseProto),
        MethodDescriptor("rename2", 18, hadoop.hdfs.Rename2RequestProto, hadoop.hdfs.Rename2ResponseProto),
        MethodDescriptor("delete", 19, hadoop.hdfs.DeleteRequestProto, hadoop.hdfs.DeleteResponseProto),
        MethodDescriptor("mkdirs", 20, hadoop.hdfs.MkdirsRequestProto, hadoop.hdfs.MkdirsResponseProto),
        MethodDescriptor("getListing", 21, hadoop.hdfs.GetListingRequestProto, hadoop.hdfs.GetListingResponseProto),
        MethodDescriptor("renewLease", 22, hadoop.hdfs.RenewLeaseRequestProto, hadoop.hdfs.RenewLeaseResponseProto),
        MethodDescriptor("recoverLease", 23, hadoop.hdfs.RecoverLeaseRequestProto, hadoop.hdfs.RecoverLeaseResponseProto),
        MethodDescriptor("getFsStats", 24, hadoop.hdfs.GetFsStatusRequestProto, hadoop.hdfs.GetFsStatsResponseProto),
        MethodDescriptor("getDatanodeReport", 25, hadoop.hdfs.GetDatanodeReportRequestProto, hadoop.hdfs.GetDatanodeReportResponseProto),
        MethodDescriptor("getDatanodeStorageReport", 26, hadoop.hdfs.GetDatanodeStorageReportRequestProto, hadoop.hdfs.GetDatanodeStorageReportResponseProto),
        MethodDescriptor("getPreferredBlockSize", 27, hadoop.hdfs.GetPreferredBlockSizeRequestProto, hadoop.hdfs.GetPreferredBlockSizeResponseProto),
        MethodDescriptor("setSafeMode", 28, hadoop.hdfs.SetSafeModeRequestProto, hadoop.hdfs.SetSafeModeResponseProto),
        MethodDescriptor("saveNamespace", 29, hadoop.hdfs.SaveNamespaceRequestProto, hadoop.hdfs.SaveNamespaceResponseProto),
        MethodDescriptor("rollEdits", 30, hadoop.hdfs.RollEditsRequestProto, hadoop.hdfs.RollEditsResponseProto),
        MethodDescriptor("restoreFailedStorage", 31, hadoop.hdfs.RestoreFailedStorageRequestProto, hadoop.hdfs.RestoreFailedStorageResponseProto),
        MethodDescriptor("refreshNodes", 32, hadoop.hdfs.RefreshNodesRequestProto, hadoop.hdfs.RefreshNodesResponseProto),
        MethodDescriptor("finalizeUpgrade", 33, hadoop.hdfs.FinalizeUpgradeRequestProto, hadoop.hdfs.FinalizeUpgradeResponseProto),
        MethodDescriptor("rollingUpgrade", 34, hadoop.hdfs.RollingUpgradeRequestProto, hadoop.hdfs.RollingUpgradeResponseProto),
        MethodDescriptor("listCorruptFileBlocks", 35, hadoop.hdfs.ListCorruptFileBlocksRequestProto, hadoop.hdfs.ListCorruptFileBlocksResponseProto),
        MethodDescriptor("metaSave", 36, hadoop.hdfs.MetaSaveRequestProto, hadoop.hdfs.MetaSaveResponseProto),
        MethodDescriptor("getFileInfo", 37, hadoop.hdfs.GetFileInfoRequestProto, hadoop.hdfs.GetFileInfoResponseProto),
        MethodDescriptor("addCacheDirective", 38, hadoop.hdfs.AddCacheDirectiveRequestProto, hadoop.hdfs.AddCacheDirectiveResponseProto),
        MethodDescriptor("modifyCacheDirective", 39, hadoop.hdfs.ModifyCacheDirectiveRequestProto, hadoop.hdfs.ModifyCacheDirectiveResponseProto),
        MethodDescriptor("removeCacheDirective", 40, hadoop.hdfs.RemoveCacheDirectiveRequestProto, hadoop.hdfs.RemoveCacheDirectiveResponseProto),
        MethodDescriptor("listCacheDirectives", 41, hadoop.hdfs.ListCacheDirectivesRequestProto, hadoop.hdfs.ListCacheDirectivesResponseProto),
        MethodDescriptor("addCachePool", 42, hadoop.hdfs.AddCachePoolRequestProto, hadoop.hdfs.AddCachePoolResponseProto),
        MethodDescriptor("modifyCachePool", 43, hadoop.hdfs.ModifyCachePoolRequestProto, hadoop.hdfs.ModifyCachePoolResponseProto),
        MethodDescriptor("removeCachePool", 44, hadoop.hdfs.RemoveCachePoolRequestProto, hadoop.hdfs.RemoveCachePoolResponseProto),
        MethodDescriptor("listCachePools", 45, hadoop.hdfs.ListCachePoolsRequestProto, hadoop.hdfs.ListCachePoolsResponseProto),
        MethodDescriptor("getFileLinkInfo", 46, hadoop.hdfs.GetFileLinkInfoRequestProto, hadoop.hdfs.GetFileLinkInfoResponseProto),
        MethodDescriptor("getContentSummary", 47, hadoop.hdfs.GetContentSummaryRequestProto, hadoop.hdfs.GetContentSummaryResponseProto),
        MethodDescriptor("setQuota", 48, hadoop.hdfs.SetQuotaRequestProto, hadoop.hdfs.SetQuotaResponseProto),
        MethodDescriptor("fsync", 49, hadoop.hdfs.FsyncRequestProto, hadoop.hdfs.FsyncResponseProto),
        MethodDescriptor("setTimes", 50, hadoop.hdfs.SetTimesRequestProto, hadoop.hdfs.SetTimesResponseProto),
        MethodDescriptor("createSymlink", 51, hadoop.hdfs.CreateSymlinkRequestProto, hadoop.hdfs.CreateSymlinkResponseProto),
        MethodDescriptor("getLinkTarget", 52, hadoop.hdfs.GetLinkTargetRequestProto, hadoop.hdfs.GetLinkTargetResponseProto),
        MethodDescriptor("updateBlockForPipeline", 53, hadoop.hdfs.UpdateBlockForPipelineRequestProto, hadoop.hdfs.UpdateBlockForPipelineResponseProto),
        MethodDescriptor("updatePipeline", 54, hadoop.hdfs.UpdatePipelineRequestProto, hadoop.hdfs.UpdatePipelineResponseProto),
        MethodDescriptor("getDelegationToken", 55, hadoop.common.GetDelegationTokenRequestProto, hadoop.common.GetDelegationTokenResponseProto),
        MethodDescriptor("renewDelegationToken", 56, hadoop.common.RenewDelegationTokenRequestProto, hadoop.common.RenewDelegationTokenResponseProto),
        MethodDescriptor("cancelDelegationToken", 57, hadoop.common.CancelDelegationTokenRequestProto, hadoop.common.CancelDelegationTokenResponseProto),
        MethodDescriptor("setBalancerBandwidth", 58, hadoop.hdfs.SetBalancerBandwidthRequestProto, hadoop.hdfs.SetBalancerBandwidthResponseProto),
        MethodDescriptor("getDataEncryptionKey", 59, hadoop.hdfs.GetDataEncryptionKeyRequestProto, hadoop.hdfs.GetDataEncryptionKeyResponseProto),
        MethodDescriptor("createSnapshot", 60, hadoop.hdfs.CreateSnapshotRequestProto, hadoop.hdfs.CreateSnapshotResponseProto),
        MethodDescriptor("renameSnapshot", 61, hadoop.hdfs.RenameSnapshotRequestProto, hadoop.hdfs.RenameSnapshotResponseProto),
        MethodDescriptor("allowSnapshot", 62, hadoop.hdfs.AllowSnapshotRequestProto, hadoop.hdfs.AllowSnapshotResponseProto),
        MethodDescriptor("disallowSnapshot", 63, hadoop.hdfs.DisallowSnapshotRequestProto, hadoop.hdfs.DisallowSnapshotResponseProto),
        MethodDescriptor("getSnapshottableDirListing", 64, hadoop.hdfs.GetSnapshottableDirListingRequestProto, hadoop.hdfs.GetSnapshottableDirListingResponseProto),
        MethodDescriptor("deleteSnapshot", 65, hadoop.hdfs.DeleteSnapshotRequestProto, hadoop.hdfs.DeleteSnapshotResponseProto),
        MethodDescriptor("getSnapshotDiffReport", 66, hadoop.hdfs.GetSnapshotDiffReportRequestProto, hadoop.hdfs.GetSnapshotDiffReportResponseProto),
        MethodDescriptor("isFileClosed", 67, hadoop.hdfs.IsFileClosedRequestProto, hadoop.hdfs.IsFileClosedResponseProto),
        MethodDescriptor("modifyAclEntries", 68, hadoop.hdfs.ModifyAclEntriesRequestProto, hadoop.hdfs.ModifyAclEntriesResponseProto),
        MethodDescriptor("removeAclEntries", 69, hadoop.hdfs.RemoveAclEntriesRequestProto, hadoop.hdfs.RemoveAclEntriesResponseProto),
        MethodDescriptor("removeDefaultAcl", 70, hadoop.hdfs.RemoveDefaultAclRequestProto, hadoop.hdfs.RemoveDefaultAclResponseProto),
        MethodDescriptor("removeAcl", 71, hadoop.hdfs.RemoveAclRequestProto, hadoop.hdfs.RemoveAclResponseProto),
        MethodDescriptor("setAcl", 72, hadoop.hdfs.SetAclRequestProto, hadoop.hdfs.SetAclResponseProto),
        MethodDescriptor("getAclStatus", 73, hadoop.hdfs.GetAclStatusRequestProto, hadoop.hdfs.GetAclStatusResponseProto),
        MethodDescriptor("setXAttr", 74, hadoop.hdfs.SetXAttrRequestProto, hadoop.hdfs.SetXAttrResponseProto),
        MethodDescriptor("getXAttrs", 75, hadoop.hdfs.GetXAttrsRequestProto, hadoop.hdfs.GetXAttrsResponseProto),
        MethodDescriptor("listXAttrs", 76, hadoop.hdfs.ListXAttrsRequestProto, hadoop.hdfs.ListXAttrsResponseProto),
        MethodDescriptor("removeXAttr", 77, hadoop.hdfs.RemoveXAttrRequestProto, hadoop.hdfs.RemoveXAttrResponseProto),
        MethodDescriptor("checkAccess", 78, hadoop.hdfs.CheckAccessRequestProto, hadoop.hdfs.CheckAccessResponseProto),
        MethodDescriptor("createEncryptionZone", 79, hadoop.hdfs.CreateEncryptionZoneRequestProto, hadoop.hdfs.CreateEncryptionZoneResponseProto),
        MethodDescriptor("listEncryptionZones", 80, hadoop.hdfs.ListEncryptionZonesRequestProto, hadoop.hdfs.ListEncryptionZonesResponseProto),
        MethodDescriptor("getEZForPath", 81, hadoop.hdfs.GetEZForPathRequestProto, hadoop.hdfs.GetEZForPathResponseProto),
        MethodDescriptor("getCurrentEditLogTxid", 82, hadoop.hdfs.GetCurrentEditLogTxidRequestProto, hadoop.hdfs.GetCurrentEditLogTxidResponseProto),
        MethodDescriptor("getEditsFromTxid", 83, hadoop.hdfs.GetEditsFromTxidRequestProto, hadoop.hdfs.GetEditsFromTxidResponseProto)
    ] # const _ClientNamenodeProtocol_methods
const _ClientNamenodeProtocol_desc = ServiceDescriptor("hadoop.hdfs.ClientNamenodeProtocol", 1, _ClientNamenodeProtocol_methods)

ClientNamenodeProtocol(impl::Module) = ProtoService(_ClientNamenodeProtocol_desc, impl)

mutable struct ClientNamenodeProtocolStub <: AbstractProtoServiceStub{false}
    impl::ProtoServiceStub
    ClientNamenodeProtocolStub(channel::ProtoRpcChannel) = new(ProtoServiceStub(_ClientNamenodeProtocol_desc, channel))
end # mutable struct ClientNamenodeProtocolStub

mutable struct ClientNamenodeProtocolBlockingStub <: AbstractProtoServiceStub{true}
    impl::ProtoServiceBlockingStub
    ClientNamenodeProtocolBlockingStub(channel::ProtoRpcChannel) = new(ProtoServiceBlockingStub(_ClientNamenodeProtocol_desc, channel))
end # mutable struct ClientNamenodeProtocolBlockingStub

getBlockLocations(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetBlockLocationsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[1], controller, inp, done)
getBlockLocations(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetBlockLocationsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[1], controller, inp)

getServerDefaults(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetServerDefaultsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[2], controller, inp, done)
getServerDefaults(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetServerDefaultsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[2], controller, inp)

create(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.CreateRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[3], controller, inp, done)
create(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.CreateRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[3], controller, inp)

append(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.AppendRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[4], controller, inp, done)
append(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.AppendRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[4], controller, inp)

setReplication(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetReplicationRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[5], controller, inp, done)
setReplication(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetReplicationRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[5], controller, inp)

setStoragePolicy(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetStoragePolicyRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[6], controller, inp, done)
setStoragePolicy(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetStoragePolicyRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[6], controller, inp)

getStoragePolicies(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetStoragePoliciesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[7], controller, inp, done)
getStoragePolicies(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetStoragePoliciesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[7], controller, inp)

setPermission(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetPermissionRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[8], controller, inp, done)
setPermission(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetPermissionRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[8], controller, inp)

setOwner(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetOwnerRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[9], controller, inp, done)
setOwner(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetOwnerRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[9], controller, inp)

abandonBlock(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.AbandonBlockRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[10], controller, inp, done)
abandonBlock(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.AbandonBlockRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[10], controller, inp)

addBlock(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.AddBlockRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[11], controller, inp, done)
addBlock(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.AddBlockRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[11], controller, inp)

getAdditionalDatanode(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetAdditionalDatanodeRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[12], controller, inp, done)
getAdditionalDatanode(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetAdditionalDatanodeRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[12], controller, inp)

complete(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.CompleteRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[13], controller, inp, done)
complete(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.CompleteRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[13], controller, inp)

reportBadBlocks(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ReportBadBlocksRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[14], controller, inp, done)
reportBadBlocks(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ReportBadBlocksRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[14], controller, inp)

concat(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ConcatRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[15], controller, inp, done)
concat(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ConcatRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[15], controller, inp)

truncate(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.TruncateRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[16], controller, inp, done)
truncate(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.TruncateRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[16], controller, inp)

rename(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RenameRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[17], controller, inp, done)
rename(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RenameRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[17], controller, inp)

rename2(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.Rename2RequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[18], controller, inp, done)
rename2(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.Rename2RequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[18], controller, inp)

delete(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.DeleteRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[19], controller, inp, done)
delete(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.DeleteRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[19], controller, inp)

mkdirs(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.MkdirsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[20], controller, inp, done)
mkdirs(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.MkdirsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[20], controller, inp)

getListing(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetListingRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[21], controller, inp, done)
getListing(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetListingRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[21], controller, inp)

renewLease(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RenewLeaseRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[22], controller, inp, done)
renewLease(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RenewLeaseRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[22], controller, inp)

recoverLease(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RecoverLeaseRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[23], controller, inp, done)
recoverLease(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RecoverLeaseRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[23], controller, inp)

getFsStats(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetFsStatusRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[24], controller, inp, done)
getFsStats(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetFsStatusRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[24], controller, inp)

getDatanodeReport(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetDatanodeReportRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[25], controller, inp, done)
getDatanodeReport(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetDatanodeReportRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[25], controller, inp)

getDatanodeStorageReport(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetDatanodeStorageReportRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[26], controller, inp, done)
getDatanodeStorageReport(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetDatanodeStorageReportRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[26], controller, inp)

getPreferredBlockSize(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetPreferredBlockSizeRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[27], controller, inp, done)
getPreferredBlockSize(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetPreferredBlockSizeRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[27], controller, inp)

setSafeMode(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetSafeModeRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[28], controller, inp, done)
setSafeMode(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetSafeModeRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[28], controller, inp)

saveNamespace(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SaveNamespaceRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[29], controller, inp, done)
saveNamespace(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SaveNamespaceRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[29], controller, inp)

rollEdits(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RollEditsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[30], controller, inp, done)
rollEdits(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RollEditsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[30], controller, inp)

restoreFailedStorage(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RestoreFailedStorageRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[31], controller, inp, done)
restoreFailedStorage(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RestoreFailedStorageRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[31], controller, inp)

refreshNodes(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RefreshNodesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[32], controller, inp, done)
refreshNodes(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RefreshNodesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[32], controller, inp)

finalizeUpgrade(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.FinalizeUpgradeRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[33], controller, inp, done)
finalizeUpgrade(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.FinalizeUpgradeRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[33], controller, inp)

rollingUpgrade(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RollingUpgradeRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[34], controller, inp, done)
rollingUpgrade(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RollingUpgradeRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[34], controller, inp)

listCorruptFileBlocks(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListCorruptFileBlocksRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[35], controller, inp, done)
listCorruptFileBlocks(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListCorruptFileBlocksRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[35], controller, inp)

metaSave(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.MetaSaveRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[36], controller, inp, done)
metaSave(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.MetaSaveRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[36], controller, inp)

getFileInfo(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetFileInfoRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[37], controller, inp, done)
getFileInfo(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetFileInfoRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[37], controller, inp)

addCacheDirective(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.AddCacheDirectiveRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[38], controller, inp, done)
addCacheDirective(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.AddCacheDirectiveRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[38], controller, inp)

modifyCacheDirective(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ModifyCacheDirectiveRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[39], controller, inp, done)
modifyCacheDirective(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ModifyCacheDirectiveRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[39], controller, inp)

removeCacheDirective(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveCacheDirectiveRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[40], controller, inp, done)
removeCacheDirective(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveCacheDirectiveRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[40], controller, inp)

listCacheDirectives(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListCacheDirectivesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[41], controller, inp, done)
listCacheDirectives(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListCacheDirectivesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[41], controller, inp)

addCachePool(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.AddCachePoolRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[42], controller, inp, done)
addCachePool(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.AddCachePoolRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[42], controller, inp)

modifyCachePool(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ModifyCachePoolRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[43], controller, inp, done)
modifyCachePool(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ModifyCachePoolRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[43], controller, inp)

removeCachePool(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveCachePoolRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[44], controller, inp, done)
removeCachePool(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveCachePoolRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[44], controller, inp)

listCachePools(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListCachePoolsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[45], controller, inp, done)
listCachePools(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListCachePoolsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[45], controller, inp)

getFileLinkInfo(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetFileLinkInfoRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[46], controller, inp, done)
getFileLinkInfo(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetFileLinkInfoRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[46], controller, inp)

getContentSummary(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetContentSummaryRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[47], controller, inp, done)
getContentSummary(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetContentSummaryRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[47], controller, inp)

setQuota(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetQuotaRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[48], controller, inp, done)
setQuota(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetQuotaRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[48], controller, inp)

fsync(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.FsyncRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[49], controller, inp, done)
fsync(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.FsyncRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[49], controller, inp)

setTimes(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetTimesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[50], controller, inp, done)
setTimes(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetTimesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[50], controller, inp)

createSymlink(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.CreateSymlinkRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[51], controller, inp, done)
createSymlink(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.CreateSymlinkRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[51], controller, inp)

getLinkTarget(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetLinkTargetRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[52], controller, inp, done)
getLinkTarget(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetLinkTargetRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[52], controller, inp)

updateBlockForPipeline(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.UpdateBlockForPipelineRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[53], controller, inp, done)
updateBlockForPipeline(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.UpdateBlockForPipelineRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[53], controller, inp)

updatePipeline(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.UpdatePipelineRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[54], controller, inp, done)
updatePipeline(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.UpdatePipelineRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[54], controller, inp)

getDelegationToken(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.common.GetDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[55], controller, inp, done)
getDelegationToken(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.common.GetDelegationTokenRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[55], controller, inp)

renewDelegationToken(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.common.RenewDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[56], controller, inp, done)
renewDelegationToken(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.common.RenewDelegationTokenRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[56], controller, inp)

cancelDelegationToken(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.common.CancelDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[57], controller, inp, done)
cancelDelegationToken(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.common.CancelDelegationTokenRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[57], controller, inp)

setBalancerBandwidth(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetBalancerBandwidthRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[58], controller, inp, done)
setBalancerBandwidth(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetBalancerBandwidthRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[58], controller, inp)

getDataEncryptionKey(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetDataEncryptionKeyRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[59], controller, inp, done)
getDataEncryptionKey(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetDataEncryptionKeyRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[59], controller, inp)

createSnapshot(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.CreateSnapshotRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[60], controller, inp, done)
createSnapshot(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.CreateSnapshotRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[60], controller, inp)

renameSnapshot(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RenameSnapshotRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[61], controller, inp, done)
renameSnapshot(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RenameSnapshotRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[61], controller, inp)

allowSnapshot(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.AllowSnapshotRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[62], controller, inp, done)
allowSnapshot(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.AllowSnapshotRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[62], controller, inp)

disallowSnapshot(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.DisallowSnapshotRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[63], controller, inp, done)
disallowSnapshot(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.DisallowSnapshotRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[63], controller, inp)

getSnapshottableDirListing(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetSnapshottableDirListingRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[64], controller, inp, done)
getSnapshottableDirListing(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetSnapshottableDirListingRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[64], controller, inp)

deleteSnapshot(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.DeleteSnapshotRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[65], controller, inp, done)
deleteSnapshot(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.DeleteSnapshotRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[65], controller, inp)

getSnapshotDiffReport(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetSnapshotDiffReportRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[66], controller, inp, done)
getSnapshotDiffReport(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetSnapshotDiffReportRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[66], controller, inp)

isFileClosed(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.IsFileClosedRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[67], controller, inp, done)
isFileClosed(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.IsFileClosedRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[67], controller, inp)

modifyAclEntries(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ModifyAclEntriesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[68], controller, inp, done)
modifyAclEntries(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ModifyAclEntriesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[68], controller, inp)

removeAclEntries(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveAclEntriesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[69], controller, inp, done)
removeAclEntries(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveAclEntriesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[69], controller, inp)

removeDefaultAcl(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveDefaultAclRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[70], controller, inp, done)
removeDefaultAcl(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveDefaultAclRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[70], controller, inp)

removeAcl(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveAclRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[71], controller, inp, done)
removeAcl(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveAclRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[71], controller, inp)

setAcl(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetAclRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[72], controller, inp, done)
setAcl(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetAclRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[72], controller, inp)

getAclStatus(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetAclStatusRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[73], controller, inp, done)
getAclStatus(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetAclStatusRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[73], controller, inp)

setXAttr(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetXAttrRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[74], controller, inp, done)
setXAttr(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetXAttrRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[74], controller, inp)

getXAttrs(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetXAttrsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[75], controller, inp, done)
getXAttrs(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetXAttrsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[75], controller, inp)

listXAttrs(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListXAttrsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[76], controller, inp, done)
listXAttrs(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListXAttrsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[76], controller, inp)

removeXAttr(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveXAttrRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[77], controller, inp, done)
removeXAttr(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveXAttrRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[77], controller, inp)

checkAccess(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.CheckAccessRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[78], controller, inp, done)
checkAccess(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.CheckAccessRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[78], controller, inp)

createEncryptionZone(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.CreateEncryptionZoneRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[79], controller, inp, done)
createEncryptionZone(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.CreateEncryptionZoneRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[79], controller, inp)

listEncryptionZones(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListEncryptionZonesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[80], controller, inp, done)
listEncryptionZones(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListEncryptionZonesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[80], controller, inp)

getEZForPath(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetEZForPathRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[81], controller, inp, done)
getEZForPath(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetEZForPathRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[81], controller, inp)

getCurrentEditLogTxid(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetCurrentEditLogTxidRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[82], controller, inp, done)
getCurrentEditLogTxid(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetCurrentEditLogTxidRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[82], controller, inp)

getEditsFromTxid(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetEditsFromTxidRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[83], controller, inp, done)
getEditsFromTxid(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetEditsFromTxidRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[83], controller, inp)

export CreateFlagProto, DatanodeReportTypeProto, SafeModeActionProto, RollingUpgradeActionProto, CacheFlagProto, GetBlockLocationsRequestProto, GetBlockLocationsResponseProto, GetServerDefaultsRequestProto, GetServerDefaultsResponseProto, CreateRequestProto, CreateResponseProto, AppendRequestProto, AppendResponseProto, SetReplicationRequestProto, SetReplicationResponseProto, SetStoragePolicyRequestProto, SetStoragePolicyResponseProto, GetStoragePoliciesRequestProto, GetStoragePoliciesResponseProto, SetPermissionRequestProto, SetPermissionResponseProto, SetOwnerRequestProto, SetOwnerResponseProto, AbandonBlockRequestProto, AbandonBlockResponseProto, AddBlockRequestProto, AddBlockResponseProto, GetAdditionalDatanodeRequestProto, GetAdditionalDatanodeResponseProto, CompleteRequestProto, CompleteResponseProto, ReportBadBlocksRequestProto, ReportBadBlocksResponseProto, ConcatRequestProto, ConcatResponseProto, TruncateRequestProto, TruncateResponseProto, RenameRequestProto, RenameResponseProto, Rename2RequestProto, Rename2ResponseProto, DeleteRequestProto, DeleteResponseProto, MkdirsRequestProto, MkdirsResponseProto, GetListingRequestProto, GetListingResponseProto, GetSnapshottableDirListingRequestProto, GetSnapshottableDirListingResponseProto, GetSnapshotDiffReportRequestProto, GetSnapshotDiffReportResponseProto, RenewLeaseRequestProto, RenewLeaseResponseProto, RecoverLeaseRequestProto, RecoverLeaseResponseProto, GetFsStatusRequestProto, GetFsStatsResponseProto, GetDatanodeReportRequestProto, GetDatanodeReportResponseProto, GetDatanodeStorageReportRequestProto, DatanodeStorageReportProto, GetDatanodeStorageReportResponseProto, GetPreferredBlockSizeRequestProto, GetPreferredBlockSizeResponseProto, SetSafeModeRequestProto, SetSafeModeResponseProto, SaveNamespaceRequestProto, SaveNamespaceResponseProto, RollEditsRequestProto, RollEditsResponseProto, RestoreFailedStorageRequestProto, RestoreFailedStorageResponseProto, RefreshNodesRequestProto, RefreshNodesResponseProto, FinalizeUpgradeRequestProto, FinalizeUpgradeResponseProto, RollingUpgradeRequestProto, RollingUpgradeInfoProto, RollingUpgradeResponseProto, ListCorruptFileBlocksRequestProto, ListCorruptFileBlocksResponseProto, MetaSaveRequestProto, MetaSaveResponseProto, GetFileInfoRequestProto, GetFileInfoResponseProto, IsFileClosedRequestProto, IsFileClosedResponseProto, CacheDirectiveInfoProto, CacheDirectiveInfoExpirationProto, CacheDirectiveStatsProto, AddCacheDirectiveRequestProto, AddCacheDirectiveResponseProto, ModifyCacheDirectiveRequestProto, ModifyCacheDirectiveResponseProto, RemoveCacheDirectiveRequestProto, RemoveCacheDirectiveResponseProto, ListCacheDirectivesRequestProto, CacheDirectiveEntryProto, ListCacheDirectivesResponseProto, CachePoolInfoProto, CachePoolStatsProto, AddCachePoolRequestProto, AddCachePoolResponseProto, ModifyCachePoolRequestProto, ModifyCachePoolResponseProto, RemoveCachePoolRequestProto, RemoveCachePoolResponseProto, ListCachePoolsRequestProto, ListCachePoolsResponseProto, CachePoolEntryProto, GetFileLinkInfoRequestProto, GetFileLinkInfoResponseProto, GetContentSummaryRequestProto, GetContentSummaryResponseProto, SetQuotaRequestProto, SetQuotaResponseProto, FsyncRequestProto, FsyncResponseProto, SetTimesRequestProto, SetTimesResponseProto, CreateSymlinkRequestProto, CreateSymlinkResponseProto, GetLinkTargetRequestProto, GetLinkTargetResponseProto, UpdateBlockForPipelineRequestProto, UpdateBlockForPipelineResponseProto, UpdatePipelineRequestProto, UpdatePipelineResponseProto, SetBalancerBandwidthRequestProto, SetBalancerBandwidthResponseProto, GetDataEncryptionKeyRequestProto, GetDataEncryptionKeyResponseProto, CreateSnapshotRequestProto, CreateSnapshotResponseProto, RenameSnapshotRequestProto, RenameSnapshotResponseProto, AllowSnapshotRequestProto, AllowSnapshotResponseProto, DisallowSnapshotRequestProto, DisallowSnapshotResponseProto, DeleteSnapshotRequestProto, DeleteSnapshotResponseProto, CheckAccessRequestProto, CheckAccessResponseProto, GetCurrentEditLogTxidRequestProto, GetCurrentEditLogTxidResponseProto, GetEditsFromTxidRequestProto, GetEditsFromTxidResponseProto, ClientNamenodeProtocol, ClientNamenodeProtocolStub, ClientNamenodeProtocolBlockingStub, getBlockLocations, getServerDefaults, create, append, setReplication, setStoragePolicy, getStoragePolicies, setPermission, setOwner, abandonBlock, addBlock, getAdditionalDatanode, complete, reportBadBlocks, concat, truncate, rename, rename2, delete, mkdirs, getListing, renewLease, recoverLease, getFsStats, getDatanodeReport, getDatanodeStorageReport, getPreferredBlockSize, setSafeMode, saveNamespace, rollEdits, restoreFailedStorage, refreshNodes, finalizeUpgrade, rollingUpgrade, listCorruptFileBlocks, metaSave, getFileInfo, addCacheDirective, modifyCacheDirective, removeCacheDirective, listCacheDirectives, addCachePool, modifyCachePool, removeCachePool, listCachePools, getFileLinkInfo, getContentSummary, setQuota, fsync, setTimes, createSymlink, getLinkTarget, updateBlockForPipeline, updatePipeline, getDelegationToken, renewDelegationToken, cancelDelegationToken, setBalancerBandwidth, getDataEncryptionKey, createSnapshot, renameSnapshot, allowSnapshot, disallowSnapshot, getSnapshottableDirListing, deleteSnapshot, getSnapshotDiffReport, isFileClosed, modifyAclEntries, removeAclEntries, removeDefaultAcl, removeAcl, setAcl, getAclStatus, setXAttr, getXAttrs, listXAttrs, removeXAttr, checkAccess, createEncryptionZone, listEncryptionZones, getEZForPath, getCurrentEditLogTxid, getEditsFromTxid
