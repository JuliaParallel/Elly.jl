using ..common
using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

type __enum_StorageTypeProto <: ProtoEnum
    DISK::Int32
    SSD::Int32
    ARCHIVE::Int32
    RAM_DISK::Int32
    __enum_StorageTypeProto() = new(1,2,3,4)
end #type __enum_StorageTypeProto
const StorageTypeProto = __enum_StorageTypeProto()

type __enum_CipherSuiteProto <: ProtoEnum
    UNKNOWN::Int32
    AES_CTR_NOPADDING::Int32
    __enum_CipherSuiteProto() = new(1,2)
end #type __enum_CipherSuiteProto
const CipherSuiteProto = __enum_CipherSuiteProto()

type __enum_CryptoProtocolVersionProto <: ProtoEnum
    UNKNOWN_PROTOCOL_VERSION::Int32
    ENCRYPTION_ZONES::Int32
    __enum_CryptoProtocolVersionProto() = new(1,2)
end #type __enum_CryptoProtocolVersionProto
const CryptoProtocolVersionProto = __enum_CryptoProtocolVersionProto()

type __enum_ChecksumTypeProto <: ProtoEnum
    CHECKSUM_NULL::Int32
    CHECKSUM_CRC32::Int32
    CHECKSUM_CRC32C::Int32
    __enum_ChecksumTypeProto() = new(0,1,2)
end #type __enum_ChecksumTypeProto
const ChecksumTypeProto = __enum_ChecksumTypeProto()

type __enum_ReplicaStateProto <: ProtoEnum
    FINALIZED::Int32
    RBW::Int32
    RWR::Int32
    RUR::Int32
    TEMPORARY::Int32
    __enum_ReplicaStateProto() = new(0,1,2,3,4)
end #type __enum_ReplicaStateProto
const ReplicaStateProto = __enum_ReplicaStateProto()

type ExtendedBlockProto
    poolId::AbstractString
    blockId::UInt64
    generationStamp::UInt64
    numBytes::UInt64
    ExtendedBlockProto() = (o=new(); fillunset(o); o)
end #type ExtendedBlockProto
const __req_ExtendedBlockProto = Symbol[:poolId,:blockId,:generationStamp]
const __val_ExtendedBlockProto = @compat Dict(:numBytes => 0)
meta(t::Type{ExtendedBlockProto}) = meta(t, __req_ExtendedBlockProto, ProtoBuf.DEF_FNUM, __val_ExtendedBlockProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ExtendedBlockProto) = ProtoBuf.protohash(v)
isequal(v1::ExtendedBlockProto, v2::ExtendedBlockProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ExtendedBlockProto, v2::ExtendedBlockProto) = ProtoBuf.protoeq(v1, v2)

type DatanodeIDProto
    ipAddr::AbstractString
    hostName::AbstractString
    datanodeUuid::AbstractString
    xferPort::UInt32
    infoPort::UInt32
    ipcPort::UInt32
    infoSecurePort::UInt32
    DatanodeIDProto() = (o=new(); fillunset(o); o)
end #type DatanodeIDProto
const __req_DatanodeIDProto = Symbol[:ipAddr,:hostName,:datanodeUuid,:xferPort,:infoPort,:ipcPort]
const __val_DatanodeIDProto = @compat Dict(:infoSecurePort => 0)
meta(t::Type{DatanodeIDProto}) = meta(t, __req_DatanodeIDProto, ProtoBuf.DEF_FNUM, __val_DatanodeIDProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::DatanodeIDProto) = ProtoBuf.protohash(v)
isequal(v1::DatanodeIDProto, v2::DatanodeIDProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::DatanodeIDProto, v2::DatanodeIDProto) = ProtoBuf.protoeq(v1, v2)

type DatanodeLocalInfoProto
    softwareVersion::AbstractString
    configVersion::AbstractString
    uptime::UInt64
    DatanodeLocalInfoProto() = (o=new(); fillunset(o); o)
end #type DatanodeLocalInfoProto
const __req_DatanodeLocalInfoProto = Symbol[:softwareVersion,:configVersion,:uptime]
meta(t::Type{DatanodeLocalInfoProto}) = meta(t, __req_DatanodeLocalInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::DatanodeLocalInfoProto) = ProtoBuf.protohash(v)
isequal(v1::DatanodeLocalInfoProto, v2::DatanodeLocalInfoProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::DatanodeLocalInfoProto, v2::DatanodeLocalInfoProto) = ProtoBuf.protoeq(v1, v2)

type __enum_DatanodeInfoProto_AdminState <: ProtoEnum
    NORMAL::Int32
    DECOMMISSION_INPROGRESS::Int32
    DECOMMISSIONED::Int32
    __enum_DatanodeInfoProto_AdminState() = new(0,1,2)
end #type __enum_DatanodeInfoProto_AdminState
const DatanodeInfoProto_AdminState = __enum_DatanodeInfoProto_AdminState()

type DatanodeInfoProto
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
    DatanodeInfoProto() = (o=new(); fillunset(o); o)
