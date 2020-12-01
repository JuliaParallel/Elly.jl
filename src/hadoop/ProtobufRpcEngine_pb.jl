# syntax: proto2
# COV_EXCL_START
using ProtoBuf
import ProtoBuf.meta

mutable struct RequestHeaderProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function RequestHeaderProto(; kwargs...)
        obj = new(meta(RequestHeaderProto), Dict{Symbol,Any}(), Set{Symbol}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RequestHeaderProto
const __meta_RequestHeaderProto = Ref{ProtoMeta}()
function meta(::Type{RequestHeaderProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RequestHeaderProto)
            __meta_RequestHeaderProto[] = target = ProtoMeta(RequestHeaderProto)
            req = Symbol[:methodName,:declaringClassProtocolName,:clientProtocolVersion]
            allflds = Pair{Symbol,Union{Type,String}}[:methodName => AbstractString, :declaringClassProtocolName => AbstractString, :clientProtocolVersion => UInt64]
            meta(target, RequestHeaderProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RequestHeaderProto[]
    end
end
function Base.getproperty(obj::RequestHeaderProto, name::Symbol)
    if name === :methodName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :declaringClassProtocolName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :clientProtocolVersion
        return (obj.__protobuf_jl_internal_values[name])::UInt64
    else
        getfield(obj, name)
    end
end

export RequestHeaderProto
# COV_EXCL_STOP