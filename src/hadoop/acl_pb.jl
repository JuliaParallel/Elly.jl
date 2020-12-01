# syntax: proto2
# COV_EXCL_START
using ProtoBuf
import ProtoBuf.meta

const AclEntryProto_AclEntryScopeProto = (;[
    Symbol("ACCESS") => Int32(0),
    Symbol("DEFAULT") => Int32(1),
]...)

const AclEntryProto_AclEntryTypeProto = (;[
    Symbol("USER") => Int32(0),
    Symbol("GROUP") => Int32(1),
    Symbol("MASK") => Int32(2),
    Symbol("OTHER") => Int32(3),
]...)

const AclEntryProto_FsActionProto = (;[
    Symbol("NONE") => Int32(0),
    Symbol("EXECUTE") => Int32(1),
    Symbol("WRITE") => Int32(2),
    Symbol("WRITE_EXECUTE") => Int32(3),
    Symbol("READ") => Int32(4),
    Symbol("READ_EXECUTE") => Int32(5),
    Symbol("READ_WRITE") => Int32(6),
    Symbol("PERM_ALL") => Int32(7),
]...)

mutable struct AclEntryProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function AclEntryProto(; kwargs...)
        obj = new(meta(AclEntryProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct AclEntryProto
const __meta_AclEntryProto = Ref{ProtoMeta}()
function meta(::Type{AclEntryProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AclEntryProto)
            __meta_AclEntryProto[] = target = ProtoMeta(AclEntryProto)
            req = Symbol[:_type,:scope,:permissions]
            allflds = Pair{Symbol,Union{Type,String}}[:_type => Int32, :scope => Int32, :permissions => Int32, :name => AbstractString]
            meta(target, AclEntryProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AclEntryProto[]
    end
end
function Base.getproperty(obj::AclEntryProto, name::Symbol)
    if name === :_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :scope
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :permissions
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct AclStatusProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function AclStatusProto(; kwargs...)
        obj = new(meta(AclStatusProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct AclStatusProto
const __meta_AclStatusProto = Ref{ProtoMeta}()
function meta(::Type{AclStatusProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AclStatusProto)
            __meta_AclStatusProto[] = target = ProtoMeta(AclStatusProto)
            req = Symbol[:owner,:group,:sticky]
            allflds = Pair{Symbol,Union{Type,String}}[:owner => AbstractString, :group => AbstractString, :sticky => Bool, :entries => Base.Vector{AclEntryProto}, :permission => FsPermissionProto]
            meta(target, AclStatusProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AclStatusProto[]
    end
end
function Base.getproperty(obj::AclStatusProto, name::Symbol)
    if name === :owner
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :group
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :sticky
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :entries
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AclEntryProto}
    elseif name === :permission
        return (obj.__protobuf_jl_internal_values[name])::FsPermissionProto
    else
        getfield(obj, name)
    end
end

mutable struct ModifyAclEntriesRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ModifyAclEntriesRequestProto(; kwargs...)
        obj = new(meta(ModifyAclEntriesRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ModifyAclEntriesRequestProto
const __meta_ModifyAclEntriesRequestProto = Ref{ProtoMeta}()
function meta(::Type{ModifyAclEntriesRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ModifyAclEntriesRequestProto)
            __meta_ModifyAclEntriesRequestProto[] = target = ProtoMeta(ModifyAclEntriesRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :aclSpec => Base.Vector{AclEntryProto}]
            meta(target, ModifyAclEntriesRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ModifyAclEntriesRequestProto[]
    end
end
function Base.getproperty(obj::ModifyAclEntriesRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :aclSpec
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AclEntryProto}
    else
        getfield(obj, name)
    end
end

mutable struct ModifyAclEntriesResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ModifyAclEntriesResponseProto(; kwargs...)
        obj = new(meta(ModifyAclEntriesResponseProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ModifyAclEntriesResponseProto
const __meta_ModifyAclEntriesResponseProto = Ref{ProtoMeta}()
function meta(::Type{ModifyAclEntriesResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ModifyAclEntriesResponseProto)
            __meta_ModifyAclEntriesResponseProto[] = target = ProtoMeta(ModifyAclEntriesResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, ModifyAclEntriesResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ModifyAclEntriesResponseProto[]
    end
end

mutable struct RemoveAclRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RemoveAclRequestProto(; kwargs...)
        obj = new(meta(RemoveAclRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RemoveAclRequestProto
const __meta_RemoveAclRequestProto = Ref{ProtoMeta}()
function meta(::Type{RemoveAclRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RemoveAclRequestProto)
            __meta_RemoveAclRequestProto[] = target = ProtoMeta(RemoveAclRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString]
            meta(target, RemoveAclRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RemoveAclRequestProto[]
    end
end
function Base.getproperty(obj::RemoveAclRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct RemoveAclResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RemoveAclResponseProto(; kwargs...)
        obj = new(meta(RemoveAclResponseProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RemoveAclResponseProto
const __meta_RemoveAclResponseProto = Ref{ProtoMeta}()
function meta(::Type{RemoveAclResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RemoveAclResponseProto)
            __meta_RemoveAclResponseProto[] = target = ProtoMeta(RemoveAclResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, RemoveAclResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RemoveAclResponseProto[]
    end
end

mutable struct RemoveAclEntriesRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RemoveAclEntriesRequestProto(; kwargs...)
        obj = new(meta(RemoveAclEntriesRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RemoveAclEntriesRequestProto
const __meta_RemoveAclEntriesRequestProto = Ref{ProtoMeta}()
function meta(::Type{RemoveAclEntriesRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RemoveAclEntriesRequestProto)
            __meta_RemoveAclEntriesRequestProto[] = target = ProtoMeta(RemoveAclEntriesRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :aclSpec => Base.Vector{AclEntryProto}]
            meta(target, RemoveAclEntriesRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RemoveAclEntriesRequestProto[]
    end
end
function Base.getproperty(obj::RemoveAclEntriesRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :aclSpec
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AclEntryProto}
    else
        getfield(obj, name)
    end
end

mutable struct RemoveAclEntriesResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RemoveAclEntriesResponseProto(; kwargs...)
        obj = new(meta(RemoveAclEntriesResponseProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RemoveAclEntriesResponseProto
const __meta_RemoveAclEntriesResponseProto = Ref{ProtoMeta}()
function meta(::Type{RemoveAclEntriesResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RemoveAclEntriesResponseProto)
            __meta_RemoveAclEntriesResponseProto[] = target = ProtoMeta(RemoveAclEntriesResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, RemoveAclEntriesResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RemoveAclEntriesResponseProto[]
    end
end

mutable struct RemoveDefaultAclRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RemoveDefaultAclRequestProto(; kwargs...)
        obj = new(meta(RemoveDefaultAclRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RemoveDefaultAclRequestProto
const __meta_RemoveDefaultAclRequestProto = Ref{ProtoMeta}()
function meta(::Type{RemoveDefaultAclRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RemoveDefaultAclRequestProto)
            __meta_RemoveDefaultAclRequestProto[] = target = ProtoMeta(RemoveDefaultAclRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString]
            meta(target, RemoveDefaultAclRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RemoveDefaultAclRequestProto[]
    end
end
function Base.getproperty(obj::RemoveDefaultAclRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct RemoveDefaultAclResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RemoveDefaultAclResponseProto(; kwargs...)
        obj = new(meta(RemoveDefaultAclResponseProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RemoveDefaultAclResponseProto
const __meta_RemoveDefaultAclResponseProto = Ref{ProtoMeta}()
function meta(::Type{RemoveDefaultAclResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RemoveDefaultAclResponseProto)
            __meta_RemoveDefaultAclResponseProto[] = target = ProtoMeta(RemoveDefaultAclResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, RemoveDefaultAclResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RemoveDefaultAclResponseProto[]
    end
end

mutable struct SetAclRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SetAclRequestProto(; kwargs...)
        obj = new(meta(SetAclRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SetAclRequestProto
const __meta_SetAclRequestProto = Ref{ProtoMeta}()
function meta(::Type{SetAclRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetAclRequestProto)
            __meta_SetAclRequestProto[] = target = ProtoMeta(SetAclRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :aclSpec => Base.Vector{AclEntryProto}]
            meta(target, SetAclRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetAclRequestProto[]
    end
end
function Base.getproperty(obj::SetAclRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :aclSpec
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AclEntryProto}
    else
        getfield(obj, name)
    end
end

mutable struct SetAclResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SetAclResponseProto(; kwargs...)
        obj = new(meta(SetAclResponseProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SetAclResponseProto
const __meta_SetAclResponseProto = Ref{ProtoMeta}()
function meta(::Type{SetAclResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetAclResponseProto)
            __meta_SetAclResponseProto[] = target = ProtoMeta(SetAclResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, SetAclResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetAclResponseProto[]
    end
end

mutable struct GetAclStatusRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function GetAclStatusRequestProto(; kwargs...)
        obj = new(meta(GetAclStatusRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct GetAclStatusRequestProto
const __meta_GetAclStatusRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetAclStatusRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetAclStatusRequestProto)
            __meta_GetAclStatusRequestProto[] = target = ProtoMeta(GetAclStatusRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString]
            meta(target, GetAclStatusRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetAclStatusRequestProto[]
    end
end
function Base.getproperty(obj::GetAclStatusRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct GetAclStatusResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function GetAclStatusResponseProto(; kwargs...)
        obj = new(meta(GetAclStatusResponseProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct GetAclStatusResponseProto
const __meta_GetAclStatusResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetAclStatusResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetAclStatusResponseProto)
            __meta_GetAclStatusResponseProto[] = target = ProtoMeta(GetAclStatusResponseProto)
            req = Symbol[:result]
            allflds = Pair{Symbol,Union{Type,String}}[:result => AclStatusProto]
            meta(target, GetAclStatusResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetAclStatusResponseProto[]
    end
end
function Base.getproperty(obj::GetAclStatusResponseProto, name::Symbol)
    if name === :result
        return (obj.__protobuf_jl_internal_values[name])::AclStatusProto
    else
        getfield(obj, name)
    end
end

export AclEntryProto_AclEntryScopeProto, AclEntryProto_AclEntryTypeProto, AclEntryProto_FsActionProto, AclEntryProto, AclStatusProto, ModifyAclEntriesRequestProto, ModifyAclEntriesResponseProto, RemoveAclRequestProto, RemoveAclResponseProto, RemoveAclEntriesRequestProto, RemoveAclEntriesResponseProto, RemoveDefaultAclRequestProto, RemoveDefaultAclResponseProto, SetAclRequestProto, SetAclResponseProto, GetAclStatusRequestProto, GetAclStatusResponseProto
# COV_EXCL_STOP