end #type DatanodeInfoProto
const __req_DatanodeInfoProto = Symbol[:id]
const __val_DatanodeInfoProto = @compat Dict(:capacity => 0, :dfsUsed => 0, :remaining => 0, :blockPoolUsed => 0, :lastUpdate => 0, :xceiverCount => 0, :adminState => DatanodeInfoProto_AdminState.NORMAL, :cacheCapacity => 0, :cacheUsed => 0, :lastUpdateMonotonic => 0)
const __fnum_DatanodeInfoProto = Int[1,2,3,4,5,6,7,8,10,11,12,13]
meta(t::Type{DatanodeInfoProto}) = meta(t, __req_DatanodeInfoProto, __fnum_DatanodeInfoProto, __val_DatanodeInfoProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::DatanodeInfoProto) = ProtoBuf.protohash(v)
isequal(v1::DatanodeInfoProto, v2::DatanodeInfoProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::DatanodeInfoProto, v2::DatanodeInfoProto) = ProtoBuf.protoeq(v1, v2)

type DatanodeInfosProto
    datanodes::Array{DatanodeInfoProto,1}
    DatanodeInfosProto() = (o=new(); fillunset(o); o)
end #type DatanodeInfosProto
hash(v::DatanodeInfosProto) = ProtoBuf.protohash(v)
isequal(v1::DatanodeInfosProto, v2::DatanodeInfosProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::DatanodeInfosProto, v2::DatanodeInfosProto) = ProtoBuf.protoeq(v1, v2)

type __enum_DatanodeStorageProto_StorageState <: ProtoEnum
    NORMAL::Int32
    READ_ONLY_SHARED::Int32
    __enum_DatanodeStorageProto_StorageState() = new(0,1)
end #type __enum_DatanodeStorageProto_StorageState
const DatanodeStorageProto_StorageState = __enum_DatanodeStorageProto_StorageState()

type DatanodeStorageProto
    storageUuid::AbstractString
    state::Int32
    storageType::Int32
    DatanodeStorageProto() = (o=new(); fillunset(o); o)
end #type DatanodeStorageProto
const __req_DatanodeStorageProto = Symbol[:storageUuid]
const __val_DatanodeStorageProto = @compat Dict(:state => DatanodeStorageProto_StorageState.NORMAL, :storageType => StorageTypeProto.DISK)
meta(t::Type{DatanodeStorageProto}) = meta(t, __req_DatanodeStorageProto, ProtoBuf.DEF_FNUM, __val_DatanodeStorageProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::DatanodeStorageProto) = ProtoBuf.protohash(v)
isequal(v1::DatanodeStorageProto, v2::DatanodeStorageProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::DatanodeStorageProto, v2::DatanodeStorageProto) = ProtoBuf.protoeq(v1, v2)

type StorageReportProto
    storageUuid::AbstractString
    failed::Bool
    capacity::UInt64
    dfsUsed::UInt64
    remaining::UInt64
    blockPoolUsed::UInt64
    storage::DatanodeStorageProto
    StorageReportProto() = (o=new(); fillunset(o); o)
end #type StorageReportProto
const __req_StorageReportProto = Symbol[:storageUuid]
const __val_StorageReportProto = @compat Dict(:failed => false, :capacity => 0, :dfsUsed => 0, :remaining => 0, :blockPoolUsed => 0)
meta(t::Type{StorageReportProto}) = meta(t, __req_StorageReportProto, ProtoBuf.DEF_FNUM, __val_StorageReportProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::StorageReportProto) = ProtoBuf.protohash(v)
isequal(v1::StorageReportProto, v2::StorageReportProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StorageReportProto, v2::StorageReportProto) = ProtoBuf.protoeq(v1, v2)

type StorageTypeQuotaInfoProto
    _type::Int32
    quota::UInt64
    consumed::UInt64
    StorageTypeQuotaInfoProto() = (o=new(); fillunset(o); o)
end #type StorageTypeQuotaInfoProto
const __req_StorageTypeQuotaInfoProto = Symbol[:_type,:quota,:consumed]
meta(t::Type{StorageTypeQuotaInfoProto}) = meta(t, __req_StorageTypeQuotaInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::StorageTypeQuotaInfoProto) = ProtoBuf.protohash(v)
isequal(v1::StorageTypeQuotaInfoProto, v2::StorageTypeQuotaInfoProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StorageTypeQuotaInfoProto, v2::StorageTypeQuotaInfoProto) = ProtoBuf.protoeq(v1, v2)

type StorageTypeQuotaInfosProto
    typeQuotaInfo::Array{StorageTypeQuotaInfoProto,1}
    StorageTypeQuotaInfosProto() = (o=new(); fillunset(o); o)
end #type StorageTypeQuotaInfosProto
hash(v::StorageTypeQuotaInfosProto) = ProtoBuf.protohash(v)
isequal(v1::StorageTypeQuotaInfosProto, v2::StorageTypeQuotaInfosProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StorageTypeQuotaInfosProto, v2::StorageTypeQuotaInfosProto) = ProtoBuf.protoeq(v1, v2)

type ContentSummaryProto
    length::UInt64
    fileCount::UInt64
    directoryCount::UInt64
    quota::UInt64
    spaceConsumed::UInt64
    spaceQuota::UInt64
    typeQuotaInfos::StorageTypeQuotaInfosProto
    ContentSummaryProto() = (o=new(); fillunset(o); o)
