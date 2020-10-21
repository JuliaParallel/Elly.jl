# syntax: proto2
using ProtoBuf
import ProtoBuf.meta
import ..hadoop

const CreateFlagProto = (;[
    Symbol("CREATE") => Int32(1),
    Symbol("OVERWRITE") => Int32(2),
    Symbol("APPEND") => Int32(4),
    Symbol("LAZY_PERSIST") => Int32(16),
    Symbol("NEW_BLOCK") => Int32(32),
]...)

const AddBlockFlagProto = (;[
    Symbol("NO_LOCAL_WRITE") => Int32(1),
]...)

const DatanodeReportTypeProto = (;[
    Symbol("ALL") => Int32(1),
    Symbol("LIVE") => Int32(2),
    Symbol("DEAD") => Int32(3),
    Symbol("DECOMMISSIONING") => Int32(4),
    Symbol("ENTERING_MAINTENANCE") => Int32(5),
    Symbol("IN_MAINTENANCE") => Int32(6),
]...)

const SafeModeActionProto = (;[
    Symbol("SAFEMODE_LEAVE") => Int32(1),
    Symbol("SAFEMODE_ENTER") => Int32(2),
    Symbol("SAFEMODE_GET") => Int32(3),
    Symbol("SAFEMODE_FORCE_EXIT") => Int32(4),
]...)

const RollingUpgradeActionProto = (;[
    Symbol("QUERY") => Int32(1),
    Symbol("START") => Int32(2),
    Symbol("FINALIZE") => Int32(3),
]...)

const CacheFlagProto = (;[
    Symbol("FORCE") => Int32(1),
]...)

