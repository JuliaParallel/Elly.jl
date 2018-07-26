# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta
import ..hadoop

struct __enum_StorageTypeProto <: ProtoEnum
    DISK::Int32
    SSD::Int32
    ARCHIVE::Int32
    RAM_DISK::Int32
    __enum_StorageTypeProto() = new(1,2,3,4)
end #struct __enum_StorageTypeProto
const StorageTypeProto = __enum_StorageTypeProto()

struct __enum_CipherSuiteProto <: ProtoEnum
    UNKNOWN::Int32
    AES_CTR_NOPADDING::Int32
    __enum_CipherSuiteProto() = new(1,2)
end #struct __enum_CipherSuiteProto
const CipherSuiteProto = __enum_CipherSuiteProto()

struct __enum_CryptoProtocolVersionProto <: ProtoEnum
    UNKNOWN_PROTOCOL_VERSION::Int32
    ENCRYPTION_ZONES::Int32
    __enum_CryptoProtocolVersionProto() = new(1,2)
end #struct __enum_CryptoProtocolVersionProto
const CryptoProtocolVersionProto = __enum_CryptoProtocolVersionProto()

struct __enum_ChecksumTypeProto <: ProtoEnum
    CHECKSUM_NULL::Int32
    CHECKSUM_CRC32::Int32
    CHECKSUM_CRC32C::Int32
    __enum_ChecksumTypeProto() = new(0,1,2)
end #struct __enum_ChecksumTypeProto
const ChecksumTypeProto = __enum_ChecksumTypeProto()

struct __enum_ReplicaStateProto <: ProtoEnum
    FINALIZED::Int32
    RBW::Int32
    RWR::Int32
    RUR::Int32
    TEMPORARY::Int32
    __enum_ReplicaStateProto() = new(0,1,2,3,4)
end #struct __enum_ReplicaStateProto
const ReplicaStateProto = __enum_ReplicaStateProto()

mutable struct ExtendedBlockProto <: ProtoType
    poolId::AbstractString
    blockId::UInt64
    generationStamp::UInt64
    numBytes::UInt64
    ExtendedBlockProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ExtendedBlockProto