end #type ContentSummaryProto
const __req_ContentSummaryProto = Symbol[:length,:fileCount,:directoryCount,:quota,:spaceConsumed,:spaceQuota]
meta(t::Type{ContentSummaryProto}) = meta(t, __req_ContentSummaryProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ContentSummaryProto) = ProtoBuf.protohash(v)
isequal(v1::ContentSummaryProto, v2::ContentSummaryProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ContentSummaryProto, v2::ContentSummaryProto) = ProtoBuf.protoeq(v1, v2)

type CorruptFileBlocksProto
    files::Array{AbstractString,1}
    cookie::AbstractString
    CorruptFileBlocksProto() = (o=new(); fillunset(o); o)
end #type CorruptFileBlocksProto
const __req_CorruptFileBlocksProto = Symbol[:cookie]
meta(t::Type{CorruptFileBlocksProto}) = meta(t, __req_CorruptFileBlocksProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CorruptFileBlocksProto) = ProtoBuf.protohash(v)
isequal(v1::CorruptFileBlocksProto, v2::CorruptFileBlocksProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CorruptFileBlocksProto, v2::CorruptFileBlocksProto) = ProtoBuf.protoeq(v1, v2)

type FsPermissionProto
    perm::UInt32
    FsPermissionProto() = (o=new(); fillunset(o); o)
end #type FsPermissionProto
const __req_FsPermissionProto = Symbol[:perm]
meta(t::Type{FsPermissionProto}) = meta(t, __req_FsPermissionProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::FsPermissionProto) = ProtoBuf.protohash(v)
isequal(v1::FsPermissionProto, v2::FsPermissionProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::FsPermissionProto, v2::FsPermissionProto) = ProtoBuf.protoeq(v1, v2)

type StorageTypesProto
    storageTypes::Array{Int32,1}
    StorageTypesProto() = (o=new(); fillunset(o); o)
end #type StorageTypesProto
hash(v::StorageTypesProto) = ProtoBuf.protohash(v)
isequal(v1::StorageTypesProto, v2::StorageTypesProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StorageTypesProto, v2::StorageTypesProto) = ProtoBuf.protoeq(v1, v2)

type BlockStoragePolicyProto
    policyId::UInt32
    name::AbstractString
    creationPolicy::StorageTypesProto
    creationFallbackPolicy::StorageTypesProto
    replicationFallbackPolicy::StorageTypesProto
    BlockStoragePolicyProto() = (o=new(); fillunset(o); o)
end #type BlockStoragePolicyProto
const __req_BlockStoragePolicyProto = Symbol[:policyId,:name,:creationPolicy]
meta(t::Type{BlockStoragePolicyProto}) = meta(t, __req_BlockStoragePolicyProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::BlockStoragePolicyProto) = ProtoBuf.protohash(v)
isequal(v1::BlockStoragePolicyProto, v2::BlockStoragePolicyProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::BlockStoragePolicyProto, v2::BlockStoragePolicyProto) = ProtoBuf.protoeq(v1, v2)

type StorageUuidsProto
    storageUuids::Array{AbstractString,1}
    StorageUuidsProto() = (o=new(); fillunset(o); o)
end #type StorageUuidsProto
hash(v::StorageUuidsProto) = ProtoBuf.protohash(v)
isequal(v1::StorageUuidsProto, v2::StorageUuidsProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StorageUuidsProto, v2::StorageUuidsProto) = ProtoBuf.protoeq(v1, v2)

type LocatedBlockProto
    b::ExtendedBlockProto
    offset::UInt64
    locs::Array{DatanodeInfoProto,1}
    corrupt::Bool
    blockToken::TokenProto
    isCached::Array{Bool,1}
    storageTypes::Array{Int32,1}
    storageIDs::Array{AbstractString,1}
    LocatedBlockProto() = (o=new(); fillunset(o); o)
end #type LocatedBlockProto
const __req_LocatedBlockProto = Symbol[:b,:offset,:corrupt,:blockToken]
const __pack_LocatedBlockProto = Symbol[:isCached]
meta(t::Type{LocatedBlockProto}) = meta(t, __req_LocatedBlockProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, __pack_LocatedBlockProto, ProtoBuf.DEF_WTYPES)
hash(v::LocatedBlockProto) = ProtoBuf.protohash(v)
isequal(v1::LocatedBlockProto, v2::LocatedBlockProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::LocatedBlockProto, v2::LocatedBlockProto) = ProtoBuf.protoeq(v1, v2)

type DataEncryptionKeyProto
    keyId::UInt32
    blockPoolId::AbstractString
    nonce::Array{UInt8,1}
    encryptionKey::Array{UInt8,1}
    expiryDate::UInt64
    encryptionAlgorithm::AbstractString
    DataEncryptionKeyProto() = (o=new(); fillunset(o); o)
end #type DataEncryptionKeyProto
const __req_DataEncryptionKeyProto = Symbol[:keyId,:blockPoolId,:nonce,:encryptionKey,:expiryDate]
meta(t::Type{DataEncryptionKeyProto}) = meta(t, __req_DataEncryptionKeyProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::DataEncryptionKeyProto) = ProtoBuf.protohash(v)
isequal(v1::DataEncryptionKeyProto, v2::DataEncryptionKeyProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::DataEncryptionKeyProto, v2::DataEncryptionKeyProto) = ProtoBuf.protoeq(v1, v2)

