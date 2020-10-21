# syntax: proto2
# COV_EXCL_START
using ProtoBuf
import ProtoBuf.meta

# service methods for ContainerManagementProtocolService
const _ContainerManagementProtocolService_methods = MethodDescriptor[
        MethodDescriptor("startContainers", 1, hadoop.yarn.StartContainersRequestProto, hadoop.yarn.StartContainersResponseProto),
        MethodDescriptor("stopContainers", 2, hadoop.yarn.StopContainersRequestProto, hadoop.yarn.StopContainersResponseProto),
        MethodDescriptor("getContainerStatuses", 3, hadoop.yarn.GetContainerStatusesRequestProto, hadoop.yarn.GetContainerStatusesResponseProto),
        MethodDescriptor("increaseContainersResource", 4, hadoop.yarn.IncreaseContainersResourceRequestProto, hadoop.yarn.IncreaseContainersResourceResponseProto),
        MethodDescriptor("updateContainer", 5, hadoop.yarn.ContainerUpdateRequestProto, hadoop.yarn.ContainerUpdateResponseProto),
        MethodDescriptor("signalToContainer", 6, hadoop.yarn.SignalContainerRequestProto, hadoop.yarn.SignalContainerResponseProto),
        MethodDescriptor("localize", 7, hadoop.yarn.ResourceLocalizationRequestProto, hadoop.yarn.ResourceLocalizationResponseProto),
        MethodDescriptor("reInitializeContainer", 8, hadoop.yarn.ReInitializeContainerRequestProto, hadoop.yarn.ReInitializeContainerResponseProto),
        MethodDescriptor("restartContainer", 9, hadoop.yarn.ContainerIdProto, hadoop.yarn.RestartContainerResponseProto),
        MethodDescriptor("rollbackLastReInitialization", 10, hadoop.yarn.ContainerIdProto, hadoop.yarn.RollbackResponseProto),
        MethodDescriptor("commitLastReInitialization", 11, hadoop.yarn.ContainerIdProto, hadoop.yarn.CommitResponseProto)
    ] # const _ContainerManagementProtocolService_methods
const _ContainerManagementProtocolService_desc = ServiceDescriptor("hadoop.yarn.ContainerManagementProtocolService", 1, _ContainerManagementProtocolService_methods)

ContainerManagementProtocolService(impl::Module) = ProtoService(_ContainerManagementProtocolService_desc, impl)

mutable struct ContainerManagementProtocolServiceStub <: AbstractProtoServiceStub{false}
    impl::ProtoServiceStub
    ContainerManagementProtocolServiceStub(channel::ProtoRpcChannel) = new(ProtoServiceStub(_ContainerManagementProtocolService_desc, channel))
end # mutable struct ContainerManagementProtocolServiceStub

mutable struct ContainerManagementProtocolServiceBlockingStub <: AbstractProtoServiceStub{true}
    impl::ProtoServiceBlockingStub
    ContainerManagementProtocolServiceBlockingStub(channel::ProtoRpcChannel) = new(ProtoServiceBlockingStub(_ContainerManagementProtocolService_desc, channel))
end # mutable struct ContainerManagementProtocolServiceBlockingStub

startContainers(stub::ContainerManagementProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.StartContainersRequestProto, done::Function) = call_method(stub.impl, _ContainerManagementProtocolService_methods[1], controller, inp, done)
startContainers(stub::ContainerManagementProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.StartContainersRequestProto) = call_method(stub.impl, _ContainerManagementProtocolService_methods[1], controller, inp)

stopContainers(stub::ContainerManagementProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.StopContainersRequestProto, done::Function) = call_method(stub.impl, _ContainerManagementProtocolService_methods[2], controller, inp, done)
stopContainers(stub::ContainerManagementProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.StopContainersRequestProto) = call_method(stub.impl, _ContainerManagementProtocolService_methods[2], controller, inp)

getContainerStatuses(stub::ContainerManagementProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetContainerStatusesRequestProto, done::Function) = call_method(stub.impl, _ContainerManagementProtocolService_methods[3], controller, inp, done)
getContainerStatuses(stub::ContainerManagementProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetContainerStatusesRequestProto) = call_method(stub.impl, _ContainerManagementProtocolService_methods[3], controller, inp)

increaseContainersResource(stub::ContainerManagementProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.IncreaseContainersResourceRequestProto, done::Function) = call_method(stub.impl, _ContainerManagementProtocolService_methods[4], controller, inp, done)
increaseContainersResource(stub::ContainerManagementProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.IncreaseContainersResourceRequestProto) = call_method(stub.impl, _ContainerManagementProtocolService_methods[4], controller, inp)

updateContainer(stub::ContainerManagementProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.ContainerUpdateRequestProto, done::Function) = call_method(stub.impl, _ContainerManagementProtocolService_methods[5], controller, inp, done)
updateContainer(stub::ContainerManagementProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.ContainerUpdateRequestProto) = call_method(stub.impl, _ContainerManagementProtocolService_methods[5], controller, inp)

signalToContainer(stub::ContainerManagementProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.SignalContainerRequestProto, done::Function) = call_method(stub.impl, _ContainerManagementProtocolService_methods[6], controller, inp, done)
signalToContainer(stub::ContainerManagementProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.SignalContainerRequestProto) = call_method(stub.impl, _ContainerManagementProtocolService_methods[6], controller, inp)

localize(stub::ContainerManagementProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.ResourceLocalizationRequestProto, done::Function) = call_method(stub.impl, _ContainerManagementProtocolService_methods[7], controller, inp, done)
localize(stub::ContainerManagementProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.ResourceLocalizationRequestProto) = call_method(stub.impl, _ContainerManagementProtocolService_methods[7], controller, inp)

reInitializeContainer(stub::ContainerManagementProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.ReInitializeContainerRequestProto, done::Function) = call_method(stub.impl, _ContainerManagementProtocolService_methods[8], controller, inp, done)
reInitializeContainer(stub::ContainerManagementProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.ReInitializeContainerRequestProto) = call_method(stub.impl, _ContainerManagementProtocolService_methods[8], controller, inp)

restartContainer(stub::ContainerManagementProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.ContainerIdProto, done::Function) = call_method(stub.impl, _ContainerManagementProtocolService_methods[9], controller, inp, done)
restartContainer(stub::ContainerManagementProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.ContainerIdProto) = call_method(stub.impl, _ContainerManagementProtocolService_methods[9], controller, inp)

rollbackLastReInitialization(stub::ContainerManagementProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.ContainerIdProto, done::Function) = call_method(stub.impl, _ContainerManagementProtocolService_methods[10], controller, inp, done)
rollbackLastReInitialization(stub::ContainerManagementProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.ContainerIdProto) = call_method(stub.impl, _ContainerManagementProtocolService_methods[10], controller, inp)

commitLastReInitialization(stub::ContainerManagementProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.ContainerIdProto, done::Function) = call_method(stub.impl, _ContainerManagementProtocolService_methods[11], controller, inp, done)
commitLastReInitialization(stub::ContainerManagementProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.ContainerIdProto) = call_method(stub.impl, _ContainerManagementProtocolService_methods[11], controller, inp)

export ContainerManagementProtocolService, ContainerManagementProtocolServiceStub, ContainerManagementProtocolServiceBlockingStub, startContainers, stopContainers, getContainerStatuses, increaseContainersResource, updateContainer, signalToContainer, localize, reInitializeContainer, restartContainer, rollbackLastReInitialization, commitLastReInitialization
# COV_EXCL_STOP