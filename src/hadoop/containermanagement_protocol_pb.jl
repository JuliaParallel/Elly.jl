# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta

# service methods for ContainerManagementProtocolService
const _ContainerManagementProtocolService_methods = MethodDescriptor[
        MethodDescriptor("startContainers", 1, hadoop.yarn.StartContainersRequestProto, hadoop.yarn.StartContainersResponseProto),
        MethodDescriptor("stopContainers", 2, hadoop.yarn.StopContainersRequestProto, hadoop.yarn.StopContainersResponseProto),
        MethodDescriptor("getContainerStatuses", 3, hadoop.yarn.GetContainerStatusesRequestProto, hadoop.yarn.GetContainerStatusesResponseProto)
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

export ContainerManagementProtocolService, ContainerManagementProtocolServiceStub, ContainerManagementProtocolServiceBlockingStub, startContainers, stopContainers, getContainerStatuses
