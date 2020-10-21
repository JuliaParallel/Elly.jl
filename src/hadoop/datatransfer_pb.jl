# syntax: proto2
using ProtoBuf
import ProtoBuf.meta
import ..hadoop

const Status = (;[
    Symbol("SUCCESS") => Int32(0),
    Symbol("ERROR") => Int32(1),
    Symbol("ERROR_CHECKSUM") => Int32(2),
    Symbol("ERROR_INVALID") => Int32(3),
    Symbol("ERROR_EXISTS") => Int32(4),
    Symbol("ERROR_ACCESS_TOKEN") => Int32(5),
    Symbol("CHECKSUM_OK") => Int32(6),
    Symbol("ERROR_UNSUPPORTED") => Int32(7),
    Symbol("OOB_RESTART") => Int32(8),
    Symbol("OOB_RESERVED1") => Int32(9),
    Symbol("OOB_RESERVED2") => Int32(10),
    Symbol("OOB_RESERVED3") => Int32(11),
    Symbol("IN_PROGRESS") => Int32(12),
]...)

const ShortCircuitFdResponse = (;[
    Symbol("DO_NOT_USE_RECEIPT_VERIFICATION") => Int32(0),
    Symbol("USE_RECEIPT_VERIFICATION") => Int32(1),
]...)

