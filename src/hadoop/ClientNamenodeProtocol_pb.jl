using ..common
using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

type __enum_CreateFlagProto <: ProtoEnum
    CREATE::Int32
    OVERWRITE::Int32
    APPEND::Int32
    LAZY_PERSIST::Int32
    NEW_BLOCK::Int32
    __enum_CreateFlagProto() = new(1,2,4,16,32)
end #type __enum_CreateFlagProto
const CreateFlagProto = __enum_CreateFlagProto()

type __enum_DatanodeReportTypeProto <: ProtoEnum
    ALL::Int32
    LIVE::Int32
    DEAD::Int32
    DECOMMISSIONING::Int32
    __enum_DatanodeReportTypeProto() = new(1,2,3,4)
end #type __enum_DatanodeReportTypeProto
const DatanodeReportTypeProto = __enum_DatanodeReportTypeProto()

type __enum_SafeModeActionProto <: ProtoEnum
    SAFEMODE_LEAVE::Int32
    SAFEMODE_ENTER::Int32
    SAFEMODE_GET::Int32
    __enum_SafeModeActionProto() = new(1,2,3)
end #type __enum_SafeModeActionProto
const SafeModeActionProto = __enum_SafeModeActionProto()

type __enum_RollingUpgradeActionProto <: ProtoEnum
    QUERY::Int32
    START::Int32
    FINALIZE::Int32
    __enum_RollingUpgradeActionProto() = new(1,2,3)
end #type __enum_RollingUpgradeActionProto
const RollingUpgradeActionProto = __enum_RollingUpgradeActionProto()

type __enum_CacheFlagProto <: ProtoEnum
    FORCE::Int32
    __enum_CacheFlagProto() = new(1)
end #type __enum_CacheFlagProto
const CacheFlagProto = __enum_CacheFlagProto()

type GetBlockLocationsRequestProto
    src::AbstractString
    offset::UInt64
    length::UInt64
    GetBlockLocationsRequestProto() = (o=new(); fillunset(o); o)