type FileEncryptionInfoProto
    suite::Int32
    cryptoProtocolVersion::Int32
    key::Array{UInt8,1}
    iv::Array{UInt8,1}
    keyName::AbstractString
    ezKeyVersionName::AbstractString
    FileEncryptionInfoProto() = (o=new(); fillunset(o); o)
end #type FileEncryptionInfoProto
const __req_FileEncryptionInfoProto = Symbol[:suite,:cryptoProtocolVersion,:key,:iv,:keyName,:ezKeyVersionName]
meta(t::Type{FileEncryptionInfoProto}) = meta(t, __req_FileEncryptionInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::FileEncryptionInfoProto) = ProtoBuf.protohash(v)
isequal(v1::FileEncryptionInfoProto, v2::FileEncryptionInfoProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::FileEncryptionInfoProto, v2::FileEncryptionInfoProto) = ProtoBuf.protoeq(v1, v2)

type PerFileEncryptionInfoProto
    key::Array{UInt8,1}
    iv::Array{UInt8,1}
    ezKeyVersionName::AbstractString
    PerFileEncryptionInfoProto() = (o=new(); fillunset(o); o)
end #type PerFileEncryptionInfoProto
const __req_PerFileEncryptionInfoProto = Symbol[:key,:iv,:ezKeyVersionName]
meta(t::Type{PerFileEncryptionInfoProto}) = meta(t, __req_PerFileEncryptionInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::PerFileEncryptionInfoProto) = ProtoBuf.protohash(v)
isequal(v1::PerFileEncryptionInfoProto, v2::PerFileEncryptionInfoProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::PerFileEncryptionInfoProto, v2::PerFileEncryptionInfoProto) = ProtoBuf.protoeq(v1, v2)

type ZoneEncryptionInfoProto
    suite::Int32
    cryptoProtocolVersion::Int32
    keyName::AbstractString
    ZoneEncryptionInfoProto() = (o=new(); fillunset(o); o)
end #type ZoneEncryptionInfoProto
const __req_ZoneEncryptionInfoProto = Symbol[:suite,:cryptoProtocolVersion,:keyName]
meta(t::Type{ZoneEncryptionInfoProto}) = meta(t, __req_ZoneEncryptionInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ZoneEncryptionInfoProto) = ProtoBuf.protohash(v)
isequal(v1::ZoneEncryptionInfoProto, v2::ZoneEncryptionInfoProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ZoneEncryptionInfoProto, v2::ZoneEncryptionInfoProto) = ProtoBuf.protoeq(v1, v2)

type CipherOptionProto
    suite::Int32
    inKey::Array{UInt8,1}
    inIv::Array{UInt8,1}
    outKey::Array{UInt8,1}
    outIv::Array{UInt8,1}
    CipherOptionProto() = (o=new(); fillunset(o); o)
end #type CipherOptionProto
const __req_CipherOptionProto = Symbol[:suite]
meta(t::Type{CipherOptionProto}) = meta(t, __req_CipherOptionProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CipherOptionProto) = ProtoBuf.protohash(v)
isequal(v1::CipherOptionProto, v2::CipherOptionProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CipherOptionProto, v2::CipherOptionProto) = ProtoBuf.protoeq(v1, v2)

type LocatedBlocksProto
    fileLength::UInt64
    blocks::Array{LocatedBlockProto,1}
    underConstruction::Bool
    lastBlock::LocatedBlockProto
    isLastBlockComplete::Bool
    fileEncryptionInfo::FileEncryptionInfoProto
    LocatedBlocksProto() = (o=new(); fillunset(o); o)
end #type LocatedBlocksProto
const __req_LocatedBlocksProto = Symbol[:fileLength,:underConstruction,:isLastBlockComplete]
meta(t::Type{LocatedBlocksProto}) = meta(t, __req_LocatedBlocksProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::LocatedBlocksProto) = ProtoBuf.protohash(v)
isequal(v1::LocatedBlocksProto, v2::LocatedBlocksProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::LocatedBlocksProto, v2::LocatedBlocksProto) = ProtoBuf.protoeq(v1, v2)

type __enum_HdfsFileStatusProto_FileType <: ProtoEnum
    IS_DIR::Int32
    IS_FILE::Int32
    IS_SYMLINK::Int32
    __enum_HdfsFileStatusProto_FileType() = new(1,2,3)
end #type __enum_HdfsFileStatusProto_FileType
const HdfsFileStatusProto_FileType = __enum_HdfsFileStatusProto_FileType()

type HdfsFileStatusProto
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
    HdfsFileStatusProto() = (o=new(); fillunset(o); o)
end #type HdfsFileStatusProto
const __req_HdfsFileStatusProto = Symbol[:fileType,:path,:length,:permission,:owner,:group,:modification_time,:access_time]
const __val_HdfsFileStatusProto = @compat Dict(:block_replication => 0, :blocksize => 0, :fileId => 0, :childrenNum => -1, :storagePolicy => 0)
meta(t::Type{HdfsFileStatusProto}) = meta(t, __req_HdfsFileStatusProto, ProtoBuf.DEF_FNUM, __val_HdfsFileStatusProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::HdfsFileStatusProto) = ProtoBuf.protohash(v)
isequal(v1::HdfsFileStatusProto, v2::HdfsFileStatusProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::HdfsFileStatusProto, v2::HdfsFileStatusProto) = ProtoBuf.protoeq(v1, v2)

