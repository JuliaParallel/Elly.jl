using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

# service methods for ContainerManagementProtocolService
const _ContainerManagementProtocolService_methods = MethodDescriptor[
        MethodDescriptor("startContainers", 1, StartContainersRequestProto, StartContainersResponseProto),
        MethodDescriptor("stopContainers", 2, StopContainersRequestProto, StopContainersResponseProto),
        MethodDescriptor("getContainerStatuses", 3, GetContainerStatusesRequestProto, GetContainerStatusesResponseProto)
    ] # const _ContainerManagementProtocolService_methods
const _ContainerManagementProtocolService_desc = ServiceDescriptor("ContainerManagementProtocolService", 1, _ContainerManagementProtocolService_methods)

ContainerManagementProtocolService(impl::Module) = ProtoService(_ContainerManagementProtocolService_desc, impl)

type ContainerManagementProtocolServiceStub <: AbstractProtoServiceStub{false}
    impl::ProtoServiceStub
    ContainerManagementProtocolServiceStub(channel::ProtoRpcChannel) = new(ProtoServiceStub(_ContainerManagementProtocolService_desc, channel))
end # type ContainerManagementProtocolServiceStub

type ContainerManagementProtocolServiceBlockingStub <: AbstractProtoServiceStub{true}
    impl::ProtoServiceBlockingStub
    ContainerManagementProtocolServiceBlockingStub(channel::ProtoRpcChannel) = new(ProtoServiceBlockingStub(_ContainerManagementProtocolService_desc, channel))
end # type ContainerManagementProtocolServiceBlockingStub

startContainers(stub::ContainerManagementProtocolServiceStub, controller::ProtoRpcController, inp::StartContainersRequestProto, done::Function) = call_method(stub.impl, _ContainerManagementProtocolService_methods[1], controller, inp, done)
startContainers(stub::ContainerManagementProtocolServiceBlockingStub, controller::ProtoRpcController, inp::StartContainersRequestProto) = call_method(stub.impl, _ContainerManagementProtocolService_methods[1], controller, inp)

stopContainers(stub::ContainerManagementProtocolServiceStub, controller::ProtoRpcController, inp::StopContainersRequestProto, done::Function) = call_method(stub.impl, _ContainerManagementProtocolService_methods[2], controller, inp, done)
stopContainers(stub::ContainerManagementProtocolServiceBlockingStub, controller::ProtoRpcController, inp::StopContainersRequestProto) = call_method(stub.impl, _ContainerManagementProtocolService_methods[2], controller, inp)

getContainerStatuses(stub::ContainerManagementProtocolServiceStub, controller::ProtoRpcController, inp::GetContainerStatusesRequestProto, done::Function) = call_method(stub.impl, _ContainerManagementProtocolService_methods[3], controller, inp, done)
getContainerStatuses(stub::ContainerManagementProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetContainerStatusesRequestProto) = call_method(stub.impl, _ContainerManagementProtocolService_methods[3], controller, inp)

export ContainerManagementProtocolService, ContainerManagementProtocolServiceStub, ContainerManagementProtocolServiceBlockingStub, startContainers, stopContainers, getContainerStatuses
