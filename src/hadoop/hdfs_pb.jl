# syntax: proto2
# COV_EXCL_START
using ProtoBuf
import ProtoBuf.meta
import ..hadoop

const StorageTypeProto = (;[
    Symbol("DISK") => Int32(1),
    Symbol("SSD") => Int32(2),
    Symbol("ARCHIVE") => Int32(3),
    Symbol("RAM_DISK") => Int32(4),
]...)

const CipherSuiteProto = (;[
    Symbol("UNKNOWN") => Int32(1),
    Symbol("AES_CTR_NOPADDING") => Int32(2),
]...)

const CryptoProtocolVersionProto = (;[
    Symbol("UNKNOWN_PROTOCOL_VERSION") => Int32(1),
    Symbol("ENCRYPTION_ZONES") => Int32(2),
]...)

const ChecksumTypeProto = (;[
    Symbol("CHECKSUM_NULL") => Int32(0),
    Symbol("CHECKSUM_CRC32") => Int32(1),
    Symbol("CHECKSUM_CRC32C") => Int32(2),
]...)

mutable struct ExtendedBlockProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ExtendedBlockProto(; kwargs...)
        obj = new(meta(ExtendedBlockProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ExtendedBlockProto
const __meta_ExtendedBlockProto = Ref{ProtoMeta}()
function meta(::Type{ExtendedBlockProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ExtendedBlockProto)
            __meta_ExtendedBlockProto[] = target = ProtoMeta(ExtendedBlockProto)
            req = Symbol[:poolId,:blockId,:generationStamp]
            val = Dict{Symbol,Any}(:numBytes => 0)
            allflds = Pair{Symbol,Union{Type,String}}[:poolId => AbstractString, :blockId => UInt64, :generationStamp => UInt64, :numBytes => UInt64]
            meta(target, ExtendedBlockProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ExtendedBlockProto[]
    end
end
function Base.getproperty(obj::ExtendedBlockProto, name::Symbol)
    if name === :poolId
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :blockId
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :generationStamp
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :numBytes
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct DatanodeIDProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function DatanodeIDProto(; kwargs...)
        obj = new(meta(DatanodeIDProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct DatanodeIDProto
const __meta_DatanodeIDProto = Ref{ProtoMeta}()
function meta(::Type{DatanodeIDProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DatanodeIDProto)
            __meta_DatanodeIDProto[] = target = ProtoMeta(DatanodeIDProto)
            req = Symbol[:ipAddr,:hostName,:datanodeUuid,:xferPort,:infoPort,:ipcPort]
            val = Dict{Symbol,Any}(:infoSecurePort => 0)
            allflds = Pair{Symbol,Union{Type,String}}[:ipAddr => AbstractString, :hostName => AbstractString, :datanodeUuid => AbstractString, :xferPort => UInt32, :infoPort => UInt32, :ipcPort => UInt32, :infoSecurePort => UInt32]
            meta(target, DatanodeIDProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DatanodeIDProto[]
    end
end
function Base.getproperty(obj::DatanodeIDProto, name::Symbol)
    if name === :ipAddr
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :hostName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :datanodeUuid
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :xferPort
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :infoPort
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :ipcPort
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :infoSecurePort
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    else
        getfield(obj, name)
    end
end

mutable struct DatanodeLocalInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function DatanodeLocalInfoProto(; kwargs...)
        obj = new(meta(DatanodeLocalInfoProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct DatanodeLocalInfoProto
const __meta_DatanodeLocalInfoProto = Ref{ProtoMeta}()
function meta(::Type{DatanodeLocalInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DatanodeLocalInfoProto)
            __meta_DatanodeLocalInfoProto[] = target = ProtoMeta(DatanodeLocalInfoProto)
            req = Symbol[:softwareVersion,:configVersion,:uptime]
            allflds = Pair{Symbol,Union{Type,String}}[:softwareVersion => AbstractString, :configVersion => AbstractString, :uptime => UInt64]
            meta(target, DatanodeLocalInfoProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DatanodeLocalInfoProto[]
    end
end
function Base.getproperty(obj::DatanodeLocalInfoProto, name::Symbol)
    if name === :softwareVersion
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :configVersion
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :uptime
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct DatanodeVolumeInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function DatanodeVolumeInfoProto(; kwargs...)
        obj = new(meta(DatanodeVolumeInfoProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct DatanodeVolumeInfoProto
const __meta_DatanodeVolumeInfoProto = Ref{ProtoMeta}()
function meta(::Type{DatanodeVolumeInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DatanodeVolumeInfoProto)
            __meta_DatanodeVolumeInfoProto[] = target = ProtoMeta(DatanodeVolumeInfoProto)
            req = Symbol[:path,:storageType,:usedSpace,:freeSpace,:reservedSpace,:reservedSpaceForReplicas,:numBlocks]
            allflds = Pair{Symbol,Union{Type,String}}[:path => AbstractString, :storageType => Int32, :usedSpace => UInt64, :freeSpace => UInt64, :reservedSpace => UInt64, :reservedSpaceForReplicas => UInt64, :numBlocks => UInt64]
            meta(target, DatanodeVolumeInfoProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DatanodeVolumeInfoProto[]
    end
end
function Base.getproperty(obj::DatanodeVolumeInfoProto, name::Symbol)
    if name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :storageType
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :usedSpace
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :freeSpace
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :reservedSpace
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :reservedSpaceForReplicas
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :numBlocks
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

const DatanodeInfoProto_AdminState = (;[
    Symbol("NORMAL") => Int32(0),
    Symbol("DECOMMISSION_INPROGRESS") => Int32(1),
    Symbol("DECOMMISSIONED") => Int32(2),
    Symbol("ENTERING_MAINTENANCE") => Int32(3),
    Symbol("IN_MAINTENANCE") => Int32(4),
]...)

mutable struct DatanodeInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function DatanodeInfoProto(; kwargs...)
        obj = new(meta(DatanodeInfoProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct DatanodeInfoProto
const __meta_DatanodeInfoProto = Ref{ProtoMeta}()
function meta(::Type{DatanodeInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DatanodeInfoProto)
            __meta_DatanodeInfoProto[] = target = ProtoMeta(DatanodeInfoProto)
            req = Symbol[:id]
            val = Dict{Symbol,Any}(:capacity => 0, :dfsUsed => 0, :remaining => 0, :blockPoolUsed => 0, :lastUpdate => 0, :xceiverCount => 0, :adminState => DatanodeInfoProto_AdminState.NORMAL, :cacheCapacity => 0, :cacheUsed => 0, :lastUpdateMonotonic => 0, :lastBlockReportTime => 0, :lastBlockReportMonotonic => 0)
            allflds = Pair{Symbol,Union{Type,String}}[:id => DatanodeIDProto, :capacity => UInt64, :dfsUsed => UInt64, :remaining => UInt64, :blockPoolUsed => UInt64, :lastUpdate => UInt64, :xceiverCount => UInt32, :location => AbstractString, :nonDfsUsed => UInt64, :adminState => Int32, :cacheCapacity => UInt64, :cacheUsed => UInt64, :lastUpdateMonotonic => UInt64, :upgradeDomain => AbstractString, :lastBlockReportTime => UInt64, :lastBlockReportMonotonic => UInt64]
            meta(target, DatanodeInfoProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DatanodeInfoProto[]
    end
end
function Base.getproperty(obj::DatanodeInfoProto, name::Symbol)
    if name === :id
        return (obj.__protobuf_jl_internal_values[name])::DatanodeIDProto
    elseif name === :capacity
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :dfsUsed
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :remaining
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :blockPoolUsed
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :lastUpdate
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :xceiverCount
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :location
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :nonDfsUsed
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :adminState
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :cacheCapacity
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :cacheUsed
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :lastUpdateMonotonic
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :upgradeDomain
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :lastBlockReportTime
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :lastBlockReportMonotonic
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct DatanodeInfosProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function DatanodeInfosProto(; kwargs...)
        obj = new(meta(DatanodeInfosProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct DatanodeInfosProto
const __meta_DatanodeInfosProto = Ref{ProtoMeta}()
function meta(::Type{DatanodeInfosProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DatanodeInfosProto)
            __meta_DatanodeInfosProto[] = target = ProtoMeta(DatanodeInfosProto)
            allflds = Pair{Symbol,Union{Type,String}}[:datanodes => Base.Vector{DatanodeInfoProto}]
            meta(target, DatanodeInfosProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DatanodeInfosProto[]
    end
end
function Base.getproperty(obj::DatanodeInfosProto, name::Symbol)
    if name === :datanodes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{DatanodeInfoProto}
    else
        getfield(obj, name)
    end
end

const DatanodeStorageProto_StorageState = (;[
    Symbol("NORMAL") => Int32(0),
    Symbol("READ_ONLY_SHARED") => Int32(1),
]...)

mutable struct DatanodeStorageProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function DatanodeStorageProto(; kwargs...)
        obj = new(meta(DatanodeStorageProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct DatanodeStorageProto
const __meta_DatanodeStorageProto = Ref{ProtoMeta}()
function meta(::Type{DatanodeStorageProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DatanodeStorageProto)
            __meta_DatanodeStorageProto[] = target = ProtoMeta(DatanodeStorageProto)
            req = Symbol[:storageUuid]
            val = Dict{Symbol,Any}(:state => DatanodeStorageProto_StorageState.NORMAL, :storageType => StorageTypeProto.DISK)
            allflds = Pair{Symbol,Union{Type,String}}[:storageUuid => AbstractString, :state => Int32, :storageType => Int32]
            meta(target, DatanodeStorageProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DatanodeStorageProto[]
    end
end
function Base.getproperty(obj::DatanodeStorageProto, name::Symbol)
    if name === :storageUuid
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :state
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :storageType
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct StorageReportProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function StorageReportProto(; kwargs...)
        obj = new(meta(StorageReportProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct StorageReportProto
const __meta_StorageReportProto = Ref{ProtoMeta}()
function meta(::Type{StorageReportProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StorageReportProto)
            __meta_StorageReportProto[] = target = ProtoMeta(StorageReportProto)
            req = Symbol[:storageUuid]
            val = Dict{Symbol,Any}(:failed => false, :capacity => 0, :dfsUsed => 0, :remaining => 0, :blockPoolUsed => 0)
            allflds = Pair{Symbol,Union{Type,String}}[:storageUuid => AbstractString, :failed => Bool, :capacity => UInt64, :dfsUsed => UInt64, :remaining => UInt64, :blockPoolUsed => UInt64, :storage => DatanodeStorageProto, :nonDfsUsed => UInt64]
            meta(target, StorageReportProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StorageReportProto[]
    end
end
function Base.getproperty(obj::StorageReportProto, name::Symbol)
    if name === :storageUuid
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :failed
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :capacity
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :dfsUsed
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :remaining
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :blockPoolUsed
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :storage
        return (obj.__protobuf_jl_internal_values[name])::DatanodeStorageProto
    elseif name === :nonDfsUsed
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct StorageTypeQuotaInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function StorageTypeQuotaInfoProto(; kwargs...)
        obj = new(meta(StorageTypeQuotaInfoProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct StorageTypeQuotaInfoProto
const __meta_StorageTypeQuotaInfoProto = Ref{ProtoMeta}()
function meta(::Type{StorageTypeQuotaInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StorageTypeQuotaInfoProto)
            __meta_StorageTypeQuotaInfoProto[] = target = ProtoMeta(StorageTypeQuotaInfoProto)
            req = Symbol[:_type,:quota,:consumed]
            allflds = Pair{Symbol,Union{Type,String}}[:_type => Int32, :quota => UInt64, :consumed => UInt64]
            meta(target, StorageTypeQuotaInfoProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StorageTypeQuotaInfoProto[]
    end
end
function Base.getproperty(obj::StorageTypeQuotaInfoProto, name::Symbol)
    if name === :_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :quota
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :consumed
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct StorageTypeQuotaInfosProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function StorageTypeQuotaInfosProto(; kwargs...)
        obj = new(meta(StorageTypeQuotaInfosProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct StorageTypeQuotaInfosProto
const __meta_StorageTypeQuotaInfosProto = Ref{ProtoMeta}()
function meta(::Type{StorageTypeQuotaInfosProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StorageTypeQuotaInfosProto)
            __meta_StorageTypeQuotaInfosProto[] = target = ProtoMeta(StorageTypeQuotaInfosProto)
            allflds = Pair{Symbol,Union{Type,String}}[:typeQuotaInfo => Base.Vector{StorageTypeQuotaInfoProto}]
            meta(target, StorageTypeQuotaInfosProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StorageTypeQuotaInfosProto[]
    end
end
function Base.getproperty(obj::StorageTypeQuotaInfosProto, name::Symbol)
    if name === :typeQuotaInfo
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{StorageTypeQuotaInfoProto}
    else
        getfield(obj, name)
    end
end

mutable struct ContentSummaryProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ContentSummaryProto(; kwargs...)
        obj = new(meta(ContentSummaryProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ContentSummaryProto
const __meta_ContentSummaryProto = Ref{ProtoMeta}()
function meta(::Type{ContentSummaryProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ContentSummaryProto)
            __meta_ContentSummaryProto[] = target = ProtoMeta(ContentSummaryProto)
            req = Symbol[:length,:fileCount,:directoryCount,:quota,:spaceConsumed,:spaceQuota]
            allflds = Pair{Symbol,Union{Type,String}}[:length => UInt64, :fileCount => UInt64, :directoryCount => UInt64, :quota => UInt64, :spaceConsumed => UInt64, :spaceQuota => UInt64, :typeQuotaInfos => StorageTypeQuotaInfosProto, :snapshotLength => UInt64, :snapshotFileCount => UInt64, :snapshotDirectoryCount => UInt64, :snapshotSpaceConsumed => UInt64]
            meta(target, ContentSummaryProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ContentSummaryProto[]
    end
end
function Base.getproperty(obj::ContentSummaryProto, name::Symbol)
    if name === :length
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :fileCount
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :directoryCount
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :quota
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :spaceConsumed
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :spaceQuota
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :typeQuotaInfos
        return (obj.__protobuf_jl_internal_values[name])::StorageTypeQuotaInfosProto
    elseif name === :snapshotLength
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :snapshotFileCount
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :snapshotDirectoryCount
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :snapshotSpaceConsumed
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct QuotaUsageProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function QuotaUsageProto(; kwargs...)
        obj = new(meta(QuotaUsageProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct QuotaUsageProto
const __meta_QuotaUsageProto = Ref{ProtoMeta}()
function meta(::Type{QuotaUsageProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_QuotaUsageProto)
            __meta_QuotaUsageProto[] = target = ProtoMeta(QuotaUsageProto)
            req = Symbol[:fileAndDirectoryCount,:quota,:spaceConsumed,:spaceQuota]
            allflds = Pair{Symbol,Union{Type,String}}[:fileAndDirectoryCount => UInt64, :quota => UInt64, :spaceConsumed => UInt64, :spaceQuota => UInt64, :typeQuotaInfos => StorageTypeQuotaInfosProto]
            meta(target, QuotaUsageProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_QuotaUsageProto[]
    end
end
function Base.getproperty(obj::QuotaUsageProto, name::Symbol)
    if name === :fileAndDirectoryCount
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :quota
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :spaceConsumed
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :spaceQuota
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :typeQuotaInfos
        return (obj.__protobuf_jl_internal_values[name])::StorageTypeQuotaInfosProto
    else
        getfield(obj, name)
    end
end

mutable struct CorruptFileBlocksProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CorruptFileBlocksProto(; kwargs...)
        obj = new(meta(CorruptFileBlocksProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct CorruptFileBlocksProto
const __meta_CorruptFileBlocksProto = Ref{ProtoMeta}()
function meta(::Type{CorruptFileBlocksProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CorruptFileBlocksProto)
            __meta_CorruptFileBlocksProto[] = target = ProtoMeta(CorruptFileBlocksProto)
            req = Symbol[:cookie]
            allflds = Pair{Symbol,Union{Type,String}}[:files => Base.Vector{AbstractString}, :cookie => AbstractString]
            meta(target, CorruptFileBlocksProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CorruptFileBlocksProto[]
    end
end
function Base.getproperty(obj::CorruptFileBlocksProto, name::Symbol)
    if name === :files
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :cookie
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct FsPermissionProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function FsPermissionProto(; kwargs...)
        obj = new(meta(FsPermissionProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct FsPermissionProto
const __meta_FsPermissionProto = Ref{ProtoMeta}()
function meta(::Type{FsPermissionProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FsPermissionProto)
            __meta_FsPermissionProto[] = target = ProtoMeta(FsPermissionProto)
            req = Symbol[:perm]
            allflds = Pair{Symbol,Union{Type,String}}[:perm => UInt32]
            meta(target, FsPermissionProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FsPermissionProto[]
    end
end
function Base.getproperty(obj::FsPermissionProto, name::Symbol)
    if name === :perm
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    else
        getfield(obj, name)
    end
end

mutable struct StorageTypesProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function StorageTypesProto(; kwargs...)
        obj = new(meta(StorageTypesProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct StorageTypesProto
const __meta_StorageTypesProto = Ref{ProtoMeta}()
function meta(::Type{StorageTypesProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StorageTypesProto)
            __meta_StorageTypesProto[] = target = ProtoMeta(StorageTypesProto)
            allflds = Pair{Symbol,Union{Type,String}}[:storageTypes => Base.Vector{Int32}]
            meta(target, StorageTypesProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StorageTypesProto[]
    end
end
function Base.getproperty(obj::StorageTypesProto, name::Symbol)
    if name === :storageTypes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    else
        getfield(obj, name)
    end
end

mutable struct BlockStoragePolicyProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function BlockStoragePolicyProto(; kwargs...)
        obj = new(meta(BlockStoragePolicyProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct BlockStoragePolicyProto
const __meta_BlockStoragePolicyProto = Ref{ProtoMeta}()
function meta(::Type{BlockStoragePolicyProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_BlockStoragePolicyProto)
            __meta_BlockStoragePolicyProto[] = target = ProtoMeta(BlockStoragePolicyProto)
            req = Symbol[:policyId,:name,:creationPolicy]
            allflds = Pair{Symbol,Union{Type,String}}[:policyId => UInt32, :name => AbstractString, :creationPolicy => StorageTypesProto, :creationFallbackPolicy => StorageTypesProto, :replicationFallbackPolicy => StorageTypesProto]
            meta(target, BlockStoragePolicyProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_BlockStoragePolicyProto[]
    end
end
function Base.getproperty(obj::BlockStoragePolicyProto, name::Symbol)
    if name === :policyId
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :creationPolicy
        return (obj.__protobuf_jl_internal_values[name])::StorageTypesProto
    elseif name === :creationFallbackPolicy
        return (obj.__protobuf_jl_internal_values[name])::StorageTypesProto
    elseif name === :replicationFallbackPolicy
        return (obj.__protobuf_jl_internal_values[name])::StorageTypesProto
    else
        getfield(obj, name)
    end
end

mutable struct LocatedBlockProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function LocatedBlockProto(; kwargs...)
        obj = new(meta(LocatedBlockProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct LocatedBlockProto
const __meta_LocatedBlockProto = Ref{ProtoMeta}()
function meta(::Type{LocatedBlockProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_LocatedBlockProto)
            __meta_LocatedBlockProto[] = target = ProtoMeta(LocatedBlockProto)
            req = Symbol[:b,:offset,:corrupt,:blockToken]
            pack = Symbol[:isCached]
            allflds = Pair{Symbol,Union{Type,String}}[:b => ExtendedBlockProto, :offset => UInt64, :locs => Base.Vector{DatanodeInfoProto}, :corrupt => Bool, :blockToken => hadoop.common.TokenProto, :isCached => Base.Vector{Bool}, :storageTypes => Base.Vector{Int32}, :storageIDs => Base.Vector{AbstractString}]
            meta(target, LocatedBlockProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, pack, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_LocatedBlockProto[]
    end
end
function Base.getproperty(obj::LocatedBlockProto, name::Symbol)
    if name === :b
        return (obj.__protobuf_jl_internal_values[name])::ExtendedBlockProto
    elseif name === :offset
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :locs
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{DatanodeInfoProto}
    elseif name === :corrupt
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :blockToken
        return (obj.__protobuf_jl_internal_values[name])::hadoop.common.TokenProto
    elseif name === :isCached
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Bool}
    elseif name === :storageTypes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    elseif name === :storageIDs
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    else
        getfield(obj, name)
    end
end

mutable struct DataEncryptionKeyProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function DataEncryptionKeyProto(; kwargs...)
        obj = new(meta(DataEncryptionKeyProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct DataEncryptionKeyProto
const __meta_DataEncryptionKeyProto = Ref{ProtoMeta}()
function meta(::Type{DataEncryptionKeyProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DataEncryptionKeyProto)
            __meta_DataEncryptionKeyProto[] = target = ProtoMeta(DataEncryptionKeyProto)
            req = Symbol[:keyId,:blockPoolId,:nonce,:encryptionKey,:expiryDate]
            allflds = Pair{Symbol,Union{Type,String}}[:keyId => UInt32, :blockPoolId => AbstractString, :nonce => Array{UInt8,1}, :encryptionKey => Array{UInt8,1}, :expiryDate => UInt64, :encryptionAlgorithm => AbstractString]
            meta(target, DataEncryptionKeyProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DataEncryptionKeyProto[]
    end
end
function Base.getproperty(obj::DataEncryptionKeyProto, name::Symbol)
    if name === :keyId
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :blockPoolId
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :nonce
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :encryptionKey
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :expiryDate
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :encryptionAlgorithm
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct FileEncryptionInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function FileEncryptionInfoProto(; kwargs...)
        obj = new(meta(FileEncryptionInfoProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct FileEncryptionInfoProto
const __meta_FileEncryptionInfoProto = Ref{ProtoMeta}()
function meta(::Type{FileEncryptionInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FileEncryptionInfoProto)
            __meta_FileEncryptionInfoProto[] = target = ProtoMeta(FileEncryptionInfoProto)
            req = Symbol[:suite,:cryptoProtocolVersion,:key,:iv,:keyName,:ezKeyVersionName]
            allflds = Pair{Symbol,Union{Type,String}}[:suite => Int32, :cryptoProtocolVersion => Int32, :key => Array{UInt8,1}, :iv => Array{UInt8,1}, :keyName => AbstractString, :ezKeyVersionName => AbstractString]
            meta(target, FileEncryptionInfoProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FileEncryptionInfoProto[]
    end
end
function Base.getproperty(obj::FileEncryptionInfoProto, name::Symbol)
    if name === :suite
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :cryptoProtocolVersion
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :key
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :iv
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :keyName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :ezKeyVersionName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct PerFileEncryptionInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function PerFileEncryptionInfoProto(; kwargs...)
        obj = new(meta(PerFileEncryptionInfoProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct PerFileEncryptionInfoProto
const __meta_PerFileEncryptionInfoProto = Ref{ProtoMeta}()
function meta(::Type{PerFileEncryptionInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_PerFileEncryptionInfoProto)
            __meta_PerFileEncryptionInfoProto[] = target = ProtoMeta(PerFileEncryptionInfoProto)
            req = Symbol[:key,:iv,:ezKeyVersionName]
            allflds = Pair{Symbol,Union{Type,String}}[:key => Array{UInt8,1}, :iv => Array{UInt8,1}, :ezKeyVersionName => AbstractString]
            meta(target, PerFileEncryptionInfoProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_PerFileEncryptionInfoProto[]
    end
end
function Base.getproperty(obj::PerFileEncryptionInfoProto, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :iv
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :ezKeyVersionName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct ZoneEncryptionInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ZoneEncryptionInfoProto(; kwargs...)
        obj = new(meta(ZoneEncryptionInfoProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ZoneEncryptionInfoProto
const __meta_ZoneEncryptionInfoProto = Ref{ProtoMeta}()
function meta(::Type{ZoneEncryptionInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ZoneEncryptionInfoProto)
            __meta_ZoneEncryptionInfoProto[] = target = ProtoMeta(ZoneEncryptionInfoProto)
            req = Symbol[:suite,:cryptoProtocolVersion,:keyName]
            allflds = Pair{Symbol,Union{Type,String}}[:suite => Int32, :cryptoProtocolVersion => Int32, :keyName => AbstractString]
            meta(target, ZoneEncryptionInfoProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ZoneEncryptionInfoProto[]
    end
end
function Base.getproperty(obj::ZoneEncryptionInfoProto, name::Symbol)
    if name === :suite
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :cryptoProtocolVersion
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :keyName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct CipherOptionProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CipherOptionProto(; kwargs...)
        obj = new(meta(CipherOptionProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct CipherOptionProto
const __meta_CipherOptionProto = Ref{ProtoMeta}()
function meta(::Type{CipherOptionProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CipherOptionProto)
            __meta_CipherOptionProto[] = target = ProtoMeta(CipherOptionProto)
            req = Symbol[:suite]
            allflds = Pair{Symbol,Union{Type,String}}[:suite => Int32, :inKey => Array{UInt8,1}, :inIv => Array{UInt8,1}, :outKey => Array{UInt8,1}, :outIv => Array{UInt8,1}]
            meta(target, CipherOptionProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CipherOptionProto[]
    end
end
function Base.getproperty(obj::CipherOptionProto, name::Symbol)
    if name === :suite
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :inKey
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :inIv
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :outKey
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :outIv
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    else
        getfield(obj, name)
    end
end

mutable struct LocatedBlocksProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function LocatedBlocksProto(; kwargs...)
        obj = new(meta(LocatedBlocksProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct LocatedBlocksProto
const __meta_LocatedBlocksProto = Ref{ProtoMeta}()
function meta(::Type{LocatedBlocksProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_LocatedBlocksProto)
            __meta_LocatedBlocksProto[] = target = ProtoMeta(LocatedBlocksProto)
            req = Symbol[:fileLength,:underConstruction,:isLastBlockComplete]
            allflds = Pair{Symbol,Union{Type,String}}[:fileLength => UInt64, :blocks => Base.Vector{LocatedBlockProto}, :underConstruction => Bool, :lastBlock => LocatedBlockProto, :isLastBlockComplete => Bool, :fileEncryptionInfo => FileEncryptionInfoProto]
            meta(target, LocatedBlocksProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_LocatedBlocksProto[]
    end
end
function Base.getproperty(obj::LocatedBlocksProto, name::Symbol)
    if name === :fileLength
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :blocks
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{LocatedBlockProto}
    elseif name === :underConstruction
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :lastBlock
        return (obj.__protobuf_jl_internal_values[name])::LocatedBlockProto
    elseif name === :isLastBlockComplete
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :fileEncryptionInfo
        return (obj.__protobuf_jl_internal_values[name])::FileEncryptionInfoProto
    else
        getfield(obj, name)
    end
end

const HdfsFileStatusProto_FileType = (;[
    Symbol("IS_DIR") => Int32(1),
    Symbol("IS_FILE") => Int32(2),
    Symbol("IS_SYMLINK") => Int32(3),
]...)

mutable struct HdfsFileStatusProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function HdfsFileStatusProto(; kwargs...)
        obj = new(meta(HdfsFileStatusProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct HdfsFileStatusProto
const __meta_HdfsFileStatusProto = Ref{ProtoMeta}()
function meta(::Type{HdfsFileStatusProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_HdfsFileStatusProto)
            __meta_HdfsFileStatusProto[] = target = ProtoMeta(HdfsFileStatusProto)
            req = Symbol[:fileType,:path,:length,:permission,:owner,:group,:modification_time,:access_time]
            val = Dict{Symbol,Any}(:block_replication => 0, :blocksize => 0, :fileId => 0, :childrenNum => -1, :storagePolicy => 0)
            allflds = Pair{Symbol,Union{Type,String}}[:fileType => Int32, :path => Array{UInt8,1}, :length => UInt64, :permission => FsPermissionProto, :owner => AbstractString, :group => AbstractString, :modification_time => UInt64, :access_time => UInt64, :symlink => Array{UInt8,1}, :block_replication => UInt32, :blocksize => UInt64, :locations => LocatedBlocksProto, :fileId => UInt64, :childrenNum => Int32, :fileEncryptionInfo => FileEncryptionInfoProto, :storagePolicy => UInt32]
            meta(target, HdfsFileStatusProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_HdfsFileStatusProto[]
    end
end
function Base.getproperty(obj::HdfsFileStatusProto, name::Symbol)
    if name === :fileType
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :path
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :length
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :permission
        return (obj.__protobuf_jl_internal_values[name])::FsPermissionProto
    elseif name === :owner
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :group
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :modification_time
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :access_time
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :symlink
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :block_replication
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :blocksize
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :locations
        return (obj.__protobuf_jl_internal_values[name])::LocatedBlocksProto
    elseif name === :fileId
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :childrenNum
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :fileEncryptionInfo
        return (obj.__protobuf_jl_internal_values[name])::FileEncryptionInfoProto
    elseif name === :storagePolicy
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    else
        getfield(obj, name)
    end
end

mutable struct FsServerDefaultsProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function FsServerDefaultsProto(; kwargs...)
        obj = new(meta(FsServerDefaultsProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct FsServerDefaultsProto
const __meta_FsServerDefaultsProto = Ref{ProtoMeta}()
function meta(::Type{FsServerDefaultsProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FsServerDefaultsProto)
            __meta_FsServerDefaultsProto[] = target = ProtoMeta(FsServerDefaultsProto)
            req = Symbol[:blockSize,:bytesPerChecksum,:writePacketSize,:replication,:fileBufferSize]
            val = Dict{Symbol,Any}(:encryptDataTransfer => false, :trashInterval => 0, :checksumType => ChecksumTypeProto.CHECKSUM_CRC32, :policyId => 0)
            allflds = Pair{Symbol,Union{Type,String}}[:blockSize => UInt64, :bytesPerChecksum => UInt32, :writePacketSize => UInt32, :replication => UInt32, :fileBufferSize => UInt32, :encryptDataTransfer => Bool, :trashInterval => UInt64, :checksumType => Int32, :keyProviderUri => AbstractString, :policyId => UInt32]
            meta(target, FsServerDefaultsProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FsServerDefaultsProto[]
    end
end
function Base.getproperty(obj::FsServerDefaultsProto, name::Symbol)
    if name === :blockSize
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :bytesPerChecksum
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :writePacketSize
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :replication
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :fileBufferSize
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :encryptDataTransfer
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :trashInterval
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :checksumType
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :keyProviderUri
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :policyId
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    else
        getfield(obj, name)
    end
end

mutable struct DirectoryListingProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function DirectoryListingProto(; kwargs...)
        obj = new(meta(DirectoryListingProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct DirectoryListingProto
const __meta_DirectoryListingProto = Ref{ProtoMeta}()
function meta(::Type{DirectoryListingProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DirectoryListingProto)
            __meta_DirectoryListingProto[] = target = ProtoMeta(DirectoryListingProto)
            req = Symbol[:remainingEntries]
            allflds = Pair{Symbol,Union{Type,String}}[:partialListing => Base.Vector{HdfsFileStatusProto}, :remainingEntries => UInt32]
            meta(target, DirectoryListingProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DirectoryListingProto[]
    end
end
function Base.getproperty(obj::DirectoryListingProto, name::Symbol)
    if name === :partialListing
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{HdfsFileStatusProto}
    elseif name === :remainingEntries
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    else
        getfield(obj, name)
    end
end

mutable struct SnapshottableDirectoryStatusProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SnapshottableDirectoryStatusProto(; kwargs...)
        obj = new(meta(SnapshottableDirectoryStatusProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct SnapshottableDirectoryStatusProto
const __meta_SnapshottableDirectoryStatusProto = Ref{ProtoMeta}()
function meta(::Type{SnapshottableDirectoryStatusProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SnapshottableDirectoryStatusProto)
            __meta_SnapshottableDirectoryStatusProto[] = target = ProtoMeta(SnapshottableDirectoryStatusProto)
            req = Symbol[:dirStatus,:snapshot_quota,:snapshot_number,:parent_fullpath]
            allflds = Pair{Symbol,Union{Type,String}}[:dirStatus => HdfsFileStatusProto, :snapshot_quota => UInt32, :snapshot_number => UInt32, :parent_fullpath => Array{UInt8,1}]
            meta(target, SnapshottableDirectoryStatusProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SnapshottableDirectoryStatusProto[]
    end
end
function Base.getproperty(obj::SnapshottableDirectoryStatusProto, name::Symbol)
    if name === :dirStatus
        return (obj.__protobuf_jl_internal_values[name])::HdfsFileStatusProto
    elseif name === :snapshot_quota
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :snapshot_number
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :parent_fullpath
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    else
        getfield(obj, name)
    end
end

mutable struct SnapshottableDirectoryListingProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SnapshottableDirectoryListingProto(; kwargs...)
        obj = new(meta(SnapshottableDirectoryListingProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct SnapshottableDirectoryListingProto
const __meta_SnapshottableDirectoryListingProto = Ref{ProtoMeta}()
function meta(::Type{SnapshottableDirectoryListingProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SnapshottableDirectoryListingProto)
            __meta_SnapshottableDirectoryListingProto[] = target = ProtoMeta(SnapshottableDirectoryListingProto)
            allflds = Pair{Symbol,Union{Type,String}}[:snapshottableDirListing => Base.Vector{SnapshottableDirectoryStatusProto}]
            meta(target, SnapshottableDirectoryListingProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SnapshottableDirectoryListingProto[]
    end
end
function Base.getproperty(obj::SnapshottableDirectoryListingProto, name::Symbol)
    if name === :snapshottableDirListing
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{SnapshottableDirectoryStatusProto}
    else
        getfield(obj, name)
    end
end

mutable struct SnapshotDiffReportEntryProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SnapshotDiffReportEntryProto(; kwargs...)
        obj = new(meta(SnapshotDiffReportEntryProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct SnapshotDiffReportEntryProto
const __meta_SnapshotDiffReportEntryProto = Ref{ProtoMeta}()
function meta(::Type{SnapshotDiffReportEntryProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SnapshotDiffReportEntryProto)
            __meta_SnapshotDiffReportEntryProto[] = target = ProtoMeta(SnapshotDiffReportEntryProto)
            req = Symbol[:fullpath,:modificationLabel]
            allflds = Pair{Symbol,Union{Type,String}}[:fullpath => Array{UInt8,1}, :modificationLabel => AbstractString, :targetPath => Array{UInt8,1}]
            meta(target, SnapshotDiffReportEntryProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SnapshotDiffReportEntryProto[]
    end
end
function Base.getproperty(obj::SnapshotDiffReportEntryProto, name::Symbol)
    if name === :fullpath
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :modificationLabel
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :targetPath
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    else
        getfield(obj, name)
    end
end

mutable struct SnapshotDiffReportProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SnapshotDiffReportProto(; kwargs...)
        obj = new(meta(SnapshotDiffReportProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct SnapshotDiffReportProto
const __meta_SnapshotDiffReportProto = Ref{ProtoMeta}()
function meta(::Type{SnapshotDiffReportProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SnapshotDiffReportProto)
            __meta_SnapshotDiffReportProto[] = target = ProtoMeta(SnapshotDiffReportProto)
            req = Symbol[:snapshotRoot,:fromSnapshot,:toSnapshot]
            allflds = Pair{Symbol,Union{Type,String}}[:snapshotRoot => AbstractString, :fromSnapshot => AbstractString, :toSnapshot => AbstractString, :diffReportEntries => Base.Vector{SnapshotDiffReportEntryProto}]
            meta(target, SnapshotDiffReportProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SnapshotDiffReportProto[]
    end
end
function Base.getproperty(obj::SnapshotDiffReportProto, name::Symbol)
    if name === :snapshotRoot
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :fromSnapshot
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :toSnapshot
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :diffReportEntries
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{SnapshotDiffReportEntryProto}
    else
        getfield(obj, name)
    end
end

mutable struct BlockProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function BlockProto(; kwargs...)
        obj = new(meta(BlockProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct BlockProto
const __meta_BlockProto = Ref{ProtoMeta}()
function meta(::Type{BlockProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_BlockProto)
            __meta_BlockProto[] = target = ProtoMeta(BlockProto)
            req = Symbol[:blockId,:genStamp]
            val = Dict{Symbol,Any}(:numBytes => 0)
            allflds = Pair{Symbol,Union{Type,String}}[:blockId => UInt64, :genStamp => UInt64, :numBytes => UInt64]
            meta(target, BlockProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_BlockProto[]
    end
end
function Base.getproperty(obj::BlockProto, name::Symbol)
    if name === :blockId
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :genStamp
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :numBytes
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct SnapshotInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SnapshotInfoProto(; kwargs...)
        obj = new(meta(SnapshotInfoProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct SnapshotInfoProto
const __meta_SnapshotInfoProto = Ref{ProtoMeta}()
function meta(::Type{SnapshotInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SnapshotInfoProto)
            __meta_SnapshotInfoProto[] = target = ProtoMeta(SnapshotInfoProto)
            req = Symbol[:snapshotName,:snapshotRoot,:permission,:owner,:group,:createTime]
            allflds = Pair{Symbol,Union{Type,String}}[:snapshotName => AbstractString, :snapshotRoot => AbstractString, :permission => FsPermissionProto, :owner => AbstractString, :group => AbstractString, :createTime => AbstractString]
            meta(target, SnapshotInfoProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SnapshotInfoProto[]
    end
end
function Base.getproperty(obj::SnapshotInfoProto, name::Symbol)
    if name === :snapshotName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :snapshotRoot
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :permission
        return (obj.__protobuf_jl_internal_values[name])::FsPermissionProto
    elseif name === :owner
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :group
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :createTime
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct RollingUpgradeStatusProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RollingUpgradeStatusProto(; kwargs...)
        obj = new(meta(RollingUpgradeStatusProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RollingUpgradeStatusProto
const __meta_RollingUpgradeStatusProto = Ref{ProtoMeta}()
function meta(::Type{RollingUpgradeStatusProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RollingUpgradeStatusProto)
            __meta_RollingUpgradeStatusProto[] = target = ProtoMeta(RollingUpgradeStatusProto)
            req = Symbol[:blockPoolId]
            val = Dict{Symbol,Any}(:finalized => false)
            allflds = Pair{Symbol,Union{Type,String}}[:blockPoolId => AbstractString, :finalized => Bool]
            meta(target, RollingUpgradeStatusProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RollingUpgradeStatusProto[]
    end
end
function Base.getproperty(obj::RollingUpgradeStatusProto, name::Symbol)
    if name === :blockPoolId
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :finalized
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

export StorageTypeProto, CipherSuiteProto, CryptoProtocolVersionProto, ChecksumTypeProto, ExtendedBlockProto, DatanodeIDProto, DatanodeLocalInfoProto, DatanodeVolumeInfoProto, DatanodeInfosProto, DatanodeInfoProto_AdminState, DatanodeInfoProto, DatanodeStorageProto_StorageState, DatanodeStorageProto, StorageReportProto, ContentSummaryProto, QuotaUsageProto, StorageTypeQuotaInfosProto, StorageTypeQuotaInfoProto, CorruptFileBlocksProto, FsPermissionProto, StorageTypesProto, BlockStoragePolicyProto, LocatedBlockProto, DataEncryptionKeyProto, FileEncryptionInfoProto, PerFileEncryptionInfoProto, ZoneEncryptionInfoProto, CipherOptionProto, LocatedBlocksProto, HdfsFileStatusProto_FileType, HdfsFileStatusProto, FsServerDefaultsProto, DirectoryListingProto, SnapshottableDirectoryStatusProto, SnapshottableDirectoryListingProto, SnapshotDiffReportEntryProto, SnapshotDiffReportProto, BlockProto, SnapshotInfoProto, RollingUpgradeStatusProto
# COV_EXCL_STOP