type FsServerDefaultsProto
    blockSize::UInt64
    bytesPerChecksum::UInt32
    writePacketSize::UInt32
    replication::UInt32
    fileBufferSize::UInt32
    encryptDataTransfer::Bool
    trashInterval::UInt64
    checksumType::Int32
    FsServerDefaultsProto() = (o=new(); fillunset(o); o)
end #type FsServerDefaultsProto
const __req_FsServerDefaultsProto = Symbol[:blockSize,:bytesPerChecksum,:writePacketSize,:replication,:fileBufferSize]
const __val_FsServerDefaultsProto = @compat Dict(:encryptDataTransfer => false, :trashInterval => 0, :checksumType => ChecksumTypeProto.CHECKSUM_CRC32)
meta(t::Type{FsServerDefaultsProto}) = meta(t, __req_FsServerDefaultsProto, ProtoBuf.DEF_FNUM, __val_FsServerDefaultsProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::FsServerDefaultsProto) = ProtoBuf.protohash(v)
isequal(v1::FsServerDefaultsProto, v2::FsServerDefaultsProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::FsServerDefaultsProto, v2::FsServerDefaultsProto) = ProtoBuf.protoeq(v1, v2)

type DirectoryListingProto
    partialListing::Array{HdfsFileStatusProto,1}
    remainingEntries::UInt32
    DirectoryListingProto() = (o=new(); fillunset(o); o)
end #type DirectoryListingProto
const __req_DirectoryListingProto = Symbol[:remainingEntries]
meta(t::Type{DirectoryListingProto}) = meta(t, __req_DirectoryListingProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::DirectoryListingProto) = ProtoBuf.protohash(v)
isequal(v1::DirectoryListingProto, v2::DirectoryListingProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::DirectoryListingProto, v2::DirectoryListingProto) = ProtoBuf.protoeq(v1, v2)

type SnapshottableDirectoryStatusProto
    dirStatus::HdfsFileStatusProto
    snapshot_quota::UInt32
    snapshot_number::UInt32
    parent_fullpath::Array{UInt8,1}
    SnapshottableDirectoryStatusProto() = (o=new(); fillunset(o); o)
end #type SnapshottableDirectoryStatusProto
const __req_SnapshottableDirectoryStatusProto = Symbol[:dirStatus,:snapshot_quota,:snapshot_number,:parent_fullpath]
meta(t::Type{SnapshottableDirectoryStatusProto}) = meta(t, __req_SnapshottableDirectoryStatusProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::SnapshottableDirectoryStatusProto) = ProtoBuf.protohash(v)
isequal(v1::SnapshottableDirectoryStatusProto, v2::SnapshottableDirectoryStatusProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SnapshottableDirectoryStatusProto, v2::SnapshottableDirectoryStatusProto) = ProtoBuf.protoeq(v1, v2)

type SnapshottableDirectoryListingProto
    snapshottableDirListing::Array{SnapshottableDirectoryStatusProto,1}
    SnapshottableDirectoryListingProto() = (o=new(); fillunset(o); o)
end #type SnapshottableDirectoryListingProto
hash(v::SnapshottableDirectoryListingProto) = ProtoBuf.protohash(v)
isequal(v1::SnapshottableDirectoryListingProto, v2::SnapshottableDirectoryListingProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SnapshottableDirectoryListingProto, v2::SnapshottableDirectoryListingProto) = ProtoBuf.protoeq(v1, v2)

type SnapshotDiffReportEntryProto
    fullpath::Array{UInt8,1}
    modificationLabel::AbstractString
    targetPath::Array{UInt8,1}
    SnapshotDiffReportEntryProto() = (o=new(); fillunset(o); o)
end #type SnapshotDiffReportEntryProto
const __req_SnapshotDiffReportEntryProto = Symbol[:fullpath,:modificationLabel]
meta(t::Type{SnapshotDiffReportEntryProto}) = meta(t, __req_SnapshotDiffReportEntryProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::SnapshotDiffReportEntryProto) = ProtoBuf.protohash(v)
isequal(v1::SnapshotDiffReportEntryProto, v2::SnapshotDiffReportEntryProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SnapshotDiffReportEntryProto, v2::SnapshotDiffReportEntryProto) = ProtoBuf.protoeq(v1, v2)

type SnapshotDiffReportProto
    snapshotRoot::AbstractString
    fromSnapshot::AbstractString
    toSnapshot::AbstractString
    diffReportEntries::Array{SnapshotDiffReportEntryProto,1}
    SnapshotDiffReportProto() = (o=new(); fillunset(o); o)