const __req_ExtendedBlockProto = Symbol[:poolId,:blockId,:generationStamp]
const __val_ExtendedBlockProto = Dict(:numBytes => 0)
meta(t::Type{ExtendedBlockProto}) = meta(t, __req_ExtendedBlockProto, ProtoBuf.DEF_FNUM, __val_ExtendedBlockProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct DatanodeIDProto <: ProtoType
    ipAddr::AbstractString
    hostName::AbstractString
    datanodeUuid::AbstractString
    xferPort::UInt32
    infoPort::UInt32
    ipcPort::UInt32
    infoSecurePort::UInt32
    DatanodeIDProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DatanodeIDProto
const __req_DatanodeIDProto = Symbol[:ipAddr,:hostName,:datanodeUuid,:xferPort,:infoPort,:ipcPort]
const __val_DatanodeIDProto = Dict(:infoSecurePort => 0)
meta(t::Type{DatanodeIDProto}) = meta(t, __req_DatanodeIDProto, ProtoBuf.DEF_FNUM, __val_DatanodeIDProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct DatanodeLocalInfoProto <: ProtoType
    softwareVersion::AbstractString
    configVersion::AbstractString
    uptime::UInt64
    DatanodeLocalInfoProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DatanodeLocalInfoProto
const __req_DatanodeLocalInfoProto = Symbol[:softwareVersion,:configVersion,:uptime]
meta(t::Type{DatanodeLocalInfoProto}) = meta(t, __req_DatanodeLocalInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

struct __enum_DatanodeInfoProto_AdminState <: ProtoEnum
    NORMAL::Int32
    DECOMMISSION_INPROGRESS::Int32
    DECOMMISSIONED::Int32
    __enum_DatanodeInfoProto_AdminState() = new(0,1,2)
end #struct __enum_DatanodeInfoProto_AdminState
const DatanodeInfoProto_AdminState = __enum_DatanodeInfoProto_AdminState()

mutable struct DatanodeInfoProto <: ProtoType
    id::DatanodeIDProto
    capacity::UInt64
    dfsUsed::UInt64
    remaining::UInt64
    blockPoolUsed::UInt64
    lastUpdate::UInt64
    xceiverCount::UInt32
    location::AbstractString
    adminState::Int32
    cacheCapacity::UInt64
    cacheUsed::UInt64
    lastUpdateMonotonic::UInt64
    DatanodeInfoProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DatanodeInfoProto
const __req_DatanodeInfoProto = Symbol[:id]
const __val_DatanodeInfoProto = Dict(:capacity => 0, :dfsUsed => 0, :remaining => 0, :blockPoolUsed => 0, :lastUpdate => 0, :xceiverCount => 0, :adminState => DatanodeInfoProto_AdminState.NORMAL, :cacheCapacity => 0, :cacheUsed => 0, :lastUpdateMonotonic => 0)
const __fnum_DatanodeInfoProto = Int[1,2,3,4,5,6,7,8,10,11,12,13]
meta(t::Type{DatanodeInfoProto}) = meta(t, __req_DatanodeInfoProto, __fnum_DatanodeInfoProto, __val_DatanodeInfoProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct DatanodeInfosProto <: ProtoType
    datanodes::Base.Vector{DatanodeInfoProto}
    DatanodeInfosProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DatanodeInfosProto

struct __enum_DatanodeStorageProto_StorageState <: ProtoEnum
    NORMAL::Int32
    READ_ONLY_SHARED::Int32
    __enum_DatanodeStorageProto_StorageState() = new(0,1)
end #struct __enum_DatanodeStorageProto_StorageState
const DatanodeStorageProto_StorageState = __enum_DatanodeStorageProto_StorageState()

mutable struct DatanodeStorageProto <: ProtoType
    storageUuid::AbstractString
    state::Int32
    storageType::Int32
    DatanodeStorageProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DatanodeStorageProto
const __req_DatanodeStorageProto = Symbol[:storageUuid]
const __val_DatanodeStorageProto = Dict(:state => DatanodeStorageProto_StorageState.NORMAL, :storageType => StorageTypeProto.DISK)
meta(t::Type{DatanodeStorageProto}) = meta(t, __req_DatanodeStorageProto, ProtoBuf.DEF_FNUM, __val_DatanodeStorageProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct StorageReportProto <: ProtoType
    storageUuid::AbstractString
    failed::Bool
    capacity::UInt64
    dfsUsed::UInt64
    remaining::UInt64
    blockPoolUsed::UInt64
    storage::DatanodeStorageProto
    StorageReportProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StorageReportProto
const __req_StorageReportProto = Symbol[:storageUuid]
const __val_StorageReportProto = Dict(:failed => false, :capacity => 0, :dfsUsed => 0, :remaining => 0, :blockPoolUsed => 0)
meta(t::Type{StorageReportProto}) = meta(t, __req_StorageReportProto, ProtoBuf.DEF_FNUM, __val_StorageReportProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct StorageTypeQuotaInfoProto <: ProtoType
    _type::Int32
    quota::UInt64
    consumed::UInt64
    StorageTypeQuotaInfoProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StorageTypeQuotaInfoProto
const __req_StorageTypeQuotaInfoProto = Symbol[:_type,:quota,:consumed]
meta(t::Type{StorageTypeQuotaInfoProto}) = meta(t, __req_StorageTypeQuotaInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct StorageTypeQuotaInfosProto <: ProtoType
    typeQuotaInfo::Base.Vector{StorageTypeQuotaInfoProto}
    StorageTypeQuotaInfosProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StorageTypeQuotaInfosProto

mutable struct ContentSummaryProto <: ProtoType
    length::UInt64
    fileCount::UInt64
    directoryCount::UInt64
    quota::UInt64
    spaceConsumed::UInt64
    spaceQuota::UInt64
    typeQuotaInfos::StorageTypeQuotaInfosProto
    ContentSummaryProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ContentSummaryProto
const __req_ContentSummaryProto = Symbol[:length,:fileCount,:directoryCount,:quota,:spaceConsumed,:spaceQuota]
meta(t::Type{ContentSummaryProto}) = meta(t, __req_ContentSummaryProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CorruptFileBlocksProto <: ProtoType
    files::Base.Vector{AbstractString}
    cookie::AbstractString
    CorruptFileBlocksProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CorruptFileBlocksProto
const __req_CorruptFileBlocksProto = Symbol[:cookie]
meta(t::Type{CorruptFileBlocksProto}) = meta(t, __req_CorruptFileBlocksProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct FsPermissionProto <: ProtoType
    perm::UInt32
    FsPermissionProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FsPermissionProto
const __req_FsPermissionProto = Symbol[:perm]
meta(t::Type{FsPermissionProto}) = meta(t, __req_FsPermissionProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct StorageTypesProto <: ProtoType
    storageTypes::Base.Vector{Int32}
    StorageTypesProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StorageTypesProto

mutable struct BlockStoragePolicyProto <: ProtoType
    policyId::UInt32
    name::AbstractString
    creationPolicy::StorageTypesProto
    creationFallbackPolicy::StorageTypesProto
    replicationFallbackPolicy::StorageTypesProto
    BlockStoragePolicyProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct BlockStoragePolicyProto
const __req_BlockStoragePolicyProto = Symbol[:policyId,:name,:creationPolicy]
meta(t::Type{BlockStoragePolicyProto}) = meta(t, __req_BlockStoragePolicyProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct StorageUuidsProto <: ProtoType
    storageUuids::Base.Vector{AbstractString}
    StorageUuidsProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StorageUuidsProto

mutable struct LocatedBlockProto <: ProtoType
    b::ExtendedBlockProto
    offset::UInt64
    locs::Base.Vector{DatanodeInfoProto}
    corrupt::Bool
    blockToken::hadoop.common.TokenProto
    isCached::Base.Vector{Bool}
    storageTypes::Base.Vector{Int32}
    storageIDs::Base.Vector{AbstractString}
    LocatedBlockProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct LocatedBlockProto
const __req_LocatedBlockProto = Symbol[:b,:offset,:corrupt,:blockToken]
const __pack_LocatedBlockProto = Symbol[:isCached]
meta(t::Type{LocatedBlockProto}) = meta(t, __req_LocatedBlockProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, __pack_LocatedBlockProto, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct DataEncryptionKeyProto <: ProtoType
    keyId::UInt32
    blockPoolId::AbstractString
    nonce::Array{UInt8,1}
    encryptionKey::Array{UInt8,1}
    expiryDate::UInt64
    encryptionAlgorithm::AbstractString
    DataEncryptionKeyProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DataEncryptionKeyProto
const __req_DataEncryptionKeyProto = Symbol[:keyId,:blockPoolId,:nonce,:encryptionKey,:expiryDate]
meta(t::Type{DataEncryptionKeyProto}) = meta(t, __req_DataEncryptionKeyProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct FileEncryptionInfoProto <: ProtoType
    suite::Int32
    cryptoProtocolVersion::Int32
    key::Array{UInt8,1}
    iv::Array{UInt8,1}
    keyName::AbstractString
    ezKeyVersionName::AbstractString
    FileEncryptionInfoProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FileEncryptionInfoProto
const __req_FileEncryptionInfoProto = Symbol[:suite,:cryptoProtocolVersion,:key,:iv,:keyName,:ezKeyVersionName]
meta(t::Type{FileEncryptionInfoProto}) = meta(t, __req_FileEncryptionInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct PerFileEncryptionInfoProto <: ProtoType
    key::Array{UInt8,1}
    iv::Array{UInt8,1}
    ezKeyVersionName::AbstractString
    PerFileEncryptionInfoProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct PerFileEncryptionInfoProto
const __req_PerFileEncryptionInfoProto = Symbol[:key,:iv,:ezKeyVersionName]
meta(t::Type{PerFileEncryptionInfoProto}) = meta(t, __req_PerFileEncryptionInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ZoneEncryptionInfoProto <: ProtoType
    suite::Int32
    cryptoProtocolVersion::Int32
    keyName::AbstractString
    ZoneEncryptionInfoProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ZoneEncryptionInfoProto
const __req_ZoneEncryptionInfoProto = Symbol[:suite,:cryptoProtocolVersion,:keyName]
meta(t::Type{ZoneEncryptionInfoProto}) = meta(t, __req_ZoneEncryptionInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CipherOptionProto <: ProtoType
    suite::Int32
    inKey::Array{UInt8,1}
    inIv::Array{UInt8,1}
    outKey::Array{UInt8,1}
    outIv::Array{UInt8,1}
    CipherOptionProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CipherOptionProto
const __req_CipherOptionProto = Symbol[:suite]
meta(t::Type{CipherOptionProto}) = meta(t, __req_CipherOptionProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct LocatedBlocksProto <: ProtoType
    fileLength::UInt64
    blocks::Base.Vector{LocatedBlockProto}
    underConstruction::Bool
    lastBlock::LocatedBlockProto
    isLastBlockComplete::Bool
    fileEncryptionInfo::FileEncryptionInfoProto
    LocatedBlocksProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct LocatedBlocksProto
const __req_LocatedBlocksProto = Symbol[:fileLength,:underConstruction,:isLastBlockComplete]
meta(t::Type{LocatedBlocksProto}) = meta(t, __req_LocatedBlocksProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

struct __enum_HdfsFileStatusProto_FileType <: ProtoEnum
    IS_DIR::Int32
    IS_FILE::Int32
    IS_SYMLINK::Int32
    __enum_HdfsFileStatusProto_FileType() = new(1,2,3)
end #struct __enum_HdfsFileStatusProto_FileType
const HdfsFileStatusProto_FileType = __enum_HdfsFileStatusProto_FileType()

mutable struct HdfsFileStatusProto <: ProtoType
    fileType::Int32
    path::Array{UInt8,1}
    length::UInt64
    permission::FsPermissionProto
    owner::AbstractString
    group::AbstractString
    modification_time::UInt64
    access_time::UInt64
    symlink::Array{UInt8,1}
    block_replication::UInt32
    blocksize::UInt64
    locations::LocatedBlocksProto
    fileId::UInt64
    childrenNum::Int32
    fileEncryptionInfo::FileEncryptionInfoProto
    storagePolicy::UInt32
    HdfsFileStatusProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct HdfsFileStatusProto
const __req_HdfsFileStatusProto = Symbol[:fileType,:path,:length,:permission,:owner,:group,:modification_time,:access_time]
const __val_HdfsFileStatusProto = Dict(:block_replication => 0, :blocksize => 0, :fileId => 0, :childrenNum => -1, :storagePolicy => 0)
meta(t::Type{HdfsFileStatusProto}) = meta(t, __req_HdfsFileStatusProto, ProtoBuf.DEF_FNUM, __val_HdfsFileStatusProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct FsServerDefaultsProto <: ProtoType
    blockSize::UInt64
    bytesPerChecksum::UInt32
    writePacketSize::UInt32
    replication::UInt32
    fileBufferSize::UInt32
    encryptDataTransfer::Bool
    trashInterval::UInt64
    checksumType::Int32
    FsServerDefaultsProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FsServerDefaultsProto
const __req_FsServerDefaultsProto = Symbol[:blockSize,:bytesPerChecksum,:writePacketSize,:replication,:fileBufferSize]
const __val_FsServerDefaultsProto = Dict(:encryptDataTransfer => false, :trashInterval => 0, :checksumType => ChecksumTypeProto.CHECKSUM_CRC32)
meta(t::Type{FsServerDefaultsProto}) = meta(t, __req_FsServerDefaultsProto, ProtoBuf.DEF_FNUM, __val_FsServerDefaultsProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct DirectoryListingProto <: ProtoType
    partialListing::Base.Vector{HdfsFileStatusProto}
    remainingEntries::UInt32
    DirectoryListingProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DirectoryListingProto
const __req_DirectoryListingProto = Symbol[:remainingEntries]
meta(t::Type{DirectoryListingProto}) = meta(t, __req_DirectoryListingProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SnapshottableDirectoryStatusProto <: ProtoType
    dirStatus::HdfsFileStatusProto
    snapshot_quota::UInt32
    snapshot_number::UInt32
    parent_fullpath::Array{UInt8,1}
    SnapshottableDirectoryStatusProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SnapshottableDirectoryStatusProto
const __req_SnapshottableDirectoryStatusProto = Symbol[:dirStatus,:snapshot_quota,:snapshot_number,:parent_fullpath]
meta(t::Type{SnapshottableDirectoryStatusProto}) = meta(t, __req_SnapshottableDirectoryStatusProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SnapshottableDirectoryListingProto <: ProtoType
    snapshottableDirListing::Base.Vector{SnapshottableDirectoryStatusProto}
    SnapshottableDirectoryListingProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SnapshottableDirectoryListingProto

mutable struct SnapshotDiffReportEntryProto <: ProtoType
    fullpath::Array{UInt8,1}
    modificationLabel::AbstractString
    targetPath::Array{UInt8,1}
    SnapshotDiffReportEntryProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SnapshotDiffReportEntryProto
const __req_SnapshotDiffReportEntryProto = Symbol[:fullpath,:modificationLabel]
meta(t::Type{SnapshotDiffReportEntryProto}) = meta(t, __req_SnapshotDiffReportEntryProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SnapshotDiffReportProto <: ProtoType
    snapshotRoot::AbstractString
    fromSnapshot::AbstractString
    toSnapshot::AbstractString
    diffReportEntries::Base.Vector{SnapshotDiffReportEntryProto}
    SnapshotDiffReportProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SnapshotDiffReportProto
const __req_SnapshotDiffReportProto = Symbol[:snapshotRoot,:fromSnapshot,:toSnapshot]
meta(t::Type{SnapshotDiffReportProto}) = meta(t, __req_SnapshotDiffReportProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct StorageInfoProto <: ProtoType
    layoutVersion::UInt32
    namespceID::UInt32
    clusterID::AbstractString
    cTime::UInt64
    StorageInfoProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StorageInfoProto
const __req_StorageInfoProto = Symbol[:layoutVersion,:namespceID,:clusterID,:cTime]
meta(t::Type{StorageInfoProto}) = meta(t, __req_StorageInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

struct __enum_NamenodeRegistrationProto_NamenodeRoleProto <: ProtoEnum
    NAMENODE::Int32
    BACKUP::Int32
    CHECKPOINT::Int32
    __enum_NamenodeRegistrationProto_NamenodeRoleProto() = new(1,2,3)
end #struct __enum_NamenodeRegistrationProto_NamenodeRoleProto
const NamenodeRegistrationProto_NamenodeRoleProto = __enum_NamenodeRegistrationProto_NamenodeRoleProto()

mutable struct NamenodeRegistrationProto <: ProtoType
    rpcAddress::AbstractString
    httpAddress::AbstractString
    storageInfo::StorageInfoProto
    role::Int32
    NamenodeRegistrationProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct NamenodeRegistrationProto
const __req_NamenodeRegistrationProto = Symbol[:rpcAddress,:httpAddress,:storageInfo]
const __val_NamenodeRegistrationProto = Dict(:role => NamenodeRegistrationProto_NamenodeRoleProto.NAMENODE)
meta(t::Type{NamenodeRegistrationProto}) = meta(t, __req_NamenodeRegistrationProto, ProtoBuf.DEF_FNUM, __val_NamenodeRegistrationProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CheckpointSignatureProto <: ProtoType
    blockPoolId::AbstractString
    mostRecentCheckpointTxId::UInt64
    curSegmentTxId::UInt64
    storageInfo::StorageInfoProto
    CheckpointSignatureProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CheckpointSignatureProto
const __req_CheckpointSignatureProto = Symbol[:blockPoolId,:mostRecentCheckpointTxId,:curSegmentTxId,:storageInfo]
meta(t::Type{CheckpointSignatureProto}) = meta(t, __req_CheckpointSignatureProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CheckpointCommandProto <: ProtoType
    signature::CheckpointSignatureProto
    needToReturnImage::Bool
    CheckpointCommandProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CheckpointCommandProto
const __req_CheckpointCommandProto = Symbol[:signature,:needToReturnImage]
meta(t::Type{CheckpointCommandProto}) = meta(t, __req_CheckpointCommandProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

struct __enum_NamenodeCommandProto_Type <: ProtoEnum
    NamenodeCommand::Int32
    CheckPointCommand::Int32
    __enum_NamenodeCommandProto_Type() = new(0,1)
end #struct __enum_NamenodeCommandProto_Type
const NamenodeCommandProto_Type = __enum_NamenodeCommandProto_Type()

mutable struct NamenodeCommandProto <: ProtoType
    action::UInt32
    _type::Int32
    checkpointCmd::CheckpointCommandProto
    NamenodeCommandProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct NamenodeCommandProto
const __req_NamenodeCommandProto = Symbol[:action,:_type]
meta(t::Type{NamenodeCommandProto}) = meta(t, __req_NamenodeCommandProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct BlockProto <: ProtoType
    blockId::UInt64
    genStamp::UInt64
    numBytes::UInt64
    BlockProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct BlockProto
const __req_BlockProto = Symbol[:blockId,:genStamp]
const __val_BlockProto = Dict(:numBytes => 0)
meta(t::Type{BlockProto}) = meta(t, __req_BlockProto, ProtoBuf.DEF_FNUM, __val_BlockProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct BlockWithLocationsProto <: ProtoType
    block::BlockProto
    datanodeUuids::Base.Vector{AbstractString}
    storageUuids::Base.Vector{AbstractString}
    storageTypes::Base.Vector{Int32}
    BlockWithLocationsProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct BlockWithLocationsProto
const __req_BlockWithLocationsProto = Symbol[:block]
meta(t::Type{BlockWithLocationsProto}) = meta(t, __req_BlockWithLocationsProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct BlocksWithLocationsProto <: ProtoType
    blocks::Base.Vector{BlockWithLocationsProto}
    BlocksWithLocationsProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct BlocksWithLocationsProto

mutable struct RemoteEditLogProto <: ProtoType
    startTxId::UInt64
    endTxId::UInt64
    isInProgress::Bool
    RemoteEditLogProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoteEditLogProto
const __req_RemoteEditLogProto = Symbol[:startTxId,:endTxId]
const __val_RemoteEditLogProto = Dict(:isInProgress => false)
meta(t::Type{RemoteEditLogProto}) = meta(t, __req_RemoteEditLogProto, ProtoBuf.DEF_FNUM, __val_RemoteEditLogProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RemoteEditLogManifestProto <: ProtoType
    logs::Base.Vector{RemoteEditLogProto}
    RemoteEditLogManifestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoteEditLogManifestProto

mutable struct NamespaceInfoProto <: ProtoType
    buildVersion::AbstractString
    unused::UInt32
    blockPoolID::AbstractString
    storageInfo::StorageInfoProto
    softwareVersion::AbstractString
    capabilities::UInt64
    NamespaceInfoProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct NamespaceInfoProto
const __req_NamespaceInfoProto = Symbol[:buildVersion,:unused,:blockPoolID,:storageInfo,:softwareVersion]
const __val_NamespaceInfoProto = Dict(:capabilities => 0)
meta(t::Type{NamespaceInfoProto}) = meta(t, __req_NamespaceInfoProto, ProtoBuf.DEF_FNUM, __val_NamespaceInfoProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct BlockKeyProto <: ProtoType
    keyId::UInt32
    expiryDate::UInt64
    keyBytes::Array{UInt8,1}
    BlockKeyProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct BlockKeyProto
const __req_BlockKeyProto = Symbol[:keyId,:expiryDate]
meta(t::Type{BlockKeyProto}) = meta(t, __req_BlockKeyProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ExportedBlockKeysProto <: ProtoType
    isBlockTokenEnabled::Bool
    keyUpdateInterval::UInt64
    tokenLifeTime::UInt64
    currentKey::BlockKeyProto
    allKeys::Base.Vector{BlockKeyProto}
    ExportedBlockKeysProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ExportedBlockKeysProto
const __req_ExportedBlockKeysProto = Symbol[:isBlockTokenEnabled,:keyUpdateInterval,:tokenLifeTime,:currentKey]
meta(t::Type{ExportedBlockKeysProto}) = meta(t, __req_ExportedBlockKeysProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RecoveringBlockProto <: ProtoType
    newGenStamp::UInt64
    block::LocatedBlockProto
    truncateBlock::BlockProto
    RecoveringBlockProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RecoveringBlockProto
const __req_RecoveringBlockProto = Symbol[:newGenStamp,:block]
meta(t::Type{RecoveringBlockProto}) = meta(t, __req_RecoveringBlockProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct VersionRequestProto <: ProtoType
    VersionRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct VersionRequestProto

mutable struct VersionResponseProto <: ProtoType
    info::NamespaceInfoProto
    VersionResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct VersionResponseProto
const __req_VersionResponseProto = Symbol[:info]
meta(t::Type{VersionResponseProto}) = meta(t, __req_VersionResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SnapshotInfoProto <: ProtoType
    snapshotName::AbstractString
    snapshotRoot::AbstractString
    permission::FsPermissionProto
    owner::AbstractString
    group::AbstractString
    createTime::AbstractString
    SnapshotInfoProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SnapshotInfoProto
const __req_SnapshotInfoProto = Symbol[:snapshotName,:snapshotRoot,:permission,:owner,:group,:createTime]
meta(t::Type{SnapshotInfoProto}) = meta(t, __req_SnapshotInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RollingUpgradeStatusProto <: ProtoType
    blockPoolId::AbstractString
    finalized::Bool
    RollingUpgradeStatusProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RollingUpgradeStatusProto
const __req_RollingUpgradeStatusProto = Symbol[:blockPoolId]
const __val_RollingUpgradeStatusProto = Dict(:finalized => false)
meta(t::Type{RollingUpgradeStatusProto}) = meta(t, __req_RollingUpgradeStatusProto, ProtoBuf.DEF_FNUM, __val_RollingUpgradeStatusProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

export StorageTypeProto, CipherSuiteProto, CryptoProtocolVersionProto, ChecksumTypeProto, ReplicaStateProto, ExtendedBlockProto, DatanodeIDProto, DatanodeLocalInfoProto, DatanodeInfosProto, DatanodeInfoProto_AdminState, DatanodeInfoProto, DatanodeStorageProto_StorageState, DatanodeStorageProto, StorageReportProto, ContentSummaryProto, StorageTypeQuotaInfosProto, StorageTypeQuotaInfoProto, CorruptFileBlocksProto, FsPermissionProto, StorageTypesProto, BlockStoragePolicyProto, StorageUuidsProto, LocatedBlockProto, DataEncryptionKeyProto, FileEncryptionInfoProto, PerFileEncryptionInfoProto, ZoneEncryptionInfoProto, CipherOptionProto, LocatedBlocksProto, HdfsFileStatusProto_FileType, HdfsFileStatusProto, FsServerDefaultsProto, DirectoryListingProto, SnapshottableDirectoryStatusProto, SnapshottableDirectoryListingProto, SnapshotDiffReportEntryProto, SnapshotDiffReportProto, StorageInfoProto, NamenodeRegistrationProto_NamenodeRoleProto, NamenodeRegistrationProto, CheckpointSignatureProto, NamenodeCommandProto_Type, NamenodeCommandProto, CheckpointCommandProto, BlockProto, BlockWithLocationsProto, BlocksWithLocationsProto, RemoteEditLogProto, RemoteEditLogManifestProto, NamespaceInfoProto, BlockKeyProto, ExportedBlockKeysProto, RecoveringBlockProto, VersionRequestProto, VersionResponseProto, SnapshotInfoProto, RollingUpgradeStatusProto
