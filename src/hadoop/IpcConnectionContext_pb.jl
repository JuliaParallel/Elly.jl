# syntax: proto2
# COV_EXCL_START
using ProtoBuf
import ProtoBuf.meta

mutable struct UserInformationProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UserInformationProto(; kwargs...)
        obj = new(meta(UserInformationProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct UserInformationProto
const __meta_UserInformationProto = Ref{ProtoMeta}()
function meta(::Type{UserInformationProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UserInformationProto)
            __meta_UserInformationProto[] = target = ProtoMeta(UserInformationProto)
            allflds = Pair{Symbol,Union{Type,String}}[:effectiveUser => AbstractString, :realUser => AbstractString]
            meta(target, UserInformationProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UserInformationProto[]
    end
end
function Base.getproperty(obj::UserInformationProto, name::Symbol)
    if name === :effectiveUser
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :realUser
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct IpcConnectionContextProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function IpcConnectionContextProto(; kwargs...)
        obj = new(meta(IpcConnectionContextProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct IpcConnectionContextProto
const __meta_IpcConnectionContextProto = Ref{ProtoMeta}()
function meta(::Type{IpcConnectionContextProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_IpcConnectionContextProto)
            __meta_IpcConnectionContextProto[] = target = ProtoMeta(IpcConnectionContextProto)
            fnum = Int[2,3]
            allflds = Pair{Symbol,Union{Type,String}}[:userInfo => UserInformationProto, :protocol => AbstractString]
            meta(target, IpcConnectionContextProto, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_IpcConnectionContextProto[]
    end
end
function Base.getproperty(obj::IpcConnectionContextProto, name::Symbol)
    if name === :userInfo
        return (obj.__protobuf_jl_internal_values[name])::UserInformationProto
    elseif name === :protocol
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

export UserInformationProto, IpcConnectionContextProto
# COV_EXCL_STOP