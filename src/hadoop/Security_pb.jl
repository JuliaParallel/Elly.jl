# syntax: proto2
using ProtoBuf
import ProtoBuf.meta

mutable struct TokenProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function TokenProto(; kwargs...)
        obj = new(meta(TokenProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct TokenProto
const __meta_TokenProto = Ref{ProtoMeta}()
function meta(::Type{TokenProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TokenProto)
            __meta_TokenProto[] = target = ProtoMeta(TokenProto)
            req = Symbol[:identifier,:password,:kind,:service]
            allflds = Pair{Symbol,Union{Type,String}}[:identifier => Array{UInt8,1}, :password => Array{UInt8,1}, :kind => AbstractString, :service => AbstractString]
            meta(target, TokenProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TokenProto[]
    end
end
function Base.getproperty(obj::TokenProto, name::Symbol)
    if name === :identifier
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :password
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :kind
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :service
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct GetDelegationTokenRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetDelegationTokenRequestProto(; kwargs...)
        obj = new(meta(GetDelegationTokenRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetDelegationTokenRequestProto
const __meta_GetDelegationTokenRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetDelegationTokenRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetDelegationTokenRequestProto)
            __meta_GetDelegationTokenRequestProto[] = target = ProtoMeta(GetDelegationTokenRequestProto)
            req = Symbol[:renewer]
            allflds = Pair{Symbol,Union{Type,String}}[:renewer => AbstractString]
            meta(target, GetDelegationTokenRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetDelegationTokenRequestProto[]
    end
end
function Base.getproperty(obj::GetDelegationTokenRequestProto, name::Symbol)
    if name === :renewer
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct GetDelegationTokenResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetDelegationTokenResponseProto(; kwargs...)
        obj = new(meta(GetDelegationTokenResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetDelegationTokenResponseProto
const __meta_GetDelegationTokenResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetDelegationTokenResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetDelegationTokenResponseProto)
            __meta_GetDelegationTokenResponseProto[] = target = ProtoMeta(GetDelegationTokenResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:token => TokenProto]
            meta(target, GetDelegationTokenResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetDelegationTokenResponseProto[]
    end
end
function Base.getproperty(obj::GetDelegationTokenResponseProto, name::Symbol)
    if name === :token
        return (obj.__protobuf_jl_internal_values[name])::TokenProto
    else
        getfield(obj, name)
    end
end

mutable struct RenewDelegationTokenRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RenewDelegationTokenRequestProto(; kwargs...)
        obj = new(meta(RenewDelegationTokenRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RenewDelegationTokenRequestProto
const __meta_RenewDelegationTokenRequestProto = Ref{ProtoMeta}()
function meta(::Type{RenewDelegationTokenRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RenewDelegationTokenRequestProto)
            __meta_RenewDelegationTokenRequestProto[] = target = ProtoMeta(RenewDelegationTokenRequestProto)
            req = Symbol[:token]
            allflds = Pair{Symbol,Union{Type,String}}[:token => TokenProto]
            meta(target, RenewDelegationTokenRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RenewDelegationTokenRequestProto[]
    end
end
function Base.getproperty(obj::RenewDelegationTokenRequestProto, name::Symbol)
    if name === :token
        return (obj.__protobuf_jl_internal_values[name])::TokenProto
    else
        getfield(obj, name)
    end
end

mutable struct RenewDelegationTokenResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RenewDelegationTokenResponseProto(; kwargs...)
        obj = new(meta(RenewDelegationTokenResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RenewDelegationTokenResponseProto
const __meta_RenewDelegationTokenResponseProto = Ref{ProtoMeta}()
function meta(::Type{RenewDelegationTokenResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RenewDelegationTokenResponseProto)
            __meta_RenewDelegationTokenResponseProto[] = target = ProtoMeta(RenewDelegationTokenResponseProto)
            req = Symbol[:newExpiryTime]
            allflds = Pair{Symbol,Union{Type,String}}[:newExpiryTime => UInt64]
            meta(target, RenewDelegationTokenResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RenewDelegationTokenResponseProto[]
    end
end
function Base.getproperty(obj::RenewDelegationTokenResponseProto, name::Symbol)
    if name === :newExpiryTime
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

mutable struct CancelDelegationTokenRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CancelDelegationTokenRequestProto(; kwargs...)
        obj = new(meta(CancelDelegationTokenRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct CancelDelegationTokenRequestProto
const __meta_CancelDelegationTokenRequestProto = Ref{ProtoMeta}()
function meta(::Type{CancelDelegationTokenRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CancelDelegationTokenRequestProto)
            __meta_CancelDelegationTokenRequestProto[] = target = ProtoMeta(CancelDelegationTokenRequestProto)
            req = Symbol[:token]
            allflds = Pair{Symbol,Union{Type,String}}[:token => TokenProto]
            meta(target, CancelDelegationTokenRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CancelDelegationTokenRequestProto[]
    end
end
function Base.getproperty(obj::CancelDelegationTokenRequestProto, name::Symbol)
    if name === :token
        return (obj.__protobuf_jl_internal_values[name])::TokenProto
    else
        getfield(obj, name)
    end
end

mutable struct CancelDelegationTokenResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CancelDelegationTokenResponseProto(; kwargs...)
        obj = new(meta(CancelDelegationTokenResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct CancelDelegationTokenResponseProto
const __meta_CancelDelegationTokenResponseProto = Ref{ProtoMeta}()
function meta(::Type{CancelDelegationTokenResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CancelDelegationTokenResponseProto)
            __meta_CancelDelegationTokenResponseProto[] = target = ProtoMeta(CancelDelegationTokenResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, CancelDelegationTokenResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CancelDelegationTokenResponseProto[]
    end
end

export TokenProto, GetDelegationTokenRequestProto, GetDelegationTokenResponseProto, RenewDelegationTokenRequestProto, RenewDelegationTokenResponseProto, CancelDelegationTokenRequestProto, CancelDelegationTokenResponseProto