end #type SnapshotDiffReportProto
const __req_SnapshotDiffReportProto = Symbol[:snapshotRoot,:fromSnapshot,:toSnapshot]
meta(t::Type{SnapshotDiffReportProto}) = meta(t, __req_SnapshotDiffReportProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::SnapshotDiffReportProto) = ProtoBuf.protohash(v)
isequal(v1::SnapshotDiffReportProto, v2::SnapshotDiffReportProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SnapshotDiffReportProto, v2::SnapshotDiffReportProto) = ProtoBuf.protoeq(v1, v2)

type StorageInfoProto
    layoutVersion::UInt32
    namespceID::UInt32
    clusterID::AbstractString
    cTime::UInt64
    StorageInfoProto() = (o=new(); fillunset(o); o)
end #type StorageInfoProto
const __req_StorageInfoProto = Symbol[:layoutVersion,:namespceID,:clusterID,:cTime]
meta(t::Type{StorageInfoProto}) = meta(t, __req_StorageInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::StorageInfoProto) = ProtoBuf.protohash(v)
isequal(v1::StorageInfoProto, v2::StorageInfoProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StorageInfoProto, v2::StorageInfoProto) = ProtoBuf.protoeq(v1, v2)

type __enum_NamenodeRegistrationProto_NamenodeRoleProto <: ProtoEnum
    NAMENODE::Int32
    BACKUP::Int32
    CHECKPOINT::Int32
    __enum_NamenodeRegistrationProto_NamenodeRoleProto() = new(1,2,3)
end #type __enum_NamenodeRegistrationProto_NamenodeRoleProto
const NamenodeRegistrationProto_NamenodeRoleProto = __enum_NamenodeRegistrationProto_NamenodeRoleProto()

type NamenodeRegistrationProto
    rpcAddress::AbstractString
    httpAddress::AbstractString
    storageInfo::StorageInfoProto
    role::Int32
    NamenodeRegistrationProto() = (o=new(); fillunset(o); o)
end #type NamenodeRegistrationProto
const __req_NamenodeRegistrationProto = Symbol[:rpcAddress,:httpAddress,:storageInfo]
const __val_NamenodeRegistrationProto = @compat Dict(:role => NamenodeRegistrationProto_NamenodeRoleProto.NAMENODE)
meta(t::Type{NamenodeRegistrationProto}) = meta(t, __req_NamenodeRegistrationProto, ProtoBuf.DEF_FNUM, __val_NamenodeRegistrationProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::NamenodeRegistrationProto) = ProtoBuf.protohash(v)
isequal(v1::NamenodeRegistrationProto, v2::NamenodeRegistrationProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::NamenodeRegistrationProto, v2::NamenodeRegistrationProto) = ProtoBuf.protoeq(v1, v2)

type CheckpointSignatureProto
    blockPoolId::AbstractString
    mostRecentCheckpointTxId::UInt64
    curSegmentTxId::UInt64
    storageInfo::StorageInfoProto
    CheckpointSignatureProto() = (o=new(); fillunset(o); o)
end #type CheckpointSignatureProto
const __req_CheckpointSignatureProto = Symbol[:blockPoolId,:mostRecentCheckpointTxId,:curSegmentTxId,:storageInfo]
meta(t::Type{CheckpointSignatureProto}) = meta(t, __req_CheckpointSignatureProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CheckpointSignatureProto) = ProtoBuf.protohash(v)
isequal(v1::CheckpointSignatureProto, v2::CheckpointSignatureProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CheckpointSignatureProto, v2::CheckpointSignatureProto) = ProtoBuf.protoeq(v1, v2)

type CheckpointCommandProto
    signature::CheckpointSignatureProto
    needToReturnImage::Bool
    CheckpointCommandProto() = (o=new(); fillunset(o); o)
end #type CheckpointCommandProto
const __req_CheckpointCommandProto = Symbol[:signature,:needToReturnImage]
meta(t::Type{CheckpointCommandProto}) = meta(t, __req_CheckpointCommandProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CheckpointCommandProto) = ProtoBuf.protohash(v)
isequal(v1::CheckpointCommandProto, v2::CheckpointCommandProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CheckpointCommandProto, v2::CheckpointCommandProto) = ProtoBuf.protoeq(v1, v2)

type __enum_NamenodeCommandProto_Type <: ProtoEnum
    NamenodeCommand::Int32
    CheckPointCommand::Int32
    __enum_NamenodeCommandProto_Type() = new(0,1)
end #type __enum_NamenodeCommandProto_Type
const NamenodeCommandProto_Type = __enum_NamenodeCommandProto_Type()

type NamenodeCommandProto
    action::UInt32
    _type::Int32
    checkpointCmd::CheckpointCommandProto
    NamenodeCommandProto() = (o=new(); fillunset(o); o)
end #type NamenodeCommandProto
const __req_NamenodeCommandProto = Symbol[:action,:_type]
meta(t::Type{NamenodeCommandProto}) = meta(t, __req_NamenodeCommandProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::NamenodeCommandProto) = ProtoBuf.protohash(v)
isequal(v1::NamenodeCommandProto, v2::NamenodeCommandProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::NamenodeCommandProto, v2::NamenodeCommandProto) = ProtoBuf.protoeq(v1, v2)

type BlockProto
    blockId::UInt64
    genStamp::UInt64
    numBytes::UInt64
    BlockProto() = (o=new(); fillunset(o); o)
