# syntax: proto2
# COV_EXCL_START
using ProtoBuf
import ProtoBuf.meta

const EventType = (;[
    Symbol("EVENT_CREATE") => Int32(0),
    Symbol("EVENT_CLOSE") => Int32(1),
    Symbol("EVENT_APPEND") => Int32(2),
    Symbol("EVENT_RENAME") => Int32(3),
    Symbol("EVENT_METADATA") => Int32(4),
    Symbol("EVENT_UNLINK") => Int32(5),
    Symbol("EVENT_TRUNCATE") => Int32(6),
]...)

const INodeType = (;[
    Symbol("I_TYPE_FILE") => Int32(0),
    Symbol("I_TYPE_DIRECTORY") => Int32(1),
    Symbol("I_TYPE_SYMLINK") => Int32(2),
]...)

const MetadataUpdateType = (;[
    Symbol("META_TYPE_TIMES") => Int32(0),
    Symbol("META_TYPE_REPLICATION") => Int32(1),
    Symbol("META_TYPE_OWNER") => Int32(2),
    Symbol("META_TYPE_PERMS") => Int32(3),
    Symbol("META_TYPE_ACLS") => Int32(4),
    Symbol("META_TYPE_XATTRS") => Int32(5),
]...)

mutable struct EventProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function EventProto(; kwargs...)
        obj = new(meta(EventProto), Dict{Symbol,Any}())
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
end # mutable struct EventProto
const __meta_EventProto = Ref{ProtoMeta}()
function meta(::Type{EventProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_EventProto)
            __meta_EventProto[] = target = ProtoMeta(EventProto)
            req = Symbol[:_type,:contents]
            allflds = Pair{Symbol,Union{Type,String}}[:_type => Int32, :contents => Array{UInt8,1}]
            meta(target, EventProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_EventProto[]
    end
end
function Base.getproperty(obj::EventProto, name::Symbol)
    if name === :_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :contents
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    else
        getfield(obj, name)
    end
end

mutable struct EventBatchProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function EventBatchProto(; kwargs...)
        obj = new(meta(EventBatchProto), Dict{Symbol,Any}())
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
end # mutable struct EventBatchProto
const __meta_EventBatchProto = Ref{ProtoMeta}()
function meta(::Type{EventBatchProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_EventBatchProto)
            __meta_EventBatchProto[] = target = ProtoMeta(EventBatchProto)
            req = Symbol[:txid]
            allflds = Pair{Symbol,Union{Type,String}}[:txid => Int64, :events => Base.Vector{EventProto}]
            meta(target, EventBatchProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_EventBatchProto[]
    end
end
function Base.getproperty(obj::EventBatchProto, name::Symbol)
    if name === :txid
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :events
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{EventProto}
    else
        getfield(obj, name)
    end
end

mutable struct CreateEventProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CreateEventProto(; kwargs...)
        obj = new(meta(CreateEventProto), Dict{Symbol,Any}())
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
end # mutable struct CreateEventProto
const __meta_CreateEventProto = Ref{ProtoMeta}()
function meta(::Type{CreateEventProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CreateEventProto)
            __meta_CreateEventProto[] = target = ProtoMeta(CreateEventProto)
            req = Symbol[:_type,:path,:ctime,:ownerName,:groupName,:perms]
            val = Dict{Symbol,Any}(:defaultBlockSize => 0)
            allflds = Pair{Symbol,Union{Type,String}}[:_type => Int32, :path => AbstractString, :ctime => Int64, :ownerName => AbstractString, :groupName => AbstractString, :perms => FsPermissionProto, :replication => Int32, :symlinkTarget => AbstractString, :overwrite => Bool, :defaultBlockSize => Int64]
            meta(target, CreateEventProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CreateEventProto[]
    end
end
function Base.getproperty(obj::CreateEventProto, name::Symbol)
    if name === :_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :ctime
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :ownerName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :groupName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :perms
        return (obj.__protobuf_jl_internal_values[name])::FsPermissionProto
    elseif name === :replication
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :symlinkTarget
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :overwrite
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :defaultBlockSize
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct CloseEventProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CloseEventProto(; kwargs...)
        obj = new(meta(CloseEventProto), Dict{Symbol,Any}())
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
end # mutable struct CloseEventProto
const __meta_CloseEventProto = Ref{ProtoMeta}()
function meta(::Type{CloseEventProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CloseEventProto)
            __meta_CloseEventProto[] = target = ProtoMeta(CloseEventProto)
            req = Symbol[:path,:fileSize,:timestamp]
            allflds = Pair{Symbol,Union{Type,String}}[:path => AbstractString, :fileSize => Int64, :timestamp => Int64]
            meta(target, CloseEventProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CloseEventProto[]
    end
end
function Base.getproperty(obj::CloseEventProto, name::Symbol)
    if name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :fileSize
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :timestamp
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct TruncateEventProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function TruncateEventProto(; kwargs...)
        obj = new(meta(TruncateEventProto), Dict{Symbol,Any}())
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
end # mutable struct TruncateEventProto
const __meta_TruncateEventProto = Ref{ProtoMeta}()
function meta(::Type{TruncateEventProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TruncateEventProto)
            __meta_TruncateEventProto[] = target = ProtoMeta(TruncateEventProto)
            req = Symbol[:path,:fileSize,:timestamp]
            allflds = Pair{Symbol,Union{Type,String}}[:path => AbstractString, :fileSize => Int64, :timestamp => Int64]
            meta(target, TruncateEventProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TruncateEventProto[]
    end
end
function Base.getproperty(obj::TruncateEventProto, name::Symbol)
    if name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :fileSize
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :timestamp
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct AppendEventProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function AppendEventProto(; kwargs...)
        obj = new(meta(AppendEventProto), Dict{Symbol,Any}())
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
end # mutable struct AppendEventProto
const __meta_AppendEventProto = Ref{ProtoMeta}()
function meta(::Type{AppendEventProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AppendEventProto)
            __meta_AppendEventProto[] = target = ProtoMeta(AppendEventProto)
            req = Symbol[:path]
            val = Dict{Symbol,Any}(:newBlock => false)
            allflds = Pair{Symbol,Union{Type,String}}[:path => AbstractString, :newBlock => Bool]
            meta(target, AppendEventProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AppendEventProto[]
    end
end
function Base.getproperty(obj::AppendEventProto, name::Symbol)
    if name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :newBlock
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct RenameEventProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RenameEventProto(; kwargs...)
        obj = new(meta(RenameEventProto), Dict{Symbol,Any}())
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
end # mutable struct RenameEventProto
const __meta_RenameEventProto = Ref{ProtoMeta}()
function meta(::Type{RenameEventProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RenameEventProto)
            __meta_RenameEventProto[] = target = ProtoMeta(RenameEventProto)
            req = Symbol[:srcPath,:destPath,:timestamp]
            allflds = Pair{Symbol,Union{Type,String}}[:srcPath => AbstractString, :destPath => AbstractString, :timestamp => Int64]
            meta(target, RenameEventProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RenameEventProto[]
    end
end
function Base.getproperty(obj::RenameEventProto, name::Symbol)
    if name === :srcPath
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :destPath
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :timestamp
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct MetadataUpdateEventProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function MetadataUpdateEventProto(; kwargs...)
        obj = new(meta(MetadataUpdateEventProto), Dict{Symbol,Any}())
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
end # mutable struct MetadataUpdateEventProto
const __meta_MetadataUpdateEventProto = Ref{ProtoMeta}()
function meta(::Type{MetadataUpdateEventProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MetadataUpdateEventProto)
            __meta_MetadataUpdateEventProto[] = target = ProtoMeta(MetadataUpdateEventProto)
            req = Symbol[:path,:_type]
            allflds = Pair{Symbol,Union{Type,String}}[:path => AbstractString, :_type => Int32, :mtime => Int64, :atime => Int64, :replication => Int32, :ownerName => AbstractString, :groupName => AbstractString, :perms => FsPermissionProto, :acls => Base.Vector{AclEntryProto}, :xAttrs => Base.Vector{XAttrProto}, :xAttrsRemoved => Bool]
            meta(target, MetadataUpdateEventProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MetadataUpdateEventProto[]
    end
end
function Base.getproperty(obj::MetadataUpdateEventProto, name::Symbol)
    if name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :mtime
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :atime
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :replication
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :ownerName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :groupName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :perms
        return (obj.__protobuf_jl_internal_values[name])::FsPermissionProto
    elseif name === :acls
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AclEntryProto}
    elseif name === :xAttrs
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{XAttrProto}
    elseif name === :xAttrsRemoved
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct UnlinkEventProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UnlinkEventProto(; kwargs...)
        obj = new(meta(UnlinkEventProto), Dict{Symbol,Any}())
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
end # mutable struct UnlinkEventProto
const __meta_UnlinkEventProto = Ref{ProtoMeta}()
function meta(::Type{UnlinkEventProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UnlinkEventProto)
            __meta_UnlinkEventProto[] = target = ProtoMeta(UnlinkEventProto)
            req = Symbol[:path,:timestamp]
            allflds = Pair{Symbol,Union{Type,String}}[:path => AbstractString, :timestamp => Int64]
            meta(target, UnlinkEventProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UnlinkEventProto[]
    end
end
function Base.getproperty(obj::UnlinkEventProto, name::Symbol)
    if name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :timestamp
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct EventsListProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function EventsListProto(; kwargs...)
        obj = new(meta(EventsListProto), Dict{Symbol,Any}())
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
end # mutable struct EventsListProto
const __meta_EventsListProto = Ref{ProtoMeta}()
function meta(::Type{EventsListProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_EventsListProto)
            __meta_EventsListProto[] = target = ProtoMeta(EventsListProto)
            req = Symbol[:firstTxid,:lastTxid,:syncTxid]
            allflds = Pair{Symbol,Union{Type,String}}[:events => Base.Vector{EventProto}, :firstTxid => Int64, :lastTxid => Int64, :syncTxid => Int64, :batch => Base.Vector{EventBatchProto}]
            meta(target, EventsListProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_EventsListProto[]
    end
end
function Base.getproperty(obj::EventsListProto, name::Symbol)
    if name === :events
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{EventProto}
    elseif name === :firstTxid
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :lastTxid
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :syncTxid
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :batch
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{EventBatchProto}
    else
        getfield(obj, name)
    end
end

export EventType, INodeType, MetadataUpdateType, EventProto, EventBatchProto, CreateEventProto, CloseEventProto, TruncateEventProto, AppendEventProto, RenameEventProto, MetadataUpdateEventProto, UnlinkEventProto, EventsListProto
# COV_EXCL_STOP