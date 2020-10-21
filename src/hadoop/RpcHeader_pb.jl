# syntax: proto2
# COV_EXCL_START
using ProtoBuf
import ProtoBuf.meta

const RpcKindProto = (;[
    Symbol("RPC_BUILTIN") => Int32(0),
    Symbol("RPC_WRITABLE") => Int32(1),
    Symbol("RPC_PROTOCOL_BUFFER") => Int32(2),
]...)

mutable struct RPCTraceInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RPCTraceInfoProto(; kwargs...)
        obj = new(meta(RPCTraceInfoProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RPCTraceInfoProto
const __meta_RPCTraceInfoProto = Ref{ProtoMeta}()
function meta(::Type{RPCTraceInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RPCTraceInfoProto)
            __meta_RPCTraceInfoProto[] = target = ProtoMeta(RPCTraceInfoProto)
            allflds = Pair{Symbol,Union{Type,String}}[:traceId => Int64, :parentId => Int64]
            meta(target, RPCTraceInfoProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RPCTraceInfoProto[]
    end
end
function Base.getproperty(obj::RPCTraceInfoProto, name::Symbol)
    if name === :traceId
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :parentId
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct RPCCallerContextProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RPCCallerContextProto(; kwargs...)
        obj = new(meta(RPCCallerContextProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RPCCallerContextProto
const __meta_RPCCallerContextProto = Ref{ProtoMeta}()
function meta(::Type{RPCCallerContextProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RPCCallerContextProto)
            __meta_RPCCallerContextProto[] = target = ProtoMeta(RPCCallerContextProto)
            req = Symbol[:context]
            allflds = Pair{Symbol,Union{Type,String}}[:context => AbstractString, :signature => Array{UInt8,1}]
            meta(target, RPCCallerContextProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RPCCallerContextProto[]
    end
end
function Base.getproperty(obj::RPCCallerContextProto, name::Symbol)
    if name === :context
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :signature
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    else
        getfield(obj, name)
    end
end

const RpcRequestHeaderProto_OperationProto = (;[
    Symbol("RPC_FINAL_PACKET") => Int32(0),
    Symbol("RPC_CONTINUATION_PACKET") => Int32(1),
    Symbol("RPC_CLOSE_CONNECTION") => Int32(2),
]...)

mutable struct RpcRequestHeaderProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RpcRequestHeaderProto(; kwargs...)
        obj = new(meta(RpcRequestHeaderProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RpcRequestHeaderProto
const __meta_RpcRequestHeaderProto = Ref{ProtoMeta}()
function meta(::Type{RpcRequestHeaderProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RpcRequestHeaderProto)
            __meta_RpcRequestHeaderProto[] = target = ProtoMeta(RpcRequestHeaderProto)
            req = Symbol[:callId,:clientId]
            val = Dict{Symbol,Any}(:retryCount => -1)
            wtype = Dict(:callId => :sint32, :retryCount => :sint32)
            allflds = Pair{Symbol,Union{Type,String}}[:rpcKind => Int32, :rpcOp => Int32, :callId => Int32, :clientId => Array{UInt8,1}, :retryCount => Int32, :traceInfo => RPCTraceInfoProto, :callerContext => RPCCallerContextProto, :stateId => Int64]
            meta(target, RpcRequestHeaderProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, wtype, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RpcRequestHeaderProto[]
    end
end
function Base.getproperty(obj::RpcRequestHeaderProto, name::Symbol)
    if name === :rpcKind
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :rpcOp
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :callId
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :clientId
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :retryCount
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :traceInfo
        return (obj.__protobuf_jl_internal_values[name])::RPCTraceInfoProto
    elseif name === :callerContext
        return (obj.__protobuf_jl_internal_values[name])::RPCCallerContextProto
    elseif name === :stateId
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

const RpcResponseHeaderProto_RpcStatusProto = (;[
    Symbol("SUCCESS") => Int32(0),
    Symbol("ERROR") => Int32(1),
    Symbol("FATAL") => Int32(2),
]...)

const RpcResponseHeaderProto_RpcErrorCodeProto = (;[
    Symbol("ERROR_APPLICATION") => Int32(1),
    Symbol("ERROR_NO_SUCH_METHOD") => Int32(2),
    Symbol("ERROR_NO_SUCH_PROTOCOL") => Int32(3),
    Symbol("ERROR_RPC_SERVER") => Int32(4),
    Symbol("ERROR_SERIALIZING_RESPONSE") => Int32(5),
    Symbol("ERROR_RPC_VERSION_MISMATCH") => Int32(6),
    Symbol("FATAL_UNKNOWN") => Int32(10),
    Symbol("FATAL_UNSUPPORTED_SERIALIZATION") => Int32(11),
    Symbol("FATAL_INVALID_RPC_HEADER") => Int32(12),
    Symbol("FATAL_DESERIALIZING_REQUEST") => Int32(13),
    Symbol("FATAL_VERSION_MISMATCH") => Int32(14),
    Symbol("FATAL_UNAUTHORIZED") => Int32(15),
]...)

mutable struct RpcResponseHeaderProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RpcResponseHeaderProto(; kwargs...)
        obj = new(meta(RpcResponseHeaderProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RpcResponseHeaderProto
const __meta_RpcResponseHeaderProto = Ref{ProtoMeta}()
function meta(::Type{RpcResponseHeaderProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RpcResponseHeaderProto)
            __meta_RpcResponseHeaderProto[] = target = ProtoMeta(RpcResponseHeaderProto)
            req = Symbol[:callId,:status]
            val = Dict{Symbol,Any}(:retryCount => -1)
            wtype = Dict(:retryCount => :sint32)
            allflds = Pair{Symbol,Union{Type,String}}[:callId => UInt32, :status => Int32, :serverIpcVersionNum => UInt32, :exceptionClassName => AbstractString, :errorMsg => AbstractString, :errorDetail => Int32, :clientId => Array{UInt8,1}, :retryCount => Int32, :stateId => Int64]
            meta(target, RpcResponseHeaderProto, allflds, req, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, wtype, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RpcResponseHeaderProto[]
    end
end
function Base.getproperty(obj::RpcResponseHeaderProto, name::Symbol)
    if name === :callId
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :status
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :serverIpcVersionNum
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :exceptionClassName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :errorMsg
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :errorDetail
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :clientId
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :retryCount
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :stateId
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

const RpcSaslProto_SaslState = (;[
    Symbol("SUCCESS") => Int32(0),
    Symbol("NEGOTIATE") => Int32(1),
    Symbol("INITIATE") => Int32(2),
    Symbol("CHALLENGE") => Int32(3),
    Symbol("RESPONSE") => Int32(4),
    Symbol("WRAP") => Int32(5),
]...)

mutable struct RpcSaslProto_SaslAuth <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RpcSaslProto_SaslAuth(; kwargs...)
        obj = new(meta(RpcSaslProto_SaslAuth), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RpcSaslProto_SaslAuth
const __meta_RpcSaslProto_SaslAuth = Ref{ProtoMeta}()
function meta(::Type{RpcSaslProto_SaslAuth})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RpcSaslProto_SaslAuth)
            __meta_RpcSaslProto_SaslAuth[] = target = ProtoMeta(RpcSaslProto_SaslAuth)
            req = Symbol[:method,:mechanism]
            allflds = Pair{Symbol,Union{Type,String}}[:method => AbstractString, :mechanism => AbstractString, :protocol => AbstractString, :serverId => AbstractString, :challenge => Array{UInt8,1}]
            meta(target, RpcSaslProto_SaslAuth, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RpcSaslProto_SaslAuth[]
    end
end
function Base.getproperty(obj::RpcSaslProto_SaslAuth, name::Symbol)
    if name === :method
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :mechanism
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :protocol
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :serverId
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :challenge
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    else
        getfield(obj, name)
    end
end

mutable struct RpcSaslProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RpcSaslProto(; kwargs...)
        obj = new(meta(RpcSaslProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RpcSaslProto
const __meta_RpcSaslProto = Ref{ProtoMeta}()
function meta(::Type{RpcSaslProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RpcSaslProto)
            __meta_RpcSaslProto[] = target = ProtoMeta(RpcSaslProto)
            req = Symbol[:state]
            allflds = Pair{Symbol,Union{Type,String}}[:version => UInt32, :state => Int32, :token => Array{UInt8,1}, :auths => Base.Vector{RpcSaslProto_SaslAuth}]
            meta(target, RpcSaslProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RpcSaslProto[]
    end
end
function Base.getproperty(obj::RpcSaslProto, name::Symbol)
    if name === :version
        return (obj.__protobuf_jl_internal_values[name])::UInt32
    elseif name === :state
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :token
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :auths
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{RpcSaslProto_SaslAuth}
    else
        getfield(obj, name)
    end
end

export RpcKindProto, RPCTraceInfoProto, RPCCallerContextProto, RpcRequestHeaderProto_OperationProto, RpcRequestHeaderProto, RpcResponseHeaderProto_RpcStatusProto, RpcResponseHeaderProto_RpcErrorCodeProto, RpcResponseHeaderProto, RpcSaslProto_SaslState, RpcSaslProto_SaslAuth, RpcSaslProto
# COV_EXCL_STOP