end #type BlockProto
const __req_BlockProto = Symbol[:blockId,:genStamp]
const __val_BlockProto = @compat Dict(:numBytes => 0)
meta(t::Type{BlockProto}) = meta(t, __req_BlockProto, ProtoBuf.DEF_FNUM, __val_BlockProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::BlockProto) = ProtoBuf.protohash(v)
isequal(v1::BlockProto, v2::BlockProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::BlockProto, v2::BlockProto) = ProtoBuf.protoeq(v1, v2)

type BlockWithLocationsProto
    block::BlockProto
    datanodeUuids::Array{AbstractString,1}
    storageUuids::Array{AbstractString,1}
    storageTypes::Array{Int32,1}
    BlockWithLocationsProto() = (o=new(); fillunset(o); o)
end #type BlockWithLocationsProto
const __req_BlockWithLocationsProto = Symbol[:block]
meta(t::Type{BlockWithLocationsProto}) = meta(t, __req_BlockWithLocationsProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::BlockWithLocationsProto) = ProtoBuf.protohash(v)
isequal(v1::BlockWithLocationsProto, v2::BlockWithLocationsProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::BlockWithLocationsProto, v2::BlockWithLocationsProto) = ProtoBuf.protoeq(v1, v2)

type BlocksWithLocationsProto
    blocks::Array{BlockWithLocationsProto,1}
    BlocksWithLocationsProto() = (o=new(); fillunset(o); o)
end #type BlocksWithLocationsProto
hash(v::BlocksWithLocationsProto) = ProtoBuf.protohash(v)
isequal(v1::BlocksWithLocationsProto, v2::BlocksWithLocationsProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::BlocksWithLocationsProto, v2::BlocksWithLocationsProto) = ProtoBuf.protoeq(v1, v2)

type RemoteEditLogProto
    startTxId::UInt64
    endTxId::UInt64
    isInProgress::Bool
    RemoteEditLogProto() = (o=new(); fillunset(o); o)
end #type RemoteEditLogProto
const __req_RemoteEditLogProto = Symbol[:startTxId,:endTxId]
const __val_RemoteEditLogProto = @compat Dict(:isInProgress => false)
meta(t::Type{RemoteEditLogProto}) = meta(t, __req_RemoteEditLogProto, ProtoBuf.DEF_FNUM, __val_RemoteEditLogProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RemoteEditLogProto) = ProtoBuf.protohash(v)
isequal(v1::RemoteEditLogProto, v2::RemoteEditLogProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoteEditLogProto, v2::RemoteEditLogProto) = ProtoBuf.protoeq(v1, v2)

type RemoteEditLogManifestProto
    logs::Array{RemoteEditLogProto,1}
    RemoteEditLogManifestProto() = (o=new(); fillunset(o); o)
end #type RemoteEditLogManifestProto
hash(v::RemoteEditLogManifestProto) = ProtoBuf.protohash(v)
isequal(v1::RemoteEditLogManifestProto, v2::RemoteEditLogManifestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoteEditLogManifestProto, v2::RemoteEditLogManifestProto) = ProtoBuf.protoeq(v1, v2)

type NamespaceInfoProto
    buildVersion::AbstractString
    unused::UInt32
    blockPoolID::AbstractString
    storageInfo::StorageInfoProto
    softwareVersion::AbstractString
    capabilities::UInt64
    NamespaceInfoProto() = (o=new(); fillunset(o); o)
end #type NamespaceInfoProto
const __req_NamespaceInfoProto = Symbol[:buildVersion,:unused,:blockPoolID,:storageInfo,:softwareVersion]
const __val_NamespaceInfoProto = @compat Dict(:capabilities => 0)
meta(t::Type{NamespaceInfoProto}) = meta(t, __req_NamespaceInfoProto, ProtoBuf.DEF_FNUM, __val_NamespaceInfoProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::NamespaceInfoProto) = ProtoBuf.protohash(v)
isequal(v1::NamespaceInfoProto, v2::NamespaceInfoProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::NamespaceInfoProto, v2::NamespaceInfoProto) = ProtoBuf.protoeq(v1, v2)

type BlockKeyProto
    keyId::UInt32
    expiryDate::UInt64
    keyBytes::Array{UInt8,1}
    BlockKeyProto() = (o=new(); fillunset(o); o)
end #type BlockKeyProto
const __req_BlockKeyProto = Symbol[:keyId,:expiryDate]
meta(t::Type{BlockKeyProto}) = meta(t, __req_BlockKeyProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::BlockKeyProto) = ProtoBuf.protohash(v)
isequal(v1::BlockKeyProto, v2::BlockKeyProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::BlockKeyProto, v2::BlockKeyProto) = ProtoBuf.protoeq(v1, v2)

type ExportedBlockKeysProto
    isBlockTokenEnabled::Bool
    keyUpdateInterval::UInt64
    tokenLifeTime::UInt64
    currentKey::BlockKeyProto
    allKeys::Array{BlockKeyProto,1}
    ExportedBlockKeysProto() = (o=new(); fillunset(o); o)