mutable struct HandshakeSecretProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function HandshakeSecretProto(; kwargs...)
        obj = new(meta(HandshakeSecretProto), Dict{Symbol,Any}())
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
end # mutable struct HandshakeSecretProto
const __meta_HandshakeSecretProto = Ref{ProtoMeta}()
function meta(::Type{HandshakeSecretProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_HandshakeSecretProto)
            __meta_HandshakeSecretProto[] = target = ProtoMeta(HandshakeSecretProto)
            req = Symbol[:secret,:bpid]
            allflds = Pair{Symbol,Union{Type,String}}[:secret => Array{UInt8,1}, :bpid => AbstractString]
            meta(target, HandshakeSecretProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_HandshakeSecretProto[]
    end
end
function Base.getproperty(obj::HandshakeSecretProto, name::Symbol)
    if name === :secret
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :bpid
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

const DataTransferEncryptorMessageProto_DataTransferEncryptorStatus = (;[
    Symbol("SUCCESS") => Int32(0),
    Symbol("ERROR_UNKNOWN_KEY") => Int32(1),
    Symbol("ERROR") => Int32(2),
]...)

mutable struct DataTransferEncryptorMessageProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function DataTransferEncryptorMessageProto(; kwargs...)
        obj = new(meta(DataTransferEncryptorMessageProto), Dict{Symbol,Any}())
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
end # mutable struct DataTransferEncryptorMessageProto
const __meta_DataTransferEncryptorMessageProto = Ref{ProtoMeta}()
function meta(::Type{DataTransferEncryptorMessageProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DataTransferEncryptorMessageProto)
            __meta_DataTransferEncryptorMessageProto[] = target = ProtoMeta(DataTransferEncryptorMessageProto)
            req = Symbol[:status]
            allflds = Pair{Symbol,Union{Type,String}}[:status => Int32, :payload => Array{UInt8,1}, :message => AbstractString, :cipherOption => Base.Vector{CipherOptionProto}, :handshakeSecret => HandshakeSecretProto]
            meta(target, DataTransferEncryptorMessageProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DataTransferEncryptorMessageProto[]
    end
end
function Base.getproperty(obj::DataTransferEncryptorMessageProto, name::Symbol)
    if name === :status
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :payload
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :message
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :cipherOption
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{CipherOptionProto}
    elseif name === :handshakeSecret
        return (obj.__protobuf_jl_internal_values[name])::HandshakeSecretProto
    else
        getfield(obj, name)
    end
end

mutable struct DataTransferTraceInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function DataTransferTraceInfoProto(; kwargs...)
        obj = new(meta(DataTransferTraceInfoProto), Dict{Symbol,Any}())
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
end # mutable struct DataTransferTraceInfoProto
const __meta_DataTransferTraceInfoProto = Ref{ProtoMeta}()
function meta(::Type{DataTransferTraceInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DataTransferTraceInfoProto)
            __meta_DataTransferTraceInfoProto[] = target = ProtoMeta(DataTransferTraceInfoProto)
            req = Symbol[:traceId,:parentId]
            allflds = Pair{Symbol,Union{Type,String}}[:traceId => UInt64, :parentId => UInt64]
            meta(target, DataTransferTraceInfoProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DataTransferTraceInfoProto[]
    end
end
function Base.getproperty(obj::DataTransferTraceInfoProto, name::Symbol)
    if name === :traceId
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :parentId
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct BaseHeaderProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function BaseHeaderProto(; kwargs...)
        obj = new(meta(BaseHeaderProto), Dict{Symbol,Any}())
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
end # mutable struct BaseHeaderProto
const __meta_BaseHeaderProto = Ref{ProtoMeta}()
function meta(::Type{BaseHeaderProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_BaseHeaderProto)
            __meta_BaseHeaderProto[] = target = ProtoMeta(BaseHeaderProto)
            req = Symbol[:block]
            allflds = Pair{Symbol,Union{Type,String}}[:block => ExtendedBlockProto, :token => hadoop.common.TokenProto, :traceInfo => DataTransferTraceInfoProto]
            meta(target, BaseHeaderProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_BaseHeaderProto[]
    end
end
function Base.getproperty(obj::BaseHeaderProto, name::Symbol)
    if name === :block
        return (obj.__protobuf_jl_internal_values[name])::ExtendedBlockProto
    elseif name === :token
        return (obj.__protobuf_jl_internal_values[name])::hadoop.common.TokenProto
    elseif name === :traceInfo
        return (obj.__protobuf_jl_internal_values[name])::DataTransferTraceInfoProto
    else
        getfield(obj, name)
    end
end

mutable struct ClientOperationHeaderProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ClientOperationHeaderProto(; kwargs...)
        obj = new(meta(ClientOperationHeaderProto), Dict{Symbol,Any}())
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
end # mutable struct ClientOperationHeaderProto
const __meta_ClientOperationHeaderProto = Ref{ProtoMeta}()
function meta(::Type{ClientOperationHeaderProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ClientOperationHeaderProto)
            __meta_ClientOperationHeaderProto[] = target = ProtoMeta(ClientOperationHeaderProto)
            req = Symbol[:baseHeader,:clientName]
            allflds = Pair{Symbol,Union{Type,String}}[:baseHeader => BaseHeaderProto, :clientName => AbstractString]
            meta(target, ClientOperationHeaderProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ClientOperationHeaderProto[]
    end
end
function Base.getproperty(obj::ClientOperationHeaderProto, name::Symbol)
    if name === :baseHeader
        return (obj.__protobuf_jl_internal_values[name])::BaseHeaderProto
    elseif name === :clientName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct CachingStrategyProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CachingStrategyProto(; kwargs...)
        obj = new(meta(CachingStrategyProto), Dict{Symbol,Any}())
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
end # mutable struct CachingStrategyProto
const __meta_CachingStrategyProto = Ref{ProtoMeta}()
function meta(::Type{CachingStrategyProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CachingStrategyProto)
            __meta_CachingStrategyProto[] = target = ProtoMeta(CachingStrategyProto)
            allflds = Pair{Symbol,Union{Type,String}}[:dropBehind => Bool, :readahead => Int64]
            meta(target, CachingStrategyProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CachingStrategyProto[]
    end
end
function Base.getproperty(obj::CachingStrategyProto, name::Symbol)
    if name === :dropBehind
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :readahead
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct OpReadBlockProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function OpReadBlockProto(; kwargs...)
        obj = new(meta(OpReadBlockProto), Dict{Symbol,Any}())
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
end # mutable struct OpReadBlockProto
const __meta_OpReadBlockProto = Ref{ProtoMeta}()
function meta(::Type{OpReadBlockProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpReadBlockProto)
            __meta_OpReadBlockProto[] = target = ProtoMeta(OpReadBlockProto)
            req = Symbol[:header,:offset,:len]
            val = Dict{Symbol,Any}(:sendChecksums => true)
            allflds = Pair{Symbol,Union{Type,String}}[:header => ClientOperationHeaderProto, :offset => UInt64, :len => UInt64, :sendChecksums => Bool, :cachingStrategy => CachingStrategyProto]
            meta(target, OpReadBlockProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpReadBlockProto[]
    end
end
function Base.getproperty(obj::OpReadBlockProto, name::Symbol)
    if name === :header
        return (obj.__protobuf_jl_internal_values[name])::ClientOperationHeaderProto
    elseif name === :offset
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :len
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :sendChecksums
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :cachingStrategy
        return (obj.__protobuf_jl_internal_values[name])::CachingStrategyProto
    else
        getfield(obj, name)
    end
end

mutable struct ChecksumProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ChecksumProto(; kwargs...)
        obj = new(meta(ChecksumProto), Dict{Symbol,Any}())
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
end # mutable struct ChecksumProto
const __meta_ChecksumProto = Ref{ProtoMeta}()
function meta(::Type{ChecksumProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ChecksumProto)
            __meta_ChecksumProto[] = target = ProtoMeta(ChecksumProto)
            req = Symbol[:_type,:bytesPerChecksum]
            allflds = Pair{Symbol,Union{Type,String}}[:_type => Int32, :bytesPerChecksum => UInt32]
            meta(target, ChecksumProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ChecksumProto[]
    end
end
function Base.getproperty(obj::ChecksumProto, name::Symbol)
    if name === :_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :bytesPerChecksum
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    else
        getfield(obj, name)
    end
end

const OpWriteBlockProto_BlockConstructionStage = (;[
    Symbol("PIPELINE_SETUP_APPEND") => Int32(0),
    Symbol("PIPELINE_SETUP_APPEND_RECOVERY") => Int32(1),
    Symbol("DATA_STREAMING") => Int32(2),
    Symbol("PIPELINE_SETUP_STREAMING_RECOVERY") => Int32(3),
    Symbol("PIPELINE_CLOSE") => Int32(4),
    Symbol("PIPELINE_CLOSE_RECOVERY") => Int32(5),
    Symbol("PIPELINE_SETUP_CREATE") => Int32(6),
    Symbol("TRANSFER_RBW") => Int32(7),
    Symbol("TRANSFER_FINALIZED") => Int32(8),
]...)

mutable struct OpWriteBlockProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function OpWriteBlockProto(; kwargs...)
        obj = new(meta(OpWriteBlockProto), Dict{Symbol,Any}())
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
end # mutable struct OpWriteBlockProto
const __meta_OpWriteBlockProto = Ref{ProtoMeta}()
function meta(::Type{OpWriteBlockProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpWriteBlockProto)
            __meta_OpWriteBlockProto[] = target = ProtoMeta(OpWriteBlockProto)
            req = Symbol[:header,:stage,:pipelineSize,:minBytesRcvd,:maxBytesRcvd,:latestGenerationStamp,:requestedChecksum]
            val = Dict{Symbol,Any}(:storageType => StorageTypeProto.DISK, :allowLazyPersist => false, :pinning => false)
            allflds = Pair{Symbol,Union{Type,String}}[:header => ClientOperationHeaderProto, :targets => Base.Vector{DatanodeInfoProto}, :source => DatanodeInfoProto, :stage => Int32, :pipelineSize => UInt32, :minBytesRcvd => UInt64, :maxBytesRcvd => UInt64, :latestGenerationStamp => UInt64, :requestedChecksum => ChecksumProto, :cachingStrategy => CachingStrategyProto, :storageType => Int32, :targetStorageTypes => Base.Vector{Int32}, :allowLazyPersist => Bool, :pinning => Bool, :targetPinnings => Base.Vector{Bool}]
            meta(target, OpWriteBlockProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpWriteBlockProto[]
    end
end
function Base.getproperty(obj::OpWriteBlockProto, name::Symbol)
    if name === :header
        return (obj.__protobuf_jl_internal_values[name])::ClientOperationHeaderProto
    elseif name === :targets
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{DatanodeInfoProto}
    elseif name === :source
        return (obj.__protobuf_jl_internal_values[name])::DatanodeInfoProto
    elseif name === :stage
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :pipelineSize
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :minBytesRcvd
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :maxBytesRcvd
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :latestGenerationStamp
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :requestedChecksum
        return (obj.__protobuf_jl_internal_values[name])::ChecksumProto
    elseif name === :cachingStrategy
        return (obj.__protobuf_jl_internal_values[name])::CachingStrategyProto
    elseif name === :storageType
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :targetStorageTypes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    elseif name === :allowLazyPersist
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :pinning
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :targetPinnings
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Bool}
    else
        getfield(obj, name)
    end
end

mutable struct OpTransferBlockProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function OpTransferBlockProto(; kwargs...)
        obj = new(meta(OpTransferBlockProto), Dict{Symbol,Any}())
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
end # mutable struct OpTransferBlockProto
const __meta_OpTransferBlockProto = Ref{ProtoMeta}()
function meta(::Type{OpTransferBlockProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpTransferBlockProto)
            __meta_OpTransferBlockProto[] = target = ProtoMeta(OpTransferBlockProto)
            req = Symbol[:header]
            allflds = Pair{Symbol,Union{Type,String}}[:header => ClientOperationHeaderProto, :targets => Base.Vector{DatanodeInfoProto}, :targetStorageTypes => Base.Vector{Int32}]
            meta(target, OpTransferBlockProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpTransferBlockProto[]
    end
end
function Base.getproperty(obj::OpTransferBlockProto, name::Symbol)
    if name === :header
        return (obj.__protobuf_jl_internal_values[name])::ClientOperationHeaderProto
    elseif name === :targets
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{DatanodeInfoProto}
    elseif name === :targetStorageTypes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    else
        getfield(obj, name)
    end
end

mutable struct OpReplaceBlockProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function OpReplaceBlockProto(; kwargs...)
        obj = new(meta(OpReplaceBlockProto), Dict{Symbol,Any}())
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
end # mutable struct OpReplaceBlockProto
const __meta_OpReplaceBlockProto = Ref{ProtoMeta}()
function meta(::Type{OpReplaceBlockProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpReplaceBlockProto)
            __meta_OpReplaceBlockProto[] = target = ProtoMeta(OpReplaceBlockProto)
            req = Symbol[:header,:delHint,:source]
            val = Dict{Symbol,Any}(:storageType => StorageTypeProto.DISK)
            allflds = Pair{Symbol,Union{Type,String}}[:header => BaseHeaderProto, :delHint => AbstractString, :source => DatanodeInfoProto, :storageType => Int32]
            meta(target, OpReplaceBlockProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpReplaceBlockProto[]
    end
end
function Base.getproperty(obj::OpReplaceBlockProto, name::Symbol)
    if name === :header
        return (obj.__protobuf_jl_internal_values[name])::BaseHeaderProto
    elseif name === :delHint
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :source
        return (obj.__protobuf_jl_internal_values[name])::DatanodeInfoProto
    elseif name === :storageType
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct OpCopyBlockProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function OpCopyBlockProto(; kwargs...)
        obj = new(meta(OpCopyBlockProto), Dict{Symbol,Any}())
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
end # mutable struct OpCopyBlockProto
const __meta_OpCopyBlockProto = Ref{ProtoMeta}()
function meta(::Type{OpCopyBlockProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpCopyBlockProto)
            __meta_OpCopyBlockProto[] = target = ProtoMeta(OpCopyBlockProto)
            req = Symbol[:header]
            allflds = Pair{Symbol,Union{Type,String}}[:header => BaseHeaderProto]
            meta(target, OpCopyBlockProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpCopyBlockProto[]
    end
end
function Base.getproperty(obj::OpCopyBlockProto, name::Symbol)
    if name === :header
        return (obj.__protobuf_jl_internal_values[name])::BaseHeaderProto
    else
        getfield(obj, name)
    end
end

mutable struct OpBlockChecksumProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function OpBlockChecksumProto(; kwargs...)
        obj = new(meta(OpBlockChecksumProto), Dict{Symbol,Any}())
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
end # mutable struct OpBlockChecksumProto
const __meta_OpBlockChecksumProto = Ref{ProtoMeta}()
function meta(::Type{OpBlockChecksumProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpBlockChecksumProto)
            __meta_OpBlockChecksumProto[] = target = ProtoMeta(OpBlockChecksumProto)
            req = Symbol[:header]
            allflds = Pair{Symbol,Union{Type,String}}[:header => BaseHeaderProto]
            meta(target, OpBlockChecksumProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpBlockChecksumProto[]
    end
end
function Base.getproperty(obj::OpBlockChecksumProto, name::Symbol)
    if name === :header
        return (obj.__protobuf_jl_internal_values[name])::BaseHeaderProto
    else
        getfield(obj, name)
    end
end

mutable struct ShortCircuitShmIdProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ShortCircuitShmIdProto(; kwargs...)
        obj = new(meta(ShortCircuitShmIdProto), Dict{Symbol,Any}())
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
end # mutable struct ShortCircuitShmIdProto
const __meta_ShortCircuitShmIdProto = Ref{ProtoMeta}()
function meta(::Type{ShortCircuitShmIdProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ShortCircuitShmIdProto)
            __meta_ShortCircuitShmIdProto[] = target = ProtoMeta(ShortCircuitShmIdProto)
            req = Symbol[:hi,:lo]
            allflds = Pair{Symbol,Union{Type,String}}[:hi => Int64, :lo => Int64]
            meta(target, ShortCircuitShmIdProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ShortCircuitShmIdProto[]
    end
end
function Base.getproperty(obj::ShortCircuitShmIdProto, name::Symbol)
    if name === :hi
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :lo
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct ShortCircuitShmSlotProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ShortCircuitShmSlotProto(; kwargs...)
        obj = new(meta(ShortCircuitShmSlotProto), Dict{Symbol,Any}())
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
end # mutable struct ShortCircuitShmSlotProto
const __meta_ShortCircuitShmSlotProto = Ref{ProtoMeta}()
function meta(::Type{ShortCircuitShmSlotProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ShortCircuitShmSlotProto)
            __meta_ShortCircuitShmSlotProto[] = target = ProtoMeta(ShortCircuitShmSlotProto)
            req = Symbol[:shmId,:slotIdx]
            allflds = Pair{Symbol,Union{Type,String}}[:shmId => ShortCircuitShmIdProto, :slotIdx => Int32]
            meta(target, ShortCircuitShmSlotProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ShortCircuitShmSlotProto[]
    end
end
function Base.getproperty(obj::ShortCircuitShmSlotProto, name::Symbol)
    if name === :shmId
        return (obj.__protobuf_jl_internal_values[name])::ShortCircuitShmIdProto
    elseif name === :slotIdx
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct OpRequestShortCircuitAccessProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function OpRequestShortCircuitAccessProto(; kwargs...)
        obj = new(meta(OpRequestShortCircuitAccessProto), Dict{Symbol,Any}())
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
end # mutable struct OpRequestShortCircuitAccessProto
const __meta_OpRequestShortCircuitAccessProto = Ref{ProtoMeta}()
function meta(::Type{OpRequestShortCircuitAccessProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpRequestShortCircuitAccessProto)
            __meta_OpRequestShortCircuitAccessProto[] = target = ProtoMeta(OpRequestShortCircuitAccessProto)
            req = Symbol[:header,:maxVersion]
            val = Dict{Symbol,Any}(:supportsReceiptVerification => false)
            allflds = Pair{Symbol,Union{Type,String}}[:header => BaseHeaderProto, :maxVersion => UInt32, :slotId => ShortCircuitShmSlotProto, :supportsReceiptVerification => Bool]
            meta(target, OpRequestShortCircuitAccessProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpRequestShortCircuitAccessProto[]
    end
end
function Base.getproperty(obj::OpRequestShortCircuitAccessProto, name::Symbol)
    if name === :header
        return (obj.__protobuf_jl_internal_values[name])::BaseHeaderProto
    elseif name === :maxVersion
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :slotId
        return (obj.__protobuf_jl_internal_values[name])::ShortCircuitShmSlotProto
    elseif name === :supportsReceiptVerification
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct ReleaseShortCircuitAccessRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReleaseShortCircuitAccessRequestProto(; kwargs...)
        obj = new(meta(ReleaseShortCircuitAccessRequestProto), Dict{Symbol,Any}())
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
end # mutable struct ReleaseShortCircuitAccessRequestProto
const __meta_ReleaseShortCircuitAccessRequestProto = Ref{ProtoMeta}()
function meta(::Type{ReleaseShortCircuitAccessRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReleaseShortCircuitAccessRequestProto)
            __meta_ReleaseShortCircuitAccessRequestProto[] = target = ProtoMeta(ReleaseShortCircuitAccessRequestProto)
            req = Symbol[:slotId]
            allflds = Pair{Symbol,Union{Type,String}}[:slotId => ShortCircuitShmSlotProto, :traceInfo => DataTransferTraceInfoProto]
            meta(target, ReleaseShortCircuitAccessRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReleaseShortCircuitAccessRequestProto[]
    end
end
function Base.getproperty(obj::ReleaseShortCircuitAccessRequestProto, name::Symbol)
    if name === :slotId
        return (obj.__protobuf_jl_internal_values[name])::ShortCircuitShmSlotProto
    elseif name === :traceInfo
        return (obj.__protobuf_jl_internal_values[name])::DataTransferTraceInfoProto
    else
        getfield(obj, name)
    end
end

mutable struct ReleaseShortCircuitAccessResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReleaseShortCircuitAccessResponseProto(; kwargs...)
        obj = new(meta(ReleaseShortCircuitAccessResponseProto), Dict{Symbol,Any}())
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
end # mutable struct ReleaseShortCircuitAccessResponseProto
const __meta_ReleaseShortCircuitAccessResponseProto = Ref{ProtoMeta}()
function meta(::Type{ReleaseShortCircuitAccessResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReleaseShortCircuitAccessResponseProto)
            __meta_ReleaseShortCircuitAccessResponseProto[] = target = ProtoMeta(ReleaseShortCircuitAccessResponseProto)
            req = Symbol[:status]
            allflds = Pair{Symbol,Union{Type,String}}[:status => Int32, :error => AbstractString]
            meta(target, ReleaseShortCircuitAccessResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReleaseShortCircuitAccessResponseProto[]
    end
end
function Base.getproperty(obj::ReleaseShortCircuitAccessResponseProto, name::Symbol)
    if name === :status
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :error
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct ShortCircuitShmRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ShortCircuitShmRequestProto(; kwargs...)
        obj = new(meta(ShortCircuitShmRequestProto), Dict{Symbol,Any}())
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
end # mutable struct ShortCircuitShmRequestProto
const __meta_ShortCircuitShmRequestProto = Ref{ProtoMeta}()
function meta(::Type{ShortCircuitShmRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ShortCircuitShmRequestProto)
            __meta_ShortCircuitShmRequestProto[] = target = ProtoMeta(ShortCircuitShmRequestProto)
            req = Symbol[:clientName]
            allflds = Pair{Symbol,Union{Type,String}}[:clientName => AbstractString, :traceInfo => DataTransferTraceInfoProto]
            meta(target, ShortCircuitShmRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ShortCircuitShmRequestProto[]
    end
end
function Base.getproperty(obj::ShortCircuitShmRequestProto, name::Symbol)
    if name === :clientName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :traceInfo
        return (obj.__protobuf_jl_internal_values[name])::DataTransferTraceInfoProto
    else
        getfield(obj, name)
    end
end

mutable struct ShortCircuitShmResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ShortCircuitShmResponseProto(; kwargs...)
        obj = new(meta(ShortCircuitShmResponseProto), Dict{Symbol,Any}())
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
end # mutable struct ShortCircuitShmResponseProto
const __meta_ShortCircuitShmResponseProto = Ref{ProtoMeta}()
function meta(::Type{ShortCircuitShmResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ShortCircuitShmResponseProto)
            __meta_ShortCircuitShmResponseProto[] = target = ProtoMeta(ShortCircuitShmResponseProto)
            req = Symbol[:status]
            allflds = Pair{Symbol,Union{Type,String}}[:status => Int32, :error => AbstractString, :id => ShortCircuitShmIdProto]
            meta(target, ShortCircuitShmResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ShortCircuitShmResponseProto[]
    end
end
function Base.getproperty(obj::ShortCircuitShmResponseProto, name::Symbol)
    if name === :status
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :error
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :id
        return (obj.__protobuf_jl_internal_values[name])::ShortCircuitShmIdProto
    else
        getfield(obj, name)
    end
end

mutable struct PacketHeaderProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function PacketHeaderProto(; kwargs...)
        obj = new(meta(PacketHeaderProto), Dict{Symbol,Any}())
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
end # mutable struct PacketHeaderProto
const __meta_PacketHeaderProto = Ref{ProtoMeta}()
function meta(::Type{PacketHeaderProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_PacketHeaderProto)
            __meta_PacketHeaderProto[] = target = ProtoMeta(PacketHeaderProto)
            req = Symbol[:offsetInBlock,:seqno,:lastPacketInBlock,:dataLen]
            val = Dict{Symbol,Any}(:syncBlock => false)
            wtype = Dict(:offsetInBlock => :sfixed64, :seqno => :sfixed64, :dataLen => :sfixed32)
            allflds = Pair{Symbol,Union{Type,String}}[:offsetInBlock => Int64, :seqno => Int64, :lastPacketInBlock => Bool, :dataLen => Int32, :syncBlock => Bool]
            meta(target, PacketHeaderProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, wtype, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_PacketHeaderProto[]
    end
end
function Base.getproperty(obj::PacketHeaderProto, name::Symbol)
    if name === :offsetInBlock
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :seqno
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :lastPacketInBlock
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :dataLen
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :syncBlock
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct PipelineAckProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function PipelineAckProto(; kwargs...)
        obj = new(meta(PipelineAckProto), Dict{Symbol,Any}())
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
end # mutable struct PipelineAckProto
const __meta_PipelineAckProto = Ref{ProtoMeta}()
function meta(::Type{PipelineAckProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_PipelineAckProto)
            __meta_PipelineAckProto[] = target = ProtoMeta(PipelineAckProto)
            req = Symbol[:seqno]
            val = Dict{Symbol,Any}(:downstreamAckTimeNanos => 0)
            pack = Symbol[:flag]
            wtype = Dict(:seqno => :sint64)
            allflds = Pair{Symbol,Union{Type,String}}[:seqno => Int64, :reply => Base.Vector{Int32}, :downstreamAckTimeNanos => UInt64, :flag => Base.Vector{UInt32}]
            meta(target, PipelineAckProto, allflds, req, ProtoBuf.DEF_FNUM, val, pack, wtype, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_PipelineAckProto[]
    end
end
function Base.getproperty(obj::PipelineAckProto, name::Symbol)
    if name === :seqno
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :reply
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    elseif name === :downstreamAckTimeNanos
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :flag
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{UInt32}
    else
        getfield(obj, name)
    end
end

mutable struct ReadOpChecksumInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReadOpChecksumInfoProto(; kwargs...)
        obj = new(meta(ReadOpChecksumInfoProto), Dict{Symbol,Any}())
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
end # mutable struct ReadOpChecksumInfoProto
const __meta_ReadOpChecksumInfoProto = Ref{ProtoMeta}()
function meta(::Type{ReadOpChecksumInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReadOpChecksumInfoProto)
            __meta_ReadOpChecksumInfoProto[] = target = ProtoMeta(ReadOpChecksumInfoProto)
            req = Symbol[:checksum,:chunkOffset]
            allflds = Pair{Symbol,Union{Type,String}}[:checksum => ChecksumProto, :chunkOffset => UInt64]
            meta(target, ReadOpChecksumInfoProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReadOpChecksumInfoProto[]
    end
end
function Base.getproperty(obj::ReadOpChecksumInfoProto, name::Symbol)
    if name === :checksum
        return (obj.__protobuf_jl_internal_values[name])::ChecksumProto
    elseif name === :chunkOffset
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct ClientReadStatusProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ClientReadStatusProto(; kwargs...)
        obj = new(meta(ClientReadStatusProto), Dict{Symbol,Any}())
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
end # mutable struct ClientReadStatusProto
const __meta_ClientReadStatusProto = Ref{ProtoMeta}()
function meta(::Type{ClientReadStatusProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ClientReadStatusProto)
            __meta_ClientReadStatusProto[] = target = ProtoMeta(ClientReadStatusProto)
            req = Symbol[:status]
            allflds = Pair{Symbol,Union{Type,String}}[:status => Int32]
            meta(target, ClientReadStatusProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ClientReadStatusProto[]
    end
end
function Base.getproperty(obj::ClientReadStatusProto, name::Symbol)
    if name === :status
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct DNTransferAckProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function DNTransferAckProto(; kwargs...)
        obj = new(meta(DNTransferAckProto), Dict{Symbol,Any}())
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
end # mutable struct DNTransferAckProto
const __meta_DNTransferAckProto = Ref{ProtoMeta}()
function meta(::Type{DNTransferAckProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DNTransferAckProto)
            __meta_DNTransferAckProto[] = target = ProtoMeta(DNTransferAckProto)
            req = Symbol[:status]
            allflds = Pair{Symbol,Union{Type,String}}[:status => Int32]
            meta(target, DNTransferAckProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DNTransferAckProto[]
    end
end
function Base.getproperty(obj::DNTransferAckProto, name::Symbol)
    if name === :status
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct OpBlockChecksumResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function OpBlockChecksumResponseProto(; kwargs...)
        obj = new(meta(OpBlockChecksumResponseProto), Dict{Symbol,Any}())
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
end # mutable struct OpBlockChecksumResponseProto
const __meta_OpBlockChecksumResponseProto = Ref{ProtoMeta}()
function meta(::Type{OpBlockChecksumResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpBlockChecksumResponseProto)
            __meta_OpBlockChecksumResponseProto[] = target = ProtoMeta(OpBlockChecksumResponseProto)
            req = Symbol[:bytesPerCrc,:crcPerBlock,:md5]
            allflds = Pair{Symbol,Union{Type,String}}[:bytesPerCrc => UInt32, :crcPerBlock => UInt64, :md5 => Array{UInt8,1}, :crcType => Int32]
            meta(target, OpBlockChecksumResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpBlockChecksumResponseProto[]
    end
end
function Base.getproperty(obj::OpBlockChecksumResponseProto, name::Symbol)
    if name === :bytesPerCrc
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :crcPerBlock
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :md5
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :crcType
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct BlockOpResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function BlockOpResponseProto(; kwargs...)
        obj = new(meta(BlockOpResponseProto), Dict{Symbol,Any}())
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
end # mutable struct BlockOpResponseProto
const __meta_BlockOpResponseProto = Ref{ProtoMeta}()
function meta(::Type{BlockOpResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_BlockOpResponseProto)
            __meta_BlockOpResponseProto[] = target = ProtoMeta(BlockOpResponseProto)
            req = Symbol[:status]
            allflds = Pair{Symbol,Union{Type,String}}[:status => Int32, :firstBadLink => AbstractString, :checksumResponse => OpBlockChecksumResponseProto, :readOpChecksumInfo => ReadOpChecksumInfoProto, :message => AbstractString, :shortCircuitAccessVersion => UInt32]
            meta(target, BlockOpResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_BlockOpResponseProto[]
    end
end
function Base.getproperty(obj::BlockOpResponseProto, name::Symbol)
    if name === :status
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :firstBadLink
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :checksumResponse
        return (obj.__protobuf_jl_internal_values[name])::OpBlockChecksumResponseProto
    elseif name === :readOpChecksumInfo
        return (obj.__protobuf_jl_internal_values[name])::ReadOpChecksumInfoProto
    elseif name === :message
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :shortCircuitAccessVersion
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    else
        getfield(obj, name)
    end
end

mutable struct OpCustomProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function OpCustomProto(; kwargs...)
        obj = new(meta(OpCustomProto), Dict{Symbol,Any}())
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
end # mutable struct OpCustomProto
const __meta_OpCustomProto = Ref{ProtoMeta}()
function meta(::Type{OpCustomProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpCustomProto)
            __meta_OpCustomProto[] = target = ProtoMeta(OpCustomProto)
            req = Symbol[:customId]
            allflds = Pair{Symbol,Union{Type,String}}[:customId => AbstractString]
            meta(target, OpCustomProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpCustomProto[]
    end
end
function Base.getproperty(obj::OpCustomProto, name::Symbol)
    if name === :customId
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

export Status, ShortCircuitFdResponse, DataTransferEncryptorMessageProto_DataTransferEncryptorStatus, DataTransferEncryptorMessageProto, HandshakeSecretProto, BaseHeaderProto, DataTransferTraceInfoProto, ClientOperationHeaderProto, CachingStrategyProto, OpReadBlockProto, ChecksumProto, OpWriteBlockProto_BlockConstructionStage, OpWriteBlockProto, OpTransferBlockProto, OpReplaceBlockProto, OpCopyBlockProto, OpBlockChecksumProto, ShortCircuitShmIdProto, ShortCircuitShmSlotProto, OpRequestShortCircuitAccessProto, ReleaseShortCircuitAccessRequestProto, ReleaseShortCircuitAccessResponseProto, ShortCircuitShmRequestProto, ShortCircuitShmResponseProto, PacketHeaderProto, PipelineAckProto, ReadOpChecksumInfoProto, BlockOpResponseProto, ClientReadStatusProto, DNTransferAckProto, OpBlockChecksumResponseProto, OpCustomProto
