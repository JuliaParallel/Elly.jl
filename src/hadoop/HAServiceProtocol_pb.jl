# syntax: proto2
using ProtoBuf
import ProtoBuf.meta
import ..hadoop

struct __enum_HAServiceStateProto <: ProtoEnum
    INITIALIZING::Int32
    ACTIVE::Int32
    STANDBY::Int32
    OBSERVER::Int32
    __enum_HAServiceStateProto() = new(0,1,2,3)
end #struct __enum_HAServiceStateProto
const HAServiceStateProto = __enum_HAServiceStateProto()

struct __enum_HARequestSource <: ProtoEnum
    REQUEST_BY_USER::Int32
    REQUEST_BY_USER_FORCED::Int32
    REQUEST_BY_ZKFC::Int32
    __enum_HARequestSource() = new(0,1,2)
end #struct __enum_HARequestSource
const HARequestSource = __enum_HARequestSource()

mutable struct HAStateChangeRequestInfoProto <: ProtoType
    reqSource::Int32
    HAStateChangeRequestInfoProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct HAStateChangeRequestInfoProto
const __req_HAStateChangeRequestInfoProto = Symbol[:reqSource]
meta(t::Type{HAStateChangeRequestInfoProto}) = meta(t, __req_HAStateChangeRequestInfoProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct MonitorHealthRequestProto <: ProtoType
    MonitorHealthRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MonitorHealthRequestProto

mutable struct MonitorHealthResponseProto <: ProtoType
    MonitorHealthResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MonitorHealthResponseProto

mutable struct TransitionToActiveRequestProto <: ProtoType
    reqInfo::HAStateChangeRequestInfoProto
    TransitionToActiveRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct TransitionToActiveRequestProto
const __req_TransitionToActiveRequestProto = Symbol[:reqInfo]
meta(t::Type{TransitionToActiveRequestProto}) = meta(t, __req_TransitionToActiveRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct TransitionToActiveResponseProto <: ProtoType
    TransitionToActiveResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct TransitionToActiveResponseProto

mutable struct TransitionToStandbyRequestProto <: ProtoType
    reqInfo::HAStateChangeRequestInfoProto
    TransitionToStandbyRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct TransitionToStandbyRequestProto
const __req_TransitionToStandbyRequestProto = Symbol[:reqInfo]
meta(t::Type{TransitionToStandbyRequestProto}) = meta(t, __req_TransitionToStandbyRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct TransitionToStandbyResponseProto <: ProtoType
    TransitionToStandbyResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct TransitionToStandbyResponseProto

mutable struct TransitionToObserverRequestProto <: ProtoType
    reqInfo::HAStateChangeRequestInfoProto
    TransitionToObserverRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct TransitionToObserverRequestProto
const __req_TransitionToObserverRequestProto = Symbol[:reqInfo]
meta(t::Type{TransitionToObserverRequestProto}) = meta(t, __req_TransitionToObserverRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct TransitionToObserverResponseProto <: ProtoType
    TransitionToObserverResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct TransitionToObserverResponseProto

mutable struct GetServiceStatusRequestProto <: ProtoType
    GetServiceStatusRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetServiceStatusRequestProto

mutable struct GetServiceStatusResponseProto <: ProtoType
    state::Int32
    readyToBecomeActive::Bool
    notReadyReason::AbstractString
    GetServiceStatusResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetServiceStatusResponseProto
const __req_GetServiceStatusResponseProto = Symbol[:state]
meta(t::Type{GetServiceStatusResponseProto}) = meta(t, __req_GetServiceStatusResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

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