end #type ExportedBlockKeysProto
const __req_ExportedBlockKeysProto = Symbol[:isBlockTokenEnabled,:keyUpdateInterval,:tokenLifeTime,:currentKey]
meta(t::Type{ExportedBlockKeysProto}) = meta(t, __req_ExportedBlockKeysProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ExportedBlockKeysProto) = ProtoBuf.protohash(v)
isequal(v1::ExportedBlockKeysProto, v2::ExportedBlockKeysProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ExportedBlockKeysProto, v2::ExportedBlockKeysProto) = ProtoBuf.protoeq(v1, v2)

type RecoveringBlockProto
    newGenStamp::UInt64
    block::LocatedBlockProto
    truncateBlock::BlockProto
    RecoveringBlockProto() = (o=new(); fillunset(o); o)
end #type RecoveringBlockProto
const __req_RecoveringBlockProto = Symbol[:newGenStamp,:block]
meta(t::Type{RecoveringBlockProto}) = meta(t, __req_RecoveringBlockProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RecoveringBlockProto) = ProtoBuf.protohash(v)
isequal(v1::RecoveringBlockProto, v2::RecoveringBlockProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RecoveringBlockProto, v2::RecoveringBlockProto) = ProtoBuf.protoeq(v1, v2)

type VersionRequestProto
    VersionRequestProto() = (o=new(); fillunset(o); o)
end #type VersionRequestProto
hash(v::VersionRequestProto) = ProtoBuf.protohash(v)
isequal(v1::VersionRequestProto, v2::VersionRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::VersionRequestProto, v2::VersionRequestProto) = ProtoBuf.protoeq(v1, v2)

type VersionResponseProto
    info::NamespaceInfoProto
    VersionResponseProto() = (o=new(); fillunset(o); o)
end #type VersionResponseProto
const __req_VersionResponseProto = Symbol[:info]
meta(t::Type{VersionResponseProto}) = meta(t, __req_VersionResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::VersionResponseProto) = ProtoBuf.protohash(v)
isequal(v1::VersionResponseProto, v2::VersionResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::VersionResponseProto, v2::VersionResponseProto) = ProtoBuf.protoeq(v1, v2)

type SnapshotInfoProto
    snapshotName::AbstractString
    snapshotRoot::AbstractString
    permission::FsPermissionProto
    owner::AbstractString
    group::AbstractString
    createTime::AbstractString
    SnapshotInfoProto() = (o=new(); fillunset(o); o)
end #type SnapshotInfoProto
const __req_SnapshotInfoProto = Symbol[:snapshotName,:snapshotRoot,:permission,:owner,:group,:createTime]
meta(t::Type{SnapshotInfoProto}) = meta(t, __req_SnapshotInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::SnapshotInfoProto) = ProtoBuf.protohash(v)
isequal(v1::SnapshotInfoProto, v2::SnapshotInfoProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SnapshotInfoProto, v2::SnapshotInfoProto) = ProtoBuf.protoeq(v1, v2)

type RollingUpgradeStatusProto
    blockPoolId::AbstractString
    RollingUpgradeStatusProto() = (o=new(); fillunset(o); o)
end #type RollingUpgradeStatusProto
const __req_RollingUpgradeStatusProto = Symbol[:blockPoolId]
meta(t::Type{RollingUpgradeStatusProto}) = meta(t, __req_RollingUpgradeStatusProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RollingUpgradeStatusProto) = ProtoBuf.protohash(v)
isequal(v1::RollingUpgradeStatusProto, v2::RollingUpgradeStatusProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RollingUpgradeStatusProto, v2::RollingUpgradeStatusProto) = ProtoBuf.protoeq(v1, v2)

export StorageTypeProto, CipherSuiteProto, CryptoProtocolVersionProto, ChecksumTypeProto, ReplicaStateProto, ExtendedBlockProto, DatanodeIDProto, DatanodeLocalInfoProto, DatanodeInfosProto, DatanodeInfoProto_AdminState, DatanodeInfoProto, DatanodeStorageProto_StorageState, DatanodeStorageProto, StorageReportProto, ContentSummaryProto, StorageTypeQuotaInfosProto, StorageTypeQuotaInfoProto, CorruptFileBlocksProto, FsPermissionProto, StorageTypesProto, BlockStoragePolicyProto, StorageUuidsProto, LocatedBlockProto, DataEncryptionKeyProto, FileEncryptionInfoProto, PerFileEncryptionInfoProto, ZoneEncryptionInfoProto, CipherOptionProto, LocatedBlocksProto, HdfsFileStatusProto_FileType, HdfsFileStatusProto, FsServerDefaultsProto, DirectoryListingProto, SnapshottableDirectoryStatusProto, SnapshottableDirectoryListingProto, SnapshotDiffReportEntryProto, SnapshotDiffReportProto, StorageInfoProto, NamenodeRegistrationProto_NamenodeRoleProto, NamenodeRegistrationProto, CheckpointSignatureProto, NamenodeCommandProto_Type, NamenodeCommandProto, CheckpointCommandProto, BlockProto, BlockWithLocationsProto, BlocksWithLocationsProto, RemoteEditLogProto, RemoteEditLogManifestProto, NamespaceInfoProto, BlockKeyProto, ExportedBlockKeysProto, RecoveringBlockProto, VersionRequestProto, VersionResponseProto, SnapshotInfoProto, RollingUpgradeStatusProto