mutable struct GetBlockLocationsRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetBlockLocationsRequestProto(; kwargs...)
        obj = new(meta(GetBlockLocationsRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetBlockLocationsRequestProto
const __meta_GetBlockLocationsRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetBlockLocationsRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetBlockLocationsRequestProto)
            __meta_GetBlockLocationsRequestProto[] = target = ProtoMeta(GetBlockLocationsRequestProto)
            req = Symbol[:src,:offset,:length]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :offset => UInt64, :length => UInt64]
            meta(target, GetBlockLocationsRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetBlockLocationsRequestProto[]
    end
end
function Base.getproperty(obj::GetBlockLocationsRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :offset
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :length
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct GetBlockLocationsResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetBlockLocationsResponseProto(; kwargs...)
        obj = new(meta(GetBlockLocationsResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetBlockLocationsResponseProto
const __meta_GetBlockLocationsResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetBlockLocationsResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetBlockLocationsResponseProto)
            __meta_GetBlockLocationsResponseProto[] = target = ProtoMeta(GetBlockLocationsResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:locations => LocatedBlocksProto]
            meta(target, GetBlockLocationsResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetBlockLocationsResponseProto[]
    end
end
function Base.getproperty(obj::GetBlockLocationsResponseProto, name::Symbol)
    if name === :locations
        return (obj.__protobuf_jl_internal_values[name])::LocatedBlocksProto
    else
        getfield(obj, name)
    end
end

mutable struct GetServerDefaultsRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetServerDefaultsRequestProto(; kwargs...)
        obj = new(meta(GetServerDefaultsRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetServerDefaultsRequestProto
const __meta_GetServerDefaultsRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetServerDefaultsRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetServerDefaultsRequestProto)
            __meta_GetServerDefaultsRequestProto[] = target = ProtoMeta(GetServerDefaultsRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, GetServerDefaultsRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetServerDefaultsRequestProto[]
    end
end

mutable struct GetServerDefaultsResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetServerDefaultsResponseProto(; kwargs...)
        obj = new(meta(GetServerDefaultsResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetServerDefaultsResponseProto
const __meta_GetServerDefaultsResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetServerDefaultsResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetServerDefaultsResponseProto)
            __meta_GetServerDefaultsResponseProto[] = target = ProtoMeta(GetServerDefaultsResponseProto)
            req = Symbol[:serverDefaults]
            allflds = Pair{Symbol,Union{Type,String}}[:serverDefaults => FsServerDefaultsProto]
            meta(target, GetServerDefaultsResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetServerDefaultsResponseProto[]
    end
end
function Base.getproperty(obj::GetServerDefaultsResponseProto, name::Symbol)
    if name === :serverDefaults
        return (obj.__protobuf_jl_internal_values[name])::FsServerDefaultsProto
    else
        getfield(obj, name)
    end
end

mutable struct CreateRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CreateRequestProto(; kwargs...)
        obj = new(meta(CreateRequestProto), Dict{Symbol,Any}())
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
end # mutable struct CreateRequestProto
const __meta_CreateRequestProto = Ref{ProtoMeta}()
function meta(::Type{CreateRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CreateRequestProto)
            __meta_CreateRequestProto[] = target = ProtoMeta(CreateRequestProto)
            req = Symbol[:src,:masked,:clientName,:createFlag,:createParent,:replication,:blockSize]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :masked => FsPermissionProto, :clientName => AbstractString, :createFlag => UInt32, :createParent => Bool, :replication => UInt32, :blockSize => UInt64, :cryptoProtocolVersion => Base.Vector{Int32}]
            meta(target, CreateRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CreateRequestProto[]
    end
end
function Base.getproperty(obj::CreateRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :masked
        return (obj.__protobuf_jl_internal_values[name])::FsPermissionProto
    elseif name === :clientName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :createFlag
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :createParent
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :replication
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :blockSize
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :cryptoProtocolVersion
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    else
        getfield(obj, name)
    end
end

mutable struct CreateResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CreateResponseProto(; kwargs...)
        obj = new(meta(CreateResponseProto), Dict{Symbol,Any}())
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
end # mutable struct CreateResponseProto
const __meta_CreateResponseProto = Ref{ProtoMeta}()
function meta(::Type{CreateResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CreateResponseProto)
            __meta_CreateResponseProto[] = target = ProtoMeta(CreateResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:fs => HdfsFileStatusProto]
            meta(target, CreateResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CreateResponseProto[]
    end
end
function Base.getproperty(obj::CreateResponseProto, name::Symbol)
    if name === :fs
        return (obj.__protobuf_jl_internal_values[name])::HdfsFileStatusProto
    else
        getfield(obj, name)
    end
end

mutable struct AppendRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function AppendRequestProto(; kwargs...)
        obj = new(meta(AppendRequestProto), Dict{Symbol,Any}())
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
end # mutable struct AppendRequestProto
const __meta_AppendRequestProto = Ref{ProtoMeta}()
function meta(::Type{AppendRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AppendRequestProto)
            __meta_AppendRequestProto[] = target = ProtoMeta(AppendRequestProto)
            req = Symbol[:src,:clientName]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :clientName => AbstractString, :flag => UInt32]
            meta(target, AppendRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AppendRequestProto[]
    end
end
function Base.getproperty(obj::AppendRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :clientName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :flag
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    else
        getfield(obj, name)
    end
end

mutable struct AppendResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function AppendResponseProto(; kwargs...)
        obj = new(meta(AppendResponseProto), Dict{Symbol,Any}())
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
end # mutable struct AppendResponseProto
const __meta_AppendResponseProto = Ref{ProtoMeta}()
function meta(::Type{AppendResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AppendResponseProto)
            __meta_AppendResponseProto[] = target = ProtoMeta(AppendResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:block => LocatedBlockProto, :stat => HdfsFileStatusProto]
            meta(target, AppendResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AppendResponseProto[]
    end
end
function Base.getproperty(obj::AppendResponseProto, name::Symbol)
    if name === :block
        return (obj.__protobuf_jl_internal_values[name])::LocatedBlockProto
    elseif name === :stat
        return (obj.__protobuf_jl_internal_values[name])::HdfsFileStatusProto
    else
        getfield(obj, name)
    end
end

mutable struct SetReplicationRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SetReplicationRequestProto(; kwargs...)
        obj = new(meta(SetReplicationRequestProto), Dict{Symbol,Any}())
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
end # mutable struct SetReplicationRequestProto
const __meta_SetReplicationRequestProto = Ref{ProtoMeta}()
function meta(::Type{SetReplicationRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetReplicationRequestProto)
            __meta_SetReplicationRequestProto[] = target = ProtoMeta(SetReplicationRequestProto)
            req = Symbol[:src,:replication]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :replication => UInt32]
            meta(target, SetReplicationRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetReplicationRequestProto[]
    end
end
function Base.getproperty(obj::SetReplicationRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :replication
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    else
        getfield(obj, name)
    end
end

mutable struct SetReplicationResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SetReplicationResponseProto(; kwargs...)
        obj = new(meta(SetReplicationResponseProto), Dict{Symbol,Any}())
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
end # mutable struct SetReplicationResponseProto
const __meta_SetReplicationResponseProto = Ref{ProtoMeta}()
function meta(::Type{SetReplicationResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetReplicationResponseProto)
            __meta_SetReplicationResponseProto[] = target = ProtoMeta(SetReplicationResponseProto)
            req = Symbol[:result]
            allflds = Pair{Symbol,Union{Type,String}}[:result => Bool]
            meta(target, SetReplicationResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetReplicationResponseProto[]
    end
end
function Base.getproperty(obj::SetReplicationResponseProto, name::Symbol)
    if name === :result
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct SetStoragePolicyRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SetStoragePolicyRequestProto(; kwargs...)
        obj = new(meta(SetStoragePolicyRequestProto), Dict{Symbol,Any}())
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
end # mutable struct SetStoragePolicyRequestProto
const __meta_SetStoragePolicyRequestProto = Ref{ProtoMeta}()
function meta(::Type{SetStoragePolicyRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetStoragePolicyRequestProto)
            __meta_SetStoragePolicyRequestProto[] = target = ProtoMeta(SetStoragePolicyRequestProto)
            req = Symbol[:src,:policyName]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :policyName => AbstractString]
            meta(target, SetStoragePolicyRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetStoragePolicyRequestProto[]
    end
end
function Base.getproperty(obj::SetStoragePolicyRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :policyName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct SetStoragePolicyResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SetStoragePolicyResponseProto(; kwargs...)
        obj = new(meta(SetStoragePolicyResponseProto), Dict{Symbol,Any}())
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
end # mutable struct SetStoragePolicyResponseProto
const __meta_SetStoragePolicyResponseProto = Ref{ProtoMeta}()
function meta(::Type{SetStoragePolicyResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetStoragePolicyResponseProto)
            __meta_SetStoragePolicyResponseProto[] = target = ProtoMeta(SetStoragePolicyResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, SetStoragePolicyResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetStoragePolicyResponseProto[]
    end
end

mutable struct UnsetStoragePolicyRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UnsetStoragePolicyRequestProto(; kwargs...)
        obj = new(meta(UnsetStoragePolicyRequestProto), Dict{Symbol,Any}())
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
end # mutable struct UnsetStoragePolicyRequestProto
const __meta_UnsetStoragePolicyRequestProto = Ref{ProtoMeta}()
function meta(::Type{UnsetStoragePolicyRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UnsetStoragePolicyRequestProto)
            __meta_UnsetStoragePolicyRequestProto[] = target = ProtoMeta(UnsetStoragePolicyRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString]
            meta(target, UnsetStoragePolicyRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UnsetStoragePolicyRequestProto[]
    end
end
function Base.getproperty(obj::UnsetStoragePolicyRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct UnsetStoragePolicyResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UnsetStoragePolicyResponseProto(; kwargs...)
        obj = new(meta(UnsetStoragePolicyResponseProto), Dict{Symbol,Any}())
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
end # mutable struct UnsetStoragePolicyResponseProto
const __meta_UnsetStoragePolicyResponseProto = Ref{ProtoMeta}()
function meta(::Type{UnsetStoragePolicyResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UnsetStoragePolicyResponseProto)
            __meta_UnsetStoragePolicyResponseProto[] = target = ProtoMeta(UnsetStoragePolicyResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, UnsetStoragePolicyResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UnsetStoragePolicyResponseProto[]
    end
end

mutable struct GetStoragePolicyRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetStoragePolicyRequestProto(; kwargs...)
        obj = new(meta(GetStoragePolicyRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetStoragePolicyRequestProto
const __meta_GetStoragePolicyRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetStoragePolicyRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetStoragePolicyRequestProto)
            __meta_GetStoragePolicyRequestProto[] = target = ProtoMeta(GetStoragePolicyRequestProto)
            req = Symbol[:path]
            allflds = Pair{Symbol,Union{Type,String}}[:path => AbstractString]
            meta(target, GetStoragePolicyRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetStoragePolicyRequestProto[]
    end
end
function Base.getproperty(obj::GetStoragePolicyRequestProto, name::Symbol)
    if name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct GetStoragePolicyResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetStoragePolicyResponseProto(; kwargs...)
        obj = new(meta(GetStoragePolicyResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetStoragePolicyResponseProto
const __meta_GetStoragePolicyResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetStoragePolicyResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetStoragePolicyResponseProto)
            __meta_GetStoragePolicyResponseProto[] = target = ProtoMeta(GetStoragePolicyResponseProto)
            req = Symbol[:storagePolicy]
            allflds = Pair{Symbol,Union{Type,String}}[:storagePolicy => BlockStoragePolicyProto]
            meta(target, GetStoragePolicyResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetStoragePolicyResponseProto[]
    end
end
function Base.getproperty(obj::GetStoragePolicyResponseProto, name::Symbol)
    if name === :storagePolicy
        return (obj.__protobuf_jl_internal_values[name])::BlockStoragePolicyProto
    else
        getfield(obj, name)
    end
end

mutable struct GetStoragePoliciesRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetStoragePoliciesRequestProto(; kwargs...)
        obj = new(meta(GetStoragePoliciesRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetStoragePoliciesRequestProto
const __meta_GetStoragePoliciesRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetStoragePoliciesRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetStoragePoliciesRequestProto)
            __meta_GetStoragePoliciesRequestProto[] = target = ProtoMeta(GetStoragePoliciesRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, GetStoragePoliciesRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetStoragePoliciesRequestProto[]
    end
end

mutable struct GetStoragePoliciesResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetStoragePoliciesResponseProto(; kwargs...)
        obj = new(meta(GetStoragePoliciesResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetStoragePoliciesResponseProto
const __meta_GetStoragePoliciesResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetStoragePoliciesResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetStoragePoliciesResponseProto)
            __meta_GetStoragePoliciesResponseProto[] = target = ProtoMeta(GetStoragePoliciesResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:policies => Base.Vector{BlockStoragePolicyProto}]
            meta(target, GetStoragePoliciesResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetStoragePoliciesResponseProto[]
    end
end
function Base.getproperty(obj::GetStoragePoliciesResponseProto, name::Symbol)
    if name === :policies
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{BlockStoragePolicyProto}
    else
        getfield(obj, name)
    end
end

mutable struct SetPermissionRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SetPermissionRequestProto(; kwargs...)
        obj = new(meta(SetPermissionRequestProto), Dict{Symbol,Any}())
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
end # mutable struct SetPermissionRequestProto
const __meta_SetPermissionRequestProto = Ref{ProtoMeta}()
function meta(::Type{SetPermissionRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetPermissionRequestProto)
            __meta_SetPermissionRequestProto[] = target = ProtoMeta(SetPermissionRequestProto)
            req = Symbol[:src,:permission]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :permission => FsPermissionProto]
            meta(target, SetPermissionRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetPermissionRequestProto[]
    end
end
function Base.getproperty(obj::SetPermissionRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :permission
        return (obj.__protobuf_jl_internal_values[name])::FsPermissionProto
    else
        getfield(obj, name)
    end
end

mutable struct SetPermissionResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SetPermissionResponseProto(; kwargs...)
        obj = new(meta(SetPermissionResponseProto), Dict{Symbol,Any}())
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
end # mutable struct SetPermissionResponseProto
const __meta_SetPermissionResponseProto = Ref{ProtoMeta}()
function meta(::Type{SetPermissionResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetPermissionResponseProto)
            __meta_SetPermissionResponseProto[] = target = ProtoMeta(SetPermissionResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, SetPermissionResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetPermissionResponseProto[]
    end
end

mutable struct SetOwnerRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SetOwnerRequestProto(; kwargs...)
        obj = new(meta(SetOwnerRequestProto), Dict{Symbol,Any}())
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
end # mutable struct SetOwnerRequestProto
const __meta_SetOwnerRequestProto = Ref{ProtoMeta}()
function meta(::Type{SetOwnerRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetOwnerRequestProto)
            __meta_SetOwnerRequestProto[] = target = ProtoMeta(SetOwnerRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :username => AbstractString, :groupname => AbstractString]
            meta(target, SetOwnerRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetOwnerRequestProto[]
    end
end
function Base.getproperty(obj::SetOwnerRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :username
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :groupname
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct SetOwnerResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SetOwnerResponseProto(; kwargs...)
        obj = new(meta(SetOwnerResponseProto), Dict{Symbol,Any}())
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
end # mutable struct SetOwnerResponseProto
const __meta_SetOwnerResponseProto = Ref{ProtoMeta}()
function meta(::Type{SetOwnerResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetOwnerResponseProto)
            __meta_SetOwnerResponseProto[] = target = ProtoMeta(SetOwnerResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, SetOwnerResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetOwnerResponseProto[]
    end
end

mutable struct AbandonBlockRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function AbandonBlockRequestProto(; kwargs...)
        obj = new(meta(AbandonBlockRequestProto), Dict{Symbol,Any}())
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
end # mutable struct AbandonBlockRequestProto
const __meta_AbandonBlockRequestProto = Ref{ProtoMeta}()
function meta(::Type{AbandonBlockRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AbandonBlockRequestProto)
            __meta_AbandonBlockRequestProto[] = target = ProtoMeta(AbandonBlockRequestProto)
            req = Symbol[:b,:src,:holder]
            val = Dict{Symbol,Any}(:fileId => 0)
            allflds = Pair{Symbol,Union{Type,String}}[:b => ExtendedBlockProto, :src => AbstractString, :holder => AbstractString, :fileId => UInt64]
            meta(target, AbandonBlockRequestProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AbandonBlockRequestProto[]
    end
end
function Base.getproperty(obj::AbandonBlockRequestProto, name::Symbol)
    if name === :b
        return (obj.__protobuf_jl_internal_values[name])::ExtendedBlockProto
    elseif name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :holder
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :fileId
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct AbandonBlockResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function AbandonBlockResponseProto(; kwargs...)
        obj = new(meta(AbandonBlockResponseProto), Dict{Symbol,Any}())
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
end # mutable struct AbandonBlockResponseProto
const __meta_AbandonBlockResponseProto = Ref{ProtoMeta}()
function meta(::Type{AbandonBlockResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AbandonBlockResponseProto)
            __meta_AbandonBlockResponseProto[] = target = ProtoMeta(AbandonBlockResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, AbandonBlockResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AbandonBlockResponseProto[]
    end
end

mutable struct AddBlockRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function AddBlockRequestProto(; kwargs...)
        obj = new(meta(AddBlockRequestProto), Dict{Symbol,Any}())
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
end # mutable struct AddBlockRequestProto
const __meta_AddBlockRequestProto = Ref{ProtoMeta}()
function meta(::Type{AddBlockRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AddBlockRequestProto)
            __meta_AddBlockRequestProto[] = target = ProtoMeta(AddBlockRequestProto)
            req = Symbol[:src,:clientName]
            val = Dict{Symbol,Any}(:fileId => 0)
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :clientName => AbstractString, :previous => ExtendedBlockProto, :excludeNodes => Base.Vector{DatanodeInfoProto}, :fileId => UInt64, :favoredNodes => Base.Vector{AbstractString}, :flags => Base.Vector{Int32}]
            meta(target, AddBlockRequestProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AddBlockRequestProto[]
    end
end
function Base.getproperty(obj::AddBlockRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :clientName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :previous
        return (obj.__protobuf_jl_internal_values[name])::ExtendedBlockProto
    elseif name === :excludeNodes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{DatanodeInfoProto}
    elseif name === :fileId
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :favoredNodes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :flags
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    else
        getfield(obj, name)
    end
end

mutable struct AddBlockResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function AddBlockResponseProto(; kwargs...)
        obj = new(meta(AddBlockResponseProto), Dict{Symbol,Any}())
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
end # mutable struct AddBlockResponseProto
const __meta_AddBlockResponseProto = Ref{ProtoMeta}()
function meta(::Type{AddBlockResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AddBlockResponseProto)
            __meta_AddBlockResponseProto[] = target = ProtoMeta(AddBlockResponseProto)
            req = Symbol[:block]
            allflds = Pair{Symbol,Union{Type,String}}[:block => LocatedBlockProto]
            meta(target, AddBlockResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AddBlockResponseProto[]
    end
end
function Base.getproperty(obj::AddBlockResponseProto, name::Symbol)
    if name === :block
        return (obj.__protobuf_jl_internal_values[name])::LocatedBlockProto
    else
        getfield(obj, name)
    end
end

mutable struct GetAdditionalDatanodeRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetAdditionalDatanodeRequestProto(; kwargs...)
        obj = new(meta(GetAdditionalDatanodeRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetAdditionalDatanodeRequestProto
const __meta_GetAdditionalDatanodeRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetAdditionalDatanodeRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetAdditionalDatanodeRequestProto)
            __meta_GetAdditionalDatanodeRequestProto[] = target = ProtoMeta(GetAdditionalDatanodeRequestProto)
            req = Symbol[:src,:blk,:numAdditionalNodes,:clientName]
            val = Dict{Symbol,Any}(:fileId => 0)
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :blk => ExtendedBlockProto, :existings => Base.Vector{DatanodeInfoProto}, :excludes => Base.Vector{DatanodeInfoProto}, :numAdditionalNodes => UInt32, :clientName => AbstractString, :existingStorageUuids => Base.Vector{AbstractString}, :fileId => UInt64]
            meta(target, GetAdditionalDatanodeRequestProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetAdditionalDatanodeRequestProto[]
    end
end
function Base.getproperty(obj::GetAdditionalDatanodeRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :blk
        return (obj.__protobuf_jl_internal_values[name])::ExtendedBlockProto
    elseif name === :existings
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{DatanodeInfoProto}
    elseif name === :excludes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{DatanodeInfoProto}
    elseif name === :numAdditionalNodes
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :clientName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :existingStorageUuids
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :fileId
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct GetAdditionalDatanodeResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetAdditionalDatanodeResponseProto(; kwargs...)
        obj = new(meta(GetAdditionalDatanodeResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetAdditionalDatanodeResponseProto
const __meta_GetAdditionalDatanodeResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetAdditionalDatanodeResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetAdditionalDatanodeResponseProto)
            __meta_GetAdditionalDatanodeResponseProto[] = target = ProtoMeta(GetAdditionalDatanodeResponseProto)
            req = Symbol[:block]
            allflds = Pair{Symbol,Union{Type,String}}[:block => LocatedBlockProto]
            meta(target, GetAdditionalDatanodeResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetAdditionalDatanodeResponseProto[]
    end
end
function Base.getproperty(obj::GetAdditionalDatanodeResponseProto, name::Symbol)
    if name === :block
        return (obj.__protobuf_jl_internal_values[name])::LocatedBlockProto
    else
        getfield(obj, name)
    end
end

mutable struct CompleteRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CompleteRequestProto(; kwargs...)
        obj = new(meta(CompleteRequestProto), Dict{Symbol,Any}())
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
end # mutable struct CompleteRequestProto
const __meta_CompleteRequestProto = Ref{ProtoMeta}()
function meta(::Type{CompleteRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CompleteRequestProto)
            __meta_CompleteRequestProto[] = target = ProtoMeta(CompleteRequestProto)
            req = Symbol[:src,:clientName]
            val = Dict{Symbol,Any}(:fileId => 0)
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :clientName => AbstractString, :last => ExtendedBlockProto, :fileId => UInt64]
            meta(target, CompleteRequestProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CompleteRequestProto[]
    end
end
function Base.getproperty(obj::CompleteRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :clientName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :last
        return (obj.__protobuf_jl_internal_values[name])::ExtendedBlockProto
    elseif name === :fileId
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct CompleteResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CompleteResponseProto(; kwargs...)
        obj = new(meta(CompleteResponseProto), Dict{Symbol,Any}())
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
end # mutable struct CompleteResponseProto
const __meta_CompleteResponseProto = Ref{ProtoMeta}()
function meta(::Type{CompleteResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CompleteResponseProto)
            __meta_CompleteResponseProto[] = target = ProtoMeta(CompleteResponseProto)
            req = Symbol[:result]
            allflds = Pair{Symbol,Union{Type,String}}[:result => Bool]
            meta(target, CompleteResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CompleteResponseProto[]
    end
end
function Base.getproperty(obj::CompleteResponseProto, name::Symbol)
    if name === :result
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct ReportBadBlocksRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReportBadBlocksRequestProto(; kwargs...)
        obj = new(meta(ReportBadBlocksRequestProto), Dict{Symbol,Any}())
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
end # mutable struct ReportBadBlocksRequestProto
const __meta_ReportBadBlocksRequestProto = Ref{ProtoMeta}()
function meta(::Type{ReportBadBlocksRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReportBadBlocksRequestProto)
            __meta_ReportBadBlocksRequestProto[] = target = ProtoMeta(ReportBadBlocksRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:blocks => Base.Vector{LocatedBlockProto}]
            meta(target, ReportBadBlocksRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReportBadBlocksRequestProto[]
    end
end
function Base.getproperty(obj::ReportBadBlocksRequestProto, name::Symbol)
    if name === :blocks
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{LocatedBlockProto}
    else
        getfield(obj, name)
    end
end

mutable struct ReportBadBlocksResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReportBadBlocksResponseProto(; kwargs...)
        obj = new(meta(ReportBadBlocksResponseProto), Dict{Symbol,Any}())
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
end # mutable struct ReportBadBlocksResponseProto
const __meta_ReportBadBlocksResponseProto = Ref{ProtoMeta}()
function meta(::Type{ReportBadBlocksResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReportBadBlocksResponseProto)
            __meta_ReportBadBlocksResponseProto[] = target = ProtoMeta(ReportBadBlocksResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, ReportBadBlocksResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReportBadBlocksResponseProto[]
    end
end

mutable struct ConcatRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ConcatRequestProto(; kwargs...)
        obj = new(meta(ConcatRequestProto), Dict{Symbol,Any}())
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
end # mutable struct ConcatRequestProto
const __meta_ConcatRequestProto = Ref{ProtoMeta}()
function meta(::Type{ConcatRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ConcatRequestProto)
            __meta_ConcatRequestProto[] = target = ProtoMeta(ConcatRequestProto)
            req = Symbol[:trg]
            allflds = Pair{Symbol,Union{Type,String}}[:trg => AbstractString, :srcs => Base.Vector{AbstractString}]
            meta(target, ConcatRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ConcatRequestProto[]
    end
end
function Base.getproperty(obj::ConcatRequestProto, name::Symbol)
    if name === :trg
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :srcs
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    else
        getfield(obj, name)
    end
end

mutable struct ConcatResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ConcatResponseProto(; kwargs...)
        obj = new(meta(ConcatResponseProto), Dict{Symbol,Any}())
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
end # mutable struct ConcatResponseProto
const __meta_ConcatResponseProto = Ref{ProtoMeta}()
function meta(::Type{ConcatResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ConcatResponseProto)
            __meta_ConcatResponseProto[] = target = ProtoMeta(ConcatResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, ConcatResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ConcatResponseProto[]
    end
end

mutable struct TruncateRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function TruncateRequestProto(; kwargs...)
        obj = new(meta(TruncateRequestProto), Dict{Symbol,Any}())
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
end # mutable struct TruncateRequestProto
const __meta_TruncateRequestProto = Ref{ProtoMeta}()
function meta(::Type{TruncateRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TruncateRequestProto)
            __meta_TruncateRequestProto[] = target = ProtoMeta(TruncateRequestProto)
            req = Symbol[:src,:newLength,:clientName]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :newLength => UInt64, :clientName => AbstractString]
            meta(target, TruncateRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TruncateRequestProto[]
    end
end
function Base.getproperty(obj::TruncateRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :newLength
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :clientName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct TruncateResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function TruncateResponseProto(; kwargs...)
        obj = new(meta(TruncateResponseProto), Dict{Symbol,Any}())
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
end # mutable struct TruncateResponseProto
const __meta_TruncateResponseProto = Ref{ProtoMeta}()
function meta(::Type{TruncateResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TruncateResponseProto)
            __meta_TruncateResponseProto[] = target = ProtoMeta(TruncateResponseProto)
            req = Symbol[:result]
            allflds = Pair{Symbol,Union{Type,String}}[:result => Bool]
            meta(target, TruncateResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TruncateResponseProto[]
    end
end
function Base.getproperty(obj::TruncateResponseProto, name::Symbol)
    if name === :result
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct RenameRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RenameRequestProto(; kwargs...)
        obj = new(meta(RenameRequestProto), Dict{Symbol,Any}())
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
end # mutable struct RenameRequestProto
const __meta_RenameRequestProto = Ref{ProtoMeta}()
function meta(::Type{RenameRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RenameRequestProto)
            __meta_RenameRequestProto[] = target = ProtoMeta(RenameRequestProto)
            req = Symbol[:src,:dst]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :dst => AbstractString]
            meta(target, RenameRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RenameRequestProto[]
    end
end
function Base.getproperty(obj::RenameRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :dst
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct RenameResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RenameResponseProto(; kwargs...)
        obj = new(meta(RenameResponseProto), Dict{Symbol,Any}())
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
end # mutable struct RenameResponseProto
const __meta_RenameResponseProto = Ref{ProtoMeta}()
function meta(::Type{RenameResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RenameResponseProto)
            __meta_RenameResponseProto[] = target = ProtoMeta(RenameResponseProto)
            req = Symbol[:result]
            allflds = Pair{Symbol,Union{Type,String}}[:result => Bool]
            meta(target, RenameResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RenameResponseProto[]
    end
end
function Base.getproperty(obj::RenameResponseProto, name::Symbol)
    if name === :result
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct Rename2RequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function Rename2RequestProto(; kwargs...)
        obj = new(meta(Rename2RequestProto), Dict{Symbol,Any}())
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
end # mutable struct Rename2RequestProto
const __meta_Rename2RequestProto = Ref{ProtoMeta}()
function meta(::Type{Rename2RequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Rename2RequestProto)
            __meta_Rename2RequestProto[] = target = ProtoMeta(Rename2RequestProto)
            req = Symbol[:src,:dst,:overwriteDest]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :dst => AbstractString, :overwriteDest => Bool, :moveToTrash => Bool]
            meta(target, Rename2RequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_Rename2RequestProto[]
    end
end
function Base.getproperty(obj::Rename2RequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :dst
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :overwriteDest
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :moveToTrash
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct Rename2ResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function Rename2ResponseProto(; kwargs...)
        obj = new(meta(Rename2ResponseProto), Dict{Symbol,Any}())
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
end # mutable struct Rename2ResponseProto
const __meta_Rename2ResponseProto = Ref{ProtoMeta}()
function meta(::Type{Rename2ResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_Rename2ResponseProto)
            __meta_Rename2ResponseProto[] = target = ProtoMeta(Rename2ResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, Rename2ResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_Rename2ResponseProto[]
    end
end

mutable struct DeleteRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function DeleteRequestProto(; kwargs...)
        obj = new(meta(DeleteRequestProto), Dict{Symbol,Any}())
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
end # mutable struct DeleteRequestProto
const __meta_DeleteRequestProto = Ref{ProtoMeta}()
function meta(::Type{DeleteRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DeleteRequestProto)
            __meta_DeleteRequestProto[] = target = ProtoMeta(DeleteRequestProto)
            req = Symbol[:src,:recursive]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :recursive => Bool]
            meta(target, DeleteRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DeleteRequestProto[]
    end
end
function Base.getproperty(obj::DeleteRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :recursive
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct DeleteResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function DeleteResponseProto(; kwargs...)
        obj = new(meta(DeleteResponseProto), Dict{Symbol,Any}())
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
end # mutable struct DeleteResponseProto
const __meta_DeleteResponseProto = Ref{ProtoMeta}()
function meta(::Type{DeleteResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DeleteResponseProto)
            __meta_DeleteResponseProto[] = target = ProtoMeta(DeleteResponseProto)
            req = Symbol[:result]
            allflds = Pair{Symbol,Union{Type,String}}[:result => Bool]
            meta(target, DeleteResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DeleteResponseProto[]
    end
end
function Base.getproperty(obj::DeleteResponseProto, name::Symbol)
    if name === :result
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct MkdirsRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function MkdirsRequestProto(; kwargs...)
        obj = new(meta(MkdirsRequestProto), Dict{Symbol,Any}())
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
end # mutable struct MkdirsRequestProto
const __meta_MkdirsRequestProto = Ref{ProtoMeta}()
function meta(::Type{MkdirsRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MkdirsRequestProto)
            __meta_MkdirsRequestProto[] = target = ProtoMeta(MkdirsRequestProto)
            req = Symbol[:src,:masked,:createParent]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :masked => FsPermissionProto, :createParent => Bool]
            meta(target, MkdirsRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MkdirsRequestProto[]
    end
end
function Base.getproperty(obj::MkdirsRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :masked
        return (obj.__protobuf_jl_internal_values[name])::FsPermissionProto
    elseif name === :createParent
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct MkdirsResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function MkdirsResponseProto(; kwargs...)
        obj = new(meta(MkdirsResponseProto), Dict{Symbol,Any}())
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
end # mutable struct MkdirsResponseProto
const __meta_MkdirsResponseProto = Ref{ProtoMeta}()
function meta(::Type{MkdirsResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MkdirsResponseProto)
            __meta_MkdirsResponseProto[] = target = ProtoMeta(MkdirsResponseProto)
            req = Symbol[:result]
            allflds = Pair{Symbol,Union{Type,String}}[:result => Bool]
            meta(target, MkdirsResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MkdirsResponseProto[]
    end
end
function Base.getproperty(obj::MkdirsResponseProto, name::Symbol)
    if name === :result
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct GetListingRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetListingRequestProto(; kwargs...)
        obj = new(meta(GetListingRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetListingRequestProto
const __meta_GetListingRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetListingRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetListingRequestProto)
            __meta_GetListingRequestProto[] = target = ProtoMeta(GetListingRequestProto)
            req = Symbol[:src,:startAfter,:needLocation]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :startAfter => Array{UInt8,1}, :needLocation => Bool]
            meta(target, GetListingRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetListingRequestProto[]
    end
end
function Base.getproperty(obj::GetListingRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :startAfter
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :needLocation
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct GetListingResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetListingResponseProto(; kwargs...)
        obj = new(meta(GetListingResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetListingResponseProto
const __meta_GetListingResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetListingResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetListingResponseProto)
            __meta_GetListingResponseProto[] = target = ProtoMeta(GetListingResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:dirList => DirectoryListingProto]
            meta(target, GetListingResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetListingResponseProto[]
    end
end
function Base.getproperty(obj::GetListingResponseProto, name::Symbol)
    if name === :dirList
        return (obj.__protobuf_jl_internal_values[name])::DirectoryListingProto
    else
        getfield(obj, name)
    end
end

mutable struct GetSnapshottableDirListingRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetSnapshottableDirListingRequestProto(; kwargs...)
        obj = new(meta(GetSnapshottableDirListingRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetSnapshottableDirListingRequestProto
const __meta_GetSnapshottableDirListingRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetSnapshottableDirListingRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetSnapshottableDirListingRequestProto)
            __meta_GetSnapshottableDirListingRequestProto[] = target = ProtoMeta(GetSnapshottableDirListingRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, GetSnapshottableDirListingRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetSnapshottableDirListingRequestProto[]
    end
end

mutable struct GetSnapshottableDirListingResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetSnapshottableDirListingResponseProto(; kwargs...)
        obj = new(meta(GetSnapshottableDirListingResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetSnapshottableDirListingResponseProto
const __meta_GetSnapshottableDirListingResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetSnapshottableDirListingResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetSnapshottableDirListingResponseProto)
            __meta_GetSnapshottableDirListingResponseProto[] = target = ProtoMeta(GetSnapshottableDirListingResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:snapshottableDirList => SnapshottableDirectoryListingProto]
            meta(target, GetSnapshottableDirListingResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetSnapshottableDirListingResponseProto[]
    end
end
function Base.getproperty(obj::GetSnapshottableDirListingResponseProto, name::Symbol)
    if name === :snapshottableDirList
        return (obj.__protobuf_jl_internal_values[name])::SnapshottableDirectoryListingProto
    else
        getfield(obj, name)
    end
end

mutable struct GetSnapshotDiffReportRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetSnapshotDiffReportRequestProto(; kwargs...)
        obj = new(meta(GetSnapshotDiffReportRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetSnapshotDiffReportRequestProto
const __meta_GetSnapshotDiffReportRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetSnapshotDiffReportRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetSnapshotDiffReportRequestProto)
            __meta_GetSnapshotDiffReportRequestProto[] = target = ProtoMeta(GetSnapshotDiffReportRequestProto)
            req = Symbol[:snapshotRoot,:fromSnapshot,:toSnapshot]
            allflds = Pair{Symbol,Union{Type,String}}[:snapshotRoot => AbstractString, :fromSnapshot => AbstractString, :toSnapshot => AbstractString]
            meta(target, GetSnapshotDiffReportRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetSnapshotDiffReportRequestProto[]
    end
end
function Base.getproperty(obj::GetSnapshotDiffReportRequestProto, name::Symbol)
    if name === :snapshotRoot
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :fromSnapshot
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :toSnapshot
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct GetSnapshotDiffReportResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetSnapshotDiffReportResponseProto(; kwargs...)
        obj = new(meta(GetSnapshotDiffReportResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetSnapshotDiffReportResponseProto
const __meta_GetSnapshotDiffReportResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetSnapshotDiffReportResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetSnapshotDiffReportResponseProto)
            __meta_GetSnapshotDiffReportResponseProto[] = target = ProtoMeta(GetSnapshotDiffReportResponseProto)
            req = Symbol[:diffReport]
            allflds = Pair{Symbol,Union{Type,String}}[:diffReport => SnapshotDiffReportProto]
            meta(target, GetSnapshotDiffReportResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetSnapshotDiffReportResponseProto[]
    end
end
function Base.getproperty(obj::GetSnapshotDiffReportResponseProto, name::Symbol)
    if name === :diffReport
        return (obj.__protobuf_jl_internal_values[name])::SnapshotDiffReportProto
    else
        getfield(obj, name)
    end
end

mutable struct RenewLeaseRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RenewLeaseRequestProto(; kwargs...)
        obj = new(meta(RenewLeaseRequestProto), Dict{Symbol,Any}())
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
end # mutable struct RenewLeaseRequestProto
const __meta_RenewLeaseRequestProto = Ref{ProtoMeta}()
function meta(::Type{RenewLeaseRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RenewLeaseRequestProto)
            __meta_RenewLeaseRequestProto[] = target = ProtoMeta(RenewLeaseRequestProto)
            req = Symbol[:clientName]
            allflds = Pair{Symbol,Union{Type,String}}[:clientName => AbstractString]
            meta(target, RenewLeaseRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RenewLeaseRequestProto[]
    end
end
function Base.getproperty(obj::RenewLeaseRequestProto, name::Symbol)
    if name === :clientName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct RenewLeaseResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RenewLeaseResponseProto(; kwargs...)
        obj = new(meta(RenewLeaseResponseProto), Dict{Symbol,Any}())
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
end # mutable struct RenewLeaseResponseProto
const __meta_RenewLeaseResponseProto = Ref{ProtoMeta}()
function meta(::Type{RenewLeaseResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RenewLeaseResponseProto)
            __meta_RenewLeaseResponseProto[] = target = ProtoMeta(RenewLeaseResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, RenewLeaseResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RenewLeaseResponseProto[]
    end
end

mutable struct RecoverLeaseRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RecoverLeaseRequestProto(; kwargs...)
        obj = new(meta(RecoverLeaseRequestProto), Dict{Symbol,Any}())
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
end # mutable struct RecoverLeaseRequestProto
const __meta_RecoverLeaseRequestProto = Ref{ProtoMeta}()
function meta(::Type{RecoverLeaseRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RecoverLeaseRequestProto)
            __meta_RecoverLeaseRequestProto[] = target = ProtoMeta(RecoverLeaseRequestProto)
            req = Symbol[:src,:clientName]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :clientName => AbstractString]
            meta(target, RecoverLeaseRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RecoverLeaseRequestProto[]
    end
end
function Base.getproperty(obj::RecoverLeaseRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :clientName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct RecoverLeaseResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RecoverLeaseResponseProto(; kwargs...)
        obj = new(meta(RecoverLeaseResponseProto), Dict{Symbol,Any}())
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
end # mutable struct RecoverLeaseResponseProto
const __meta_RecoverLeaseResponseProto = Ref{ProtoMeta}()
function meta(::Type{RecoverLeaseResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RecoverLeaseResponseProto)
            __meta_RecoverLeaseResponseProto[] = target = ProtoMeta(RecoverLeaseResponseProto)
            req = Symbol[:result]
            allflds = Pair{Symbol,Union{Type,String}}[:result => Bool]
            meta(target, RecoverLeaseResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RecoverLeaseResponseProto[]
    end
end
function Base.getproperty(obj::RecoverLeaseResponseProto, name::Symbol)
    if name === :result
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct GetFsStatusRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetFsStatusRequestProto(; kwargs...)
        obj = new(meta(GetFsStatusRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetFsStatusRequestProto
const __meta_GetFsStatusRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetFsStatusRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetFsStatusRequestProto)
            __meta_GetFsStatusRequestProto[] = target = ProtoMeta(GetFsStatusRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, GetFsStatusRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetFsStatusRequestProto[]
    end
end

mutable struct GetFsStatsResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetFsStatsResponseProto(; kwargs...)
        obj = new(meta(GetFsStatsResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetFsStatsResponseProto
const __meta_GetFsStatsResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetFsStatsResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetFsStatsResponseProto)
            __meta_GetFsStatsResponseProto[] = target = ProtoMeta(GetFsStatsResponseProto)
            req = Symbol[:capacity,:used,:remaining,:under_replicated,:corrupt_blocks,:missing_blocks]
            allflds = Pair{Symbol,Union{Type,String}}[:capacity => UInt64, :used => UInt64, :remaining => UInt64, :under_replicated => UInt64, :corrupt_blocks => UInt64, :missing_blocks => UInt64, :missing_repl_one_blocks => UInt64, :blocks_in_future => UInt64, :pending_deletion_blocks => UInt64]
            meta(target, GetFsStatsResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetFsStatsResponseProto[]
    end
end
function Base.getproperty(obj::GetFsStatsResponseProto, name::Symbol)
    if name === :capacity
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :used
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :remaining
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :under_replicated
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :corrupt_blocks
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :missing_blocks
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :missing_repl_one_blocks
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :blocks_in_future
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :pending_deletion_blocks
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct GetDatanodeReportRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetDatanodeReportRequestProto(; kwargs...)
        obj = new(meta(GetDatanodeReportRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetDatanodeReportRequestProto
const __meta_GetDatanodeReportRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetDatanodeReportRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetDatanodeReportRequestProto)
            __meta_GetDatanodeReportRequestProto[] = target = ProtoMeta(GetDatanodeReportRequestProto)
            req = Symbol[:_type]
            allflds = Pair{Symbol,Union{Type,String}}[:_type => Int32]
            meta(target, GetDatanodeReportRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetDatanodeReportRequestProto[]
    end
end
function Base.getproperty(obj::GetDatanodeReportRequestProto, name::Symbol)
    if name === :_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct GetDatanodeReportResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetDatanodeReportResponseProto(; kwargs...)
        obj = new(meta(GetDatanodeReportResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetDatanodeReportResponseProto
const __meta_GetDatanodeReportResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetDatanodeReportResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetDatanodeReportResponseProto)
            __meta_GetDatanodeReportResponseProto[] = target = ProtoMeta(GetDatanodeReportResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:di => Base.Vector{DatanodeInfoProto}]
            meta(target, GetDatanodeReportResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetDatanodeReportResponseProto[]
    end
end
function Base.getproperty(obj::GetDatanodeReportResponseProto, name::Symbol)
    if name === :di
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{DatanodeInfoProto}
    else
        getfield(obj, name)
    end
end

mutable struct GetDatanodeStorageReportRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetDatanodeStorageReportRequestProto(; kwargs...)
        obj = new(meta(GetDatanodeStorageReportRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetDatanodeStorageReportRequestProto
const __meta_GetDatanodeStorageReportRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetDatanodeStorageReportRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetDatanodeStorageReportRequestProto)
            __meta_GetDatanodeStorageReportRequestProto[] = target = ProtoMeta(GetDatanodeStorageReportRequestProto)
            req = Symbol[:_type]
            allflds = Pair{Symbol,Union{Type,String}}[:_type => Int32]
            meta(target, GetDatanodeStorageReportRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetDatanodeStorageReportRequestProto[]
    end
end
function Base.getproperty(obj::GetDatanodeStorageReportRequestProto, name::Symbol)
    if name === :_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct DatanodeStorageReportProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function DatanodeStorageReportProto(; kwargs...)
        obj = new(meta(DatanodeStorageReportProto), Dict{Symbol,Any}())
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
end # mutable struct DatanodeStorageReportProto
const __meta_DatanodeStorageReportProto = Ref{ProtoMeta}()
function meta(::Type{DatanodeStorageReportProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DatanodeStorageReportProto)
            __meta_DatanodeStorageReportProto[] = target = ProtoMeta(DatanodeStorageReportProto)
            req = Symbol[:datanodeInfo]
            allflds = Pair{Symbol,Union{Type,String}}[:datanodeInfo => DatanodeInfoProto, :storageReports => Base.Vector{StorageReportProto}]
            meta(target, DatanodeStorageReportProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DatanodeStorageReportProto[]
    end
end
function Base.getproperty(obj::DatanodeStorageReportProto, name::Symbol)
    if name === :datanodeInfo
        return (obj.__protobuf_jl_internal_values[name])::DatanodeInfoProto
    elseif name === :storageReports
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{StorageReportProto}
    else
        getfield(obj, name)
    end
end

mutable struct GetDatanodeStorageReportResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetDatanodeStorageReportResponseProto(; kwargs...)
        obj = new(meta(GetDatanodeStorageReportResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetDatanodeStorageReportResponseProto
const __meta_GetDatanodeStorageReportResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetDatanodeStorageReportResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetDatanodeStorageReportResponseProto)
            __meta_GetDatanodeStorageReportResponseProto[] = target = ProtoMeta(GetDatanodeStorageReportResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:datanodeStorageReports => Base.Vector{DatanodeStorageReportProto}]
            meta(target, GetDatanodeStorageReportResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetDatanodeStorageReportResponseProto[]
    end
end
function Base.getproperty(obj::GetDatanodeStorageReportResponseProto, name::Symbol)
    if name === :datanodeStorageReports
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{DatanodeStorageReportProto}
    else
        getfield(obj, name)
    end
end

mutable struct GetPreferredBlockSizeRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetPreferredBlockSizeRequestProto(; kwargs...)
        obj = new(meta(GetPreferredBlockSizeRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetPreferredBlockSizeRequestProto
const __meta_GetPreferredBlockSizeRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetPreferredBlockSizeRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetPreferredBlockSizeRequestProto)
            __meta_GetPreferredBlockSizeRequestProto[] = target = ProtoMeta(GetPreferredBlockSizeRequestProto)
            req = Symbol[:filename]
            allflds = Pair{Symbol,Union{Type,String}}[:filename => AbstractString]
            meta(target, GetPreferredBlockSizeRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetPreferredBlockSizeRequestProto[]
    end
end
function Base.getproperty(obj::GetPreferredBlockSizeRequestProto, name::Symbol)
    if name === :filename
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct GetPreferredBlockSizeResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetPreferredBlockSizeResponseProto(; kwargs...)
        obj = new(meta(GetPreferredBlockSizeResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetPreferredBlockSizeResponseProto
const __meta_GetPreferredBlockSizeResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetPreferredBlockSizeResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetPreferredBlockSizeResponseProto)
            __meta_GetPreferredBlockSizeResponseProto[] = target = ProtoMeta(GetPreferredBlockSizeResponseProto)
            req = Symbol[:bsize]
            allflds = Pair{Symbol,Union{Type,String}}[:bsize => UInt64]
            meta(target, GetPreferredBlockSizeResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetPreferredBlockSizeResponseProto[]
    end
end
function Base.getproperty(obj::GetPreferredBlockSizeResponseProto, name::Symbol)
    if name === :bsize
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct SetSafeModeRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SetSafeModeRequestProto(; kwargs...)
        obj = new(meta(SetSafeModeRequestProto), Dict{Symbol,Any}())
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
end # mutable struct SetSafeModeRequestProto
const __meta_SetSafeModeRequestProto = Ref{ProtoMeta}()
function meta(::Type{SetSafeModeRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetSafeModeRequestProto)
            __meta_SetSafeModeRequestProto[] = target = ProtoMeta(SetSafeModeRequestProto)
            req = Symbol[:action]
            val = Dict{Symbol,Any}(:checked => false)
            allflds = Pair{Symbol,Union{Type,String}}[:action => Int32, :checked => Bool]
            meta(target, SetSafeModeRequestProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetSafeModeRequestProto[]
    end
end
function Base.getproperty(obj::SetSafeModeRequestProto, name::Symbol)
    if name === :action
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :checked
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct SetSafeModeResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SetSafeModeResponseProto(; kwargs...)
        obj = new(meta(SetSafeModeResponseProto), Dict{Symbol,Any}())
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
end # mutable struct SetSafeModeResponseProto
const __meta_SetSafeModeResponseProto = Ref{ProtoMeta}()
function meta(::Type{SetSafeModeResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetSafeModeResponseProto)
            __meta_SetSafeModeResponseProto[] = target = ProtoMeta(SetSafeModeResponseProto)
            req = Symbol[:result]
            allflds = Pair{Symbol,Union{Type,String}}[:result => Bool]
            meta(target, SetSafeModeResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetSafeModeResponseProto[]
    end
end
function Base.getproperty(obj::SetSafeModeResponseProto, name::Symbol)
    if name === :result
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct SaveNamespaceRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SaveNamespaceRequestProto(; kwargs...)
        obj = new(meta(SaveNamespaceRequestProto), Dict{Symbol,Any}())
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
end # mutable struct SaveNamespaceRequestProto
const __meta_SaveNamespaceRequestProto = Ref{ProtoMeta}()
function meta(::Type{SaveNamespaceRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SaveNamespaceRequestProto)
            __meta_SaveNamespaceRequestProto[] = target = ProtoMeta(SaveNamespaceRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, SaveNamespaceRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SaveNamespaceRequestProto[]
    end
end

mutable struct SaveNamespaceResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SaveNamespaceResponseProto(; kwargs...)
        obj = new(meta(SaveNamespaceResponseProto), Dict{Symbol,Any}())
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
end # mutable struct SaveNamespaceResponseProto
const __meta_SaveNamespaceResponseProto = Ref{ProtoMeta}()
function meta(::Type{SaveNamespaceResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SaveNamespaceResponseProto)
            __meta_SaveNamespaceResponseProto[] = target = ProtoMeta(SaveNamespaceResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, SaveNamespaceResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SaveNamespaceResponseProto[]
    end
end

mutable struct RollEditsRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RollEditsRequestProto(; kwargs...)
        obj = new(meta(RollEditsRequestProto), Dict{Symbol,Any}())
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
end # mutable struct RollEditsRequestProto
const __meta_RollEditsRequestProto = Ref{ProtoMeta}()
function meta(::Type{RollEditsRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RollEditsRequestProto)
            __meta_RollEditsRequestProto[] = target = ProtoMeta(RollEditsRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, RollEditsRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RollEditsRequestProto[]
    end
end

mutable struct RollEditsResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RollEditsResponseProto(; kwargs...)
        obj = new(meta(RollEditsResponseProto), Dict{Symbol,Any}())
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
end # mutable struct RollEditsResponseProto
const __meta_RollEditsResponseProto = Ref{ProtoMeta}()
function meta(::Type{RollEditsResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RollEditsResponseProto)
            __meta_RollEditsResponseProto[] = target = ProtoMeta(RollEditsResponseProto)
            req = Symbol[:newSegmentTxId]
            allflds = Pair{Symbol,Union{Type,String}}[:newSegmentTxId => UInt64]
            meta(target, RollEditsResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RollEditsResponseProto[]
    end
end
function Base.getproperty(obj::RollEditsResponseProto, name::Symbol)
    if name === :newSegmentTxId
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct RestoreFailedStorageRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RestoreFailedStorageRequestProto(; kwargs...)
        obj = new(meta(RestoreFailedStorageRequestProto), Dict{Symbol,Any}())
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
end # mutable struct RestoreFailedStorageRequestProto
const __meta_RestoreFailedStorageRequestProto = Ref{ProtoMeta}()
function meta(::Type{RestoreFailedStorageRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RestoreFailedStorageRequestProto)
            __meta_RestoreFailedStorageRequestProto[] = target = ProtoMeta(RestoreFailedStorageRequestProto)
            req = Symbol[:arg]
            allflds = Pair{Symbol,Union{Type,String}}[:arg => AbstractString]
            meta(target, RestoreFailedStorageRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RestoreFailedStorageRequestProto[]
    end
end
function Base.getproperty(obj::RestoreFailedStorageRequestProto, name::Symbol)
    if name === :arg
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct RestoreFailedStorageResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RestoreFailedStorageResponseProto(; kwargs...)
        obj = new(meta(RestoreFailedStorageResponseProto), Dict{Symbol,Any}())
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
end # mutable struct RestoreFailedStorageResponseProto
const __meta_RestoreFailedStorageResponseProto = Ref{ProtoMeta}()
function meta(::Type{RestoreFailedStorageResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RestoreFailedStorageResponseProto)
            __meta_RestoreFailedStorageResponseProto[] = target = ProtoMeta(RestoreFailedStorageResponseProto)
            req = Symbol[:result]
            allflds = Pair{Symbol,Union{Type,String}}[:result => Bool]
            meta(target, RestoreFailedStorageResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RestoreFailedStorageResponseProto[]
    end
end
function Base.getproperty(obj::RestoreFailedStorageResponseProto, name::Symbol)
    if name === :result
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct RefreshNodesRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RefreshNodesRequestProto(; kwargs...)
        obj = new(meta(RefreshNodesRequestProto), Dict{Symbol,Any}())
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
end # mutable struct RefreshNodesRequestProto
const __meta_RefreshNodesRequestProto = Ref{ProtoMeta}()
function meta(::Type{RefreshNodesRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RefreshNodesRequestProto)
            __meta_RefreshNodesRequestProto[] = target = ProtoMeta(RefreshNodesRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, RefreshNodesRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RefreshNodesRequestProto[]
    end
end

mutable struct RefreshNodesResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RefreshNodesResponseProto(; kwargs...)
        obj = new(meta(RefreshNodesResponseProto), Dict{Symbol,Any}())
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
end # mutable struct RefreshNodesResponseProto
const __meta_RefreshNodesResponseProto = Ref{ProtoMeta}()
function meta(::Type{RefreshNodesResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RefreshNodesResponseProto)
            __meta_RefreshNodesResponseProto[] = target = ProtoMeta(RefreshNodesResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, RefreshNodesResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RefreshNodesResponseProto[]
    end
end

mutable struct FinalizeUpgradeRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function FinalizeUpgradeRequestProto(; kwargs...)
        obj = new(meta(FinalizeUpgradeRequestProto), Dict{Symbol,Any}())
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
end # mutable struct FinalizeUpgradeRequestProto
const __meta_FinalizeUpgradeRequestProto = Ref{ProtoMeta}()
function meta(::Type{FinalizeUpgradeRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FinalizeUpgradeRequestProto)
            __meta_FinalizeUpgradeRequestProto[] = target = ProtoMeta(FinalizeUpgradeRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, FinalizeUpgradeRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FinalizeUpgradeRequestProto[]
    end
end

mutable struct FinalizeUpgradeResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function FinalizeUpgradeResponseProto(; kwargs...)
        obj = new(meta(FinalizeUpgradeResponseProto), Dict{Symbol,Any}())
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
end # mutable struct FinalizeUpgradeResponseProto
const __meta_FinalizeUpgradeResponseProto = Ref{ProtoMeta}()
function meta(::Type{FinalizeUpgradeResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FinalizeUpgradeResponseProto)
            __meta_FinalizeUpgradeResponseProto[] = target = ProtoMeta(FinalizeUpgradeResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, FinalizeUpgradeResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FinalizeUpgradeResponseProto[]
    end
end

mutable struct RollingUpgradeRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RollingUpgradeRequestProto(; kwargs...)
        obj = new(meta(RollingUpgradeRequestProto), Dict{Symbol,Any}())
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
end # mutable struct RollingUpgradeRequestProto
const __meta_RollingUpgradeRequestProto = Ref{ProtoMeta}()
function meta(::Type{RollingUpgradeRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RollingUpgradeRequestProto)
            __meta_RollingUpgradeRequestProto[] = target = ProtoMeta(RollingUpgradeRequestProto)
            req = Symbol[:action]
            allflds = Pair{Symbol,Union{Type,String}}[:action => Int32]
            meta(target, RollingUpgradeRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RollingUpgradeRequestProto[]
    end
end
function Base.getproperty(obj::RollingUpgradeRequestProto, name::Symbol)
    if name === :action
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct RollingUpgradeInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RollingUpgradeInfoProto(; kwargs...)
        obj = new(meta(RollingUpgradeInfoProto), Dict{Symbol,Any}())
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
end # mutable struct RollingUpgradeInfoProto
const __meta_RollingUpgradeInfoProto = Ref{ProtoMeta}()
function meta(::Type{RollingUpgradeInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RollingUpgradeInfoProto)
            __meta_RollingUpgradeInfoProto[] = target = ProtoMeta(RollingUpgradeInfoProto)
            req = Symbol[:status,:startTime,:finalizeTime,:createdRollbackImages]
            allflds = Pair{Symbol,Union{Type,String}}[:status => RollingUpgradeStatusProto, :startTime => UInt64, :finalizeTime => UInt64, :createdRollbackImages => Bool]
            meta(target, RollingUpgradeInfoProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RollingUpgradeInfoProto[]
    end
end
function Base.getproperty(obj::RollingUpgradeInfoProto, name::Symbol)
    if name === :status
        return (obj.__protobuf_jl_internal_values[name])::RollingUpgradeStatusProto
    elseif name === :startTime
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :finalizeTime
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :createdRollbackImages
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct RollingUpgradeResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RollingUpgradeResponseProto(; kwargs...)
        obj = new(meta(RollingUpgradeResponseProto), Dict{Symbol,Any}())
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
end # mutable struct RollingUpgradeResponseProto
const __meta_RollingUpgradeResponseProto = Ref{ProtoMeta}()
function meta(::Type{RollingUpgradeResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RollingUpgradeResponseProto)
            __meta_RollingUpgradeResponseProto[] = target = ProtoMeta(RollingUpgradeResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:rollingUpgradeInfo => RollingUpgradeInfoProto]
            meta(target, RollingUpgradeResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RollingUpgradeResponseProto[]
    end
end
function Base.getproperty(obj::RollingUpgradeResponseProto, name::Symbol)
    if name === :rollingUpgradeInfo
        return (obj.__protobuf_jl_internal_values[name])::RollingUpgradeInfoProto
    else
        getfield(obj, name)
    end
end

mutable struct ListCorruptFileBlocksRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ListCorruptFileBlocksRequestProto(; kwargs...)
        obj = new(meta(ListCorruptFileBlocksRequestProto), Dict{Symbol,Any}())
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
end # mutable struct ListCorruptFileBlocksRequestProto
const __meta_ListCorruptFileBlocksRequestProto = Ref{ProtoMeta}()
function meta(::Type{ListCorruptFileBlocksRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ListCorruptFileBlocksRequestProto)
            __meta_ListCorruptFileBlocksRequestProto[] = target = ProtoMeta(ListCorruptFileBlocksRequestProto)
            req = Symbol[:path]
            allflds = Pair{Symbol,Union{Type,String}}[:path => AbstractString, :cookie => AbstractString]
            meta(target, ListCorruptFileBlocksRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ListCorruptFileBlocksRequestProto[]
    end
end
function Base.getproperty(obj::ListCorruptFileBlocksRequestProto, name::Symbol)
    if name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :cookie
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct ListCorruptFileBlocksResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ListCorruptFileBlocksResponseProto(; kwargs...)
        obj = new(meta(ListCorruptFileBlocksResponseProto), Dict{Symbol,Any}())
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
end # mutable struct ListCorruptFileBlocksResponseProto
const __meta_ListCorruptFileBlocksResponseProto = Ref{ProtoMeta}()
function meta(::Type{ListCorruptFileBlocksResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ListCorruptFileBlocksResponseProto)
            __meta_ListCorruptFileBlocksResponseProto[] = target = ProtoMeta(ListCorruptFileBlocksResponseProto)
            req = Symbol[:corrupt]
            allflds = Pair{Symbol,Union{Type,String}}[:corrupt => CorruptFileBlocksProto]
            meta(target, ListCorruptFileBlocksResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ListCorruptFileBlocksResponseProto[]
    end
end
function Base.getproperty(obj::ListCorruptFileBlocksResponseProto, name::Symbol)
    if name === :corrupt
        return (obj.__protobuf_jl_internal_values[name])::CorruptFileBlocksProto
    else
        getfield(obj, name)
    end
end

mutable struct MetaSaveRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function MetaSaveRequestProto(; kwargs...)
        obj = new(meta(MetaSaveRequestProto), Dict{Symbol,Any}())
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
end # mutable struct MetaSaveRequestProto
const __meta_MetaSaveRequestProto = Ref{ProtoMeta}()
function meta(::Type{MetaSaveRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MetaSaveRequestProto)
            __meta_MetaSaveRequestProto[] = target = ProtoMeta(MetaSaveRequestProto)
            req = Symbol[:filename]
            allflds = Pair{Symbol,Union{Type,String}}[:filename => AbstractString]
            meta(target, MetaSaveRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MetaSaveRequestProto[]
    end
end
function Base.getproperty(obj::MetaSaveRequestProto, name::Symbol)
    if name === :filename
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct MetaSaveResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function MetaSaveResponseProto(; kwargs...)
        obj = new(meta(MetaSaveResponseProto), Dict{Symbol,Any}())
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
end # mutable struct MetaSaveResponseProto
const __meta_MetaSaveResponseProto = Ref{ProtoMeta}()
function meta(::Type{MetaSaveResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MetaSaveResponseProto)
            __meta_MetaSaveResponseProto[] = target = ProtoMeta(MetaSaveResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, MetaSaveResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MetaSaveResponseProto[]
    end
end

mutable struct GetFileInfoRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetFileInfoRequestProto(; kwargs...)
        obj = new(meta(GetFileInfoRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetFileInfoRequestProto
const __meta_GetFileInfoRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetFileInfoRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetFileInfoRequestProto)
            __meta_GetFileInfoRequestProto[] = target = ProtoMeta(GetFileInfoRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString]
            meta(target, GetFileInfoRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetFileInfoRequestProto[]
    end
end
function Base.getproperty(obj::GetFileInfoRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct GetFileInfoResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetFileInfoResponseProto(; kwargs...)
        obj = new(meta(GetFileInfoResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetFileInfoResponseProto
const __meta_GetFileInfoResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetFileInfoResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetFileInfoResponseProto)
            __meta_GetFileInfoResponseProto[] = target = ProtoMeta(GetFileInfoResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:fs => HdfsFileStatusProto]
            meta(target, GetFileInfoResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetFileInfoResponseProto[]
    end
end
function Base.getproperty(obj::GetFileInfoResponseProto, name::Symbol)
    if name === :fs
        return (obj.__protobuf_jl_internal_values[name])::HdfsFileStatusProto
    else
        getfield(obj, name)
    end
end

mutable struct IsFileClosedRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function IsFileClosedRequestProto(; kwargs...)
        obj = new(meta(IsFileClosedRequestProto), Dict{Symbol,Any}())
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
end # mutable struct IsFileClosedRequestProto
const __meta_IsFileClosedRequestProto = Ref{ProtoMeta}()
function meta(::Type{IsFileClosedRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_IsFileClosedRequestProto)
            __meta_IsFileClosedRequestProto[] = target = ProtoMeta(IsFileClosedRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString]
            meta(target, IsFileClosedRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_IsFileClosedRequestProto[]
    end
end
function Base.getproperty(obj::IsFileClosedRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct IsFileClosedResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function IsFileClosedResponseProto(; kwargs...)
        obj = new(meta(IsFileClosedResponseProto), Dict{Symbol,Any}())
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
end # mutable struct IsFileClosedResponseProto
const __meta_IsFileClosedResponseProto = Ref{ProtoMeta}()
function meta(::Type{IsFileClosedResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_IsFileClosedResponseProto)
            __meta_IsFileClosedResponseProto[] = target = ProtoMeta(IsFileClosedResponseProto)
            req = Symbol[:result]
            allflds = Pair{Symbol,Union{Type,String}}[:result => Bool]
            meta(target, IsFileClosedResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_IsFileClosedResponseProto[]
    end
end
function Base.getproperty(obj::IsFileClosedResponseProto, name::Symbol)
    if name === :result
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct CacheDirectiveInfoExpirationProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CacheDirectiveInfoExpirationProto(; kwargs...)
        obj = new(meta(CacheDirectiveInfoExpirationProto), Dict{Symbol,Any}())
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
end # mutable struct CacheDirectiveInfoExpirationProto
const __meta_CacheDirectiveInfoExpirationProto = Ref{ProtoMeta}()
function meta(::Type{CacheDirectiveInfoExpirationProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CacheDirectiveInfoExpirationProto)
            __meta_CacheDirectiveInfoExpirationProto[] = target = ProtoMeta(CacheDirectiveInfoExpirationProto)
            req = Symbol[:millis,:isRelative]
            allflds = Pair{Symbol,Union{Type,String}}[:millis => Int64, :isRelative => Bool]
            meta(target, CacheDirectiveInfoExpirationProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CacheDirectiveInfoExpirationProto[]
    end
end
function Base.getproperty(obj::CacheDirectiveInfoExpirationProto, name::Symbol)
    if name === :millis
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :isRelative
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct CacheDirectiveInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CacheDirectiveInfoProto(; kwargs...)
        obj = new(meta(CacheDirectiveInfoProto), Dict{Symbol,Any}())
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
end # mutable struct CacheDirectiveInfoProto
const __meta_CacheDirectiveInfoProto = Ref{ProtoMeta}()
function meta(::Type{CacheDirectiveInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CacheDirectiveInfoProto)
            __meta_CacheDirectiveInfoProto[] = target = ProtoMeta(CacheDirectiveInfoProto)
            allflds = Pair{Symbol,Union{Type,String}}[:id => Int64, :path => AbstractString, :replication => UInt32, :pool => AbstractString, :expiration => CacheDirectiveInfoExpirationProto]
            meta(target, CacheDirectiveInfoProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CacheDirectiveInfoProto[]
    end
end
function Base.getproperty(obj::CacheDirectiveInfoProto, name::Symbol)
    if name === :id
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :replication
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :pool
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :expiration
        return (obj.__protobuf_jl_internal_values[name])::CacheDirectiveInfoExpirationProto
    else
        getfield(obj, name)
    end
end

mutable struct CacheDirectiveStatsProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CacheDirectiveStatsProto(; kwargs...)
        obj = new(meta(CacheDirectiveStatsProto), Dict{Symbol,Any}())
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
end # mutable struct CacheDirectiveStatsProto
const __meta_CacheDirectiveStatsProto = Ref{ProtoMeta}()
function meta(::Type{CacheDirectiveStatsProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CacheDirectiveStatsProto)
            __meta_CacheDirectiveStatsProto[] = target = ProtoMeta(CacheDirectiveStatsProto)
            req = Symbol[:bytesNeeded,:bytesCached,:filesNeeded,:filesCached,:hasExpired]
            allflds = Pair{Symbol,Union{Type,String}}[:bytesNeeded => Int64, :bytesCached => Int64, :filesNeeded => Int64, :filesCached => Int64, :hasExpired => Bool]
            meta(target, CacheDirectiveStatsProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CacheDirectiveStatsProto[]
    end
end
function Base.getproperty(obj::CacheDirectiveStatsProto, name::Symbol)
    if name === :bytesNeeded
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :bytesCached
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :filesNeeded
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :filesCached
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :hasExpired
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct AddCacheDirectiveRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function AddCacheDirectiveRequestProto(; kwargs...)
        obj = new(meta(AddCacheDirectiveRequestProto), Dict{Symbol,Any}())
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
end # mutable struct AddCacheDirectiveRequestProto
const __meta_AddCacheDirectiveRequestProto = Ref{ProtoMeta}()
function meta(::Type{AddCacheDirectiveRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AddCacheDirectiveRequestProto)
            __meta_AddCacheDirectiveRequestProto[] = target = ProtoMeta(AddCacheDirectiveRequestProto)
            req = Symbol[:info]
            allflds = Pair{Symbol,Union{Type,String}}[:info => CacheDirectiveInfoProto, :cacheFlags => UInt32]
            meta(target, AddCacheDirectiveRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AddCacheDirectiveRequestProto[]
    end
end
function Base.getproperty(obj::AddCacheDirectiveRequestProto, name::Symbol)
    if name === :info
        return (obj.__protobuf_jl_internal_values[name])::CacheDirectiveInfoProto
    elseif name === :cacheFlags
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    else
        getfield(obj, name)
    end
end

mutable struct AddCacheDirectiveResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function AddCacheDirectiveResponseProto(; kwargs...)
        obj = new(meta(AddCacheDirectiveResponseProto), Dict{Symbol,Any}())
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
end # mutable struct AddCacheDirectiveResponseProto
const __meta_AddCacheDirectiveResponseProto = Ref{ProtoMeta}()
function meta(::Type{AddCacheDirectiveResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AddCacheDirectiveResponseProto)
            __meta_AddCacheDirectiveResponseProto[] = target = ProtoMeta(AddCacheDirectiveResponseProto)
            req = Symbol[:id]
            allflds = Pair{Symbol,Union{Type,String}}[:id => Int64]
            meta(target, AddCacheDirectiveResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AddCacheDirectiveResponseProto[]
    end
end
function Base.getproperty(obj::AddCacheDirectiveResponseProto, name::Symbol)
    if name === :id
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct ModifyCacheDirectiveRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ModifyCacheDirectiveRequestProto(; kwargs...)
        obj = new(meta(ModifyCacheDirectiveRequestProto), Dict{Symbol,Any}())
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
end # mutable struct ModifyCacheDirectiveRequestProto
const __meta_ModifyCacheDirectiveRequestProto = Ref{ProtoMeta}()
function meta(::Type{ModifyCacheDirectiveRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ModifyCacheDirectiveRequestProto)
            __meta_ModifyCacheDirectiveRequestProto[] = target = ProtoMeta(ModifyCacheDirectiveRequestProto)
            req = Symbol[:info]
            allflds = Pair{Symbol,Union{Type,String}}[:info => CacheDirectiveInfoProto, :cacheFlags => UInt32]
            meta(target, ModifyCacheDirectiveRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ModifyCacheDirectiveRequestProto[]
    end
end
function Base.getproperty(obj::ModifyCacheDirectiveRequestProto, name::Symbol)
    if name === :info
        return (obj.__protobuf_jl_internal_values[name])::CacheDirectiveInfoProto
    elseif name === :cacheFlags
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    else
        getfield(obj, name)
    end
end

mutable struct ModifyCacheDirectiveResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ModifyCacheDirectiveResponseProto(; kwargs...)
        obj = new(meta(ModifyCacheDirectiveResponseProto), Dict{Symbol,Any}())
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
end # mutable struct ModifyCacheDirectiveResponseProto
const __meta_ModifyCacheDirectiveResponseProto = Ref{ProtoMeta}()
function meta(::Type{ModifyCacheDirectiveResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ModifyCacheDirectiveResponseProto)
            __meta_ModifyCacheDirectiveResponseProto[] = target = ProtoMeta(ModifyCacheDirectiveResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, ModifyCacheDirectiveResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ModifyCacheDirectiveResponseProto[]
    end
end

mutable struct RemoveCacheDirectiveRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RemoveCacheDirectiveRequestProto(; kwargs...)
        obj = new(meta(RemoveCacheDirectiveRequestProto), Dict{Symbol,Any}())
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
end # mutable struct RemoveCacheDirectiveRequestProto
const __meta_RemoveCacheDirectiveRequestProto = Ref{ProtoMeta}()
function meta(::Type{RemoveCacheDirectiveRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RemoveCacheDirectiveRequestProto)
            __meta_RemoveCacheDirectiveRequestProto[] = target = ProtoMeta(RemoveCacheDirectiveRequestProto)
            req = Symbol[:id]
            allflds = Pair{Symbol,Union{Type,String}}[:id => Int64]
            meta(target, RemoveCacheDirectiveRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RemoveCacheDirectiveRequestProto[]
    end
end
function Base.getproperty(obj::RemoveCacheDirectiveRequestProto, name::Symbol)
    if name === :id
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct RemoveCacheDirectiveResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RemoveCacheDirectiveResponseProto(; kwargs...)
        obj = new(meta(RemoveCacheDirectiveResponseProto), Dict{Symbol,Any}())
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
end # mutable struct RemoveCacheDirectiveResponseProto
const __meta_RemoveCacheDirectiveResponseProto = Ref{ProtoMeta}()
function meta(::Type{RemoveCacheDirectiveResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RemoveCacheDirectiveResponseProto)
            __meta_RemoveCacheDirectiveResponseProto[] = target = ProtoMeta(RemoveCacheDirectiveResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, RemoveCacheDirectiveResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RemoveCacheDirectiveResponseProto[]
    end
end

mutable struct ListCacheDirectivesRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ListCacheDirectivesRequestProto(; kwargs...)
        obj = new(meta(ListCacheDirectivesRequestProto), Dict{Symbol,Any}())
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
end # mutable struct ListCacheDirectivesRequestProto
const __meta_ListCacheDirectivesRequestProto = Ref{ProtoMeta}()
function meta(::Type{ListCacheDirectivesRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ListCacheDirectivesRequestProto)
            __meta_ListCacheDirectivesRequestProto[] = target = ProtoMeta(ListCacheDirectivesRequestProto)
            req = Symbol[:prevId,:filter]
            allflds = Pair{Symbol,Union{Type,String}}[:prevId => Int64, :filter => CacheDirectiveInfoProto]
            meta(target, ListCacheDirectivesRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ListCacheDirectivesRequestProto[]
    end
end
function Base.getproperty(obj::ListCacheDirectivesRequestProto, name::Symbol)
    if name === :prevId
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :filter
        return (obj.__protobuf_jl_internal_values[name])::CacheDirectiveInfoProto
    else
        getfield(obj, name)
    end
end

mutable struct CacheDirectiveEntryProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CacheDirectiveEntryProto(; kwargs...)
        obj = new(meta(CacheDirectiveEntryProto), Dict{Symbol,Any}())
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
end # mutable struct CacheDirectiveEntryProto
const __meta_CacheDirectiveEntryProto = Ref{ProtoMeta}()
function meta(::Type{CacheDirectiveEntryProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CacheDirectiveEntryProto)
            __meta_CacheDirectiveEntryProto[] = target = ProtoMeta(CacheDirectiveEntryProto)
            req = Symbol[:info,:stats]
            allflds = Pair{Symbol,Union{Type,String}}[:info => CacheDirectiveInfoProto, :stats => CacheDirectiveStatsProto]
            meta(target, CacheDirectiveEntryProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CacheDirectiveEntryProto[]
    end
end
function Base.getproperty(obj::CacheDirectiveEntryProto, name::Symbol)
    if name === :info
        return (obj.__protobuf_jl_internal_values[name])::CacheDirectiveInfoProto
    elseif name === :stats
        return (obj.__protobuf_jl_internal_values[name])::CacheDirectiveStatsProto
    else
        getfield(obj, name)
    end
end

mutable struct ListCacheDirectivesResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ListCacheDirectivesResponseProto(; kwargs...)
        obj = new(meta(ListCacheDirectivesResponseProto), Dict{Symbol,Any}())
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
end # mutable struct ListCacheDirectivesResponseProto
const __meta_ListCacheDirectivesResponseProto = Ref{ProtoMeta}()
function meta(::Type{ListCacheDirectivesResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ListCacheDirectivesResponseProto)
            __meta_ListCacheDirectivesResponseProto[] = target = ProtoMeta(ListCacheDirectivesResponseProto)
            req = Symbol[:hasMore]
            allflds = Pair{Symbol,Union{Type,String}}[:elements => Base.Vector{CacheDirectiveEntryProto}, :hasMore => Bool]
            meta(target, ListCacheDirectivesResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ListCacheDirectivesResponseProto[]
    end
end
function Base.getproperty(obj::ListCacheDirectivesResponseProto, name::Symbol)
    if name === :elements
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{CacheDirectiveEntryProto}
    elseif name === :hasMore
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct CachePoolInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CachePoolInfoProto(; kwargs...)
        obj = new(meta(CachePoolInfoProto), Dict{Symbol,Any}())
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
end # mutable struct CachePoolInfoProto
const __meta_CachePoolInfoProto = Ref{ProtoMeta}()
function meta(::Type{CachePoolInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CachePoolInfoProto)
            __meta_CachePoolInfoProto[] = target = ProtoMeta(CachePoolInfoProto)
            val = Dict{Symbol,Any}(:defaultReplication => 1)
            allflds = Pair{Symbol,Union{Type,String}}[:poolName => AbstractString, :ownerName => AbstractString, :groupName => AbstractString, :mode => Int32, :limit => Int64, :maxRelativeExpiry => Int64, :defaultReplication => UInt32]
            meta(target, CachePoolInfoProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CachePoolInfoProto[]
    end
end
function Base.getproperty(obj::CachePoolInfoProto, name::Symbol)
    if name === :poolName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :ownerName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :groupName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :mode
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :limit
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :maxRelativeExpiry
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :defaultReplication
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    else
        getfield(obj, name)
    end
end

mutable struct CachePoolStatsProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CachePoolStatsProto(; kwargs...)
        obj = new(meta(CachePoolStatsProto), Dict{Symbol,Any}())
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
end # mutable struct CachePoolStatsProto
const __meta_CachePoolStatsProto = Ref{ProtoMeta}()
function meta(::Type{CachePoolStatsProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CachePoolStatsProto)
            __meta_CachePoolStatsProto[] = target = ProtoMeta(CachePoolStatsProto)
            req = Symbol[:bytesNeeded,:bytesCached,:bytesOverlimit,:filesNeeded,:filesCached]
            allflds = Pair{Symbol,Union{Type,String}}[:bytesNeeded => Int64, :bytesCached => Int64, :bytesOverlimit => Int64, :filesNeeded => Int64, :filesCached => Int64]
            meta(target, CachePoolStatsProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CachePoolStatsProto[]
    end
end
function Base.getproperty(obj::CachePoolStatsProto, name::Symbol)
    if name === :bytesNeeded
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :bytesCached
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :bytesOverlimit
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :filesNeeded
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :filesCached
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct AddCachePoolRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function AddCachePoolRequestProto(; kwargs...)
        obj = new(meta(AddCachePoolRequestProto), Dict{Symbol,Any}())
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
end # mutable struct AddCachePoolRequestProto
const __meta_AddCachePoolRequestProto = Ref{ProtoMeta}()
function meta(::Type{AddCachePoolRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AddCachePoolRequestProto)
            __meta_AddCachePoolRequestProto[] = target = ProtoMeta(AddCachePoolRequestProto)
            req = Symbol[:info]
            allflds = Pair{Symbol,Union{Type,String}}[:info => CachePoolInfoProto]
            meta(target, AddCachePoolRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AddCachePoolRequestProto[]
    end
end
function Base.getproperty(obj::AddCachePoolRequestProto, name::Symbol)
    if name === :info
        return (obj.__protobuf_jl_internal_values[name])::CachePoolInfoProto
    else
        getfield(obj, name)
    end
end

mutable struct AddCachePoolResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function AddCachePoolResponseProto(; kwargs...)
        obj = new(meta(AddCachePoolResponseProto), Dict{Symbol,Any}())
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
end # mutable struct AddCachePoolResponseProto
const __meta_AddCachePoolResponseProto = Ref{ProtoMeta}()
function meta(::Type{AddCachePoolResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AddCachePoolResponseProto)
            __meta_AddCachePoolResponseProto[] = target = ProtoMeta(AddCachePoolResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, AddCachePoolResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AddCachePoolResponseProto[]
    end
end

mutable struct ModifyCachePoolRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ModifyCachePoolRequestProto(; kwargs...)
        obj = new(meta(ModifyCachePoolRequestProto), Dict{Symbol,Any}())
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
end # mutable struct ModifyCachePoolRequestProto
const __meta_ModifyCachePoolRequestProto = Ref{ProtoMeta}()
function meta(::Type{ModifyCachePoolRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ModifyCachePoolRequestProto)
            __meta_ModifyCachePoolRequestProto[] = target = ProtoMeta(ModifyCachePoolRequestProto)
            req = Symbol[:info]
            allflds = Pair{Symbol,Union{Type,String}}[:info => CachePoolInfoProto]
            meta(target, ModifyCachePoolRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ModifyCachePoolRequestProto[]
    end
end
function Base.getproperty(obj::ModifyCachePoolRequestProto, name::Symbol)
    if name === :info
        return (obj.__protobuf_jl_internal_values[name])::CachePoolInfoProto
    else
        getfield(obj, name)
    end
end

mutable struct ModifyCachePoolResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ModifyCachePoolResponseProto(; kwargs...)
        obj = new(meta(ModifyCachePoolResponseProto), Dict{Symbol,Any}())
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
end # mutable struct ModifyCachePoolResponseProto
const __meta_ModifyCachePoolResponseProto = Ref{ProtoMeta}()
function meta(::Type{ModifyCachePoolResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ModifyCachePoolResponseProto)
            __meta_ModifyCachePoolResponseProto[] = target = ProtoMeta(ModifyCachePoolResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, ModifyCachePoolResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ModifyCachePoolResponseProto[]
    end
end

mutable struct RemoveCachePoolRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RemoveCachePoolRequestProto(; kwargs...)
        obj = new(meta(RemoveCachePoolRequestProto), Dict{Symbol,Any}())
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
end # mutable struct RemoveCachePoolRequestProto
const __meta_RemoveCachePoolRequestProto = Ref{ProtoMeta}()
function meta(::Type{RemoveCachePoolRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RemoveCachePoolRequestProto)
            __meta_RemoveCachePoolRequestProto[] = target = ProtoMeta(RemoveCachePoolRequestProto)
            req = Symbol[:poolName]
            allflds = Pair{Symbol,Union{Type,String}}[:poolName => AbstractString]
            meta(target, RemoveCachePoolRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RemoveCachePoolRequestProto[]
    end
end
function Base.getproperty(obj::RemoveCachePoolRequestProto, name::Symbol)
    if name === :poolName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct RemoveCachePoolResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RemoveCachePoolResponseProto(; kwargs...)
        obj = new(meta(RemoveCachePoolResponseProto), Dict{Symbol,Any}())
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
end # mutable struct RemoveCachePoolResponseProto
const __meta_RemoveCachePoolResponseProto = Ref{ProtoMeta}()
function meta(::Type{RemoveCachePoolResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RemoveCachePoolResponseProto)
            __meta_RemoveCachePoolResponseProto[] = target = ProtoMeta(RemoveCachePoolResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, RemoveCachePoolResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RemoveCachePoolResponseProto[]
    end
end

mutable struct ListCachePoolsRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ListCachePoolsRequestProto(; kwargs...)
        obj = new(meta(ListCachePoolsRequestProto), Dict{Symbol,Any}())
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
end # mutable struct ListCachePoolsRequestProto
const __meta_ListCachePoolsRequestProto = Ref{ProtoMeta}()
function meta(::Type{ListCachePoolsRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ListCachePoolsRequestProto)
            __meta_ListCachePoolsRequestProto[] = target = ProtoMeta(ListCachePoolsRequestProto)
            req = Symbol[:prevPoolName]
            allflds = Pair{Symbol,Union{Type,String}}[:prevPoolName => AbstractString]
            meta(target, ListCachePoolsRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ListCachePoolsRequestProto[]
    end
end
function Base.getproperty(obj::ListCachePoolsRequestProto, name::Symbol)
    if name === :prevPoolName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct CachePoolEntryProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CachePoolEntryProto(; kwargs...)
        obj = new(meta(CachePoolEntryProto), Dict{Symbol,Any}())
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
end # mutable struct CachePoolEntryProto
const __meta_CachePoolEntryProto = Ref{ProtoMeta}()
function meta(::Type{CachePoolEntryProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CachePoolEntryProto)
            __meta_CachePoolEntryProto[] = target = ProtoMeta(CachePoolEntryProto)
            req = Symbol[:info,:stats]
            allflds = Pair{Symbol,Union{Type,String}}[:info => CachePoolInfoProto, :stats => CachePoolStatsProto]
            meta(target, CachePoolEntryProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CachePoolEntryProto[]
    end
end
function Base.getproperty(obj::CachePoolEntryProto, name::Symbol)
    if name === :info
        return (obj.__protobuf_jl_internal_values[name])::CachePoolInfoProto
    elseif name === :stats
        return (obj.__protobuf_jl_internal_values[name])::CachePoolStatsProto
    else
        getfield(obj, name)
    end
end

mutable struct ListCachePoolsResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ListCachePoolsResponseProto(; kwargs...)
        obj = new(meta(ListCachePoolsResponseProto), Dict{Symbol,Any}())
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
end # mutable struct ListCachePoolsResponseProto
const __meta_ListCachePoolsResponseProto = Ref{ProtoMeta}()
function meta(::Type{ListCachePoolsResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ListCachePoolsResponseProto)
            __meta_ListCachePoolsResponseProto[] = target = ProtoMeta(ListCachePoolsResponseProto)
            req = Symbol[:hasMore]
            allflds = Pair{Symbol,Union{Type,String}}[:entries => Base.Vector{CachePoolEntryProto}, :hasMore => Bool]
            meta(target, ListCachePoolsResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ListCachePoolsResponseProto[]
    end
end
function Base.getproperty(obj::ListCachePoolsResponseProto, name::Symbol)
    if name === :entries
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{CachePoolEntryProto}
    elseif name === :hasMore
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct GetFileLinkInfoRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetFileLinkInfoRequestProto(; kwargs...)
        obj = new(meta(GetFileLinkInfoRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetFileLinkInfoRequestProto
const __meta_GetFileLinkInfoRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetFileLinkInfoRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetFileLinkInfoRequestProto)
            __meta_GetFileLinkInfoRequestProto[] = target = ProtoMeta(GetFileLinkInfoRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString]
            meta(target, GetFileLinkInfoRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetFileLinkInfoRequestProto[]
    end
end
function Base.getproperty(obj::GetFileLinkInfoRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct GetFileLinkInfoResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetFileLinkInfoResponseProto(; kwargs...)
        obj = new(meta(GetFileLinkInfoResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetFileLinkInfoResponseProto
const __meta_GetFileLinkInfoResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetFileLinkInfoResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetFileLinkInfoResponseProto)
            __meta_GetFileLinkInfoResponseProto[] = target = ProtoMeta(GetFileLinkInfoResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:fs => HdfsFileStatusProto]
            meta(target, GetFileLinkInfoResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetFileLinkInfoResponseProto[]
    end
end
function Base.getproperty(obj::GetFileLinkInfoResponseProto, name::Symbol)
    if name === :fs
        return (obj.__protobuf_jl_internal_values[name])::HdfsFileStatusProto
    else
        getfield(obj, name)
    end
end

mutable struct GetContentSummaryRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetContentSummaryRequestProto(; kwargs...)
        obj = new(meta(GetContentSummaryRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetContentSummaryRequestProto
const __meta_GetContentSummaryRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetContentSummaryRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetContentSummaryRequestProto)
            __meta_GetContentSummaryRequestProto[] = target = ProtoMeta(GetContentSummaryRequestProto)
            req = Symbol[:path]
            allflds = Pair{Symbol,Union{Type,String}}[:path => AbstractString]
            meta(target, GetContentSummaryRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetContentSummaryRequestProto[]
    end
end
function Base.getproperty(obj::GetContentSummaryRequestProto, name::Symbol)
    if name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct GetContentSummaryResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetContentSummaryResponseProto(; kwargs...)
        obj = new(meta(GetContentSummaryResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetContentSummaryResponseProto
const __meta_GetContentSummaryResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetContentSummaryResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetContentSummaryResponseProto)
            __meta_GetContentSummaryResponseProto[] = target = ProtoMeta(GetContentSummaryResponseProto)
            req = Symbol[:summary]
            allflds = Pair{Symbol,Union{Type,String}}[:summary => ContentSummaryProto]
            meta(target, GetContentSummaryResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetContentSummaryResponseProto[]
    end
end
function Base.getproperty(obj::GetContentSummaryResponseProto, name::Symbol)
    if name === :summary
        return (obj.__protobuf_jl_internal_values[name])::ContentSummaryProto
    else
        getfield(obj, name)
    end
end

mutable struct GetQuotaUsageRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetQuotaUsageRequestProto(; kwargs...)
        obj = new(meta(GetQuotaUsageRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetQuotaUsageRequestProto
const __meta_GetQuotaUsageRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetQuotaUsageRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetQuotaUsageRequestProto)
            __meta_GetQuotaUsageRequestProto[] = target = ProtoMeta(GetQuotaUsageRequestProto)
            req = Symbol[:path]
            allflds = Pair{Symbol,Union{Type,String}}[:path => AbstractString]
            meta(target, GetQuotaUsageRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetQuotaUsageRequestProto[]
    end
end
function Base.getproperty(obj::GetQuotaUsageRequestProto, name::Symbol)
    if name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct GetQuotaUsageResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetQuotaUsageResponseProto(; kwargs...)
        obj = new(meta(GetQuotaUsageResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetQuotaUsageResponseProto
const __meta_GetQuotaUsageResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetQuotaUsageResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetQuotaUsageResponseProto)
            __meta_GetQuotaUsageResponseProto[] = target = ProtoMeta(GetQuotaUsageResponseProto)
            req = Symbol[:usage]
            allflds = Pair{Symbol,Union{Type,String}}[:usage => QuotaUsageProto]
            meta(target, GetQuotaUsageResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetQuotaUsageResponseProto[]
    end
end
function Base.getproperty(obj::GetQuotaUsageResponseProto, name::Symbol)
    if name === :usage
        return (obj.__protobuf_jl_internal_values[name])::QuotaUsageProto
    else
        getfield(obj, name)
    end
end

mutable struct SetQuotaRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SetQuotaRequestProto(; kwargs...)
        obj = new(meta(SetQuotaRequestProto), Dict{Symbol,Any}())
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
end # mutable struct SetQuotaRequestProto
const __meta_SetQuotaRequestProto = Ref{ProtoMeta}()
function meta(::Type{SetQuotaRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetQuotaRequestProto)
            __meta_SetQuotaRequestProto[] = target = ProtoMeta(SetQuotaRequestProto)
            req = Symbol[:path,:namespaceQuota,:storagespaceQuota]
            allflds = Pair{Symbol,Union{Type,String}}[:path => AbstractString, :namespaceQuota => UInt64, :storagespaceQuota => UInt64, :storageType => Int32]
            meta(target, SetQuotaRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetQuotaRequestProto[]
    end
end
function Base.getproperty(obj::SetQuotaRequestProto, name::Symbol)
    if name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :namespaceQuota
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :storagespaceQuota
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :storageType
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct SetQuotaResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SetQuotaResponseProto(; kwargs...)
        obj = new(meta(SetQuotaResponseProto), Dict{Symbol,Any}())
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
end # mutable struct SetQuotaResponseProto
const __meta_SetQuotaResponseProto = Ref{ProtoMeta}()
function meta(::Type{SetQuotaResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetQuotaResponseProto)
            __meta_SetQuotaResponseProto[] = target = ProtoMeta(SetQuotaResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, SetQuotaResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetQuotaResponseProto[]
    end
end

mutable struct FsyncRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function FsyncRequestProto(; kwargs...)
        obj = new(meta(FsyncRequestProto), Dict{Symbol,Any}())
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
end # mutable struct FsyncRequestProto
const __meta_FsyncRequestProto = Ref{ProtoMeta}()
function meta(::Type{FsyncRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FsyncRequestProto)
            __meta_FsyncRequestProto[] = target = ProtoMeta(FsyncRequestProto)
            req = Symbol[:src,:client]
            val = Dict{Symbol,Any}(:lastBlockLength => -1, :fileId => 0)
            wtype = Dict(:lastBlockLength => :sint64)
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :client => AbstractString, :lastBlockLength => Int64, :fileId => UInt64]
            meta(target, FsyncRequestProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, wtype, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FsyncRequestProto[]
    end
end
function Base.getproperty(obj::FsyncRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :client
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :lastBlockLength
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :fileId
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct FsyncResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function FsyncResponseProto(; kwargs...)
        obj = new(meta(FsyncResponseProto), Dict{Symbol,Any}())
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
end # mutable struct FsyncResponseProto
const __meta_FsyncResponseProto = Ref{ProtoMeta}()
function meta(::Type{FsyncResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FsyncResponseProto)
            __meta_FsyncResponseProto[] = target = ProtoMeta(FsyncResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, FsyncResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FsyncResponseProto[]
    end
end

mutable struct SetTimesRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SetTimesRequestProto(; kwargs...)
        obj = new(meta(SetTimesRequestProto), Dict{Symbol,Any}())
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
end # mutable struct SetTimesRequestProto
const __meta_SetTimesRequestProto = Ref{ProtoMeta}()
function meta(::Type{SetTimesRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetTimesRequestProto)
            __meta_SetTimesRequestProto[] = target = ProtoMeta(SetTimesRequestProto)
            req = Symbol[:src,:mtime,:atime]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :mtime => UInt64, :atime => UInt64]
            meta(target, SetTimesRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetTimesRequestProto[]
    end
end
function Base.getproperty(obj::SetTimesRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :mtime
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    elseif name === :atime
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct SetTimesResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SetTimesResponseProto(; kwargs...)
        obj = new(meta(SetTimesResponseProto), Dict{Symbol,Any}())
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
end # mutable struct SetTimesResponseProto
const __meta_SetTimesResponseProto = Ref{ProtoMeta}()
function meta(::Type{SetTimesResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetTimesResponseProto)
            __meta_SetTimesResponseProto[] = target = ProtoMeta(SetTimesResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, SetTimesResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetTimesResponseProto[]
    end
end

mutable struct CreateSymlinkRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CreateSymlinkRequestProto(; kwargs...)
        obj = new(meta(CreateSymlinkRequestProto), Dict{Symbol,Any}())
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
end # mutable struct CreateSymlinkRequestProto
const __meta_CreateSymlinkRequestProto = Ref{ProtoMeta}()
function meta(::Type{CreateSymlinkRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CreateSymlinkRequestProto)
            __meta_CreateSymlinkRequestProto[] = target = ProtoMeta(CreateSymlinkRequestProto)
            req = Symbol[:target,:link,:dirPerm,:createParent]
            allflds = Pair{Symbol,Union{Type,String}}[:target => AbstractString, :link => AbstractString, :dirPerm => FsPermissionProto, :createParent => Bool]
            meta(target, CreateSymlinkRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CreateSymlinkRequestProto[]
    end
end
function Base.getproperty(obj::CreateSymlinkRequestProto, name::Symbol)
    if name === :target
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :link
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :dirPerm
        return (obj.__protobuf_jl_internal_values[name])::FsPermissionProto
    elseif name === :createParent
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct CreateSymlinkResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CreateSymlinkResponseProto(; kwargs...)
        obj = new(meta(CreateSymlinkResponseProto), Dict{Symbol,Any}())
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
end # mutable struct CreateSymlinkResponseProto
const __meta_CreateSymlinkResponseProto = Ref{ProtoMeta}()
function meta(::Type{CreateSymlinkResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CreateSymlinkResponseProto)
            __meta_CreateSymlinkResponseProto[] = target = ProtoMeta(CreateSymlinkResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, CreateSymlinkResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CreateSymlinkResponseProto[]
    end
end

mutable struct GetLinkTargetRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetLinkTargetRequestProto(; kwargs...)
        obj = new(meta(GetLinkTargetRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetLinkTargetRequestProto
const __meta_GetLinkTargetRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetLinkTargetRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetLinkTargetRequestProto)
            __meta_GetLinkTargetRequestProto[] = target = ProtoMeta(GetLinkTargetRequestProto)
            req = Symbol[:path]
            allflds = Pair{Symbol,Union{Type,String}}[:path => AbstractString]
            meta(target, GetLinkTargetRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetLinkTargetRequestProto[]
    end
end
function Base.getproperty(obj::GetLinkTargetRequestProto, name::Symbol)
    if name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct GetLinkTargetResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetLinkTargetResponseProto(; kwargs...)
        obj = new(meta(GetLinkTargetResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetLinkTargetResponseProto
const __meta_GetLinkTargetResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetLinkTargetResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetLinkTargetResponseProto)
            __meta_GetLinkTargetResponseProto[] = target = ProtoMeta(GetLinkTargetResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:targetPath => AbstractString]
            meta(target, GetLinkTargetResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetLinkTargetResponseProto[]
    end
end
function Base.getproperty(obj::GetLinkTargetResponseProto, name::Symbol)
    if name === :targetPath
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct UpdateBlockForPipelineRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UpdateBlockForPipelineRequestProto(; kwargs...)
        obj = new(meta(UpdateBlockForPipelineRequestProto), Dict{Symbol,Any}())
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
end # mutable struct UpdateBlockForPipelineRequestProto
const __meta_UpdateBlockForPipelineRequestProto = Ref{ProtoMeta}()
function meta(::Type{UpdateBlockForPipelineRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UpdateBlockForPipelineRequestProto)
            __meta_UpdateBlockForPipelineRequestProto[] = target = ProtoMeta(UpdateBlockForPipelineRequestProto)
            req = Symbol[:block,:clientName]
            allflds = Pair{Symbol,Union{Type,String}}[:block => ExtendedBlockProto, :clientName => AbstractString]
            meta(target, UpdateBlockForPipelineRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UpdateBlockForPipelineRequestProto[]
    end
end
function Base.getproperty(obj::UpdateBlockForPipelineRequestProto, name::Symbol)
    if name === :block
        return (obj.__protobuf_jl_internal_values[name])::ExtendedBlockProto
    elseif name === :clientName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct UpdateBlockForPipelineResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UpdateBlockForPipelineResponseProto(; kwargs...)
        obj = new(meta(UpdateBlockForPipelineResponseProto), Dict{Symbol,Any}())
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
end # mutable struct UpdateBlockForPipelineResponseProto
const __meta_UpdateBlockForPipelineResponseProto = Ref{ProtoMeta}()
function meta(::Type{UpdateBlockForPipelineResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UpdateBlockForPipelineResponseProto)
            __meta_UpdateBlockForPipelineResponseProto[] = target = ProtoMeta(UpdateBlockForPipelineResponseProto)
            req = Symbol[:block]
            allflds = Pair{Symbol,Union{Type,String}}[:block => LocatedBlockProto]
            meta(target, UpdateBlockForPipelineResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UpdateBlockForPipelineResponseProto[]
    end
end
function Base.getproperty(obj::UpdateBlockForPipelineResponseProto, name::Symbol)
    if name === :block
        return (obj.__protobuf_jl_internal_values[name])::LocatedBlockProto
    else
        getfield(obj, name)
    end
end

mutable struct UpdatePipelineRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UpdatePipelineRequestProto(; kwargs...)
        obj = new(meta(UpdatePipelineRequestProto), Dict{Symbol,Any}())
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
end # mutable struct UpdatePipelineRequestProto
const __meta_UpdatePipelineRequestProto = Ref{ProtoMeta}()
function meta(::Type{UpdatePipelineRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UpdatePipelineRequestProto)
            __meta_UpdatePipelineRequestProto[] = target = ProtoMeta(UpdatePipelineRequestProto)
            req = Symbol[:clientName,:oldBlock,:newBlock]
            allflds = Pair{Symbol,Union{Type,String}}[:clientName => AbstractString, :oldBlock => ExtendedBlockProto, :newBlock => ExtendedBlockProto, :newNodes => Base.Vector{DatanodeIDProto}, :storageIDs => Base.Vector{AbstractString}]
            meta(target, UpdatePipelineRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UpdatePipelineRequestProto[]
    end
end
function Base.getproperty(obj::UpdatePipelineRequestProto, name::Symbol)
    if name === :clientName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :oldBlock
        return (obj.__protobuf_jl_internal_values[name])::ExtendedBlockProto
    elseif name === :newBlock
        return (obj.__protobuf_jl_internal_values[name])::ExtendedBlockProto
    elseif name === :newNodes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{DatanodeIDProto}
    elseif name === :storageIDs
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    else
        getfield(obj, name)
    end
end

mutable struct UpdatePipelineResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UpdatePipelineResponseProto(; kwargs...)
        obj = new(meta(UpdatePipelineResponseProto), Dict{Symbol,Any}())
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
end # mutable struct UpdatePipelineResponseProto
const __meta_UpdatePipelineResponseProto = Ref{ProtoMeta}()
function meta(::Type{UpdatePipelineResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UpdatePipelineResponseProto)
            __meta_UpdatePipelineResponseProto[] = target = ProtoMeta(UpdatePipelineResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, UpdatePipelineResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UpdatePipelineResponseProto[]
    end
end

mutable struct SetBalancerBandwidthRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SetBalancerBandwidthRequestProto(; kwargs...)
        obj = new(meta(SetBalancerBandwidthRequestProto), Dict{Symbol,Any}())
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
end # mutable struct SetBalancerBandwidthRequestProto
const __meta_SetBalancerBandwidthRequestProto = Ref{ProtoMeta}()
function meta(::Type{SetBalancerBandwidthRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetBalancerBandwidthRequestProto)
            __meta_SetBalancerBandwidthRequestProto[] = target = ProtoMeta(SetBalancerBandwidthRequestProto)
            req = Symbol[:bandwidth]
            allflds = Pair{Symbol,Union{Type,String}}[:bandwidth => Int64]
            meta(target, SetBalancerBandwidthRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetBalancerBandwidthRequestProto[]
    end
end
function Base.getproperty(obj::SetBalancerBandwidthRequestProto, name::Symbol)
    if name === :bandwidth
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct SetBalancerBandwidthResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SetBalancerBandwidthResponseProto(; kwargs...)
        obj = new(meta(SetBalancerBandwidthResponseProto), Dict{Symbol,Any}())
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
end # mutable struct SetBalancerBandwidthResponseProto
const __meta_SetBalancerBandwidthResponseProto = Ref{ProtoMeta}()
function meta(::Type{SetBalancerBandwidthResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetBalancerBandwidthResponseProto)
            __meta_SetBalancerBandwidthResponseProto[] = target = ProtoMeta(SetBalancerBandwidthResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, SetBalancerBandwidthResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetBalancerBandwidthResponseProto[]
    end
end

mutable struct GetDataEncryptionKeyRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetDataEncryptionKeyRequestProto(; kwargs...)
        obj = new(meta(GetDataEncryptionKeyRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetDataEncryptionKeyRequestProto
const __meta_GetDataEncryptionKeyRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetDataEncryptionKeyRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetDataEncryptionKeyRequestProto)
            __meta_GetDataEncryptionKeyRequestProto[] = target = ProtoMeta(GetDataEncryptionKeyRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, GetDataEncryptionKeyRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetDataEncryptionKeyRequestProto[]
    end
end

mutable struct GetDataEncryptionKeyResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetDataEncryptionKeyResponseProto(; kwargs...)
        obj = new(meta(GetDataEncryptionKeyResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetDataEncryptionKeyResponseProto
const __meta_GetDataEncryptionKeyResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetDataEncryptionKeyResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetDataEncryptionKeyResponseProto)
            __meta_GetDataEncryptionKeyResponseProto[] = target = ProtoMeta(GetDataEncryptionKeyResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:dataEncryptionKey => DataEncryptionKeyProto]
            meta(target, GetDataEncryptionKeyResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetDataEncryptionKeyResponseProto[]
    end
end
function Base.getproperty(obj::GetDataEncryptionKeyResponseProto, name::Symbol)
    if name === :dataEncryptionKey
        return (obj.__protobuf_jl_internal_values[name])::DataEncryptionKeyProto
    else
        getfield(obj, name)
    end
end

mutable struct CreateSnapshotRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CreateSnapshotRequestProto(; kwargs...)
        obj = new(meta(CreateSnapshotRequestProto), Dict{Symbol,Any}())
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
end # mutable struct CreateSnapshotRequestProto
const __meta_CreateSnapshotRequestProto = Ref{ProtoMeta}()
function meta(::Type{CreateSnapshotRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CreateSnapshotRequestProto)
            __meta_CreateSnapshotRequestProto[] = target = ProtoMeta(CreateSnapshotRequestProto)
            req = Symbol[:snapshotRoot]
            allflds = Pair{Symbol,Union{Type,String}}[:snapshotRoot => AbstractString, :snapshotName => AbstractString]
            meta(target, CreateSnapshotRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CreateSnapshotRequestProto[]
    end
end
function Base.getproperty(obj::CreateSnapshotRequestProto, name::Symbol)
    if name === :snapshotRoot
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :snapshotName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct CreateSnapshotResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CreateSnapshotResponseProto(; kwargs...)
        obj = new(meta(CreateSnapshotResponseProto), Dict{Symbol,Any}())
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
end # mutable struct CreateSnapshotResponseProto
const __meta_CreateSnapshotResponseProto = Ref{ProtoMeta}()
function meta(::Type{CreateSnapshotResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CreateSnapshotResponseProto)
            __meta_CreateSnapshotResponseProto[] = target = ProtoMeta(CreateSnapshotResponseProto)
            req = Symbol[:snapshotPath]
            allflds = Pair{Symbol,Union{Type,String}}[:snapshotPath => AbstractString]
            meta(target, CreateSnapshotResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CreateSnapshotResponseProto[]
    end
end
function Base.getproperty(obj::CreateSnapshotResponseProto, name::Symbol)
    if name === :snapshotPath
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct RenameSnapshotRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RenameSnapshotRequestProto(; kwargs...)
        obj = new(meta(RenameSnapshotRequestProto), Dict{Symbol,Any}())
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
end # mutable struct RenameSnapshotRequestProto
const __meta_RenameSnapshotRequestProto = Ref{ProtoMeta}()
function meta(::Type{RenameSnapshotRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RenameSnapshotRequestProto)
            __meta_RenameSnapshotRequestProto[] = target = ProtoMeta(RenameSnapshotRequestProto)
            req = Symbol[:snapshotRoot,:snapshotOldName,:snapshotNewName]
            allflds = Pair{Symbol,Union{Type,String}}[:snapshotRoot => AbstractString, :snapshotOldName => AbstractString, :snapshotNewName => AbstractString]
            meta(target, RenameSnapshotRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RenameSnapshotRequestProto[]
    end
end
function Base.getproperty(obj::RenameSnapshotRequestProto, name::Symbol)
    if name === :snapshotRoot
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :snapshotOldName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :snapshotNewName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct RenameSnapshotResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RenameSnapshotResponseProto(; kwargs...)
        obj = new(meta(RenameSnapshotResponseProto), Dict{Symbol,Any}())
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
end # mutable struct RenameSnapshotResponseProto
const __meta_RenameSnapshotResponseProto = Ref{ProtoMeta}()
function meta(::Type{RenameSnapshotResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RenameSnapshotResponseProto)
            __meta_RenameSnapshotResponseProto[] = target = ProtoMeta(RenameSnapshotResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, RenameSnapshotResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RenameSnapshotResponseProto[]
    end
end

mutable struct AllowSnapshotRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function AllowSnapshotRequestProto(; kwargs...)
        obj = new(meta(AllowSnapshotRequestProto), Dict{Symbol,Any}())
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
end # mutable struct AllowSnapshotRequestProto
const __meta_AllowSnapshotRequestProto = Ref{ProtoMeta}()
function meta(::Type{AllowSnapshotRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AllowSnapshotRequestProto)
            __meta_AllowSnapshotRequestProto[] = target = ProtoMeta(AllowSnapshotRequestProto)
            req = Symbol[:snapshotRoot]
            allflds = Pair{Symbol,Union{Type,String}}[:snapshotRoot => AbstractString]
            meta(target, AllowSnapshotRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AllowSnapshotRequestProto[]
    end
end
function Base.getproperty(obj::AllowSnapshotRequestProto, name::Symbol)
    if name === :snapshotRoot
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct AllowSnapshotResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function AllowSnapshotResponseProto(; kwargs...)
        obj = new(meta(AllowSnapshotResponseProto), Dict{Symbol,Any}())
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
end # mutable struct AllowSnapshotResponseProto
const __meta_AllowSnapshotResponseProto = Ref{ProtoMeta}()
function meta(::Type{AllowSnapshotResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AllowSnapshotResponseProto)
            __meta_AllowSnapshotResponseProto[] = target = ProtoMeta(AllowSnapshotResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, AllowSnapshotResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AllowSnapshotResponseProto[]
    end
end

mutable struct DisallowSnapshotRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function DisallowSnapshotRequestProto(; kwargs...)
        obj = new(meta(DisallowSnapshotRequestProto), Dict{Symbol,Any}())
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
end # mutable struct DisallowSnapshotRequestProto
const __meta_DisallowSnapshotRequestProto = Ref{ProtoMeta}()
function meta(::Type{DisallowSnapshotRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DisallowSnapshotRequestProto)
            __meta_DisallowSnapshotRequestProto[] = target = ProtoMeta(DisallowSnapshotRequestProto)
            req = Symbol[:snapshotRoot]
            allflds = Pair{Symbol,Union{Type,String}}[:snapshotRoot => AbstractString]
            meta(target, DisallowSnapshotRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DisallowSnapshotRequestProto[]
    end
end
function Base.getproperty(obj::DisallowSnapshotRequestProto, name::Symbol)
    if name === :snapshotRoot
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct DisallowSnapshotResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function DisallowSnapshotResponseProto(; kwargs...)
        obj = new(meta(DisallowSnapshotResponseProto), Dict{Symbol,Any}())
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
end # mutable struct DisallowSnapshotResponseProto
const __meta_DisallowSnapshotResponseProto = Ref{ProtoMeta}()
function meta(::Type{DisallowSnapshotResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DisallowSnapshotResponseProto)
            __meta_DisallowSnapshotResponseProto[] = target = ProtoMeta(DisallowSnapshotResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, DisallowSnapshotResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DisallowSnapshotResponseProto[]
    end
end

mutable struct DeleteSnapshotRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function DeleteSnapshotRequestProto(; kwargs...)
        obj = new(meta(DeleteSnapshotRequestProto), Dict{Symbol,Any}())
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
end # mutable struct DeleteSnapshotRequestProto
const __meta_DeleteSnapshotRequestProto = Ref{ProtoMeta}()
function meta(::Type{DeleteSnapshotRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DeleteSnapshotRequestProto)
            __meta_DeleteSnapshotRequestProto[] = target = ProtoMeta(DeleteSnapshotRequestProto)
            req = Symbol[:snapshotRoot,:snapshotName]
            allflds = Pair{Symbol,Union{Type,String}}[:snapshotRoot => AbstractString, :snapshotName => AbstractString]
            meta(target, DeleteSnapshotRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DeleteSnapshotRequestProto[]
    end
end
function Base.getproperty(obj::DeleteSnapshotRequestProto, name::Symbol)
    if name === :snapshotRoot
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :snapshotName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct DeleteSnapshotResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function DeleteSnapshotResponseProto(; kwargs...)
        obj = new(meta(DeleteSnapshotResponseProto), Dict{Symbol,Any}())
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
end # mutable struct DeleteSnapshotResponseProto
const __meta_DeleteSnapshotResponseProto = Ref{ProtoMeta}()
function meta(::Type{DeleteSnapshotResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_DeleteSnapshotResponseProto)
            __meta_DeleteSnapshotResponseProto[] = target = ProtoMeta(DeleteSnapshotResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, DeleteSnapshotResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_DeleteSnapshotResponseProto[]
    end
end

mutable struct CheckAccessRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CheckAccessRequestProto(; kwargs...)
        obj = new(meta(CheckAccessRequestProto), Dict{Symbol,Any}())
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
end # mutable struct CheckAccessRequestProto
const __meta_CheckAccessRequestProto = Ref{ProtoMeta}()
function meta(::Type{CheckAccessRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CheckAccessRequestProto)
            __meta_CheckAccessRequestProto[] = target = ProtoMeta(CheckAccessRequestProto)
            req = Symbol[:path,:mode]
            allflds = Pair{Symbol,Union{Type,String}}[:path => AbstractString, :mode => Int32]
            meta(target, CheckAccessRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CheckAccessRequestProto[]
    end
end
function Base.getproperty(obj::CheckAccessRequestProto, name::Symbol)
    if name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :mode
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct CheckAccessResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CheckAccessResponseProto(; kwargs...)
        obj = new(meta(CheckAccessResponseProto), Dict{Symbol,Any}())
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
end # mutable struct CheckAccessResponseProto
const __meta_CheckAccessResponseProto = Ref{ProtoMeta}()
function meta(::Type{CheckAccessResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CheckAccessResponseProto)
            __meta_CheckAccessResponseProto[] = target = ProtoMeta(CheckAccessResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, CheckAccessResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CheckAccessResponseProto[]
    end
end

mutable struct GetCurrentEditLogTxidRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetCurrentEditLogTxidRequestProto(; kwargs...)
        obj = new(meta(GetCurrentEditLogTxidRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetCurrentEditLogTxidRequestProto
const __meta_GetCurrentEditLogTxidRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetCurrentEditLogTxidRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetCurrentEditLogTxidRequestProto)
            __meta_GetCurrentEditLogTxidRequestProto[] = target = ProtoMeta(GetCurrentEditLogTxidRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, GetCurrentEditLogTxidRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetCurrentEditLogTxidRequestProto[]
    end
end

mutable struct GetCurrentEditLogTxidResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetCurrentEditLogTxidResponseProto(; kwargs...)
        obj = new(meta(GetCurrentEditLogTxidResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetCurrentEditLogTxidResponseProto
const __meta_GetCurrentEditLogTxidResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetCurrentEditLogTxidResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetCurrentEditLogTxidResponseProto)
            __meta_GetCurrentEditLogTxidResponseProto[] = target = ProtoMeta(GetCurrentEditLogTxidResponseProto)
            req = Symbol[:txid]
            allflds = Pair{Symbol,Union{Type,String}}[:txid => Int64]
            meta(target, GetCurrentEditLogTxidResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetCurrentEditLogTxidResponseProto[]
    end
end
function Base.getproperty(obj::GetCurrentEditLogTxidResponseProto, name::Symbol)
    if name === :txid
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct GetEditsFromTxidRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetEditsFromTxidRequestProto(; kwargs...)
        obj = new(meta(GetEditsFromTxidRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetEditsFromTxidRequestProto
const __meta_GetEditsFromTxidRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetEditsFromTxidRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetEditsFromTxidRequestProto)
            __meta_GetEditsFromTxidRequestProto[] = target = ProtoMeta(GetEditsFromTxidRequestProto)
            req = Symbol[:txid]
            allflds = Pair{Symbol,Union{Type,String}}[:txid => Int64]
            meta(target, GetEditsFromTxidRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetEditsFromTxidRequestProto[]
    end
end
function Base.getproperty(obj::GetEditsFromTxidRequestProto, name::Symbol)
    if name === :txid
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct GetEditsFromTxidResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetEditsFromTxidResponseProto(; kwargs...)
        obj = new(meta(GetEditsFromTxidResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetEditsFromTxidResponseProto
const __meta_GetEditsFromTxidResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetEditsFromTxidResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetEditsFromTxidResponseProto)
            __meta_GetEditsFromTxidResponseProto[] = target = ProtoMeta(GetEditsFromTxidResponseProto)
            req = Symbol[:eventsList]
            allflds = Pair{Symbol,Union{Type,String}}[:eventsList => EventsListProto]
            meta(target, GetEditsFromTxidResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetEditsFromTxidResponseProto[]
    end
end
function Base.getproperty(obj::GetEditsFromTxidResponseProto, name::Symbol)
    if name === :eventsList
        return (obj.__protobuf_jl_internal_values[name])::EventsListProto
    else
        getfield(obj, name)
    end
end

mutable struct ListOpenFilesRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ListOpenFilesRequestProto(; kwargs...)
        obj = new(meta(ListOpenFilesRequestProto), Dict{Symbol,Any}())
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
end # mutable struct ListOpenFilesRequestProto
const __meta_ListOpenFilesRequestProto = Ref{ProtoMeta}()
function meta(::Type{ListOpenFilesRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ListOpenFilesRequestProto)
            __meta_ListOpenFilesRequestProto[] = target = ProtoMeta(ListOpenFilesRequestProto)
            req = Symbol[:id]
            allflds = Pair{Symbol,Union{Type,String}}[:id => Int64]
            meta(target, ListOpenFilesRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ListOpenFilesRequestProto[]
    end
end
function Base.getproperty(obj::ListOpenFilesRequestProto, name::Symbol)
    if name === :id
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct OpenFilesBatchResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function OpenFilesBatchResponseProto(; kwargs...)
        obj = new(meta(OpenFilesBatchResponseProto), Dict{Symbol,Any}())
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
end # mutable struct OpenFilesBatchResponseProto
const __meta_OpenFilesBatchResponseProto = Ref{ProtoMeta}()
function meta(::Type{OpenFilesBatchResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_OpenFilesBatchResponseProto)
            __meta_OpenFilesBatchResponseProto[] = target = ProtoMeta(OpenFilesBatchResponseProto)
            req = Symbol[:id,:path,:clientName,:clientMachine]
            allflds = Pair{Symbol,Union{Type,String}}[:id => Int64, :path => AbstractString, :clientName => AbstractString, :clientMachine => AbstractString]
            meta(target, OpenFilesBatchResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_OpenFilesBatchResponseProto[]
    end
end
function Base.getproperty(obj::OpenFilesBatchResponseProto, name::Symbol)
    if name === :id
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :clientName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :clientMachine
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct ListOpenFilesResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ListOpenFilesResponseProto(; kwargs...)
        obj = new(meta(ListOpenFilesResponseProto), Dict{Symbol,Any}())
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
end # mutable struct ListOpenFilesResponseProto
const __meta_ListOpenFilesResponseProto = Ref{ProtoMeta}()
function meta(::Type{ListOpenFilesResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ListOpenFilesResponseProto)
            __meta_ListOpenFilesResponseProto[] = target = ProtoMeta(ListOpenFilesResponseProto)
            req = Symbol[:hasMore]
            allflds = Pair{Symbol,Union{Type,String}}[:entries => Base.Vector{OpenFilesBatchResponseProto}, :hasMore => Bool]
            meta(target, ListOpenFilesResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ListOpenFilesResponseProto[]
    end
end
function Base.getproperty(obj::ListOpenFilesResponseProto, name::Symbol)
    if name === :entries
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{OpenFilesBatchResponseProto}
    elseif name === :hasMore
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct MsyncRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function MsyncRequestProto(; kwargs...)
        obj = new(meta(MsyncRequestProto), Dict{Symbol,Any}())
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
end # mutable struct MsyncRequestProto
const __meta_MsyncRequestProto = Ref{ProtoMeta}()
function meta(::Type{MsyncRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MsyncRequestProto)
            __meta_MsyncRequestProto[] = target = ProtoMeta(MsyncRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, MsyncRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MsyncRequestProto[]
    end
end

mutable struct MsyncResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function MsyncResponseProto(; kwargs...)
        obj = new(meta(MsyncResponseProto), Dict{Symbol,Any}())
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
end # mutable struct MsyncResponseProto
const __meta_MsyncResponseProto = Ref{ProtoMeta}()
function meta(::Type{MsyncResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MsyncResponseProto)
            __meta_MsyncResponseProto[] = target = ProtoMeta(MsyncResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, MsyncResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MsyncResponseProto[]
    end
end

mutable struct HAServiceStateRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function HAServiceStateRequestProto(; kwargs...)
        obj = new(meta(HAServiceStateRequestProto), Dict{Symbol,Any}())
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
end # mutable struct HAServiceStateRequestProto
const __meta_HAServiceStateRequestProto = Ref{ProtoMeta}()
function meta(::Type{HAServiceStateRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_HAServiceStateRequestProto)
            __meta_HAServiceStateRequestProto[] = target = ProtoMeta(HAServiceStateRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, HAServiceStateRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_HAServiceStateRequestProto[]
    end
end

mutable struct HAServiceStateResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function HAServiceStateResponseProto(; kwargs...)
        obj = new(meta(HAServiceStateResponseProto), Dict{Symbol,Any}())
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
end # mutable struct HAServiceStateResponseProto
const __meta_HAServiceStateResponseProto = Ref{ProtoMeta}()
function meta(::Type{HAServiceStateResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_HAServiceStateResponseProto)
            __meta_HAServiceStateResponseProto[] = target = ProtoMeta(HAServiceStateResponseProto)
            req = Symbol[:state]
            allflds = Pair{Symbol,Union{Type,String}}[:state => Int32]
            meta(target, HAServiceStateResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_HAServiceStateResponseProto[]
    end
end
function Base.getproperty(obj::HAServiceStateResponseProto, name::Symbol)
    if name === :state
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

# service methods for ClientNamenodeProtocol
const _ClientNamenodeProtocol_methods = MethodDescriptor[
        MethodDescriptor("getBlockLocations", 1, hadoop.hdfs.GetBlockLocationsRequestProto, hadoop.hdfs.GetBlockLocationsResponseProto),
        MethodDescriptor("getServerDefaults", 2, hadoop.hdfs.GetServerDefaultsRequestProto, hadoop.hdfs.GetServerDefaultsResponseProto),
        MethodDescriptor("create", 3, hadoop.hdfs.CreateRequestProto, hadoop.hdfs.CreateResponseProto),
        MethodDescriptor("append", 4, hadoop.hdfs.AppendRequestProto, hadoop.hdfs.AppendResponseProto),
        MethodDescriptor("setReplication", 5, hadoop.hdfs.SetReplicationRequestProto, hadoop.hdfs.SetReplicationResponseProto),
        MethodDescriptor("setStoragePolicy", 6, hadoop.hdfs.SetStoragePolicyRequestProto, hadoop.hdfs.SetStoragePolicyResponseProto),
        MethodDescriptor("unsetStoragePolicy", 7, hadoop.hdfs.UnsetStoragePolicyRequestProto, hadoop.hdfs.UnsetStoragePolicyResponseProto),
        MethodDescriptor("getStoragePolicy", 8, hadoop.hdfs.GetStoragePolicyRequestProto, hadoop.hdfs.GetStoragePolicyResponseProto),
        MethodDescriptor("getStoragePolicies", 9, hadoop.hdfs.GetStoragePoliciesRequestProto, hadoop.hdfs.GetStoragePoliciesResponseProto),
        MethodDescriptor("setPermission", 10, hadoop.hdfs.SetPermissionRequestProto, hadoop.hdfs.SetPermissionResponseProto),
        MethodDescriptor("setOwner", 11, hadoop.hdfs.SetOwnerRequestProto, hadoop.hdfs.SetOwnerResponseProto),
        MethodDescriptor("abandonBlock", 12, hadoop.hdfs.AbandonBlockRequestProto, hadoop.hdfs.AbandonBlockResponseProto),
        MethodDescriptor("addBlock", 13, hadoop.hdfs.AddBlockRequestProto, hadoop.hdfs.AddBlockResponseProto),
        MethodDescriptor("getAdditionalDatanode", 14, hadoop.hdfs.GetAdditionalDatanodeRequestProto, hadoop.hdfs.GetAdditionalDatanodeResponseProto),
        MethodDescriptor("complete", 15, hadoop.hdfs.CompleteRequestProto, hadoop.hdfs.CompleteResponseProto),
        MethodDescriptor("reportBadBlocks", 16, hadoop.hdfs.ReportBadBlocksRequestProto, hadoop.hdfs.ReportBadBlocksResponseProto),
        MethodDescriptor("concat", 17, hadoop.hdfs.ConcatRequestProto, hadoop.hdfs.ConcatResponseProto),
        MethodDescriptor("truncate", 18, hadoop.hdfs.TruncateRequestProto, hadoop.hdfs.TruncateResponseProto),
        MethodDescriptor("rename", 19, hadoop.hdfs.RenameRequestProto, hadoop.hdfs.RenameResponseProto),
        MethodDescriptor("rename2", 20, hadoop.hdfs.Rename2RequestProto, hadoop.hdfs.Rename2ResponseProto),
        MethodDescriptor("delete", 21, hadoop.hdfs.DeleteRequestProto, hadoop.hdfs.DeleteResponseProto),
        MethodDescriptor("mkdirs", 22, hadoop.hdfs.MkdirsRequestProto, hadoop.hdfs.MkdirsResponseProto),
        MethodDescriptor("getListing", 23, hadoop.hdfs.GetListingRequestProto, hadoop.hdfs.GetListingResponseProto),
        MethodDescriptor("renewLease", 24, hadoop.hdfs.RenewLeaseRequestProto, hadoop.hdfs.RenewLeaseResponseProto),
        MethodDescriptor("recoverLease", 25, hadoop.hdfs.RecoverLeaseRequestProto, hadoop.hdfs.RecoverLeaseResponseProto),
        MethodDescriptor("getFsStats", 26, hadoop.hdfs.GetFsStatusRequestProto, hadoop.hdfs.GetFsStatsResponseProto),
        MethodDescriptor("getDatanodeReport", 27, hadoop.hdfs.GetDatanodeReportRequestProto, hadoop.hdfs.GetDatanodeReportResponseProto),
        MethodDescriptor("getDatanodeStorageReport", 28, hadoop.hdfs.GetDatanodeStorageReportRequestProto, hadoop.hdfs.GetDatanodeStorageReportResponseProto),
        MethodDescriptor("getPreferredBlockSize", 29, hadoop.hdfs.GetPreferredBlockSizeRequestProto, hadoop.hdfs.GetPreferredBlockSizeResponseProto),
        MethodDescriptor("setSafeMode", 30, hadoop.hdfs.SetSafeModeRequestProto, hadoop.hdfs.SetSafeModeResponseProto),
        MethodDescriptor("saveNamespace", 31, hadoop.hdfs.SaveNamespaceRequestProto, hadoop.hdfs.SaveNamespaceResponseProto),
        MethodDescriptor("rollEdits", 32, hadoop.hdfs.RollEditsRequestProto, hadoop.hdfs.RollEditsResponseProto),
        MethodDescriptor("restoreFailedStorage", 33, hadoop.hdfs.RestoreFailedStorageRequestProto, hadoop.hdfs.RestoreFailedStorageResponseProto),
        MethodDescriptor("refreshNodes", 34, hadoop.hdfs.RefreshNodesRequestProto, hadoop.hdfs.RefreshNodesResponseProto),
        MethodDescriptor("finalizeUpgrade", 35, hadoop.hdfs.FinalizeUpgradeRequestProto, hadoop.hdfs.FinalizeUpgradeResponseProto),
        MethodDescriptor("rollingUpgrade", 36, hadoop.hdfs.RollingUpgradeRequestProto, hadoop.hdfs.RollingUpgradeResponseProto),
        MethodDescriptor("listCorruptFileBlocks", 37, hadoop.hdfs.ListCorruptFileBlocksRequestProto, hadoop.hdfs.ListCorruptFileBlocksResponseProto),
        MethodDescriptor("metaSave", 38, hadoop.hdfs.MetaSaveRequestProto, hadoop.hdfs.MetaSaveResponseProto),
        MethodDescriptor("getFileInfo", 39, hadoop.hdfs.GetFileInfoRequestProto, hadoop.hdfs.GetFileInfoResponseProto),
        MethodDescriptor("addCacheDirective", 40, hadoop.hdfs.AddCacheDirectiveRequestProto, hadoop.hdfs.AddCacheDirectiveResponseProto),
        MethodDescriptor("modifyCacheDirective", 41, hadoop.hdfs.ModifyCacheDirectiveRequestProto, hadoop.hdfs.ModifyCacheDirectiveResponseProto),
        MethodDescriptor("removeCacheDirective", 42, hadoop.hdfs.RemoveCacheDirectiveRequestProto, hadoop.hdfs.RemoveCacheDirectiveResponseProto),
        MethodDescriptor("listCacheDirectives", 43, hadoop.hdfs.ListCacheDirectivesRequestProto, hadoop.hdfs.ListCacheDirectivesResponseProto),
        MethodDescriptor("addCachePool", 44, hadoop.hdfs.AddCachePoolRequestProto, hadoop.hdfs.AddCachePoolResponseProto),
        MethodDescriptor("modifyCachePool", 45, hadoop.hdfs.ModifyCachePoolRequestProto, hadoop.hdfs.ModifyCachePoolResponseProto),
        MethodDescriptor("removeCachePool", 46, hadoop.hdfs.RemoveCachePoolRequestProto, hadoop.hdfs.RemoveCachePoolResponseProto),
        MethodDescriptor("listCachePools", 47, hadoop.hdfs.ListCachePoolsRequestProto, hadoop.hdfs.ListCachePoolsResponseProto),
        MethodDescriptor("getFileLinkInfo", 48, hadoop.hdfs.GetFileLinkInfoRequestProto, hadoop.hdfs.GetFileLinkInfoResponseProto),
        MethodDescriptor("getContentSummary", 49, hadoop.hdfs.GetContentSummaryRequestProto, hadoop.hdfs.GetContentSummaryResponseProto),
        MethodDescriptor("setQuota", 50, hadoop.hdfs.SetQuotaRequestProto, hadoop.hdfs.SetQuotaResponseProto),
        MethodDescriptor("fsync", 51, hadoop.hdfs.FsyncRequestProto, hadoop.hdfs.FsyncResponseProto),
        MethodDescriptor("setTimes", 52, hadoop.hdfs.SetTimesRequestProto, hadoop.hdfs.SetTimesResponseProto),
        MethodDescriptor("createSymlink", 53, hadoop.hdfs.CreateSymlinkRequestProto, hadoop.hdfs.CreateSymlinkResponseProto),
        MethodDescriptor("getLinkTarget", 54, hadoop.hdfs.GetLinkTargetRequestProto, hadoop.hdfs.GetLinkTargetResponseProto),
        MethodDescriptor("updateBlockForPipeline", 55, hadoop.hdfs.UpdateBlockForPipelineRequestProto, hadoop.hdfs.UpdateBlockForPipelineResponseProto),
        MethodDescriptor("updatePipeline", 56, hadoop.hdfs.UpdatePipelineRequestProto, hadoop.hdfs.UpdatePipelineResponseProto),
        MethodDescriptor("getDelegationToken", 57, hadoop.common.GetDelegationTokenRequestProto, hadoop.common.GetDelegationTokenResponseProto),
        MethodDescriptor("renewDelegationToken", 58, hadoop.common.RenewDelegationTokenRequestProto, hadoop.common.RenewDelegationTokenResponseProto),
        MethodDescriptor("cancelDelegationToken", 59, hadoop.common.CancelDelegationTokenRequestProto, hadoop.common.CancelDelegationTokenResponseProto),
        MethodDescriptor("setBalancerBandwidth", 60, hadoop.hdfs.SetBalancerBandwidthRequestProto, hadoop.hdfs.SetBalancerBandwidthResponseProto),
        MethodDescriptor("getDataEncryptionKey", 61, hadoop.hdfs.GetDataEncryptionKeyRequestProto, hadoop.hdfs.GetDataEncryptionKeyResponseProto),
        MethodDescriptor("createSnapshot", 62, hadoop.hdfs.CreateSnapshotRequestProto, hadoop.hdfs.CreateSnapshotResponseProto),
        MethodDescriptor("renameSnapshot", 63, hadoop.hdfs.RenameSnapshotRequestProto, hadoop.hdfs.RenameSnapshotResponseProto),
        MethodDescriptor("allowSnapshot", 64, hadoop.hdfs.AllowSnapshotRequestProto, hadoop.hdfs.AllowSnapshotResponseProto),
        MethodDescriptor("disallowSnapshot", 65, hadoop.hdfs.DisallowSnapshotRequestProto, hadoop.hdfs.DisallowSnapshotResponseProto),
        MethodDescriptor("getSnapshottableDirListing", 66, hadoop.hdfs.GetSnapshottableDirListingRequestProto, hadoop.hdfs.GetSnapshottableDirListingResponseProto),
        MethodDescriptor("deleteSnapshot", 67, hadoop.hdfs.DeleteSnapshotRequestProto, hadoop.hdfs.DeleteSnapshotResponseProto),
        MethodDescriptor("getSnapshotDiffReport", 68, hadoop.hdfs.GetSnapshotDiffReportRequestProto, hadoop.hdfs.GetSnapshotDiffReportResponseProto),
        MethodDescriptor("isFileClosed", 69, hadoop.hdfs.IsFileClosedRequestProto, hadoop.hdfs.IsFileClosedResponseProto),
        MethodDescriptor("modifyAclEntries", 70, hadoop.hdfs.ModifyAclEntriesRequestProto, hadoop.hdfs.ModifyAclEntriesResponseProto),
        MethodDescriptor("removeAclEntries", 71, hadoop.hdfs.RemoveAclEntriesRequestProto, hadoop.hdfs.RemoveAclEntriesResponseProto),
        MethodDescriptor("removeDefaultAcl", 72, hadoop.hdfs.RemoveDefaultAclRequestProto, hadoop.hdfs.RemoveDefaultAclResponseProto),
        MethodDescriptor("removeAcl", 73, hadoop.hdfs.RemoveAclRequestProto, hadoop.hdfs.RemoveAclResponseProto),
        MethodDescriptor("setAcl", 74, hadoop.hdfs.SetAclRequestProto, hadoop.hdfs.SetAclResponseProto),
        MethodDescriptor("getAclStatus", 75, hadoop.hdfs.GetAclStatusRequestProto, hadoop.hdfs.GetAclStatusResponseProto),
        MethodDescriptor("setXAttr", 76, hadoop.hdfs.SetXAttrRequestProto, hadoop.hdfs.SetXAttrResponseProto),
        MethodDescriptor("getXAttrs", 77, hadoop.hdfs.GetXAttrsRequestProto, hadoop.hdfs.GetXAttrsResponseProto),
        MethodDescriptor("listXAttrs", 78, hadoop.hdfs.ListXAttrsRequestProto, hadoop.hdfs.ListXAttrsResponseProto),
        MethodDescriptor("removeXAttr", 79, hadoop.hdfs.RemoveXAttrRequestProto, hadoop.hdfs.RemoveXAttrResponseProto),
        MethodDescriptor("checkAccess", 80, hadoop.hdfs.CheckAccessRequestProto, hadoop.hdfs.CheckAccessResponseProto),
        MethodDescriptor("createEncryptionZone", 81, hadoop.hdfs.CreateEncryptionZoneRequestProto, hadoop.hdfs.CreateEncryptionZoneResponseProto),
        MethodDescriptor("listEncryptionZones", 82, hadoop.hdfs.ListEncryptionZonesRequestProto, hadoop.hdfs.ListEncryptionZonesResponseProto),
        MethodDescriptor("getEZForPath", 83, hadoop.hdfs.GetEZForPathRequestProto, hadoop.hdfs.GetEZForPathResponseProto),
        MethodDescriptor("getCurrentEditLogTxid", 84, hadoop.hdfs.GetCurrentEditLogTxidRequestProto, hadoop.hdfs.GetCurrentEditLogTxidResponseProto),
        MethodDescriptor("getEditsFromTxid", 85, hadoop.hdfs.GetEditsFromTxidRequestProto, hadoop.hdfs.GetEditsFromTxidResponseProto),
        MethodDescriptor("getQuotaUsage", 86, hadoop.hdfs.GetQuotaUsageRequestProto, hadoop.hdfs.GetQuotaUsageResponseProto),
        MethodDescriptor("listOpenFiles", 87, hadoop.hdfs.ListOpenFilesRequestProto, hadoop.hdfs.ListOpenFilesResponseProto),
        MethodDescriptor("msync", 88, hadoop.hdfs.MsyncRequestProto, hadoop.hdfs.MsyncResponseProto),
        MethodDescriptor("getHAServiceState", 89, hadoop.hdfs.HAServiceStateRequestProto, hadoop.hdfs.HAServiceStateResponseProto)
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

unsetStoragePolicy(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.UnsetStoragePolicyRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[7], controller, inp, done)
unsetStoragePolicy(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.UnsetStoragePolicyRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[7], controller, inp)

getStoragePolicy(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetStoragePolicyRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[8], controller, inp, done)
getStoragePolicy(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetStoragePolicyRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[8], controller, inp)

getStoragePolicies(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetStoragePoliciesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[9], controller, inp, done)
getStoragePolicies(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetStoragePoliciesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[9], controller, inp)

setPermission(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetPermissionRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[10], controller, inp, done)
setPermission(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetPermissionRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[10], controller, inp)

setOwner(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetOwnerRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[11], controller, inp, done)
setOwner(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetOwnerRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[11], controller, inp)

abandonBlock(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.AbandonBlockRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[12], controller, inp, done)
abandonBlock(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.AbandonBlockRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[12], controller, inp)

addBlock(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.AddBlockRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[13], controller, inp, done)
addBlock(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.AddBlockRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[13], controller, inp)

getAdditionalDatanode(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetAdditionalDatanodeRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[14], controller, inp, done)
getAdditionalDatanode(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetAdditionalDatanodeRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[14], controller, inp)

complete(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.CompleteRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[15], controller, inp, done)
complete(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.CompleteRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[15], controller, inp)

reportBadBlocks(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ReportBadBlocksRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[16], controller, inp, done)
reportBadBlocks(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ReportBadBlocksRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[16], controller, inp)

concat(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ConcatRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[17], controller, inp, done)
concat(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ConcatRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[17], controller, inp)

truncate(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.TruncateRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[18], controller, inp, done)
truncate(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.TruncateRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[18], controller, inp)

rename(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RenameRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[19], controller, inp, done)
rename(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RenameRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[19], controller, inp)

rename2(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.Rename2RequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[20], controller, inp, done)
rename2(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.Rename2RequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[20], controller, inp)

delete(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.DeleteRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[21], controller, inp, done)
delete(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.DeleteRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[21], controller, inp)

mkdirs(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.MkdirsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[22], controller, inp, done)
mkdirs(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.MkdirsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[22], controller, inp)

getListing(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetListingRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[23], controller, inp, done)
getListing(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetListingRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[23], controller, inp)

renewLease(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RenewLeaseRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[24], controller, inp, done)
renewLease(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RenewLeaseRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[24], controller, inp)

recoverLease(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RecoverLeaseRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[25], controller, inp, done)
recoverLease(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RecoverLeaseRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[25], controller, inp)

getFsStats(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetFsStatusRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[26], controller, inp, done)
getFsStats(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetFsStatusRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[26], controller, inp)

getDatanodeReport(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetDatanodeReportRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[27], controller, inp, done)
getDatanodeReport(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetDatanodeReportRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[27], controller, inp)

getDatanodeStorageReport(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetDatanodeStorageReportRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[28], controller, inp, done)
getDatanodeStorageReport(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetDatanodeStorageReportRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[28], controller, inp)

getPreferredBlockSize(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetPreferredBlockSizeRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[29], controller, inp, done)
getPreferredBlockSize(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetPreferredBlockSizeRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[29], controller, inp)

setSafeMode(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetSafeModeRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[30], controller, inp, done)
setSafeMode(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetSafeModeRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[30], controller, inp)

saveNamespace(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SaveNamespaceRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[31], controller, inp, done)
saveNamespace(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SaveNamespaceRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[31], controller, inp)

rollEdits(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RollEditsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[32], controller, inp, done)
rollEdits(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RollEditsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[32], controller, inp)

restoreFailedStorage(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RestoreFailedStorageRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[33], controller, inp, done)
restoreFailedStorage(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RestoreFailedStorageRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[33], controller, inp)

refreshNodes(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RefreshNodesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[34], controller, inp, done)
refreshNodes(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RefreshNodesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[34], controller, inp)

finalizeUpgrade(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.FinalizeUpgradeRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[35], controller, inp, done)
finalizeUpgrade(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.FinalizeUpgradeRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[35], controller, inp)

rollingUpgrade(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RollingUpgradeRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[36], controller, inp, done)
rollingUpgrade(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RollingUpgradeRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[36], controller, inp)

listCorruptFileBlocks(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListCorruptFileBlocksRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[37], controller, inp, done)
listCorruptFileBlocks(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListCorruptFileBlocksRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[37], controller, inp)

metaSave(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.MetaSaveRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[38], controller, inp, done)
metaSave(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.MetaSaveRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[38], controller, inp)

getFileInfo(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetFileInfoRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[39], controller, inp, done)
getFileInfo(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetFileInfoRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[39], controller, inp)

addCacheDirective(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.AddCacheDirectiveRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[40], controller, inp, done)
addCacheDirective(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.AddCacheDirectiveRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[40], controller, inp)

modifyCacheDirective(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ModifyCacheDirectiveRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[41], controller, inp, done)
modifyCacheDirective(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ModifyCacheDirectiveRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[41], controller, inp)

removeCacheDirective(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveCacheDirectiveRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[42], controller, inp, done)
removeCacheDirective(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveCacheDirectiveRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[42], controller, inp)

listCacheDirectives(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListCacheDirectivesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[43], controller, inp, done)
listCacheDirectives(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListCacheDirectivesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[43], controller, inp)

addCachePool(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.AddCachePoolRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[44], controller, inp, done)
addCachePool(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.AddCachePoolRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[44], controller, inp)

modifyCachePool(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ModifyCachePoolRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[45], controller, inp, done)
modifyCachePool(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ModifyCachePoolRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[45], controller, inp)

removeCachePool(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveCachePoolRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[46], controller, inp, done)
removeCachePool(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveCachePoolRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[46], controller, inp)

listCachePools(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListCachePoolsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[47], controller, inp, done)
listCachePools(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListCachePoolsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[47], controller, inp)

getFileLinkInfo(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetFileLinkInfoRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[48], controller, inp, done)
getFileLinkInfo(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetFileLinkInfoRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[48], controller, inp)

getContentSummary(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetContentSummaryRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[49], controller, inp, done)
getContentSummary(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetContentSummaryRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[49], controller, inp)

setQuota(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetQuotaRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[50], controller, inp, done)
setQuota(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetQuotaRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[50], controller, inp)

fsync(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.FsyncRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[51], controller, inp, done)
fsync(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.FsyncRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[51], controller, inp)

setTimes(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetTimesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[52], controller, inp, done)
setTimes(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetTimesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[52], controller, inp)

createSymlink(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.CreateSymlinkRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[53], controller, inp, done)
createSymlink(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.CreateSymlinkRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[53], controller, inp)

getLinkTarget(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetLinkTargetRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[54], controller, inp, done)
getLinkTarget(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetLinkTargetRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[54], controller, inp)

updateBlockForPipeline(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.UpdateBlockForPipelineRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[55], controller, inp, done)
updateBlockForPipeline(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.UpdateBlockForPipelineRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[55], controller, inp)

updatePipeline(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.UpdatePipelineRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[56], controller, inp, done)
updatePipeline(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.UpdatePipelineRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[56], controller, inp)

getDelegationToken(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.common.GetDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[57], controller, inp, done)
getDelegationToken(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.common.GetDelegationTokenRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[57], controller, inp)

renewDelegationToken(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.common.RenewDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[58], controller, inp, done)
renewDelegationToken(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.common.RenewDelegationTokenRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[58], controller, inp)

cancelDelegationToken(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.common.CancelDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[59], controller, inp, done)
cancelDelegationToken(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.common.CancelDelegationTokenRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[59], controller, inp)

setBalancerBandwidth(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetBalancerBandwidthRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[60], controller, inp, done)
setBalancerBandwidth(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetBalancerBandwidthRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[60], controller, inp)

getDataEncryptionKey(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetDataEncryptionKeyRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[61], controller, inp, done)
getDataEncryptionKey(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetDataEncryptionKeyRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[61], controller, inp)

createSnapshot(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.CreateSnapshotRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[62], controller, inp, done)
createSnapshot(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.CreateSnapshotRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[62], controller, inp)

renameSnapshot(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RenameSnapshotRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[63], controller, inp, done)
renameSnapshot(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RenameSnapshotRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[63], controller, inp)

allowSnapshot(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.AllowSnapshotRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[64], controller, inp, done)
allowSnapshot(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.AllowSnapshotRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[64], controller, inp)

disallowSnapshot(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.DisallowSnapshotRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[65], controller, inp, done)
disallowSnapshot(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.DisallowSnapshotRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[65], controller, inp)

getSnapshottableDirListing(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetSnapshottableDirListingRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[66], controller, inp, done)
getSnapshottableDirListing(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetSnapshottableDirListingRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[66], controller, inp)

deleteSnapshot(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.DeleteSnapshotRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[67], controller, inp, done)
deleteSnapshot(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.DeleteSnapshotRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[67], controller, inp)

getSnapshotDiffReport(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetSnapshotDiffReportRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[68], controller, inp, done)
getSnapshotDiffReport(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetSnapshotDiffReportRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[68], controller, inp)

isFileClosed(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.IsFileClosedRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[69], controller, inp, done)
isFileClosed(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.IsFileClosedRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[69], controller, inp)

modifyAclEntries(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ModifyAclEntriesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[70], controller, inp, done)
modifyAclEntries(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ModifyAclEntriesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[70], controller, inp)

removeAclEntries(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveAclEntriesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[71], controller, inp, done)
removeAclEntries(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveAclEntriesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[71], controller, inp)

removeDefaultAcl(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveDefaultAclRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[72], controller, inp, done)
removeDefaultAcl(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveDefaultAclRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[72], controller, inp)

removeAcl(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveAclRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[73], controller, inp, done)
removeAcl(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveAclRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[73], controller, inp)

setAcl(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetAclRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[74], controller, inp, done)
setAcl(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetAclRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[74], controller, inp)

getAclStatus(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetAclStatusRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[75], controller, inp, done)
getAclStatus(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetAclStatusRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[75], controller, inp)

setXAttr(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetXAttrRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[76], controller, inp, done)
setXAttr(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.SetXAttrRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[76], controller, inp)

getXAttrs(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetXAttrsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[77], controller, inp, done)
getXAttrs(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetXAttrsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[77], controller, inp)

listXAttrs(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListXAttrsRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[78], controller, inp, done)
listXAttrs(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListXAttrsRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[78], controller, inp)

removeXAttr(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveXAttrRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[79], controller, inp, done)
removeXAttr(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.RemoveXAttrRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[79], controller, inp)

checkAccess(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.CheckAccessRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[80], controller, inp, done)
checkAccess(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.CheckAccessRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[80], controller, inp)

createEncryptionZone(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.CreateEncryptionZoneRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[81], controller, inp, done)
createEncryptionZone(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.CreateEncryptionZoneRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[81], controller, inp)

listEncryptionZones(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListEncryptionZonesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[82], controller, inp, done)
listEncryptionZones(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListEncryptionZonesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[82], controller, inp)

getEZForPath(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetEZForPathRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[83], controller, inp, done)
getEZForPath(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetEZForPathRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[83], controller, inp)

getCurrentEditLogTxid(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetCurrentEditLogTxidRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[84], controller, inp, done)
getCurrentEditLogTxid(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetCurrentEditLogTxidRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[84], controller, inp)

getEditsFromTxid(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetEditsFromTxidRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[85], controller, inp, done)
getEditsFromTxid(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetEditsFromTxidRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[85], controller, inp)

getQuotaUsage(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetQuotaUsageRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[86], controller, inp, done)
getQuotaUsage(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.GetQuotaUsageRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[86], controller, inp)

listOpenFiles(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListOpenFilesRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[87], controller, inp, done)
listOpenFiles(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.ListOpenFilesRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[87], controller, inp)

msync(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.MsyncRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[88], controller, inp, done)
msync(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.MsyncRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[88], controller, inp)

getHAServiceState(stub::ClientNamenodeProtocolStub, controller::ProtoRpcController, inp::hadoop.hdfs.HAServiceStateRequestProto, done::Function) = call_method(stub.impl, _ClientNamenodeProtocol_methods[89], controller, inp, done)
getHAServiceState(stub::ClientNamenodeProtocolBlockingStub, controller::ProtoRpcController, inp::hadoop.hdfs.HAServiceStateRequestProto) = call_method(stub.impl, _ClientNamenodeProtocol_methods[89], controller, inp)

export CreateFlagProto, AddBlockFlagProto, DatanodeReportTypeProto, SafeModeActionProto, RollingUpgradeActionProto, CacheFlagProto, GetBlockLocationsRequestProto, GetBlockLocationsResponseProto, GetServerDefaultsRequestProto, GetServerDefaultsResponseProto, CreateRequestProto, CreateResponseProto, AppendRequestProto, AppendResponseProto, SetReplicationRequestProto, SetReplicationResponseProto, SetStoragePolicyRequestProto, SetStoragePolicyResponseProto, UnsetStoragePolicyRequestProto, UnsetStoragePolicyResponseProto, GetStoragePolicyRequestProto, GetStoragePolicyResponseProto, GetStoragePoliciesRequestProto, GetStoragePoliciesResponseProto, SetPermissionRequestProto, SetPermissionResponseProto, SetOwnerRequestProto, SetOwnerResponseProto, AbandonBlockRequestProto, AbandonBlockResponseProto, AddBlockRequestProto, AddBlockResponseProto, GetAdditionalDatanodeRequestProto, GetAdditionalDatanodeResponseProto, CompleteRequestProto, CompleteResponseProto, ReportBadBlocksRequestProto, ReportBadBlocksResponseProto, ConcatRequestProto, ConcatResponseProto, TruncateRequestProto, TruncateResponseProto, RenameRequestProto, RenameResponseProto, Rename2RequestProto, Rename2ResponseProto, DeleteRequestProto, DeleteResponseProto, MkdirsRequestProto, MkdirsResponseProto, GetListingRequestProto, GetListingResponseProto, GetSnapshottableDirListingRequestProto, GetSnapshottableDirListingResponseProto, GetSnapshotDiffReportRequestProto, GetSnapshotDiffReportResponseProto, RenewLeaseRequestProto, RenewLeaseResponseProto, RecoverLeaseRequestProto, RecoverLeaseResponseProto, GetFsStatusRequestProto, GetFsStatsResponseProto, GetDatanodeReportRequestProto, GetDatanodeReportResponseProto, GetDatanodeStorageReportRequestProto, DatanodeStorageReportProto, GetDatanodeStorageReportResponseProto, GetPreferredBlockSizeRequestProto, GetPreferredBlockSizeResponseProto, SetSafeModeRequestProto, SetSafeModeResponseProto, SaveNamespaceRequestProto, SaveNamespaceResponseProto, RollEditsRequestProto, RollEditsResponseProto, RestoreFailedStorageRequestProto, RestoreFailedStorageResponseProto, RefreshNodesRequestProto, RefreshNodesResponseProto, FinalizeUpgradeRequestProto, FinalizeUpgradeResponseProto, RollingUpgradeRequestProto, RollingUpgradeInfoProto, RollingUpgradeResponseProto, ListCorruptFileBlocksRequestProto, ListCorruptFileBlocksResponseProto, MetaSaveRequestProto, MetaSaveResponseProto, GetFileInfoRequestProto, GetFileInfoResponseProto, IsFileClosedRequestProto, IsFileClosedResponseProto, CacheDirectiveInfoProto, CacheDirectiveInfoExpirationProto, CacheDirectiveStatsProto, AddCacheDirectiveRequestProto, AddCacheDirectiveResponseProto, ModifyCacheDirectiveRequestProto, ModifyCacheDirectiveResponseProto, RemoveCacheDirectiveRequestProto, RemoveCacheDirectiveResponseProto, ListCacheDirectivesRequestProto, CacheDirectiveEntryProto, ListCacheDirectivesResponseProto, CachePoolInfoProto, CachePoolStatsProto, AddCachePoolRequestProto, AddCachePoolResponseProto, ModifyCachePoolRequestProto, ModifyCachePoolResponseProto, RemoveCachePoolRequestProto, RemoveCachePoolResponseProto, ListCachePoolsRequestProto, ListCachePoolsResponseProto, CachePoolEntryProto, GetFileLinkInfoRequestProto, GetFileLinkInfoResponseProto, GetContentSummaryRequestProto, GetContentSummaryResponseProto, GetQuotaUsageRequestProto, GetQuotaUsageResponseProto, SetQuotaRequestProto, SetQuotaResponseProto, FsyncRequestProto, FsyncResponseProto, SetTimesRequestProto, SetTimesResponseProto, CreateSymlinkRequestProto, CreateSymlinkResponseProto, GetLinkTargetRequestProto, GetLinkTargetResponseProto, UpdateBlockForPipelineRequestProto, UpdateBlockForPipelineResponseProto, UpdatePipelineRequestProto, UpdatePipelineResponseProto, SetBalancerBandwidthRequestProto, SetBalancerBandwidthResponseProto, GetDataEncryptionKeyRequestProto, GetDataEncryptionKeyResponseProto, CreateSnapshotRequestProto, CreateSnapshotResponseProto, RenameSnapshotRequestProto, RenameSnapshotResponseProto, AllowSnapshotRequestProto, AllowSnapshotResponseProto, DisallowSnapshotRequestProto, DisallowSnapshotResponseProto, DeleteSnapshotRequestProto, DeleteSnapshotResponseProto, CheckAccessRequestProto, CheckAccessResponseProto, GetCurrentEditLogTxidRequestProto, GetCurrentEditLogTxidResponseProto, GetEditsFromTxidRequestProto, GetEditsFromTxidResponseProto, ListOpenFilesRequestProto, OpenFilesBatchResponseProto, ListOpenFilesResponseProto, MsyncRequestProto, MsyncResponseProto, HAServiceStateRequestProto, HAServiceStateResponseProto, ClientNamenodeProtocol, ClientNamenodeProtocolStub, ClientNamenodeProtocolBlockingStub, getBlockLocations, getServerDefaults, create, append, setReplication, setStoragePolicy, unsetStoragePolicy, getStoragePolicy, getStoragePolicies, setPermission, setOwner, abandonBlock, addBlock, getAdditionalDatanode, complete, reportBadBlocks, concat, truncate, rename, rename2, delete, mkdirs, getListing, renewLease, recoverLease, getFsStats, getDatanodeReport, getDatanodeStorageReport, getPreferredBlockSize, setSafeMode, saveNamespace, rollEdits, restoreFailedStorage, refreshNodes, finalizeUpgrade, rollingUpgrade, listCorruptFileBlocks, metaSave, getFileInfo, addCacheDirective, modifyCacheDirective, removeCacheDirective, listCacheDirectives, addCachePool, modifyCachePool, removeCachePool, listCachePools, getFileLinkInfo, getContentSummary, setQuota, fsync, setTimes, createSymlink, getLinkTarget, updateBlockForPipeline, updatePipeline, getDelegationToken, renewDelegationToken, cancelDelegationToken, setBalancerBandwidth, getDataEncryptionKey, createSnapshot, renameSnapshot, allowSnapshot, disallowSnapshot, getSnapshottableDirListing, deleteSnapshot, getSnapshotDiffReport, isFileClosed, modifyAclEntries, removeAclEntries, removeDefaultAcl, removeAcl, setAcl, getAclStatus, setXAttr, getXAttrs, listXAttrs, removeXAttr, checkAccess, createEncryptionZone, listEncryptionZones, getEZForPath, getCurrentEditLogTxid, getEditsFromTxid, getQuotaUsage, listOpenFiles, msync, getHAServiceState
