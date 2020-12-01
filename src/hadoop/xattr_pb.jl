# syntax: proto2
# COV_EXCL_START
using ProtoBuf
import ProtoBuf.meta

const XAttrSetFlagProto = (;[
    Symbol("XATTR_CREATE") => Int32(1),
    Symbol("XATTR_REPLACE") => Int32(2),
]...)

const XAttrProto_XAttrNamespaceProto = (;[
    Symbol("USER") => Int32(0),
    Symbol("TRUSTED") => Int32(1),
    Symbol("SECURITY") => Int32(2),
    Symbol("SYSTEM") => Int32(3),
    Symbol("RAW") => Int32(4),
]...)

mutable struct XAttrProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function XAttrProto(; kwargs...)
        obj = new(meta(XAttrProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct XAttrProto
const __meta_XAttrProto = Ref{ProtoMeta}()
function meta(::Type{XAttrProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_XAttrProto)
            __meta_XAttrProto[] = target = ProtoMeta(XAttrProto)
            req = Symbol[:namespace,:name]
            allflds = Pair{Symbol,Union{Type,String}}[:namespace => Int32, :name => AbstractString, :value => Array{UInt8,1}]
            meta(target, XAttrProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_XAttrProto[]
    end
end
function Base.getproperty(obj::XAttrProto, name::Symbol)
    if name === :namespace
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    else
        getfield(obj, name)
    end
end

mutable struct SetXAttrRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SetXAttrRequestProto(; kwargs...)
        obj = new(meta(SetXAttrRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SetXAttrRequestProto
const __meta_SetXAttrRequestProto = Ref{ProtoMeta}()
function meta(::Type{SetXAttrRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetXAttrRequestProto)
            __meta_SetXAttrRequestProto[] = target = ProtoMeta(SetXAttrRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :xAttr => XAttrProto, :flag => UInt32]
            meta(target, SetXAttrRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetXAttrRequestProto[]
    end
end
function Base.getproperty(obj::SetXAttrRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :xAttr
        return (obj.__protobuf_jl_internal_values[name])::XAttrProto
    elseif name === :flag
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    else
        getfield(obj, name)
    end
end

mutable struct SetXAttrResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SetXAttrResponseProto(; kwargs...)
        obj = new(meta(SetXAttrResponseProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SetXAttrResponseProto
const __meta_SetXAttrResponseProto = Ref{ProtoMeta}()
function meta(::Type{SetXAttrResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SetXAttrResponseProto)
            __meta_SetXAttrResponseProto[] = target = ProtoMeta(SetXAttrResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, SetXAttrResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SetXAttrResponseProto[]
    end
end

mutable struct GetXAttrsRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function GetXAttrsRequestProto(; kwargs...)
        obj = new(meta(GetXAttrsRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct GetXAttrsRequestProto
const __meta_GetXAttrsRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetXAttrsRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetXAttrsRequestProto)
            __meta_GetXAttrsRequestProto[] = target = ProtoMeta(GetXAttrsRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :xAttrs => Base.Vector{XAttrProto}]
            meta(target, GetXAttrsRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetXAttrsRequestProto[]
    end
end
function Base.getproperty(obj::GetXAttrsRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :xAttrs
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{XAttrProto}
    else
        getfield(obj, name)
    end
end

mutable struct GetXAttrsResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function GetXAttrsResponseProto(; kwargs...)
        obj = new(meta(GetXAttrsResponseProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct GetXAttrsResponseProto
const __meta_GetXAttrsResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetXAttrsResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetXAttrsResponseProto)
            __meta_GetXAttrsResponseProto[] = target = ProtoMeta(GetXAttrsResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:xAttrs => Base.Vector{XAttrProto}]
            meta(target, GetXAttrsResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetXAttrsResponseProto[]
    end
end
function Base.getproperty(obj::GetXAttrsResponseProto, name::Symbol)
    if name === :xAttrs
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{XAttrProto}
    else
        getfield(obj, name)
    end
end

mutable struct ListXAttrsRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ListXAttrsRequestProto(; kwargs...)
        obj = new(meta(ListXAttrsRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ListXAttrsRequestProto
const __meta_ListXAttrsRequestProto = Ref{ProtoMeta}()
function meta(::Type{ListXAttrsRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ListXAttrsRequestProto)
            __meta_ListXAttrsRequestProto[] = target = ProtoMeta(ListXAttrsRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString]
            meta(target, ListXAttrsRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ListXAttrsRequestProto[]
    end
end
function Base.getproperty(obj::ListXAttrsRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct ListXAttrsResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ListXAttrsResponseProto(; kwargs...)
        obj = new(meta(ListXAttrsResponseProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ListXAttrsResponseProto
const __meta_ListXAttrsResponseProto = Ref{ProtoMeta}()
function meta(::Type{ListXAttrsResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ListXAttrsResponseProto)
            __meta_ListXAttrsResponseProto[] = target = ProtoMeta(ListXAttrsResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:xAttrs => Base.Vector{XAttrProto}]
            meta(target, ListXAttrsResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ListXAttrsResponseProto[]
    end
end
function Base.getproperty(obj::ListXAttrsResponseProto, name::Symbol)
    if name === :xAttrs
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{XAttrProto}
    else
        getfield(obj, name)
    end
end

mutable struct RemoveXAttrRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RemoveXAttrRequestProto(; kwargs...)
        obj = new(meta(RemoveXAttrRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RemoveXAttrRequestProto
const __meta_RemoveXAttrRequestProto = Ref{ProtoMeta}()
function meta(::Type{RemoveXAttrRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RemoveXAttrRequestProto)
            __meta_RemoveXAttrRequestProto[] = target = ProtoMeta(RemoveXAttrRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :xAttr => XAttrProto]
            meta(target, RemoveXAttrRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RemoveXAttrRequestProto[]
    end
end
function Base.getproperty(obj::RemoveXAttrRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :xAttr
        return (obj.__protobuf_jl_internal_values[name])::XAttrProto
    else
        getfield(obj, name)
    end
end

mutable struct RemoveXAttrResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RemoveXAttrResponseProto(; kwargs...)
        obj = new(meta(RemoveXAttrResponseProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct RemoveXAttrResponseProto
const __meta_RemoveXAttrResponseProto = Ref{ProtoMeta}()
function meta(::Type{RemoveXAttrResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RemoveXAttrResponseProto)
            __meta_RemoveXAttrResponseProto[] = target = ProtoMeta(RemoveXAttrResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, RemoveXAttrResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RemoveXAttrResponseProto[]
    end
end

export XAttrSetFlagProto, XAttrProto_XAttrNamespaceProto, XAttrProto, SetXAttrRequestProto, SetXAttrResponseProto, GetXAttrsRequestProto, GetXAttrsResponseProto, ListXAttrsRequestProto, ListXAttrsResponseProto, RemoveXAttrRequestProto, RemoveXAttrResponseProto
# COV_EXCL_STOP