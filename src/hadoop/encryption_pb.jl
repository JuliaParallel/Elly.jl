# syntax: proto2
using ProtoBuf
import ProtoBuf.meta

mutable struct CreateEncryptionZoneRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CreateEncryptionZoneRequestProto(; kwargs...)
        obj = new(meta(CreateEncryptionZoneRequestProto), Dict{Symbol,Any}())
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
end # mutable struct CreateEncryptionZoneRequestProto
const __meta_CreateEncryptionZoneRequestProto = Ref{ProtoMeta}()
function meta(::Type{CreateEncryptionZoneRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CreateEncryptionZoneRequestProto)
            __meta_CreateEncryptionZoneRequestProto[] = target = ProtoMeta(CreateEncryptionZoneRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString, :keyName => AbstractString]
            meta(target, CreateEncryptionZoneRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CreateEncryptionZoneRequestProto[]
    end
end
function Base.getproperty(obj::CreateEncryptionZoneRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :keyName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct CreateEncryptionZoneResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CreateEncryptionZoneResponseProto(; kwargs...)
        obj = new(meta(CreateEncryptionZoneResponseProto), Dict{Symbol,Any}())
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
end # mutable struct CreateEncryptionZoneResponseProto
const __meta_CreateEncryptionZoneResponseProto = Ref{ProtoMeta}()
function meta(::Type{CreateEncryptionZoneResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CreateEncryptionZoneResponseProto)
            __meta_CreateEncryptionZoneResponseProto[] = target = ProtoMeta(CreateEncryptionZoneResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, CreateEncryptionZoneResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CreateEncryptionZoneResponseProto[]
    end
end

mutable struct ListEncryptionZonesRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ListEncryptionZonesRequestProto(; kwargs...)
        obj = new(meta(ListEncryptionZonesRequestProto), Dict{Symbol,Any}())
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
end # mutable struct ListEncryptionZonesRequestProto
const __meta_ListEncryptionZonesRequestProto = Ref{ProtoMeta}()
function meta(::Type{ListEncryptionZonesRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ListEncryptionZonesRequestProto)
            __meta_ListEncryptionZonesRequestProto[] = target = ProtoMeta(ListEncryptionZonesRequestProto)
            req = Symbol[:id]
            allflds = Pair{Symbol,Union{Type,String}}[:id => Int64]
            meta(target, ListEncryptionZonesRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ListEncryptionZonesRequestProto[]
    end
end
function Base.getproperty(obj::ListEncryptionZonesRequestProto, name::Symbol)
    if name === :id
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct EncryptionZoneProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function EncryptionZoneProto(; kwargs...)
        obj = new(meta(EncryptionZoneProto), Dict{Symbol,Any}())
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
end # mutable struct EncryptionZoneProto
const __meta_EncryptionZoneProto = Ref{ProtoMeta}()
function meta(::Type{EncryptionZoneProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_EncryptionZoneProto)
            __meta_EncryptionZoneProto[] = target = ProtoMeta(EncryptionZoneProto)
            req = Symbol[:id,:path,:suite,:cryptoProtocolVersion,:keyName]
            allflds = Pair{Symbol,Union{Type,String}}[:id => Int64, :path => AbstractString, :suite => Int32, :cryptoProtocolVersion => Int32, :keyName => AbstractString]
            meta(target, EncryptionZoneProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_EncryptionZoneProto[]
    end
end
function Base.getproperty(obj::EncryptionZoneProto, name::Symbol)
    if name === :id
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :suite
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :cryptoProtocolVersion
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :keyName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct ListEncryptionZonesResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ListEncryptionZonesResponseProto(; kwargs...)
        obj = new(meta(ListEncryptionZonesResponseProto), Dict{Symbol,Any}())
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
end # mutable struct ListEncryptionZonesResponseProto
const __meta_ListEncryptionZonesResponseProto = Ref{ProtoMeta}()
function meta(::Type{ListEncryptionZonesResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ListEncryptionZonesResponseProto)
            __meta_ListEncryptionZonesResponseProto[] = target = ProtoMeta(ListEncryptionZonesResponseProto)
            req = Symbol[:hasMore]
            allflds = Pair{Symbol,Union{Type,String}}[:zones => Base.Vector{EncryptionZoneProto}, :hasMore => Bool]
            meta(target, ListEncryptionZonesResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ListEncryptionZonesResponseProto[]
    end
end
function Base.getproperty(obj::ListEncryptionZonesResponseProto, name::Symbol)
    if name === :zones
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{EncryptionZoneProto}
    elseif name === :hasMore
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct GetEZForPathRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetEZForPathRequestProto(; kwargs...)
        obj = new(meta(GetEZForPathRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetEZForPathRequestProto
const __meta_GetEZForPathRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetEZForPathRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetEZForPathRequestProto)
            __meta_GetEZForPathRequestProto[] = target = ProtoMeta(GetEZForPathRequestProto)
            req = Symbol[:src]
            allflds = Pair{Symbol,Union{Type,String}}[:src => AbstractString]
            meta(target, GetEZForPathRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetEZForPathRequestProto[]
    end
end
function Base.getproperty(obj::GetEZForPathRequestProto, name::Symbol)
    if name === :src
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct GetEZForPathResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetEZForPathResponseProto(; kwargs...)
        obj = new(meta(GetEZForPathResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetEZForPathResponseProto
const __meta_GetEZForPathResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetEZForPathResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetEZForPathResponseProto)
            __meta_GetEZForPathResponseProto[] = target = ProtoMeta(GetEZForPathResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:zone => EncryptionZoneProto]
            meta(target, GetEZForPathResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetEZForPathResponseProto[]
    end
end
function Base.getproperty(obj::GetEZForPathResponseProto, name::Symbol)
    if name === :zone
        return (obj.__protobuf_jl_internal_values[name])::EncryptionZoneProto
    else
        getfield(obj, name)
    end
end

export CreateEncryptionZoneRequestProto, CreateEncryptionZoneResponseProto, ListEncryptionZonesRequestProto, EncryptionZoneProto, ListEncryptionZonesResponseProto, GetEZForPathRequestProto, GetEZForPathResponseProto
