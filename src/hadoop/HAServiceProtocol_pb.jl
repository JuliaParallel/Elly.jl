# syntax: proto2
# COV_EXCL_START
using ProtoBuf
import ProtoBuf.meta
import ..hadoop

const HAServiceStateProto = (;[
    Symbol("INITIALIZING") => Int32(0),
    Symbol("ACTIVE") => Int32(1),
    Symbol("STANDBY") => Int32(2),
    Symbol("OBSERVER") => Int32(3),
]...)

const HARequestSource = (;[
    Symbol("REQUEST_BY_USER") => Int32(0),
    Symbol("REQUEST_BY_USER_FORCED") => Int32(1),
    Symbol("REQUEST_BY_ZKFC") => Int32(2),
]...)

mutable struct HAStateChangeRequestInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function HAStateChangeRequestInfoProto(; kwargs...)
        obj = new(meta(HAStateChangeRequestInfoProto), Dict{Symbol,Any}())
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
end # mutable struct HAStateChangeRequestInfoProto
const __meta_HAStateChangeRequestInfoProto = Ref{ProtoMeta}()
function meta(::Type{HAStateChangeRequestInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_HAStateChangeRequestInfoProto)
            __meta_HAStateChangeRequestInfoProto[] = target = ProtoMeta(HAStateChangeRequestInfoProto)
            req = Symbol[:reqSource]
            allflds = Pair{Symbol,Union{Type,String}}[:reqSource => Int32]
            meta(target, HAStateChangeRequestInfoProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_HAStateChangeRequestInfoProto[]
    end
end
function Base.getproperty(obj::HAStateChangeRequestInfoProto, name::Symbol)
    if name === :reqSource
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct MonitorHealthRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function MonitorHealthRequestProto(; kwargs...)
        obj = new(meta(MonitorHealthRequestProto), Dict{Symbol,Any}())
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
end # mutable struct MonitorHealthRequestProto
const __meta_MonitorHealthRequestProto = Ref{ProtoMeta}()
function meta(::Type{MonitorHealthRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MonitorHealthRequestProto)
            __meta_MonitorHealthRequestProto[] = target = ProtoMeta(MonitorHealthRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, MonitorHealthRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MonitorHealthRequestProto[]
    end
end

mutable struct MonitorHealthResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function MonitorHealthResponseProto(; kwargs...)
        obj = new(meta(MonitorHealthResponseProto), Dict{Symbol,Any}())
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
end # mutable struct MonitorHealthResponseProto
const __meta_MonitorHealthResponseProto = Ref{ProtoMeta}()
function meta(::Type{MonitorHealthResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MonitorHealthResponseProto)
            __meta_MonitorHealthResponseProto[] = target = ProtoMeta(MonitorHealthResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, MonitorHealthResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MonitorHealthResponseProto[]
    end
end

mutable struct TransitionToActiveRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function TransitionToActiveRequestProto(; kwargs...)
        obj = new(meta(TransitionToActiveRequestProto), Dict{Symbol,Any}())
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
end # mutable struct TransitionToActiveRequestProto
const __meta_TransitionToActiveRequestProto = Ref{ProtoMeta}()
function meta(::Type{TransitionToActiveRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TransitionToActiveRequestProto)
            __meta_TransitionToActiveRequestProto[] = target = ProtoMeta(TransitionToActiveRequestProto)
            req = Symbol[:reqInfo]
            allflds = Pair{Symbol,Union{Type,String}}[:reqInfo => HAStateChangeRequestInfoProto]
            meta(target, TransitionToActiveRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TransitionToActiveRequestProto[]
    end
end
function Base.getproperty(obj::TransitionToActiveRequestProto, name::Symbol)
    if name === :reqInfo
        return (obj.__protobuf_jl_internal_values[name])::HAStateChangeRequestInfoProto
    else
        getfield(obj, name)
    end
end

mutable struct TransitionToActiveResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function TransitionToActiveResponseProto(; kwargs...)
        obj = new(meta(TransitionToActiveResponseProto), Dict{Symbol,Any}())
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
end # mutable struct TransitionToActiveResponseProto
const __meta_TransitionToActiveResponseProto = Ref{ProtoMeta}()
function meta(::Type{TransitionToActiveResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TransitionToActiveResponseProto)
            __meta_TransitionToActiveResponseProto[] = target = ProtoMeta(TransitionToActiveResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, TransitionToActiveResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TransitionToActiveResponseProto[]
    end
end

mutable struct TransitionToStandbyRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function TransitionToStandbyRequestProto(; kwargs...)
        obj = new(meta(TransitionToStandbyRequestProto), Dict{Symbol,Any}())
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
end # mutable struct TransitionToStandbyRequestProto
const __meta_TransitionToStandbyRequestProto = Ref{ProtoMeta}()
function meta(::Type{TransitionToStandbyRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TransitionToStandbyRequestProto)
            __meta_TransitionToStandbyRequestProto[] = target = ProtoMeta(TransitionToStandbyRequestProto)
            req = Symbol[:reqInfo]
            allflds = Pair{Symbol,Union{Type,String}}[:reqInfo => HAStateChangeRequestInfoProto]
            meta(target, TransitionToStandbyRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TransitionToStandbyRequestProto[]
    end
end
function Base.getproperty(obj::TransitionToStandbyRequestProto, name::Symbol)
    if name === :reqInfo
        return (obj.__protobuf_jl_internal_values[name])::HAStateChangeRequestInfoProto
    else
        getfield(obj, name)
    end
end

mutable struct TransitionToStandbyResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function TransitionToStandbyResponseProto(; kwargs...)
        obj = new(meta(TransitionToStandbyResponseProto), Dict{Symbol,Any}())
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
end # mutable struct TransitionToStandbyResponseProto
const __meta_TransitionToStandbyResponseProto = Ref{ProtoMeta}()
function meta(::Type{TransitionToStandbyResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TransitionToStandbyResponseProto)
            __meta_TransitionToStandbyResponseProto[] = target = ProtoMeta(TransitionToStandbyResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, TransitionToStandbyResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TransitionToStandbyResponseProto[]
    end
end

mutable struct TransitionToObserverRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function TransitionToObserverRequestProto(; kwargs...)
        obj = new(meta(TransitionToObserverRequestProto), Dict{Symbol,Any}())
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
end # mutable struct TransitionToObserverRequestProto
const __meta_TransitionToObserverRequestProto = Ref{ProtoMeta}()
function meta(::Type{TransitionToObserverRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TransitionToObserverRequestProto)
            __meta_TransitionToObserverRequestProto[] = target = ProtoMeta(TransitionToObserverRequestProto)
            req = Symbol[:reqInfo]
            allflds = Pair{Symbol,Union{Type,String}}[:reqInfo => HAStateChangeRequestInfoProto]
            meta(target, TransitionToObserverRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TransitionToObserverRequestProto[]
    end
end
function Base.getproperty(obj::TransitionToObserverRequestProto, name::Symbol)
    if name === :reqInfo
        return (obj.__protobuf_jl_internal_values[name])::HAStateChangeRequestInfoProto
    else
        getfield(obj, name)
    end
end

mutable struct TransitionToObserverResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function TransitionToObserverResponseProto(; kwargs...)
        obj = new(meta(TransitionToObserverResponseProto), Dict{Symbol,Any}())
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
end # mutable struct TransitionToObserverResponseProto
const __meta_TransitionToObserverResponseProto = Ref{ProtoMeta}()
function meta(::Type{TransitionToObserverResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_TransitionToObserverResponseProto)
            __meta_TransitionToObserverResponseProto[] = target = ProtoMeta(TransitionToObserverResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, TransitionToObserverResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_TransitionToObserverResponseProto[]
    end
end

mutable struct GetServiceStatusRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetServiceStatusRequestProto(; kwargs...)
        obj = new(meta(GetServiceStatusRequestProto), Dict{Symbol,Any}())
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
end # mutable struct GetServiceStatusRequestProto
const __meta_GetServiceStatusRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetServiceStatusRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetServiceStatusRequestProto)
            __meta_GetServiceStatusRequestProto[] = target = ProtoMeta(GetServiceStatusRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, GetServiceStatusRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetServiceStatusRequestProto[]
    end
end

mutable struct GetServiceStatusResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetServiceStatusResponseProto(; kwargs...)
        obj = new(meta(GetServiceStatusResponseProto), Dict{Symbol,Any}())
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
end # mutable struct GetServiceStatusResponseProto
const __meta_GetServiceStatusResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetServiceStatusResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetServiceStatusResponseProto)
            __meta_GetServiceStatusResponseProto[] = target = ProtoMeta(GetServiceStatusResponseProto)
            req = Symbol[:state]
            allflds = Pair{Symbol,Union{Type,String}}[:state => Int32, :readyToBecomeActive => Bool, :notReadyReason => AbstractString]
            meta(target, GetServiceStatusResponseProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetServiceStatusResponseProto[]
    end
end
function Base.getproperty(obj::GetServiceStatusResponseProto, name::Symbol)
    if name === :state
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :readyToBecomeActive
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :notReadyReason
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

# service methods for HAServiceProtocolService
const _HAServiceProtocolService_methods = MethodDescriptor[
        MethodDescriptor("monitorHealth", 1, hadoop.common.MonitorHealthRequestProto, hadoop.common.MonitorHealthResponseProto),
        MethodDescriptor("transitionToActive", 2, hadoop.common.TransitionToActiveRequestProto, hadoop.common.TransitionToActiveResponseProto),
        MethodDescriptor("transitionToStandby", 3, hadoop.common.TransitionToStandbyRequestProto, hadoop.common.TransitionToStandbyResponseProto),
        MethodDescriptor("transitionToObserver", 4, hadoop.common.TransitionToObserverRequestProto, hadoop.common.TransitionToObserverResponseProto),
        MethodDescriptor("getServiceStatus", 5, hadoop.common.GetServiceStatusRequestProto, hadoop.common.GetServiceStatusResponseProto)
    ] # const _HAServiceProtocolService_methods
const _HAServiceProtocolService_desc = ServiceDescriptor("hadoop.common.HAServiceProtocolService", 1, _HAServiceProtocolService_methods)

HAServiceProtocolService(impl::Module) = ProtoService(_HAServiceProtocolService_desc, impl)

mutable struct HAServiceProtocolServiceStub <: AbstractProtoServiceStub{false}
    impl::ProtoServiceStub
    HAServiceProtocolServiceStub(channel::ProtoRpcChannel) = new(ProtoServiceStub(_HAServiceProtocolService_desc, channel))
end # mutable struct HAServiceProtocolServiceStub

mutable struct HAServiceProtocolServiceBlockingStub <: AbstractProtoServiceStub{true}
    impl::ProtoServiceBlockingStub
    HAServiceProtocolServiceBlockingStub(channel::ProtoRpcChannel) = new(ProtoServiceBlockingStub(_HAServiceProtocolService_desc, channel))
end # mutable struct HAServiceProtocolServiceBlockingStub

monitorHealth(stub::HAServiceProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.common.MonitorHealthRequestProto, done::Function) = call_method(stub.impl, _HAServiceProtocolService_methods[1], controller, inp, done)
monitorHealth(stub::HAServiceProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.common.MonitorHealthRequestProto) = call_method(stub.impl, _HAServiceProtocolService_methods[1], controller, inp)

transitionToActive(stub::HAServiceProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.common.TransitionToActiveRequestProto, done::Function) = call_method(stub.impl, _HAServiceProtocolService_methods[2], controller, inp, done)
transitionToActive(stub::HAServiceProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.common.TransitionToActiveRequestProto) = call_method(stub.impl, _HAServiceProtocolService_methods[2], controller, inp)

transitionToStandby(stub::HAServiceProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.common.TransitionToStandbyRequestProto, done::Function) = call_method(stub.impl, _HAServiceProtocolService_methods[3], controller, inp, done)
transitionToStandby(stub::HAServiceProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.common.TransitionToStandbyRequestProto) = call_method(stub.impl, _HAServiceProtocolService_methods[3], controller, inp)

transitionToObserver(stub::HAServiceProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.common.TransitionToObserverRequestProto, done::Function) = call_method(stub.impl, _HAServiceProtocolService_methods[4], controller, inp, done)
transitionToObserver(stub::HAServiceProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.common.TransitionToObserverRequestProto) = call_method(stub.impl, _HAServiceProtocolService_methods[4], controller, inp)

getServiceStatus(stub::HAServiceProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.common.GetServiceStatusRequestProto, done::Function) = call_method(stub.impl, _HAServiceProtocolService_methods[5], controller, inp, done)
getServiceStatus(stub::HAServiceProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.common.GetServiceStatusRequestProto) = call_method(stub.impl, _HAServiceProtocolService_methods[5], controller, inp)

export HAServiceStateProto, HARequestSource, HAStateChangeRequestInfoProto, MonitorHealthRequestProto, MonitorHealthResponseProto, TransitionToActiveRequestProto, TransitionToActiveResponseProto, TransitionToStandbyRequestProto, TransitionToStandbyResponseProto, TransitionToObserverRequestProto, TransitionToObserverResponseProto, GetServiceStatusRequestProto, GetServiceStatusResponseProto, HAServiceProtocolService, HAServiceProtocolServiceStub, HAServiceProtocolServiceBlockingStub, monitorHealth, transitionToActive, transitionToStandby, transitionToObserver, getServiceStatus
# COV_EXCL_STOP