end #type GetBlockLocationsRequestProto
const __req_GetBlockLocationsRequestProto = Symbol[:src,:offset,:length]
meta(t::Type{GetBlockLocationsRequestProto}) = meta(t, __req_GetBlockLocationsRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetBlockLocationsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetBlockLocationsRequestProto, v2::GetBlockLocationsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetBlockLocationsRequestProto, v2::GetBlockLocationsRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetBlockLocationsResponseProto
    locations::LocatedBlocksProto
    GetBlockLocationsResponseProto() = (o=new(); fillunset(o); o)
end #type GetBlockLocationsResponseProto
hash(v::GetBlockLocationsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetBlockLocationsResponseProto, v2::GetBlockLocationsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetBlockLocationsResponseProto, v2::GetBlockLocationsResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetServerDefaultsRequestProto
    GetServerDefaultsRequestProto() = (o=new(); fillunset(o); o)
end #type GetServerDefaultsRequestProto
hash(v::GetServerDefaultsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetServerDefaultsRequestProto, v2::GetServerDefaultsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetServerDefaultsRequestProto, v2::GetServerDefaultsRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetServerDefaultsResponseProto
    serverDefaults::FsServerDefaultsProto
    GetServerDefaultsResponseProto() = (o=new(); fillunset(o); o)
end #type GetServerDefaultsResponseProto
const __req_GetServerDefaultsResponseProto = Symbol[:serverDefaults]
meta(t::Type{GetServerDefaultsResponseProto}) = meta(t, __req_GetServerDefaultsResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetServerDefaultsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetServerDefaultsResponseProto, v2::GetServerDefaultsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetServerDefaultsResponseProto, v2::GetServerDefaultsResponseProto) = ProtoBuf.protoeq(v1, v2)

type CreateRequestProto
    src::AbstractString
    masked::FsPermissionProto
    clientName::AbstractString
    createFlag::UInt32
    createParent::Bool
    replication::UInt32
    blockSize::UInt64
    cryptoProtocolVersion::Array{Int32,1}
    CreateRequestProto() = (o=new(); fillunset(o); o)
end #type CreateRequestProto
const __req_CreateRequestProto = Symbol[:src,:masked,:clientName,:createFlag,:createParent,:replication,:blockSize]
meta(t::Type{CreateRequestProto}) = meta(t, __req_CreateRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CreateRequestProto) = ProtoBuf.protohash(v)
isequal(v1::CreateRequestProto, v2::CreateRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CreateRequestProto, v2::CreateRequestProto) = ProtoBuf.protoeq(v1, v2)

type CreateResponseProto
    fs::HdfsFileStatusProto
    CreateResponseProto() = (o=new(); fillunset(o); o)
end #type CreateResponseProto
hash(v::CreateResponseProto) = ProtoBuf.protohash(v)
isequal(v1::CreateResponseProto, v2::CreateResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CreateResponseProto, v2::CreateResponseProto) = ProtoBuf.protoeq(v1, v2)

type AppendRequestProto
    src::AbstractString
    clientName::AbstractString
    flag::UInt32
    AppendRequestProto() = (o=new(); fillunset(o); o)
end #type AppendRequestProto
const __req_AppendRequestProto = Symbol[:src,:clientName]
meta(t::Type{AppendRequestProto}) = meta(t, __req_AppendRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::AppendRequestProto) = ProtoBuf.protohash(v)
isequal(v1::AppendRequestProto, v2::AppendRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AppendRequestProto, v2::AppendRequestProto) = ProtoBuf.protoeq(v1, v2)

type AppendResponseProto
    block::LocatedBlockProto
    stat::HdfsFileStatusProto
    AppendResponseProto() = (o=new(); fillunset(o); o)
end #type AppendResponseProto
hash(v::AppendResponseProto) = ProtoBuf.protohash(v)
isequal(v1::AppendResponseProto, v2::AppendResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AppendResponseProto, v2::AppendResponseProto) = ProtoBuf.protoeq(v1, v2)

type SetReplicationRequestProto
    src::AbstractString
    replication::UInt32
    SetReplicationRequestProto() = (o=new(); fillunset(o); o)
end #type SetReplicationRequestProto
const __req_SetReplicationRequestProto = Symbol[:src,:replication]
meta(t::Type{SetReplicationRequestProto}) = meta(t, __req_SetReplicationRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::SetReplicationRequestProto) = ProtoBuf.protohash(v)
isequal(v1::SetReplicationRequestProto, v2::SetReplicationRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetReplicationRequestProto, v2::SetReplicationRequestProto) = ProtoBuf.protoeq(v1, v2)

type SetReplicationResponseProto
    result::Bool
    SetReplicationResponseProto() = (o=new(); fillunset(o); o)
end #type SetReplicationResponseProto
const __req_SetReplicationResponseProto = Symbol[:result]
meta(t::Type{SetReplicationResponseProto}) = meta(t, __req_SetReplicationResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::SetReplicationResponseProto) = ProtoBuf.protohash(v)
isequal(v1::SetReplicationResponseProto, v2::SetReplicationResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetReplicationResponseProto, v2::SetReplicationResponseProto) = ProtoBuf.protoeq(v1, v2)

type SetStoragePolicyRequestProto
    src::AbstractString
    policyName::AbstractString
    SetStoragePolicyRequestProto() = (o=new(); fillunset(o); o)
end #type SetStoragePolicyRequestProto
const __req_SetStoragePolicyRequestProto = Symbol[:src,:policyName]
meta(t::Type{SetStoragePolicyRequestProto}) = meta(t, __req_SetStoragePolicyRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::SetStoragePolicyRequestProto) = ProtoBuf.protohash(v)
isequal(v1::SetStoragePolicyRequestProto, v2::SetStoragePolicyRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetStoragePolicyRequestProto, v2::SetStoragePolicyRequestProto) = ProtoBuf.protoeq(v1, v2)

type SetStoragePolicyResponseProto
    SetStoragePolicyResponseProto() = (o=new(); fillunset(o); o)
end #type SetStoragePolicyResponseProto
hash(v::SetStoragePolicyResponseProto) = ProtoBuf.protohash(v)
isequal(v1::SetStoragePolicyResponseProto, v2::SetStoragePolicyResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetStoragePolicyResponseProto, v2::SetStoragePolicyResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetStoragePoliciesRequestProto
    GetStoragePoliciesRequestProto() = (o=new(); fillunset(o); o)
end #type GetStoragePoliciesRequestProto
hash(v::GetStoragePoliciesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetStoragePoliciesRequestProto, v2::GetStoragePoliciesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetStoragePoliciesRequestProto, v2::GetStoragePoliciesRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetStoragePoliciesResponseProto
    policies::Array{BlockStoragePolicyProto,1}
    GetStoragePoliciesResponseProto() = (o=new(); fillunset(o); o)
end #type GetStoragePoliciesResponseProto
hash(v::GetStoragePoliciesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetStoragePoliciesResponseProto, v2::GetStoragePoliciesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetStoragePoliciesResponseProto, v2::GetStoragePoliciesResponseProto) = ProtoBuf.protoeq(v1, v2)

type SetPermissionRequestProto
    src::AbstractString
    permission::FsPermissionProto
    SetPermissionRequestProto() = (o=new(); fillunset(o); o)
end #type SetPermissionRequestProto
const __req_SetPermissionRequestProto = Symbol[:src,:permission]
meta(t::Type{SetPermissionRequestProto}) = meta(t, __req_SetPermissionRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::SetPermissionRequestProto) = ProtoBuf.protohash(v)
isequal(v1::SetPermissionRequestProto, v2::SetPermissionRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetPermissionRequestProto, v2::SetPermissionRequestProto) = ProtoBuf.protoeq(v1, v2)

type SetPermissionResponseProto
    SetPermissionResponseProto() = (o=new(); fillunset(o); o)
end #type SetPermissionResponseProto
hash(v::SetPermissionResponseProto) = ProtoBuf.protohash(v)
isequal(v1::SetPermissionResponseProto, v2::SetPermissionResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetPermissionResponseProto, v2::SetPermissionResponseProto) = ProtoBuf.protoeq(v1, v2)

type SetOwnerRequestProto
    src::AbstractString
    username::AbstractString
    groupname::AbstractString
    SetOwnerRequestProto() = (o=new(); fillunset(o); o)
end #type SetOwnerRequestProto
const __req_SetOwnerRequestProto = Symbol[:src]
meta(t::Type{SetOwnerRequestProto}) = meta(t, __req_SetOwnerRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::SetOwnerRequestProto) = ProtoBuf.protohash(v)
isequal(v1::SetOwnerRequestProto, v2::SetOwnerRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetOwnerRequestProto, v2::SetOwnerRequestProto) = ProtoBuf.protoeq(v1, v2)

type SetOwnerResponseProto
    SetOwnerResponseProto() = (o=new(); fillunset(o); o)
end #type SetOwnerResponseProto
hash(v::SetOwnerResponseProto) = ProtoBuf.protohash(v)
isequal(v1::SetOwnerResponseProto, v2::SetOwnerResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetOwnerResponseProto, v2::SetOwnerResponseProto) = ProtoBuf.protoeq(v1, v2)

type AbandonBlockRequestProto
    b::ExtendedBlockProto
    src::AbstractString
    holder::AbstractString
    fileId::UInt64
    AbandonBlockRequestProto() = (o=new(); fillunset(o); o)
end #type AbandonBlockRequestProto
const __req_AbandonBlockRequestProto = Symbol[:b,:src,:holder]
const __val_AbandonBlockRequestProto = @compat Dict(:fileId => 0)
meta(t::Type{AbandonBlockRequestProto}) = meta(t, __req_AbandonBlockRequestProto, ProtoBuf.DEF_FNUM, __val_AbandonBlockRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::AbandonBlockRequestProto) = ProtoBuf.protohash(v)
isequal(v1::AbandonBlockRequestProto, v2::AbandonBlockRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AbandonBlockRequestProto, v2::AbandonBlockRequestProto) = ProtoBuf.protoeq(v1, v2)

type AbandonBlockResponseProto
    AbandonBlockResponseProto() = (o=new(); fillunset(o); o)
end #type AbandonBlockResponseProto
hash(v::AbandonBlockResponseProto) = ProtoBuf.protohash(v)
isequal(v1::AbandonBlockResponseProto, v2::AbandonBlockResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AbandonBlockResponseProto, v2::AbandonBlockResponseProto) = ProtoBuf.protoeq(v1, v2)

type AddBlockRequestProto
    src::AbstractString
    clientName::AbstractString
    previous::ExtendedBlockProto
    excludeNodes::Array{DatanodeInfoProto,1}
    fileId::UInt64
    favoredNodes::Array{AbstractString,1}
    AddBlockRequestProto() = (o=new(); fillunset(o); o)
end #type AddBlockRequestProto
const __req_AddBlockRequestProto = Symbol[:src,:clientName]
const __val_AddBlockRequestProto = @compat Dict(:fileId => 0)
meta(t::Type{AddBlockRequestProto}) = meta(t, __req_AddBlockRequestProto, ProtoBuf.DEF_FNUM, __val_AddBlockRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::AddBlockRequestProto) = ProtoBuf.protohash(v)
isequal(v1::AddBlockRequestProto, v2::AddBlockRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AddBlockRequestProto, v2::AddBlockRequestProto) = ProtoBuf.protoeq(v1, v2)

type AddBlockResponseProto
    block::LocatedBlockProto
    AddBlockResponseProto() = (o=new(); fillunset(o); o)
end #type AddBlockResponseProto
const __req_AddBlockResponseProto = Symbol[:block]
meta(t::Type{AddBlockResponseProto}) = meta(t, __req_AddBlockResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::AddBlockResponseProto) = ProtoBuf.protohash(v)
isequal(v1::AddBlockResponseProto, v2::AddBlockResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AddBlockResponseProto, v2::AddBlockResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetAdditionalDatanodeRequestProto
    src::AbstractString
    blk::ExtendedBlockProto
    existings::Array{DatanodeInfoProto,1}
    excludes::Array{DatanodeInfoProto,1}
    numAdditionalNodes::UInt32
    clientName::AbstractString
    existingStorageUuids::Array{AbstractString,1}
    fileId::UInt64
    GetAdditionalDatanodeRequestProto() = (o=new(); fillunset(o); o)
end #type GetAdditionalDatanodeRequestProto
const __req_GetAdditionalDatanodeRequestProto = Symbol[:src,:blk,:numAdditionalNodes,:clientName]
const __val_GetAdditionalDatanodeRequestProto = @compat Dict(:fileId => 0)
meta(t::Type{GetAdditionalDatanodeRequestProto}) = meta(t, __req_GetAdditionalDatanodeRequestProto, ProtoBuf.DEF_FNUM, __val_GetAdditionalDatanodeRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetAdditionalDatanodeRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetAdditionalDatanodeRequestProto, v2::GetAdditionalDatanodeRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetAdditionalDatanodeRequestProto, v2::GetAdditionalDatanodeRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetAdditionalDatanodeResponseProto
    block::LocatedBlockProto
    GetAdditionalDatanodeResponseProto() = (o=new(); fillunset(o); o)
end #type GetAdditionalDatanodeResponseProto
const __req_GetAdditionalDatanodeResponseProto = Symbol[:block]
meta(t::Type{GetAdditionalDatanodeResponseProto}) = meta(t, __req_GetAdditionalDatanodeResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetAdditionalDatanodeResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetAdditionalDatanodeResponseProto, v2::GetAdditionalDatanodeResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetAdditionalDatanodeResponseProto, v2::GetAdditionalDatanodeResponseProto) = ProtoBuf.protoeq(v1, v2)

type CompleteRequestProto
    src::AbstractString
    clientName::AbstractString
    last::ExtendedBlockProto
    fileId::UInt64
    CompleteRequestProto() = (o=new(); fillunset(o); o)
end #type CompleteRequestProto
const __req_CompleteRequestProto = Symbol[:src,:clientName]
const __val_CompleteRequestProto = @compat Dict(:fileId => 0)
meta(t::Type{CompleteRequestProto}) = meta(t, __req_CompleteRequestProto, ProtoBuf.DEF_FNUM, __val_CompleteRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CompleteRequestProto) = ProtoBuf.protohash(v)
isequal(v1::CompleteRequestProto, v2::CompleteRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CompleteRequestProto, v2::CompleteRequestProto) = ProtoBuf.protoeq(v1, v2)

type CompleteResponseProto
    result::Bool
    CompleteResponseProto() = (o=new(); fillunset(o); o)
end #type CompleteResponseProto
const __req_CompleteResponseProto = Symbol[:result]
meta(t::Type{CompleteResponseProto}) = meta(t, __req_CompleteResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CompleteResponseProto) = ProtoBuf.protohash(v)
isequal(v1::CompleteResponseProto, v2::CompleteResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CompleteResponseProto, v2::CompleteResponseProto) = ProtoBuf.protoeq(v1, v2)

type ReportBadBlocksRequestProto
    blocks::Array{LocatedBlockProto,1}
    ReportBadBlocksRequestProto() = (o=new(); fillunset(o); o)
end #type ReportBadBlocksRequestProto
hash(v::ReportBadBlocksRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ReportBadBlocksRequestProto, v2::ReportBadBlocksRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReportBadBlocksRequestProto, v2::ReportBadBlocksRequestProto) = ProtoBuf.protoeq(v1, v2)

type ReportBadBlocksResponseProto
    ReportBadBlocksResponseProto() = (o=new(); fillunset(o); o)
end #type ReportBadBlocksResponseProto
hash(v::ReportBadBlocksResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ReportBadBlocksResponseProto, v2::ReportBadBlocksResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReportBadBlocksResponseProto, v2::ReportBadBlocksResponseProto) = ProtoBuf.protoeq(v1, v2)

type ConcatRequestProto
    trg::AbstractString
    srcs::Array{AbstractString,1}
    ConcatRequestProto() = (o=new(); fillunset(o); o)
end #type ConcatRequestProto
const __req_ConcatRequestProto = Symbol[:trg]
meta(t::Type{ConcatRequestProto}) = meta(t, __req_ConcatRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ConcatRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ConcatRequestProto, v2::ConcatRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ConcatRequestProto, v2::ConcatRequestProto) = ProtoBuf.protoeq(v1, v2)

type ConcatResponseProto
    ConcatResponseProto() = (o=new(); fillunset(o); o)
end #type ConcatResponseProto
hash(v::ConcatResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ConcatResponseProto, v2::ConcatResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ConcatResponseProto, v2::ConcatResponseProto) = ProtoBuf.protoeq(v1, v2)

type TruncateRequestProto
    src::AbstractString
    newLength::UInt64
    clientName::AbstractString
    TruncateRequestProto() = (o=new(); fillunset(o); o)
end #type TruncateRequestProto
const __req_TruncateRequestProto = Symbol[:src,:newLength,:clientName]
meta(t::Type{TruncateRequestProto}) = meta(t, __req_TruncateRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::TruncateRequestProto) = ProtoBuf.protohash(v)
isequal(v1::TruncateRequestProto, v2::TruncateRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::TruncateRequestProto, v2::TruncateRequestProto) = ProtoBuf.protoeq(v1, v2)

type TruncateResponseProto
    result::Bool
    TruncateResponseProto() = (o=new(); fillunset(o); o)
end #type TruncateResponseProto
const __req_TruncateResponseProto = Symbol[:result]
meta(t::Type{TruncateResponseProto}) = meta(t, __req_TruncateResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::TruncateResponseProto) = ProtoBuf.protohash(v)
isequal(v1::TruncateResponseProto, v2::TruncateResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::TruncateResponseProto, v2::TruncateResponseProto) = ProtoBuf.protoeq(v1, v2)

type RenameRequestProto
    src::AbstractString
    dst::AbstractString
    RenameRequestProto() = (o=new(); fillunset(o); o)
end #type RenameRequestProto
const __req_RenameRequestProto = Symbol[:src,:dst]
meta(t::Type{RenameRequestProto}) = meta(t, __req_RenameRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RenameRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RenameRequestProto, v2::RenameRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RenameRequestProto, v2::RenameRequestProto) = ProtoBuf.protoeq(v1, v2)

type RenameResponseProto
    result::Bool
    RenameResponseProto() = (o=new(); fillunset(o); o)
end #type RenameResponseProto
const __req_RenameResponseProto = Symbol[:result]
meta(t::Type{RenameResponseProto}) = meta(t, __req_RenameResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RenameResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RenameResponseProto, v2::RenameResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RenameResponseProto, v2::RenameResponseProto) = ProtoBuf.protoeq(v1, v2)

type Rename2RequestProto
    src::AbstractString
    dst::AbstractString
    overwriteDest::Bool
    Rename2RequestProto() = (o=new(); fillunset(o); o)
end #type Rename2RequestProto
const __req_Rename2RequestProto = Symbol[:src,:dst,:overwriteDest]
meta(t::Type{Rename2RequestProto}) = meta(t, __req_Rename2RequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::Rename2RequestProto) = ProtoBuf.protohash(v)
isequal(v1::Rename2RequestProto, v2::Rename2RequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::Rename2RequestProto, v2::Rename2RequestProto) = ProtoBuf.protoeq(v1, v2)

type Rename2ResponseProto
    Rename2ResponseProto() = (o=new(); fillunset(o); o)
end #type Rename2ResponseProto
hash(v::Rename2ResponseProto) = ProtoBuf.protohash(v)
isequal(v1::Rename2ResponseProto, v2::Rename2ResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::Rename2ResponseProto, v2::Rename2ResponseProto) = ProtoBuf.protoeq(v1, v2)

type DeleteRequestProto
    src::AbstractString
    recursive::Bool
    DeleteRequestProto() = (o=new(); fillunset(o); o)
end #type DeleteRequestProto
const __req_DeleteRequestProto = Symbol[:src,:recursive]
meta(t::Type{DeleteRequestProto}) = meta(t, __req_DeleteRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::DeleteRequestProto) = ProtoBuf.protohash(v)
isequal(v1::DeleteRequestProto, v2::DeleteRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::DeleteRequestProto, v2::DeleteRequestProto) = ProtoBuf.protoeq(v1, v2)

type DeleteResponseProto
    result::Bool
    DeleteResponseProto() = (o=new(); fillunset(o); o)
end #type DeleteResponseProto
const __req_DeleteResponseProto = Symbol[:result]
meta(t::Type{DeleteResponseProto}) = meta(t, __req_DeleteResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::DeleteResponseProto) = ProtoBuf.protohash(v)
isequal(v1::DeleteResponseProto, v2::DeleteResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::DeleteResponseProto, v2::DeleteResponseProto) = ProtoBuf.protoeq(v1, v2)

type MkdirsRequestProto
    src::AbstractString
    masked::FsPermissionProto
    createParent::Bool
    MkdirsRequestProto() = (o=new(); fillunset(o); o)
end #type MkdirsRequestProto
const __req_MkdirsRequestProto = Symbol[:src,:masked,:createParent]
meta(t::Type{MkdirsRequestProto}) = meta(t, __req_MkdirsRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::MkdirsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::MkdirsRequestProto, v2::MkdirsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::MkdirsRequestProto, v2::MkdirsRequestProto) = ProtoBuf.protoeq(v1, v2)

type MkdirsResponseProto
    result::Bool
    MkdirsResponseProto() = (o=new(); fillunset(o); o)
end #type MkdirsResponseProto
const __req_MkdirsResponseProto = Symbol[:result]
meta(t::Type{MkdirsResponseProto}) = meta(t, __req_MkdirsResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::MkdirsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::MkdirsResponseProto, v2::MkdirsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::MkdirsResponseProto, v2::MkdirsResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetListingRequestProto
    src::AbstractString
    startAfter::Array{UInt8,1}
    needLocation::Bool
    GetListingRequestProto() = (o=new(); fillunset(o); o)
end #type GetListingRequestProto
const __req_GetListingRequestProto = Symbol[:src,:startAfter,:needLocation]
meta(t::Type{GetListingRequestProto}) = meta(t, __req_GetListingRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetListingRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetListingRequestProto, v2::GetListingRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetListingRequestProto, v2::GetListingRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetListingResponseProto
    dirList::DirectoryListingProto
    GetListingResponseProto() = (o=new(); fillunset(o); o)
end #type GetListingResponseProto
hash(v::GetListingResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetListingResponseProto, v2::GetListingResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetListingResponseProto, v2::GetListingResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetSnapshottableDirListingRequestProto
    GetSnapshottableDirListingRequestProto() = (o=new(); fillunset(o); o)
end #type GetSnapshottableDirListingRequestProto
hash(v::GetSnapshottableDirListingRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetSnapshottableDirListingRequestProto, v2::GetSnapshottableDirListingRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetSnapshottableDirListingRequestProto, v2::GetSnapshottableDirListingRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetSnapshottableDirListingResponseProto
    snapshottableDirList::SnapshottableDirectoryListingProto
    GetSnapshottableDirListingResponseProto() = (o=new(); fillunset(o); o)
end #type GetSnapshottableDirListingResponseProto
hash(v::GetSnapshottableDirListingResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetSnapshottableDirListingResponseProto, v2::GetSnapshottableDirListingResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetSnapshottableDirListingResponseProto, v2::GetSnapshottableDirListingResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetSnapshotDiffReportRequestProto
    snapshotRoot::AbstractString
    fromSnapshot::AbstractString
    toSnapshot::AbstractString
    GetSnapshotDiffReportRequestProto() = (o=new(); fillunset(o); o)
end #type GetSnapshotDiffReportRequestProto
const __req_GetSnapshotDiffReportRequestProto = Symbol[:snapshotRoot,:fromSnapshot,:toSnapshot]
meta(t::Type{GetSnapshotDiffReportRequestProto}) = meta(t, __req_GetSnapshotDiffReportRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetSnapshotDiffReportRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetSnapshotDiffReportRequestProto, v2::GetSnapshotDiffReportRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetSnapshotDiffReportRequestProto, v2::GetSnapshotDiffReportRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetSnapshotDiffReportResponseProto
    diffReport::SnapshotDiffReportProto
    GetSnapshotDiffReportResponseProto() = (o=new(); fillunset(o); o)
end #type GetSnapshotDiffReportResponseProto
const __req_GetSnapshotDiffReportResponseProto = Symbol[:diffReport]
meta(t::Type{GetSnapshotDiffReportResponseProto}) = meta(t, __req_GetSnapshotDiffReportResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetSnapshotDiffReportResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetSnapshotDiffReportResponseProto, v2::GetSnapshotDiffReportResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetSnapshotDiffReportResponseProto, v2::GetSnapshotDiffReportResponseProto) = ProtoBuf.protoeq(v1, v2)

type RenewLeaseRequestProto
    clientName::AbstractString
    RenewLeaseRequestProto() = (o=new(); fillunset(o); o)
end #type RenewLeaseRequestProto
const __req_RenewLeaseRequestProto = Symbol[:clientName]
meta(t::Type{RenewLeaseRequestProto}) = meta(t, __req_RenewLeaseRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RenewLeaseRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RenewLeaseRequestProto, v2::RenewLeaseRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RenewLeaseRequestProto, v2::RenewLeaseRequestProto) = ProtoBuf.protoeq(v1, v2)

type RenewLeaseResponseProto
    RenewLeaseResponseProto() = (o=new(); fillunset(o); o)
end #type RenewLeaseResponseProto
hash(v::RenewLeaseResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RenewLeaseResponseProto, v2::RenewLeaseResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RenewLeaseResponseProto, v2::RenewLeaseResponseProto) = ProtoBuf.protoeq(v1, v2)

type RecoverLeaseRequestProto
    src::AbstractString
    clientName::AbstractString
    RecoverLeaseRequestProto() = (o=new(); fillunset(o); o)
end #type RecoverLeaseRequestProto
const __req_RecoverLeaseRequestProto = Symbol[:src,:clientName]
meta(t::Type{RecoverLeaseRequestProto}) = meta(t, __req_RecoverLeaseRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RecoverLeaseRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RecoverLeaseRequestProto, v2::RecoverLeaseRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RecoverLeaseRequestProto, v2::RecoverLeaseRequestProto) = ProtoBuf.protoeq(v1, v2)

type RecoverLeaseResponseProto
    result::Bool
    RecoverLeaseResponseProto() = (o=new(); fillunset(o); o)
end #type RecoverLeaseResponseProto
const __req_RecoverLeaseResponseProto = Symbol[:result]
meta(t::Type{RecoverLeaseResponseProto}) = meta(t, __req_RecoverLeaseResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RecoverLeaseResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RecoverLeaseResponseProto, v2::RecoverLeaseResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RecoverLeaseResponseProto, v2::RecoverLeaseResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetFsStatusRequestProto
    GetFsStatusRequestProto() = (o=new(); fillunset(o); o)
end #type GetFsStatusRequestProto
hash(v::GetFsStatusRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetFsStatusRequestProto, v2::GetFsStatusRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetFsStatusRequestProto, v2::GetFsStatusRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetFsStatsResponseProto
    capacity::UInt64
    used::UInt64
    remaining::UInt64
    under_replicated::UInt64
    corrupt_blocks::UInt64
    missing_blocks::UInt64
    missing_repl_one_blocks::UInt64
    GetFsStatsResponseProto() = (o=new(); fillunset(o); o)
end #type GetFsStatsResponseProto
const __req_GetFsStatsResponseProto = Symbol[:capacity,:used,:remaining,:under_replicated,:corrupt_blocks,:missing_blocks]
meta(t::Type{GetFsStatsResponseProto}) = meta(t, __req_GetFsStatsResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetFsStatsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetFsStatsResponseProto, v2::GetFsStatsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetFsStatsResponseProto, v2::GetFsStatsResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetDatanodeReportRequestProto
    _type::Int32
    GetDatanodeReportRequestProto() = (o=new(); fillunset(o); o)
end #type GetDatanodeReportRequestProto
const __req_GetDatanodeReportRequestProto = Symbol[:_type]
meta(t::Type{GetDatanodeReportRequestProto}) = meta(t, __req_GetDatanodeReportRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetDatanodeReportRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetDatanodeReportRequestProto, v2::GetDatanodeReportRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetDatanodeReportRequestProto, v2::GetDatanodeReportRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetDatanodeReportResponseProto
    di::Array{DatanodeInfoProto,1}
    GetDatanodeReportResponseProto() = (o=new(); fillunset(o); o)
end #type GetDatanodeReportResponseProto
hash(v::GetDatanodeReportResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetDatanodeReportResponseProto, v2::GetDatanodeReportResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetDatanodeReportResponseProto, v2::GetDatanodeReportResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetDatanodeStorageReportRequestProto
    _type::Int32
    GetDatanodeStorageReportRequestProto() = (o=new(); fillunset(o); o)
end #type GetDatanodeStorageReportRequestProto
const __req_GetDatanodeStorageReportRequestProto = Symbol[:_type]
meta(t::Type{GetDatanodeStorageReportRequestProto}) = meta(t, __req_GetDatanodeStorageReportRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetDatanodeStorageReportRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetDatanodeStorageReportRequestProto, v2::GetDatanodeStorageReportRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetDatanodeStorageReportRequestProto, v2::GetDatanodeStorageReportRequestProto) = ProtoBuf.protoeq(v1, v2)

type DatanodeStorageReportProto
    datanodeInfo::DatanodeInfoProto
    storageReports::Array{StorageReportProto,1}
    DatanodeStorageReportProto() = (o=new(); fillunset(o); o)
end #type DatanodeStorageReportProto
const __req_DatanodeStorageReportProto = Symbol[:datanodeInfo]
meta(t::Type{DatanodeStorageReportProto}) = meta(t, __req_DatanodeStorageReportProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::DatanodeStorageReportProto) = ProtoBuf.protohash(v)
isequal(v1::DatanodeStorageReportProto, v2::DatanodeStorageReportProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::DatanodeStorageReportProto, v2::DatanodeStorageReportProto) = ProtoBuf.protoeq(v1, v2)

type GetDatanodeStorageReportResponseProto
    datanodeStorageReports::Array{DatanodeStorageReportProto,1}
    GetDatanodeStorageReportResponseProto() = (o=new(); fillunset(o); o)
end #type GetDatanodeStorageReportResponseProto
hash(v::GetDatanodeStorageReportResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetDatanodeStorageReportResponseProto, v2::GetDatanodeStorageReportResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetDatanodeStorageReportResponseProto, v2::GetDatanodeStorageReportResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetPreferredBlockSizeRequestProto
    filename::AbstractString
    GetPreferredBlockSizeRequestProto() = (o=new(); fillunset(o); o)
end #type GetPreferredBlockSizeRequestProto
const __req_GetPreferredBlockSizeRequestProto = Symbol[:filename]
meta(t::Type{GetPreferredBlockSizeRequestProto}) = meta(t, __req_GetPreferredBlockSizeRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetPreferredBlockSizeRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetPreferredBlockSizeRequestProto, v2::GetPreferredBlockSizeRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetPreferredBlockSizeRequestProto, v2::GetPreferredBlockSizeRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetPreferredBlockSizeResponseProto
    bsize::UInt64
    GetPreferredBlockSizeResponseProto() = (o=new(); fillunset(o); o)
end #type GetPreferredBlockSizeResponseProto
const __req_GetPreferredBlockSizeResponseProto = Symbol[:bsize]
meta(t::Type{GetPreferredBlockSizeResponseProto}) = meta(t, __req_GetPreferredBlockSizeResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetPreferredBlockSizeResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetPreferredBlockSizeResponseProto, v2::GetPreferredBlockSizeResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetPreferredBlockSizeResponseProto, v2::GetPreferredBlockSizeResponseProto) = ProtoBuf.protoeq(v1, v2)

type SetSafeModeRequestProto
    action::Int32
    checked::Bool
    SetSafeModeRequestProto() = (o=new(); fillunset(o); o)
end #type SetSafeModeRequestProto
const __req_SetSafeModeRequestProto = Symbol[:action]
const __val_SetSafeModeRequestProto = @compat Dict(:checked => false)
meta(t::Type{SetSafeModeRequestProto}) = meta(t, __req_SetSafeModeRequestProto, ProtoBuf.DEF_FNUM, __val_SetSafeModeRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::SetSafeModeRequestProto) = ProtoBuf.protohash(v)
isequal(v1::SetSafeModeRequestProto, v2::SetSafeModeRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetSafeModeRequestProto, v2::SetSafeModeRequestProto) = ProtoBuf.protoeq(v1, v2)

type SetSafeModeResponseProto
    result::Bool
    SetSafeModeResponseProto() = (o=new(); fillunset(o); o)
end #type SetSafeModeResponseProto
const __req_SetSafeModeResponseProto = Symbol[:result]
meta(t::Type{SetSafeModeResponseProto}) = meta(t, __req_SetSafeModeResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::SetSafeModeResponseProto) = ProtoBuf.protohash(v)
isequal(v1::SetSafeModeResponseProto, v2::SetSafeModeResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetSafeModeResponseProto, v2::SetSafeModeResponseProto) = ProtoBuf.protoeq(v1, v2)

type SaveNamespaceRequestProto
    SaveNamespaceRequestProto() = (o=new(); fillunset(o); o)
end #type SaveNamespaceRequestProto
hash(v::SaveNamespaceRequestProto) = ProtoBuf.protohash(v)
isequal(v1::SaveNamespaceRequestProto, v2::SaveNamespaceRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SaveNamespaceRequestProto, v2::SaveNamespaceRequestProto) = ProtoBuf.protoeq(v1, v2)

type SaveNamespaceResponseProto
    SaveNamespaceResponseProto() = (o=new(); fillunset(o); o)
end #type SaveNamespaceResponseProto
hash(v::SaveNamespaceResponseProto) = ProtoBuf.protohash(v)
isequal(v1::SaveNamespaceResponseProto, v2::SaveNamespaceResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SaveNamespaceResponseProto, v2::SaveNamespaceResponseProto) = ProtoBuf.protoeq(v1, v2)

type RollEditsRequestProto
    RollEditsRequestProto() = (o=new(); fillunset(o); o)
end #type RollEditsRequestProto
hash(v::RollEditsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RollEditsRequestProto, v2::RollEditsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RollEditsRequestProto, v2::RollEditsRequestProto) = ProtoBuf.protoeq(v1, v2)

type RollEditsResponseProto
    newSegmentTxId::UInt64
    RollEditsResponseProto() = (o=new(); fillunset(o); o)
end #type RollEditsResponseProto
const __req_RollEditsResponseProto = Symbol[:newSegmentTxId]
meta(t::Type{RollEditsResponseProto}) = meta(t, __req_RollEditsResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RollEditsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RollEditsResponseProto, v2::RollEditsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RollEditsResponseProto, v2::RollEditsResponseProto) = ProtoBuf.protoeq(v1, v2)

type RestoreFailedStorageRequestProto
    arg::AbstractString
    RestoreFailedStorageRequestProto() = (o=new(); fillunset(o); o)
end #type RestoreFailedStorageRequestProto
const __req_RestoreFailedStorageRequestProto = Symbol[:arg]
meta(t::Type{RestoreFailedStorageRequestProto}) = meta(t, __req_RestoreFailedStorageRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RestoreFailedStorageRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RestoreFailedStorageRequestProto, v2::RestoreFailedStorageRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RestoreFailedStorageRequestProto, v2::RestoreFailedStorageRequestProto) = ProtoBuf.protoeq(v1, v2)

type RestoreFailedStorageResponseProto
    result::Bool
    RestoreFailedStorageResponseProto() = (o=new(); fillunset(o); o)
end #type RestoreFailedStorageResponseProto
const __req_RestoreFailedStorageResponseProto = Symbol[:result]
meta(t::Type{RestoreFailedStorageResponseProto}) = meta(t, __req_RestoreFailedStorageResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RestoreFailedStorageResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RestoreFailedStorageResponseProto, v2::RestoreFailedStorageResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RestoreFailedStorageResponseProto, v2::RestoreFailedStorageResponseProto) = ProtoBuf.protoeq(v1, v2)

type RefreshNodesRequestProto
    RefreshNodesRequestProto() = (o=new(); fillunset(o); o)
end #type RefreshNodesRequestProto
hash(v::RefreshNodesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RefreshNodesRequestProto, v2::RefreshNodesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RefreshNodesRequestProto, v2::RefreshNodesRequestProto) = ProtoBuf.protoeq(v1, v2)

type RefreshNodesResponseProto
    RefreshNodesResponseProto() = (o=new(); fillunset(o); o)
end #type RefreshNodesResponseProto
hash(v::RefreshNodesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RefreshNodesResponseProto, v2::RefreshNodesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RefreshNodesResponseProto, v2::RefreshNodesResponseProto) = ProtoBuf.protoeq(v1, v2)

type FinalizeUpgradeRequestProto
    FinalizeUpgradeRequestProto() = (o=new(); fillunset(o); o)
end #type FinalizeUpgradeRequestProto
hash(v::FinalizeUpgradeRequestProto) = ProtoBuf.protohash(v)
isequal(v1::FinalizeUpgradeRequestProto, v2::FinalizeUpgradeRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::FinalizeUpgradeRequestProto, v2::FinalizeUpgradeRequestProto) = ProtoBuf.protoeq(v1, v2)

type FinalizeUpgradeResponseProto
    FinalizeUpgradeResponseProto() = (o=new(); fillunset(o); o)
end #type FinalizeUpgradeResponseProto
hash(v::FinalizeUpgradeResponseProto) = ProtoBuf.protohash(v)
isequal(v1::FinalizeUpgradeResponseProto, v2::FinalizeUpgradeResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::FinalizeUpgradeResponseProto, v2::FinalizeUpgradeResponseProto) = ProtoBuf.protoeq(v1, v2)

type RollingUpgradeRequestProto
    action::Int32
    RollingUpgradeRequestProto() = (o=new(); fillunset(o); o)
end #type RollingUpgradeRequestProto
const __req_RollingUpgradeRequestProto = Symbol[:action]
meta(t::Type{RollingUpgradeRequestProto}) = meta(t, __req_RollingUpgradeRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RollingUpgradeRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RollingUpgradeRequestProto, v2::RollingUpgradeRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RollingUpgradeRequestProto, v2::RollingUpgradeRequestProto) = ProtoBuf.protoeq(v1, v2)

type RollingUpgradeInfoProto
    status::RollingUpgradeStatusProto
    startTime::UInt64
    finalizeTime::UInt64
    createdRollbackImages::Bool
    RollingUpgradeInfoProto() = (o=new(); fillunset(o); o)
end #type RollingUpgradeInfoProto
const __req_RollingUpgradeInfoProto = Symbol[:status,:startTime,:finalizeTime,:createdRollbackImages]
meta(t::Type{RollingUpgradeInfoProto}) = meta(t, __req_RollingUpgradeInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RollingUpgradeInfoProto) = ProtoBuf.protohash(v)
isequal(v1::RollingUpgradeInfoProto, v2::RollingUpgradeInfoProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RollingUpgradeInfoProto, v2::RollingUpgradeInfoProto) = ProtoBuf.protoeq(v1, v2)

type RollingUpgradeResponseProto
    rollingUpgradeInfo::RollingUpgradeInfoProto
    RollingUpgradeResponseProto() = (o=new(); fillunset(o); o)
end #type RollingUpgradeResponseProto
hash(v::RollingUpgradeResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RollingUpgradeResponseProto, v2::RollingUpgradeResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RollingUpgradeResponseProto, v2::RollingUpgradeResponseProto) = ProtoBuf.protoeq(v1, v2)

type ListCorruptFileBlocksRequestProto
    path::AbstractString
    cookie::AbstractString
    ListCorruptFileBlocksRequestProto() = (o=new(); fillunset(o); o)
end #type ListCorruptFileBlocksRequestProto
const __req_ListCorruptFileBlocksRequestProto = Symbol[:path]
meta(t::Type{ListCorruptFileBlocksRequestProto}) = meta(t, __req_ListCorruptFileBlocksRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ListCorruptFileBlocksRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ListCorruptFileBlocksRequestProto, v2::ListCorruptFileBlocksRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ListCorruptFileBlocksRequestProto, v2::ListCorruptFileBlocksRequestProto) = ProtoBuf.protoeq(v1, v2)

type ListCorruptFileBlocksResponseProto
    corrupt::CorruptFileBlocksProto
    ListCorruptFileBlocksResponseProto() = (o=new(); fillunset(o); o)
end #type ListCorruptFileBlocksResponseProto
const __req_ListCorruptFileBlocksResponseProto = Symbol[:corrupt]
meta(t::Type{ListCorruptFileBlocksResponseProto}) = meta(t, __req_ListCorruptFileBlocksResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ListCorruptFileBlocksResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ListCorruptFileBlocksResponseProto, v2::ListCorruptFileBlocksResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ListCorruptFileBlocksResponseProto, v2::ListCorruptFileBlocksResponseProto) = ProtoBuf.protoeq(v1, v2)

type MetaSaveRequestProto
    filename::AbstractString
    MetaSaveRequestProto() = (o=new(); fillunset(o); o)
end #type MetaSaveRequestProto
const __req_MetaSaveRequestProto = Symbol[:filename]
meta(t::Type{MetaSaveRequestProto}) = meta(t, __req_MetaSaveRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::MetaSaveRequestProto) = ProtoBuf.protohash(v)
isequal(v1::MetaSaveRequestProto, v2::MetaSaveRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::MetaSaveRequestProto, v2::MetaSaveRequestProto) = ProtoBuf.protoeq(v1, v2)

type MetaSaveResponseProto
    MetaSaveResponseProto() = (o=new(); fillunset(o); o)
end #type MetaSaveResponseProto
hash(v::MetaSaveResponseProto) = ProtoBuf.protohash(v)
isequal(v1::MetaSaveResponseProto, v2::MetaSaveResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::MetaSaveResponseProto, v2::MetaSaveResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetFileInfoRequestProto
    src::AbstractString
    GetFileInfoRequestProto() = (o=new(); fillunset(o); o)
end #type GetFileInfoRequestProto
const __req_GetFileInfoRequestProto = Symbol[:src]
meta(t::Type{GetFileInfoRequestProto}) = meta(t, __req_GetFileInfoRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetFileInfoRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetFileInfoRequestProto, v2::GetFileInfoRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetFileInfoRequestProto, v2::GetFileInfoRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetFileInfoResponseProto
    fs::HdfsFileStatusProto
    GetFileInfoResponseProto() = (o=new(); fillunset(o); o)
end #type GetFileInfoResponseProto
hash(v::GetFileInfoResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetFileInfoResponseProto, v2::GetFileInfoResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetFileInfoResponseProto, v2::GetFileInfoResponseProto) = ProtoBuf.protoeq(v1, v2)

type IsFileClosedRequestProto
    src::AbstractString
    IsFileClosedRequestProto() = (o=new(); fillunset(o); o)
end #type IsFileClosedRequestProto
const __req_IsFileClosedRequestProto = Symbol[:src]
meta(t::Type{IsFileClosedRequestProto}) = meta(t, __req_IsFileClosedRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::IsFileClosedRequestProto) = ProtoBuf.protohash(v)
isequal(v1::IsFileClosedRequestProto, v2::IsFileClosedRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::IsFileClosedRequestProto, v2::IsFileClosedRequestProto) = ProtoBuf.protoeq(v1, v2)

type IsFileClosedResponseProto
    result::Bool
    IsFileClosedResponseProto() = (o=new(); fillunset(o); o)
end #type IsFileClosedResponseProto
const __req_IsFileClosedResponseProto = Symbol[:result]
meta(t::Type{IsFileClosedResponseProto}) = meta(t, __req_IsFileClosedResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::IsFileClosedResponseProto) = ProtoBuf.protohash(v)
isequal(v1::IsFileClosedResponseProto, v2::IsFileClosedResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::IsFileClosedResponseProto, v2::IsFileClosedResponseProto) = ProtoBuf.protoeq(v1, v2)

type CacheDirectiveInfoExpirationProto
    millis::Int64
    isRelative::Bool
    CacheDirectiveInfoExpirationProto() = (o=new(); fillunset(o); o)
end #type CacheDirectiveInfoExpirationProto
const __req_CacheDirectiveInfoExpirationProto = Symbol[:millis,:isRelative]
meta(t::Type{CacheDirectiveInfoExpirationProto}) = meta(t, __req_CacheDirectiveInfoExpirationProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CacheDirectiveInfoExpirationProto) = ProtoBuf.protohash(v)
isequal(v1::CacheDirectiveInfoExpirationProto, v2::CacheDirectiveInfoExpirationProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CacheDirectiveInfoExpirationProto, v2::CacheDirectiveInfoExpirationProto) = ProtoBuf.protoeq(v1, v2)

type CacheDirectiveInfoProto
    id::Int64
    path::AbstractString
    replication::UInt32
    pool::AbstractString
    expiration::CacheDirectiveInfoExpirationProto
    CacheDirectiveInfoProto() = (o=new(); fillunset(o); o)
end #type CacheDirectiveInfoProto
hash(v::CacheDirectiveInfoProto) = ProtoBuf.protohash(v)
isequal(v1::CacheDirectiveInfoProto, v2::CacheDirectiveInfoProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CacheDirectiveInfoProto, v2::CacheDirectiveInfoProto) = ProtoBuf.protoeq(v1, v2)

type CacheDirectiveStatsProto
    bytesNeeded::Int64
    bytesCached::Int64
    filesNeeded::Int64
    filesCached::Int64
    hasExpired::Bool
    CacheDirectiveStatsProto() = (o=new(); fillunset(o); o)
end #type CacheDirectiveStatsProto
const __req_CacheDirectiveStatsProto = Symbol[:bytesNeeded,:bytesCached,:filesNeeded,:filesCached,:hasExpired]
meta(t::Type{CacheDirectiveStatsProto}) = meta(t, __req_CacheDirectiveStatsProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CacheDirectiveStatsProto) = ProtoBuf.protohash(v)
isequal(v1::CacheDirectiveStatsProto, v2::CacheDirectiveStatsProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CacheDirectiveStatsProto, v2::CacheDirectiveStatsProto) = ProtoBuf.protoeq(v1, v2)

type AddCacheDirectiveRequestProto
    info::CacheDirectiveInfoProto
    cacheFlags::UInt32
    AddCacheDirectiveRequestProto() = (o=new(); fillunset(o); o)
end #type AddCacheDirectiveRequestProto
const __req_AddCacheDirectiveRequestProto = Symbol[:info]
meta(t::Type{AddCacheDirectiveRequestProto}) = meta(t, __req_AddCacheDirectiveRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::AddCacheDirectiveRequestProto) = ProtoBuf.protohash(v)
isequal(v1::AddCacheDirectiveRequestProto, v2::AddCacheDirectiveRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AddCacheDirectiveRequestProto, v2::AddCacheDirectiveRequestProto) = ProtoBuf.protoeq(v1, v2)

type AddCacheDirectiveResponseProto
    id::Int64
    AddCacheDirectiveResponseProto() = (o=new(); fillunset(o); o)
end #type AddCacheDirectiveResponseProto
const __req_AddCacheDirectiveResponseProto = Symbol[:id]
meta(t::Type{AddCacheDirectiveResponseProto}) = meta(t, __req_AddCacheDirectiveResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::AddCacheDirectiveResponseProto) = ProtoBuf.protohash(v)
isequal(v1::AddCacheDirectiveResponseProto, v2::AddCacheDirectiveResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AddCacheDirectiveResponseProto, v2::AddCacheDirectiveResponseProto) = ProtoBuf.protoeq(v1, v2)

type ModifyCacheDirectiveRequestProto
    info::CacheDirectiveInfoProto
    cacheFlags::UInt32
    ModifyCacheDirectiveRequestProto() = (o=new(); fillunset(o); o)
end #type ModifyCacheDirectiveRequestProto
const __req_ModifyCacheDirectiveRequestProto = Symbol[:info]
meta(t::Type{ModifyCacheDirectiveRequestProto}) = meta(t, __req_ModifyCacheDirectiveRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ModifyCacheDirectiveRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ModifyCacheDirectiveRequestProto, v2::ModifyCacheDirectiveRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ModifyCacheDirectiveRequestProto, v2::ModifyCacheDirectiveRequestProto) = ProtoBuf.protoeq(v1, v2)

type ModifyCacheDirectiveResponseProto
    ModifyCacheDirectiveResponseProto() = (o=new(); fillunset(o); o)
end #type ModifyCacheDirectiveResponseProto
hash(v::ModifyCacheDirectiveResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ModifyCacheDirectiveResponseProto, v2::ModifyCacheDirectiveResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ModifyCacheDirectiveResponseProto, v2::ModifyCacheDirectiveResponseProto) = ProtoBuf.protoeq(v1, v2)

type RemoveCacheDirectiveRequestProto
    id::Int64
    RemoveCacheDirectiveRequestProto() = (o=new(); fillunset(o); o)
end #type RemoveCacheDirectiveRequestProto
const __req_RemoveCacheDirectiveRequestProto = Symbol[:id]
meta(t::Type{RemoveCacheDirectiveRequestProto}) = meta(t, __req_RemoveCacheDirectiveRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RemoveCacheDirectiveRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveCacheDirectiveRequestProto, v2::RemoveCacheDirectiveRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveCacheDirectiveRequestProto, v2::RemoveCacheDirectiveRequestProto) = ProtoBuf.protoeq(v1, v2)

type RemoveCacheDirectiveResponseProto
    RemoveCacheDirectiveResponseProto() = (o=new(); fillunset(o); o)
end #type RemoveCacheDirectiveResponseProto
hash(v::RemoveCacheDirectiveResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveCacheDirectiveResponseProto, v2::RemoveCacheDirectiveResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveCacheDirectiveResponseProto, v2::RemoveCacheDirectiveResponseProto) = ProtoBuf.protoeq(v1, v2)

type ListCacheDirectivesRequestProto
    prevId::Int64
    filter::CacheDirectiveInfoProto
    ListCacheDirectivesRequestProto() = (o=new(); fillunset(o); o)
end #type ListCacheDirectivesRequestProto
const __req_ListCacheDirectivesRequestProto = Symbol[:prevId,:filter]
meta(t::Type{ListCacheDirectivesRequestProto}) = meta(t, __req_ListCacheDirectivesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ListCacheDirectivesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ListCacheDirectivesRequestProto, v2::ListCacheDirectivesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ListCacheDirectivesRequestProto, v2::ListCacheDirectivesRequestProto) = ProtoBuf.protoeq(v1, v2)

type CacheDirectiveEntryProto
    info::CacheDirectiveInfoProto
    stats::CacheDirectiveStatsProto
    CacheDirectiveEntryProto() = (o=new(); fillunset(o); o)
end #type CacheDirectiveEntryProto
const __req_CacheDirectiveEntryProto = Symbol[:info,:stats]
meta(t::Type{CacheDirectiveEntryProto}) = meta(t, __req_CacheDirectiveEntryProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CacheDirectiveEntryProto) = ProtoBuf.protohash(v)
isequal(v1::CacheDirectiveEntryProto, v2::CacheDirectiveEntryProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CacheDirectiveEntryProto, v2::CacheDirectiveEntryProto) = ProtoBuf.protoeq(v1, v2)

type ListCacheDirectivesResponseProto
    elements::Array{CacheDirectiveEntryProto,1}
    hasMore::Bool
    ListCacheDirectivesResponseProto() = (o=new(); fillunset(o); o)
end #type ListCacheDirectivesResponseProto
const __req_ListCacheDirectivesResponseProto = Symbol[:hasMore]
meta(t::Type{ListCacheDirectivesResponseProto}) = meta(t, __req_ListCacheDirectivesResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ListCacheDirectivesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ListCacheDirectivesResponseProto, v2::ListCacheDirectivesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ListCacheDirectivesResponseProto, v2::ListCacheDirectivesResponseProto) = ProtoBuf.protoeq(v1, v2)

type CachePoolInfoProto
    poolName::AbstractString
    ownerName::AbstractString
    groupName::AbstractString
    mode::Int32
    limit::Int64
    maxRelativeExpiry::Int64
    CachePoolInfoProto() = (o=new(); fillunset(o); o)
end #type CachePoolInfoProto
hash(v::CachePoolInfoProto) = ProtoBuf.protohash(v)
isequal(v1::CachePoolInfoProto, v2::CachePoolInfoProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CachePoolInfoProto, v2::CachePoolInfoProto) = ProtoBuf.protoeq(v1, v2)

type CachePoolStatsProto
    bytesNeeded::Int64
    bytesCached::Int64
    bytesOverlimit::Int64
    filesNeeded::Int64
    filesCached::Int64
    CachePoolStatsProto() = (o=new(); fillunset(o); o)
end #type CachePoolStatsProto
const __req_CachePoolStatsProto = Symbol[:bytesNeeded,:bytesCached,:bytesOverlimit,:filesNeeded,:filesCached]
meta(t::Type{CachePoolStatsProto}) = meta(t, __req_CachePoolStatsProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CachePoolStatsProto) = ProtoBuf.protohash(v)
isequal(v1::CachePoolStatsProto, v2::CachePoolStatsProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CachePoolStatsProto, v2::CachePoolStatsProto) = ProtoBuf.protoeq(v1, v2)

type AddCachePoolRequestProto
    info::CachePoolInfoProto
    AddCachePoolRequestProto() = (o=new(); fillunset(o); o)
end #type AddCachePoolRequestProto
const __req_AddCachePoolRequestProto = Symbol[:info]
meta(t::Type{AddCachePoolRequestProto}) = meta(t, __req_AddCachePoolRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::AddCachePoolRequestProto) = ProtoBuf.protohash(v)
isequal(v1::AddCachePoolRequestProto, v2::AddCachePoolRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AddCachePoolRequestProto, v2::AddCachePoolRequestProto) = ProtoBuf.protoeq(v1, v2)

type AddCachePoolResponseProto
    AddCachePoolResponseProto() = (o=new(); fillunset(o); o)
end #type AddCachePoolResponseProto
hash(v::AddCachePoolResponseProto) = ProtoBuf.protohash(v)
isequal(v1::AddCachePoolResponseProto, v2::AddCachePoolResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AddCachePoolResponseProto, v2::AddCachePoolResponseProto) = ProtoBuf.protoeq(v1, v2)

type ModifyCachePoolRequestProto
    info::CachePoolInfoProto
    ModifyCachePoolRequestProto() = (o=new(); fillunset(o); o)
end #type ModifyCachePoolRequestProto
const __req_ModifyCachePoolRequestProto = Symbol[:info]
meta(t::Type{ModifyCachePoolRequestProto}) = meta(t, __req_ModifyCachePoolRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ModifyCachePoolRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ModifyCachePoolRequestProto, v2::ModifyCachePoolRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ModifyCachePoolRequestProto, v2::ModifyCachePoolRequestProto) = ProtoBuf.protoeq(v1, v2)

type ModifyCachePoolResponseProto
    ModifyCachePoolResponseProto() = (o=new(); fillunset(o); o)
end #type ModifyCachePoolResponseProto
hash(v::ModifyCachePoolResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ModifyCachePoolResponseProto, v2::ModifyCachePoolResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ModifyCachePoolResponseProto, v2::ModifyCachePoolResponseProto) = ProtoBuf.protoeq(v1, v2)

type RemoveCachePoolRequestProto
    poolName::AbstractString
    RemoveCachePoolRequestProto() = (o=new(); fillunset(o); o)
end #type RemoveCachePoolRequestProto
const __req_RemoveCachePoolRequestProto = Symbol[:poolName]
meta(t::Type{RemoveCachePoolRequestProto}) = meta(t, __req_RemoveCachePoolRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RemoveCachePoolRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveCachePoolRequestProto, v2::RemoveCachePoolRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveCachePoolRequestProto, v2::RemoveCachePoolRequestProto) = ProtoBuf.protoeq(v1, v2)

type RemoveCachePoolResponseProto
    RemoveCachePoolResponseProto() = (o=new(); fillunset(o); o)
end #type RemoveCachePoolResponseProto
hash(v::RemoveCachePoolResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveCachePoolResponseProto, v2::RemoveCachePoolResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveCachePoolResponseProto, v2::RemoveCachePoolResponseProto) = ProtoBuf.protoeq(v1, v2)

type ListCachePoolsRequestProto
    prevPoolName::AbstractString
    ListCachePoolsRequestProto() = (o=new(); fillunset(o); o)
end #type ListCachePoolsRequestProto
const __req_ListCachePoolsRequestProto = Symbol[:prevPoolName]
meta(t::Type{ListCachePoolsRequestProto}) = meta(t, __req_ListCachePoolsRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ListCachePoolsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ListCachePoolsRequestProto, v2::ListCachePoolsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ListCachePoolsRequestProto, v2::ListCachePoolsRequestProto) = ProtoBuf.protoeq(v1, v2)

type CachePoolEntryProto
    info::CachePoolInfoProto
    stats::CachePoolStatsProto
    CachePoolEntryProto() = (o=new(); fillunset(o); o)
end #type CachePoolEntryProto
const __req_CachePoolEntryProto = Symbol[:info,:stats]
meta(t::Type{CachePoolEntryProto}) = meta(t, __req_CachePoolEntryProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CachePoolEntryProto) = ProtoBuf.protohash(v)
isequal(v1::CachePoolEntryProto, v2::CachePoolEntryProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CachePoolEntryProto, v2::CachePoolEntryProto) = ProtoBuf.protoeq(v1, v2)

type ListCachePoolsResponseProto
    entries::Array{CachePoolEntryProto,1}
    hasMore::Bool
    ListCachePoolsResponseProto() = (o=new(); fillunset(o); o)
end #type ListCachePoolsResponseProto
const __req_ListCachePoolsResponseProto = Symbol[:hasMore]
meta(t::Type{ListCachePoolsResponseProto}) = meta(t, __req_ListCachePoolsResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ListCachePoolsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ListCachePoolsResponseProto, v2::ListCachePoolsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ListCachePoolsResponseProto, v2::ListCachePoolsResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetFileLinkInfoRequestProto
    src::AbstractString
    GetFileLinkInfoRequestProto() = (o=new(); fillunset(o); o)
end #type GetFileLinkInfoRequestProto
const __req_GetFileLinkInfoRequestProto = Symbol[:src]
meta(t::Type{GetFileLinkInfoRequestProto}) = meta(t, __req_GetFileLinkInfoRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetFileLinkInfoRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetFileLinkInfoRequestProto, v2::GetFileLinkInfoRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetFileLinkInfoRequestProto, v2::GetFileLinkInfoRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetFileLinkInfoResponseProto
    fs::HdfsFileStatusProto
    GetFileLinkInfoResponseProto() = (o=new(); fillunset(o); o)
end #type GetFileLinkInfoResponseProto
hash(v::GetFileLinkInfoResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetFileLinkInfoResponseProto, v2::GetFileLinkInfoResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetFileLinkInfoResponseProto, v2::GetFileLinkInfoResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetContentSummaryRequestProto
    path::AbstractString
    GetContentSummaryRequestProto() = (o=new(); fillunset(o); o)
end #type GetContentSummaryRequestProto
const __req_GetContentSummaryRequestProto = Symbol[:path]
meta(t::Type{GetContentSummaryRequestProto}) = meta(t, __req_GetContentSummaryRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetContentSummaryRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetContentSummaryRequestProto, v2::GetContentSummaryRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContentSummaryRequestProto, v2::GetContentSummaryRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetContentSummaryResponseProto
    summary::ContentSummaryProto
    GetContentSummaryResponseProto() = (o=new(); fillunset(o); o)
end #type GetContentSummaryResponseProto
const __req_GetContentSummaryResponseProto = Symbol[:summary]
meta(t::Type{GetContentSummaryResponseProto}) = meta(t, __req_GetContentSummaryResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetContentSummaryResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetContentSummaryResponseProto, v2::GetContentSummaryResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContentSummaryResponseProto, v2::GetContentSummaryResponseProto) = ProtoBuf.protoeq(v1, v2)

type SetQuotaRequestProto
    path::AbstractString
    namespaceQuota::UInt64
    storagespaceQuota::UInt64
    storageType::Int32
    SetQuotaRequestProto() = (o=new(); fillunset(o); o)
end #type SetQuotaRequestProto
const __req_SetQuotaRequestProto = Symbol[:path,:namespaceQuota,:storagespaceQuota]
meta(t::Type{SetQuotaRequestProto}) = meta(t, __req_SetQuotaRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::SetQuotaRequestProto) = ProtoBuf.protohash(v)
isequal(v1::SetQuotaRequestProto, v2::SetQuotaRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetQuotaRequestProto, v2::SetQuotaRequestProto) = ProtoBuf.protoeq(v1, v2)

type SetQuotaResponseProto
    SetQuotaResponseProto() = (o=new(); fillunset(o); o)
end #type SetQuotaResponseProto
hash(v::SetQuotaResponseProto) = ProtoBuf.protohash(v)
isequal(v1::SetQuotaResponseProto, v2::SetQuotaResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetQuotaResponseProto, v2::SetQuotaResponseProto) = ProtoBuf.protoeq(v1, v2)

type FsyncRequestProto
    src::AbstractString
    client::AbstractString
    lastBlockLength::Int64
    fileId::UInt64
    FsyncRequestProto() = (o=new(); fillunset(o); o)
end #type FsyncRequestProto
const __req_FsyncRequestProto = Symbol[:src,:client]
const __val_FsyncRequestProto = @compat Dict(:lastBlockLength => -1, :fileId => 0)
const __wtype_FsyncRequestProto = @compat Dict(:lastBlockLength => :sint64)
meta(t::Type{FsyncRequestProto}) = meta(t, __req_FsyncRequestProto, ProtoBuf.DEF_FNUM, __val_FsyncRequestProto, true, ProtoBuf.DEF_PACK, __wtype_FsyncRequestProto)
hash(v::FsyncRequestProto) = ProtoBuf.protohash(v)
isequal(v1::FsyncRequestProto, v2::FsyncRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::FsyncRequestProto, v2::FsyncRequestProto) = ProtoBuf.protoeq(v1, v2)

type FsyncResponseProto
    FsyncResponseProto() = (o=new(); fillunset(o); o)
end #type FsyncResponseProto
hash(v::FsyncResponseProto) = ProtoBuf.protohash(v)
isequal(v1::FsyncResponseProto, v2::FsyncResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::FsyncResponseProto, v2::FsyncResponseProto) = ProtoBuf.protoeq(v1, v2)

type SetTimesRequestProto
    src::AbstractString
    mtime::UInt64
    atime::UInt64
    SetTimesRequestProto() = (o=new(); fillunset(o); o)
end #type SetTimesRequestProto
const __req_SetTimesRequestProto = Symbol[:src,:mtime,:atime]
meta(t::Type{SetTimesRequestProto}) = meta(t, __req_SetTimesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::SetTimesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::SetTimesRequestProto, v2::SetTimesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetTimesRequestProto, v2::SetTimesRequestProto) = ProtoBuf.protoeq(v1, v2)

type SetTimesResponseProto
    SetTimesResponseProto() = (o=new(); fillunset(o); o)
end #type SetTimesResponseProto
hash(v::SetTimesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::SetTimesResponseProto, v2::SetTimesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetTimesResponseProto, v2::SetTimesResponseProto) = ProtoBuf.protoeq(v1, v2)

type CreateSymlinkRequestProto
    target::AbstractString
    link::AbstractString
    dirPerm::FsPermissionProto
    createParent::Bool
    CreateSymlinkRequestProto() = (o=new(); fillunset(o); o)
end #type CreateSymlinkRequestProto
const __req_CreateSymlinkRequestProto = Symbol[:target,:link,:dirPerm,:createParent]
meta(t::Type{CreateSymlinkRequestProto}) = meta(t, __req_CreateSymlinkRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CreateSymlinkRequestProto) = ProtoBuf.protohash(v)
isequal(v1::CreateSymlinkRequestProto, v2::CreateSymlinkRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CreateSymlinkRequestProto, v2::CreateSymlinkRequestProto) = ProtoBuf.protoeq(v1, v2)

type CreateSymlinkResponseProto
    CreateSymlinkResponseProto() = (o=new(); fillunset(o); o)
end #type CreateSymlinkResponseProto
hash(v::CreateSymlinkResponseProto) = ProtoBuf.protohash(v)
isequal(v1::CreateSymlinkResponseProto, v2::CreateSymlinkResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CreateSymlinkResponseProto, v2::CreateSymlinkResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetLinkTargetRequestProto
    path::AbstractString
    GetLinkTargetRequestProto() = (o=new(); fillunset(o); o)
end #type GetLinkTargetRequestProto
const __req_GetLinkTargetRequestProto = Symbol[:path]
meta(t::Type{GetLinkTargetRequestProto}) = meta(t, __req_GetLinkTargetRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetLinkTargetRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetLinkTargetRequestProto, v2::GetLinkTargetRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetLinkTargetRequestProto, v2::GetLinkTargetRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetLinkTargetResponseProto
    targetPath::AbstractString
    GetLinkTargetResponseProto() = (o=new(); fillunset(o); o)
end #type GetLinkTargetResponseProto
hash(v::GetLinkTargetResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetLinkTargetResponseProto, v2::GetLinkTargetResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetLinkTargetResponseProto, v2::GetLinkTargetResponseProto) = ProtoBuf.protoeq(v1, v2)

type UpdateBlockForPipelineRequestProto
    block::ExtendedBlockProto
    clientName::AbstractString
    UpdateBlockForPipelineRequestProto() = (o=new(); fillunset(o); o)
end #type UpdateBlockForPipelineRequestProto
const __req_UpdateBlockForPipelineRequestProto = Symbol[:block,:clientName]
meta(t::Type{UpdateBlockForPipelineRequestProto}) = meta(t, __req_UpdateBlockForPipelineRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::UpdateBlockForPipelineRequestProto) = ProtoBuf.protohash(v)
isequal(v1::UpdateBlockForPipelineRequestProto, v2::UpdateBlockForPipelineRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::UpdateBlockForPipelineRequestProto, v2::UpdateBlockForPipelineRequestProto) = ProtoBuf.protoeq(v1, v2)

type UpdateBlockForPipelineResponseProto
    block::LocatedBlockProto
    UpdateBlockForPipelineResponseProto() = (o=new(); fillunset(o); o)
end #type UpdateBlockForPipelineResponseProto
const __req_UpdateBlockForPipelineResponseProto = Symbol[:block]
meta(t::Type{UpdateBlockForPipelineResponseProto}) = meta(t, __req_UpdateBlockForPipelineResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::UpdateBlockForPipelineResponseProto) = ProtoBuf.protohash(v)
isequal(v1::UpdateBlockForPipelineResponseProto, v2::UpdateBlockForPipelineResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::UpdateBlockForPipelineResponseProto, v2::UpdateBlockForPipelineResponseProto) = ProtoBuf.protoeq(v1, v2)

type UpdatePipelineRequestProto
    clientName::AbstractString
    oldBlock::ExtendedBlockProto
    newBlock::ExtendedBlockProto
    newNodes::Array{DatanodeIDProto,1}
    storageIDs::Array{AbstractString,1}
    UpdatePipelineRequestProto() = (o=new(); fillunset(o); o)
end #type UpdatePipelineRequestProto
const __req_UpdatePipelineRequestProto = Symbol[:clientName,:oldBlock,:newBlock]
meta(t::Type{UpdatePipelineRequestProto}) = meta(t, __req_UpdatePipelineRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::UpdatePipelineRequestProto) = ProtoBuf.protohash(v)
isequal(v1::UpdatePipelineRequestProto, v2::UpdatePipelineRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::UpdatePipelineRequestProto, v2::UpdatePipelineRequestProto) = ProtoBuf.protoeq(v1, v2)

type UpdatePipelineResponseProto
    UpdatePipelineResponseProto() = (o=new(); fillunset(o); o)
end #type UpdatePipelineResponseProto
hash(v::UpdatePipelineResponseProto) = ProtoBuf.protohash(v)
isequal(v1::UpdatePipelineResponseProto, v2::UpdatePipelineResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::UpdatePipelineResponseProto, v2::UpdatePipelineResponseProto) = ProtoBuf.protoeq(v1, v2)

type SetBalancerBandwidthRequestProto
    bandwidth::Int64
    SetBalancerBandwidthRequestProto() = (o=new(); fillunset(o); o)
end #type SetBalancerBandwidthRequestProto
const __req_SetBalancerBandwidthRequestProto = Symbol[:bandwidth]
meta(t::Type{SetBalancerBandwidthRequestProto}) = meta(t, __req_SetBalancerBandwidthRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::SetBalancerBandwidthRequestProto) = ProtoBuf.protohash(v)
isequal(v1::SetBalancerBandwidthRequestProto, v2::SetBalancerBandwidthRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetBalancerBandwidthRequestProto, v2::SetBalancerBandwidthRequestProto) = ProtoBuf.protoeq(v1, v2)

type SetBalancerBandwidthResponseProto
    SetBalancerBandwidthResponseProto() = (o=new(); fillunset(o); o)
end #type SetBalancerBandwidthResponseProto
hash(v::SetBalancerBandwidthResponseProto) = ProtoBuf.protohash(v)
isequal(v1::SetBalancerBandwidthResponseProto, v2::SetBalancerBandwidthResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetBalancerBandwidthResponseProto, v2::SetBalancerBandwidthResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetDataEncryptionKeyRequestProto
    GetDataEncryptionKeyRequestProto() = (o=new(); fillunset(o); o)
end #type GetDataEncryptionKeyRequestProto
hash(v::GetDataEncryptionKeyRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetDataEncryptionKeyRequestProto, v2::GetDataEncryptionKeyRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetDataEncryptionKeyRequestProto, v2::GetDataEncryptionKeyRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetDataEncryptionKeyResponseProto
    dataEncryptionKey::DataEncryptionKeyProto
    GetDataEncryptionKeyResponseProto() = (o=new(); fillunset(o); o)
end #type GetDataEncryptionKeyResponseProto
hash(v::GetDataEncryptionKeyResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetDataEncryptionKeyResponseProto, v2::GetDataEncryptionKeyResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetDataEncryptionKeyResponseProto, v2::GetDataEncryptionKeyResponseProto) = ProtoBuf.protoeq(v1, v2)

type CreateSnapshotRequestProto
    snapshotRoot::AbstractString
    snapshotName::AbstractString
    CreateSnapshotRequestProto() = (o=new(); fillunset(o); o)
end #type CreateSnapshotRequestProto
const __req_CreateSnapshotRequestProto = Symbol[:snapshotRoot]
meta(t::Type{CreateSnapshotRequestProto}) = meta(t, __req_CreateSnapshotRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CreateSnapshotRequestProto) = ProtoBuf.protohash(v)
isequal(v1::CreateSnapshotRequestProto, v2::CreateSnapshotRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CreateSnapshotRequestProto, v2::CreateSnapshotRequestProto) = ProtoBuf.protoeq(v1, v2)

type CreateSnapshotResponseProto
    snapshotPath::AbstractString
    CreateSnapshotResponseProto() = (o=new(); fillunset(o); o)
end #type CreateSnapshotResponseProto
const __req_CreateSnapshotResponseProto = Symbol[:snapshotPath]
meta(t::Type{CreateSnapshotResponseProto}) = meta(t, __req_CreateSnapshotResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CreateSnapshotResponseProto) = ProtoBuf.protohash(v)
isequal(v1::CreateSnapshotResponseProto, v2::CreateSnapshotResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CreateSnapshotResponseProto, v2::CreateSnapshotResponseProto) = ProtoBuf.protoeq(v1, v2)

type RenameSnapshotRequestProto
    snapshotRoot::AbstractString
    snapshotOldName::AbstractString
    snapshotNewName::AbstractString
    RenameSnapshotRequestProto() = (o=new(); fillunset(o); o)
end #type RenameSnapshotRequestProto
const __req_RenameSnapshotRequestProto = Symbol[:snapshotRoot,:snapshotOldName,:snapshotNewName]
meta(t::Type{RenameSnapshotRequestProto}) = meta(t, __req_RenameSnapshotRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RenameSnapshotRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RenameSnapshotRequestProto, v2::RenameSnapshotRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RenameSnapshotRequestProto, v2::RenameSnapshotRequestProto) = ProtoBuf.protoeq(v1, v2)

type RenameSnapshotResponseProto
    RenameSnapshotResponseProto() = (o=new(); fillunset(o); o)
end #type RenameSnapshotResponseProto
hash(v::RenameSnapshotResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RenameSnapshotResponseProto, v2::RenameSnapshotResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RenameSnapshotResponseProto, v2::RenameSnapshotResponseProto) = ProtoBuf.protoeq(v1, v2)

type AllowSnapshotRequestProto
    snapshotRoot::AbstractString
    AllowSnapshotRequestProto() = (o=new(); fillunset(o); o)
end #type AllowSnapshotRequestProto
const __req_AllowSnapshotRequestProto = Symbol[:snapshotRoot]
meta(t::Type{AllowSnapshotRequestProto}) = meta(t, __req_AllowSnapshotRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::AllowSnapshotRequestProto) = ProtoBuf.protohash(v)
isequal(v1::AllowSnapshotRequestProto, v2::AllowSnapshotRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AllowSnapshotRequestProto, v2::AllowSnapshotRequestProto) = ProtoBuf.protoeq(v1, v2)

type AllowSnapshotResponseProto
    AllowSnapshotResponseProto() = (o=new(); fillunset(o); o)
end #type AllowSnapshotResponseProto
hash(v::AllowSnapshotResponseProto) = ProtoBuf.protohash(v)
isequal(v1::AllowSnapshotResponseProto, v2::AllowSnapshotResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AllowSnapshotResponseProto, v2::AllowSnapshotResponseProto) = ProtoBuf.protoeq(v1, v2)

type DisallowSnapshotRequestProto
    snapshotRoot::AbstractString
    DisallowSnapshotRequestProto() = (o=new(); fillunset(o); o)
end #type DisallowSnapshotRequestProto
const __req_DisallowSnapshotRequestProto = Symbol[:snapshotRoot]
meta(t::Type{DisallowSnapshotRequestProto}) = meta(t, __req_DisallowSnapshotRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::DisallowSnapshotRequestProto) = ProtoBuf.protohash(v)
isequal(v1::DisallowSnapshotRequestProto, v2::DisallowSnapshotRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::DisallowSnapshotRequestProto, v2::DisallowSnapshotRequestProto) = ProtoBuf.protoeq(v1, v2)

type DisallowSnapshotResponseProto
    DisallowSnapshotResponseProto() = (o=new(); fillunset(o); o)
end #type DisallowSnapshotResponseProto
hash(v::DisallowSnapshotResponseProto) = ProtoBuf.protohash(v)
isequal(v1::DisallowSnapshotResponseProto, v2::DisallowSnapshotResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::DisallowSnapshotResponseProto, v2::DisallowSnapshotResponseProto) = ProtoBuf.protoeq(v1, v2)

type DeleteSnapshotRequestProto
    snapshotRoot::AbstractString
    snapshotName::AbstractString
    DeleteSnapshotRequestProto() = (o=new(); fillunset(o); o)
end #type DeleteSnapshotRequestProto
const __req_DeleteSnapshotRequestProto = Symbol[:snapshotRoot,:snapshotName]
meta(t::Type{DeleteSnapshotRequestProto}) = meta(t, __req_DeleteSnapshotRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::DeleteSnapshotRequestProto) = ProtoBuf.protohash(v)
isequal(v1::DeleteSnapshotRequestProto, v2::DeleteSnapshotRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::DeleteSnapshotRequestProto, v2::DeleteSnapshotRequestProto) = ProtoBuf.protoeq(v1, v2)

type DeleteSnapshotResponseProto
    DeleteSnapshotResponseProto() = (o=new(); fillunset(o); o)
end #type DeleteSnapshotResponseProto
hash(v::DeleteSnapshotResponseProto) = ProtoBuf.protohash(v)
isequal(v1::DeleteSnapshotResponseProto, v2::DeleteSnapshotResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::DeleteSnapshotResponseProto, v2::DeleteSnapshotResponseProto) = ProtoBuf.protoeq(v1, v2)

type CheckAccessRequestProto
    path::AbstractString
    mode::Int32
    CheckAccessRequestProto() = (o=new(); fillunset(o); o)
end #type CheckAccessRequestProto
const __req_CheckAccessRequestProto = Symbol[:path,:mode]
meta(t::Type{CheckAccessRequestProto}) = meta(t, __req_CheckAccessRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CheckAccessRequestProto) = ProtoBuf.protohash(v)
isequal(v1::CheckAccessRequestProto, v2::CheckAccessRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CheckAccessRequestProto, v2::CheckAccessRequestProto) = ProtoBuf.protoeq(v1, v2)

type CheckAccessResponseProto
    CheckAccessResponseProto() = (o=new(); fillunset(o); o)
end #type CheckAccessResponseProto
hash(v::CheckAccessResponseProto) = ProtoBuf.protohash(v)
isequal(v1::CheckAccessResponseProto, v2::CheckAccessResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CheckAccessResponseProto, v2::CheckAccessResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetCurrentEditLogTxidRequestProto
    GetCurrentEditLogTxidRequestProto() = (o=new(); fillunset(o); o)
end #type GetCurrentEditLogTxidRequestProto
hash(v::GetCurrentEditLogTxidRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetCurrentEditLogTxidRequestProto, v2::GetCurrentEditLogTxidRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetCurrentEditLogTxidRequestProto, v2::GetCurrentEditLogTxidRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetCurrentEditLogTxidResponseProto
    txid::Int64
    GetCurrentEditLogTxidResponseProto() = (o=new(); fillunset(o); o)
end #type GetCurrentEditLogTxidResponseProto
const __req_GetCurrentEditLogTxidResponseProto = Symbol[:txid]
meta(t::Type{GetCurrentEditLogTxidResponseProto}) = meta(t, __req_GetCurrentEditLogTxidResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetCurrentEditLogTxidResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetCurrentEditLogTxidResponseProto, v2::GetCurrentEditLogTxidResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetCurrentEditLogTxidResponseProto, v2::GetCurrentEditLogTxidResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetEditsFromTxidRequestProto
    txid::Int64
    GetEditsFromTxidRequestProto() = (o=new(); fillunset(o); o)
end #type GetEditsFromTxidRequestProto
const __req_GetEditsFromTxidRequestProto = Symbol[:txid]
meta(t::Type{GetEditsFromTxidRequestProto}) = meta(t, __req_GetEditsFromTxidRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetEditsFromTxidRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetEditsFromTxidRequestProto, v2::GetEditsFromTxidRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetEditsFromTxidRequestProto, v2::GetEditsFromTxidRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetEditsFromTxidResponseProto
    eventsList::EventsListProto
    GetEditsFromTxidResponseProto() = (o=new(); fillunset(o); o)
end #type GetEditsFromTxidResponseProto
const __req_GetEditsFromTxidResponseProto = Symbol[:eventsList]
meta(t::Type{GetEditsFromTxidResponseProto}) = meta(t, __req_GetEditsFromTxidResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetEditsFromTxidResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetEditsFromTxidResponseProto, v2::GetEditsFromTxidResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetEditsFromTxidResponseProto, v2::GetEditsFromTxidResponseProto) = ProtoBuf.protoeq(v1, v2)

# service methods for ClientNamenodeProtocol
const _ClientNamenodeProtocol_methods = MethodDescriptor[
        MethodDescriptor("getBlockLocations", 1, GetBlockLocationsRequestProto, GetBlockLocationsResponseProto),
        MethodDescriptor("getServerDefaults", 2, GetServerDefaultsRequestProto, GetServerDefaultsResponseProto),
        MethodDescriptor("create", 3, CreateRequestProto, CreateResponseProto),
        MethodDescriptor("append", 4, AppendRequestProto, AppendResponseProto),
        MethodDescriptor("setReplication", 5, SetReplicationRequestProto, SetReplicationResponseProto),
        MethodDescriptor("setStoragePolicy", 6, SetStoragePolicyRequestProto, SetStoragePolicyResponseProto),
        MethodDescriptor("getStoragePolicies", 7, GetStoragePoliciesRequestProto, GetStoragePoliciesResponseProto),
        MethodDescriptor("setPermission", 8, SetPermissionRequestProto, SetPermissionResponseProto),
        MethodDescriptor("setOwner", 9, SetOwnerRequestProto, SetOwnerResponseProto),
        MethodDescriptor("abandonBlock", 10, AbandonBlockRequestProto, AbandonBlockResponseProto),
        MethodDescriptor("addBlock", 11, AddBlockRequestProto, AddBlockResponseProto),
        MethodDescriptor("getAdditionalDatanode", 12, GetAdditionalDatanodeRequestProto, GetAdditionalDatanodeResponseProto),
        MethodDescriptor("complete", 13, CompleteRequestProto, CompleteResponseProto),
        MethodDescriptor("reportBadBlocks", 14, ReportBadBlocksRequestProto, ReportBadBlocksResponseProto),
        MethodDescriptor("concat", 15, ConcatRequestProto, ConcatResponseProto),
        MethodDescriptor("truncate", 16, TruncateRequestProto, TruncateResponseProto),
        MethodDescriptor("rename", 17, RenameRequestProto, RenameResponseProto),
        MethodDescriptor("rename2", 18, Rename2RequestProto, Rename2ResponseProto),
        MethodDescriptor("delete", 19, DeleteRequestProto, DeleteResponseProto),
        MethodDescriptor("mkdirs", 20, MkdirsRequestProto, MkdirsResponseProto),
        MethodDescriptor("getListing", 21, GetListingRequestProto, GetListingResponseProto),
        MethodDescriptor("renewLease", 22, RenewLeaseRequestProto, RenewLeaseResponseProto),
        MethodDescriptor("recoverLease", 23, RecoverLeaseRequestProto, RecoverLeaseResponseProto),
        MethodDescriptor("getFsStats", 24, GetFsStatusRequestProto, GetFsStatsResponseProto),
        MethodDescriptor("getDatanodeReport", 25, GetDatanodeReportRequestProto, GetDatanodeReportResponseProto),
        MethodDescriptor("getDatanodeStorageReport", 26, GetDatanodeStorageReportRequestProto, GetDatanodeStorageReportResponseProto),
        MethodDescriptor("getPreferredBlockSize", 27, GetPreferredBlockSizeRequestProto, GetPreferredBlockSizeResponseProto),
        MethodDescriptor("setSafeMode", 28, SetSafeModeRequestProto, SetSafeModeResponseProto),
        MethodDescriptor("saveNamespace", 29, SaveNamespaceRequestProto, SaveNamespaceResponseProto),
        MethodDescriptor("rollEdits", 30, RollEditsRequestProto, RollEditsResponseProto),
        MethodDescriptor("restoreFailedStorage", 31, RestoreFailedStorageRequestProto, RestoreFailedStorageResponseProto),
        MethodDescriptor("refreshNodes", 32, RefreshNodesRequestProto, RefreshNodesResponseProto),
        MethodDescriptor("finalizeUpgrade", 33, FinalizeUpgradeRequestProto, FinalizeUpgradeResponseProto),
        MethodDescriptor("rollingUpgrade", 34, RollingUpgradeRequestProto, RollingUpgradeResponseProto),
        MethodDescriptor("listCorruptFileBlocks", 35, ListCorruptFileBlocksRequestProto, ListCorruptFileBlocksResponseProto),
        MethodDescriptor("metaSave", 36, MetaSaveRequestProto, MetaSaveResponseProto),
        MethodDescriptor("getFileInfo", 37, GetFileInfoRequestProto, GetFileInfoResponseProto),
        MethodDescriptor("addCacheDirective", 38, AddCacheDirectiveRequestProto, AddCacheDirectiveResponseProto),
        MethodDescriptor("modifyCacheDirective", 39, ModifyCacheDirectiveRequestProto, ModifyCacheDirectiveResponseProto),
        MethodDescriptor("removeCacheDirective", 40, RemoveCacheDirectiveRequestProto, RemoveCacheDirectiveResponseProto),
        MethodDescriptor("listCacheDirectives", 41, ListCacheDirectivesRequestProto, ListCacheDirectivesResponseProto),
        MethodDescriptor("addCachePool", 42, AddCachePoolRequestProto, AddCachePoolResponseProto),
        MethodDescriptor("modifyCachePool", 43, ModifyCachePoolRequestProto, ModifyCachePoolResponseProto),
        MethodDescriptor("removeCachePool", 44, RemoveCachePoolRequestProto, RemoveCachePoolResponseProto),
        MethodDescriptor("listCachePools", 45, ListCachePoolsRequestProto, ListCachePoolsResponseProto),
        MethodDescriptor("getFileLinkInfo", 46, GetFileLinkInfoRequestProto, GetFileLinkInfoResponseProto),
        MethodDescriptor("getContentSummary", 47, GetContentSummaryRequestProto, GetContentSummaryResponseProto),
        MethodDescriptor("setQuota", 48, SetQuotaRequestProto, SetQuotaResponseProto),
        MethodDescriptor("fsync", 49, FsyncRequestProto, FsyncResponseProto),
        MethodDescriptor("setTimes", 50, SetTimesRequestProto, SetTimesResponseProto),
        MethodDescriptor("createSymlink", 51, CreateSymlinkRequestProto, CreateSymlinkResponseProto),
        MethodDescriptor("getLinkTarget", 52, GetLinkTargetRequestProto, GetLinkTargetResponseProto),
        MethodDescriptor("updateBlockForPipeline", 53, UpdateBlockForPipelineRequestProto, UpdateBlockForPipelineResponseProto),
        MethodDescriptor("updatePipeline", 54, UpdatePipelineRequestProto, UpdatePipelineResponseProto),
        MethodDescriptor("getDelegationToken", 55, GetDelegationTokenRequestProto, GetDelegationTokenResponseProto),
        MethodDescriptor("renewDelegationToken", 56, RenewDelegationTokenRequestProto, RenewDelegationTokenResponseProto),
        MethodDescriptor("cancelDelegationToken", 57, CancelDelegationTokenRequestProto, CancelDelegationTokenResponseProto),
        MethodDescriptor("setBalancerBandwidth", 58, SetBalancerBandwidthRequestProto, SetBalancerBandwidthResponseProto),
        MethodDescriptor("getDataEncryptionKey", 59, GetDataEncryptionKeyRequestProto, GetDataEncryptionKeyResponseProto),
        MethodDescriptor("createSnapshot", 60, CreateSnapshotRequestProto, CreateSnapshotResponseProto),
        MethodDescriptor("renameSnapshot", 61, RenameSnapshotRequestProto, RenameSnapshotResponseProto),
        MethodDescriptor("allowSnapshot", 62, AllowSnapshotRequestProto, AllowSnapshotResponseProto),
        MethodDescriptor("disallowSnapshot", 63, DisallowSnapshotRequestProto, DisallowSnapshotResponseProto),
        MethodDescriptor("getSnapshottableDirListing", 64, GetSnapshottableDirListingRequestProto, GetSnapshottableDirListingResponseProto),
        MethodDescriptor("deleteSnapshot", 65, DeleteSnapshotRequestProto, DeleteSnapshotResponseProto),
        MethodDescriptor("getSnapshotDiffReport", 66, GetSnapshotDiffReportRequestProto, GetSnapshotDiffReportResponseProto),
        MethodDescriptor("isFileClosed", 67, IsFileClosedRequestProto, IsFileClosedResponseProto),
        MethodDescriptor("modifyAclEntries", 68, ModifyAclEntriesRequestProto, ModifyAclEntriesResponseProto),
        MethodDescriptor("removeAclEntries", 69, RemoveAclEntriesRequestProto, RemoveAclEntriesResponseProto),
        MethodDescriptor("removeDefaultAcl", 70, RemoveDefaultAclRequestProto, RemoveDefaultAclResponseProto),
        MethodDescriptor("removeAcl", 71, RemoveAclRequestProto, RemoveAclResponseProto),
        MethodDescriptor("setAcl", 72, SetAclRequestProto, SetAclResponseProto),
        MethodDescriptor("getAclStatus", 73, GetAclStatusRequestProto, GetAclStatusResponseProto),
        MethodDescriptor("setXAttr", 74, SetXAttrRequestProto, SetXAttrResponseProto),
        MethodDescriptor("getXAttrs", 75, GetXAttrsRequestProto, GetXAttrsResponseProto),
        MethodDescriptor("listXAttrs", 76, ListXAttrsRequestProto, ListXAttrsResponseProto),
        MethodDescriptor("removeXAttr", 77, RemoveXAttrRequestProto, RemoveXAttrResponseProto),
        MethodDescriptor("checkAccess", 78, CheckAccessRequestProto, CheckAccessResponseProto),
        MethodDescriptor("createEncryptionZone", 79, CreateEncryptionZoneRequestProto, CreateEncryptionZoneResponseProto),
        MethodDescriptor("listEncryptionZones", 80, ListEncryptionZonesRequestProto, ListEncryptionZonesResponseProto),
        MethodDescriptor("getEZForPath", 81, GetEZForPathRequestProto, GetEZForPathResponseProto),
        MethodDescriptor("getCurrentEditLogTxid", 82, GetCurrentEditLogTxidRequestProto, GetCurrentEditLogTxidResponseProto),
        MethodDescriptor("getEditsFromTxid", 83, GetEditsFromTxidRequestProto, GetEditsFromTxidResponseProto)
    ] # const _ClientNamenodeProtocol_methods
const _ClientNamenodeProtocol_desc = ServiceDescriptor("ClientNamenodeProtocol", 1, _ClientNamenodeProtocol_methods)

ClientNamenodeProtocol(impl::Module) = ProtoService(_ClientNamenodeProtocol_desc, impl)

type ClientNamenodeProtocolStub <: AbstractProtoServiceStub{false}
    impl::ProtoServiceStub
    ClientNamenodeProtocolStub(channel::ProtoRpcChannel) = new(ProtoServiceStub(_ClientNamenodeProtocol_desc, channel))
end # type ClientNamenodeProtocolStub

type ClientNamenodeProtocolBlockingStub <: AbstractProtoServiceStub{true}
    impl::ProtoServiceBlockingStub
    ClientNamenodeProtocolBlockingStub(channel::ProtoRpcChannel) = new(ProtoServiceBlockingStub(_ClientNamenodeProtocol_desc, channel))
end # type ClientNamenodeProtocolBlockingStub

getBlockLocations(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetBlockLocationsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[1], controller, inp, done)
getBlockLocations(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetBlockLocationsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[1], controller, inp)

getServerDefaults(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetServerDefaultsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[2], controller, inp, done)
getServerDefaults(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetServerDefaultsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[2], controller, inp)

create(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::CreateRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[3], controller, inp, done)
create(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::CreateRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[3], controller, inp)

append(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::AppendRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[4], controller, inp, done)
append(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::AppendRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[4], controller, inp)

setReplication(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::SetReplicationRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[5], controller, inp, done)
setReplication(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::SetReplicationRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[5], controller, inp)

setStoragePolicy(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::SetStoragePolicyRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[6], controller, inp, done)
setStoragePolicy(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::SetStoragePolicyRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[6], controller, inp)

getStoragePolicies(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetStoragePoliciesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[7], controller, inp, done)
getStoragePolicies(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetStoragePoliciesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[7], controller, inp)

setPermission(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::SetPermissionRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[8], controller, inp, done)
setPermission(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::SetPermissionRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[8], controller, inp)

setOwner(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::SetOwnerRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[9], controller, inp, done)
setOwner(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::SetOwnerRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[9], controller, inp)

abandonBlock(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::AbandonBlockRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[10], controller, inp, done)
abandonBlock(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::AbandonBlockRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[10], controller, inp)

addBlock(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::AddBlockRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[11], controller, inp, done)
addBlock(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::AddBlockRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[11], controller, inp)

getAdditionalDatanode(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetAdditionalDatanodeRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[12], controller, inp, done)
getAdditionalDatanode(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetAdditionalDatanodeRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[12], controller, inp)

complete(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::CompleteRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[13], controller, inp, done)
complete(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::CompleteRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[13], controller, inp)

reportBadBlocks(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::ReportBadBlocksRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[14], controller, inp, done)
reportBadBlocks(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::ReportBadBlocksRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[14], controller, inp)

concat(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::ConcatRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[15], controller, inp, done)
concat(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::ConcatRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[15], controller, inp)

truncate(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::TruncateRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[16], controller, inp, done)
truncate(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::TruncateRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[16], controller, inp)

rename(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::RenameRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[17], controller, inp, done)
rename(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::RenameRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[17], controller, inp)

rename2(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::Rename2RequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[18], controller, inp, done)
rename2(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::Rename2RequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[18], controller, inp)

delete(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::DeleteRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[19], controller, inp, done)
delete(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::DeleteRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[19], controller, inp)

mkdirs(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::MkdirsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[20], controller, inp, done)
mkdirs(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::MkdirsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[20], controller, inp)

getListing(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetListingRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[21], controller, inp, done)
getListing(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetListingRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[21], controller, inp)

renewLease(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::RenewLeaseRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[22], controller, inp, done)
renewLease(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::RenewLeaseRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[22], controller, inp)

recoverLease(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::RecoverLeaseRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[23], controller, inp, done)
recoverLease(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::RecoverLeaseRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[23], controller, inp)

getFsStats(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetFsStatusRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[24], controller, inp, done)
getFsStats(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetFsStatusRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[24], controller, inp)

getDatanodeReport(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetDatanodeReportRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[25], controller, inp, done)
getDatanodeReport(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetDatanodeReportRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[25], controller, inp)

getDatanodeStorageReport(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetDatanodeStorageReportRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[26], controller, inp, done)
getDatanodeStorageReport(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetDatanodeStorageReportRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[26], controller, inp)

getPreferredBlockSize(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetPreferredBlockSizeRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[27], controller, inp, done)
getPreferredBlockSize(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetPreferredBlockSizeRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[27], controller, inp)

setSafeMode(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::SetSafeModeRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[28], controller, inp, done)
setSafeMode(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::SetSafeModeRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[28], controller, inp)

saveNamespace(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::SaveNamespaceRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[29], controller, inp, done)
saveNamespace(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::SaveNamespaceRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[29], controller, inp)

rollEdits(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::RollEditsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[30], controller, inp, done)
rollEdits(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::RollEditsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[30], controller, inp)

restoreFailedStorage(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::RestoreFailedStorageRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[31], controller, inp, done)
restoreFailedStorage(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::RestoreFailedStorageRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[31], controller, inp)

refreshNodes(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::RefreshNodesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[32], controller, inp, done)
refreshNodes(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::RefreshNodesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[32], controller, inp)

finalizeUpgrade(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::FinalizeUpgradeRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[33], controller, inp, done)
finalizeUpgrade(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::FinalizeUpgradeRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[33], controller, inp)

rollingUpgrade(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::RollingUpgradeRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[34], controller, inp, done)
rollingUpgrade(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::RollingUpgradeRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[34], controller, inp)

listCorruptFileBlocks(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::ListCorruptFileBlocksRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[35], controller, inp, done)
listCorruptFileBlocks(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::ListCorruptFileBlocksRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[35], controller, inp)

metaSave(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::MetaSaveRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[36], controller, inp, done)
metaSave(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::MetaSaveRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[36], controller, inp)

getFileInfo(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetFileInfoRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[37], controller, inp, done)
getFileInfo(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetFileInfoRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[37], controller, inp)

addCacheDirective(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::AddCacheDirectiveRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[38], controller, inp, done)
addCacheDirective(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::AddCacheDirectiveRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[38], controller, inp)

modifyCacheDirective(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::ModifyCacheDirectiveRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[39], controller, inp, done)
modifyCacheDirective(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::ModifyCacheDirectiveRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[39], controller, inp)

removeCacheDirective(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::RemoveCacheDirectiveRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[40], controller, inp, done)
removeCacheDirective(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::RemoveCacheDirectiveRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[40], controller, inp)

listCacheDirectives(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::ListCacheDirectivesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[41], controller, inp, done)
listCacheDirectives(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::ListCacheDirectivesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[41], controller, inp)

addCachePool(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::AddCachePoolRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[42], controller, inp, done)
addCachePool(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::AddCachePoolRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[42], controller, inp)

modifyCachePool(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::ModifyCachePoolRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[43], controller, inp, done)
modifyCachePool(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::ModifyCachePoolRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[43], controller, inp)

removeCachePool(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::RemoveCachePoolRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[44], controller, inp, done)
removeCachePool(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::RemoveCachePoolRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[44], controller, inp)

listCachePools(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::ListCachePoolsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[45], controller, inp, done)
listCachePools(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::ListCachePoolsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[45], controller, inp)

getFileLinkInfo(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetFileLinkInfoRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[46], controller, inp, done)
getFileLinkInfo(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetFileLinkInfoRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[46], controller, inp)

getContentSummary(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetContentSummaryRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[47], controller, inp, done)
getContentSummary(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetContentSummaryRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[47], controller, inp)

setQuota(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::SetQuotaRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[48], controller, inp, done)
setQuota(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::SetQuotaRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[48], controller, inp)

fsync(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::FsyncRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[49], controller, inp, done)
fsync(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::FsyncRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[49], controller, inp)

setTimes(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::SetTimesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[50], controller, inp, done)
setTimes(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::SetTimesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[50], controller, inp)

createSymlink(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::CreateSymlinkRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[51], controller, inp, done)
createSymlink(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::CreateSymlinkRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[51], controller, inp)

getLinkTarget(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetLinkTargetRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[52], controller, inp, done)
getLinkTarget(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetLinkTargetRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[52], controller, inp)

updateBlockForPipeline(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::UpdateBlockForPipelineRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[53], controller, inp, done)
updateBlockForPipeline(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::UpdateBlockForPipelineRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[53], controller, inp)

updatePipeline(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::UpdatePipelineRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[54], controller, inp, done)
updatePipeline(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::UpdatePipelineRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[54], controller, inp)

getDelegationToken(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[55], controller, inp, done)
getDelegationToken(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetDelegationTokenRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[55], controller, inp)

renewDelegationToken(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::RenewDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[56], controller, inp, done)
renewDelegationToken(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::RenewDelegationTokenRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[56], controller, inp)

cancelDelegationToken(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::CancelDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[57], controller, inp, done)
cancelDelegationToken(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::CancelDelegationTokenRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[57], controller, inp)

setBalancerBandwidth(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::SetBalancerBandwidthRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[58], controller, inp, done)
setBalancerBandwidth(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::SetBalancerBandwidthRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[58], controller, inp)

getDataEncryptionKey(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetDataEncryptionKeyRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[59], controller, inp, done)
getDataEncryptionKey(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetDataEncryptionKeyRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[59], controller, inp)

createSnapshot(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::CreateSnapshotRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[60], controller, inp, done)
createSnapshot(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::CreateSnapshotRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[60], controller, inp)

renameSnapshot(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::RenameSnapshotRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[61], controller, inp, done)
renameSnapshot(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::RenameSnapshotRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[61], controller, inp)

allowSnapshot(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::AllowSnapshotRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[62], controller, inp, done)
allowSnapshot(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::AllowSnapshotRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[62], controller, inp)

disallowSnapshot(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::DisallowSnapshotRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[63], controller, inp, done)
disallowSnapshot(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::DisallowSnapshotRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[63], controller, inp)

getSnapshottableDirListing(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetSnapshottableDirListingRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[64], controller, inp, done)
getSnapshottableDirListing(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetSnapshottableDirListingRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[64], controller, inp)

deleteSnapshot(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::DeleteSnapshotRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[65], controller, inp, done)
deleteSnapshot(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::DeleteSnapshotRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[65], controller, inp)

getSnapshotDiffReport(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetSnapshotDiffReportRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[66], controller, inp, done)
getSnapshotDiffReport(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetSnapshotDiffReportRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[66], controller, inp)

isFileClosed(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::IsFileClosedRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[67], controller, inp, done)
isFileClosed(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::IsFileClosedRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[67], controller, inp)

modifyAclEntries(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::ModifyAclEntriesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[68], controller, inp, done)
modifyAclEntries(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::ModifyAclEntriesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[68], controller, inp)

removeAclEntries(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::RemoveAclEntriesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[69], controller, inp, done)
removeAclEntries(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::RemoveAclEntriesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[69], controller, inp)

removeDefaultAcl(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::RemoveDefaultAclRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[70], controller, inp, done)
removeDefaultAcl(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::RemoveDefaultAclRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[70], controller, inp)

removeAcl(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::RemoveAclRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[71], controller, inp, done)
removeAcl(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::RemoveAclRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[71], controller, inp)

setAcl(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::SetAclRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[72], controller, inp, done)
setAcl(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::SetAclRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[72], controller, inp)

getAclStatus(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetAclStatusRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[73], controller, inp, done)
getAclStatus(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetAclStatusRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[73], controller, inp)

setXAttr(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::SetXAttrRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[74], controller, inp, done)
setXAttr(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::SetXAttrRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[74], controller, inp)

getXAttrs(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetXAttrsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[75], controller, inp, done)
getXAttrs(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetXAttrsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[75], controller, inp)

listXAttrs(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::ListXAttrsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[76], controller, inp, done)
listXAttrs(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::ListXAttrsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[76], controller, inp)

removeXAttr(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::RemoveXAttrRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[77], controller, inp, done)
removeXAttr(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::RemoveXAttrRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[77], controller, inp)

checkAccess(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::CheckAccessRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[78], controller, inp, done)
checkAccess(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::CheckAccessRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[78], controller, inp)

createEncryptionZone(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::CreateEncryptionZoneRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[79], controller, inp, done)
createEncryptionZone(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::CreateEncryptionZoneRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[79], controller, inp)

listEncryptionZones(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::ListEncryptionZonesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[80], controller, inp, done)
listEncryptionZones(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::ListEncryptionZonesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[80], controller, inp)

getEZForPath(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetEZForPathRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[81], controller, inp, done)
getEZForPath(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetEZForPathRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[81], controller, inp)

getCurrentEditLogTxid(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetCurrentEditLogTxidRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[82], controller, inp, done)
getCurrentEditLogTxid(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetCurrentEditLogTxidRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[82], controller, inp)

getEditsFromTxid(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::GetEditsFromTxidRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[83], controller, inp, done)
getEditsFromTxid(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::GetEditsFromTxidRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[83], controller, inp)

export CreateFlagProto, DatanodeReportTypeProto, SafeModeActionProto, RollingUpgradeActionProto, CacheFlagProto, GetBlockLocationsRequestProto, GetBlockLocationsResponseProto, GetServerDefaultsRequestProto, GetServerDefaultsResponseProto, CreateRequestProto, CreateResponseProto, AppendRequestProto, AppendResponseProto, SetReplicationRequestProto, SetReplicationResponseProto, SetStoragePolicyRequestProto, SetStoragePolicyResponseProto, GetStoragePoliciesRequestProto, GetStoragePoliciesResponseProto, SetPermissionRequestProto, SetPermissionResponseProto, SetOwnerRequestProto, SetOwnerResponseProto, AbandonBlockRequestProto, AbandonBlockResponseProto, AddBlockRequestProto, AddBlockResponseProto, GetAdditionalDatanodeRequestProto, GetAdditionalDatanodeResponseProto, CompleteRequestProto, CompleteResponseProto, ReportBadBlocksRequestProto, ReportBadBlocksResponseProto, ConcatRequestProto, ConcatResponseProto, TruncateRequestProto, TruncateResponseProto, RenameRequestProto, RenameResponseProto, Rename2RequestProto, Rename2ResponseProto, DeleteRequestProto, DeleteResponseProto, MkdirsRequestProto, MkdirsResponseProto, GetListingRequestProto, GetListingResponseProto, GetSnapshottableDirListingRequestProto, GetSnapshottableDirListingResponseProto, GetSnapshotDiffReportRequestProto, GetSnapshotDiffReportResponseProto, RenewLeaseRequestProto, RenewLeaseResponseProto, RecoverLeaseRequestProto, RecoverLeaseResponseProto, GetFsStatusRequestProto, GetFsStatsResponseProto, GetDatanodeReportRequestProto, GetDatanodeReportResponseProto, GetDatanodeStorageReportRequestProto, DatanodeStorageReportProto, GetDatanodeStorageReportResponseProto, GetPreferredBlockSizeRequestProto, GetPreferredBlockSizeResponseProto, SetSafeModeRequestProto, SetSafeModeResponseProto, SaveNamespaceRequestProto, SaveNamespaceResponseProto, RollEditsRequestProto, RollEditsResponseProto, RestoreFailedStorageRequestProto, RestoreFailedStorageResponseProto, RefreshNodesRequestProto, RefreshNodesResponseProto, FinalizeUpgradeRequestProto, FinalizeUpgradeResponseProto, RollingUpgradeRequestProto, RollingUpgradeInfoProto, RollingUpgradeResponseProto, ListCorruptFileBlocksRequestProto, ListCorruptFileBlocksResponseProto, MetaSaveRequestProto, MetaSaveResponseProto, GetFileInfoRequestProto, GetFileInfoResponseProto, IsFileClosedRequestProto, IsFileClosedResponseProto, CacheDirectiveInfoProto, CacheDirectiveInfoExpirationProto, CacheDirectiveStatsProto, AddCacheDirectiveRequestProto, AddCacheDirectiveResponseProto, ModifyCacheDirectiveRequestProto, ModifyCacheDirectiveResponseProto, RemoveCacheDirectiveRequestProto, RemoveCacheDirectiveResponseProto, ListCacheDirectivesRequestProto, CacheDirectiveEntryProto, ListCacheDirectivesResponseProto, CachePoolInfoProto, CachePoolStatsProto, AddCachePoolRequestProto, AddCachePoolResponseProto, ModifyCachePoolRequestProto, ModifyCachePoolResponseProto, RemoveCachePoolRequestProto, RemoveCachePoolResponseProto, ListCachePoolsRequestProto, ListCachePoolsResponseProto, CachePoolEntryProto, GetFileLinkInfoRequestProto, GetFileLinkInfoResponseProto, GetContentSummaryRequestProto, GetContentSummaryResponseProto, SetQuotaRequestProto, SetQuotaResponseProto, FsyncRequestProto, FsyncResponseProto, SetTimesRequestProto, SetTimesResponseProto, CreateSymlinkRequestProto, CreateSymlinkResponseProto, GetLinkTargetRequestProto, GetLinkTargetResponseProto, UpdateBlockForPipelineRequestProto, UpdateBlockForPipelineResponseProto, UpdatePipelineRequestProto, UpdatePipelineResponseProto, SetBalancerBandwidthRequestProto, SetBalancerBandwidthResponseProto, GetDataEncryptionKeyRequestProto, GetDataEncryptionKeyResponseProto, CreateSnapshotRequestProto, CreateSnapshotResponseProto, RenameSnapshotRequestProto, RenameSnapshotResponseProto, AllowSnapshotRequestProto, AllowSnapshotResponseProto, DisallowSnapshotRequestProto, DisallowSnapshotResponseProto, DeleteSnapshotRequestProto, DeleteSnapshotResponseProto, CheckAccessRequestProto, CheckAccessResponseProto, GetCurrentEditLogTxidRequestProto, GetCurrentEditLogTxidResponseProto, GetEditsFromTxidRequestProto, GetEditsFromTxidResponseProto, ClientNamenodeProtocol, ClientNamenodeProtocolStub, ClientNamenodeProtocolBlockingStub, getBlockLocations, getServerDefaults, create, append, setReplication, setStoragePolicy, getStoragePolicies, setPermission, setOwner, abandonBlock, addBlock, getAdditionalDatanode, complete, reportBadBlocks, concat, truncate, rename, rename2, delete, mkdirs, getListing, renewLease, recoverLease, getFsStats, getDatanodeReport, getDatanodeStorageReport, getPreferredBlockSize, setSafeMode, saveNamespace, rollEdits, restoreFailedStorage, refreshNodes, finalizeUpgrade, rollingUpgrade, listCorruptFileBlocks, metaSave, getFileInfo, addCacheDirective, modifyCacheDirective, removeCacheDirective, listCacheDirectives, addCachePool, modifyCachePool, removeCachePool, listCachePools, getFileLinkInfo, getContentSummary, setQuota, fsync, setTimes, createSymlink, getLinkTarget, updateBlockForPipeline, updatePipeline, getDelegationToken, renewDelegationToken, cancelDelegationToken, setBalancerBandwidth, getDataEncryptionKey, createSnapshot, renameSnapshot, allowSnapshot, disallowSnapshot, getSnapshottableDirListing, deleteSnapshot, getSnapshotDiffReport, isFileClosed, modifyAclEntries, removeAclEntries, removeDefaultAcl, removeAcl, setAcl, getAclStatus, setXAttr, getXAttrs, listXAttrs, removeXAttr, checkAccess, createEncryptionZone, listEncryptionZones, getEZForPath, getCurrentEditLogTxid, getEditsFromTxid
