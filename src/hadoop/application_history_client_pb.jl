using ..common
using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

# service methods for ApplicationHistoryProtocolService
const _ApplicationHistoryProtocolService_methods = MethodDescriptor[
        MethodDescriptor("getApplicationReport", 1, GetApplicationReportRequestProto, GetApplicationReportResponseProto),
        MethodDescriptor("getApplications", 2, GetApplicationsRequestProto, GetApplicationsResponseProto),
        MethodDescriptor("getApplicationAttemptReport", 3, GetApplicationAttemptReportRequestProto, GetApplicationAttemptReportResponseProto),
        MethodDescriptor("getApplicationAttempts", 4, GetApplicationAttemptsRequestProto, GetApplicationAttemptsResponseProto),
        MethodDescriptor("getContainerReport", 5, GetContainerReportRequestProto, GetContainerReportResponseProto),
        MethodDescriptor("getContainers", 6, GetContainersRequestProto, GetContainersResponseProto),
        MethodDescriptor("getDelegationToken", 7, GetDelegationTokenRequestProto, GetDelegationTokenResponseProto),
        MethodDescriptor("renewDelegationToken", 8, RenewDelegationTokenRequestProto, RenewDelegationTokenResponseProto),
        MethodDescriptor("cancelDelegationToken", 9, CancelDelegationTokenRequestProto, CancelDelegationTokenResponseProto)
    ] # const _ApplicationHistoryProtocolService_methods
const _ApplicationHistoryProtocolService_desc = ServiceDescriptor("ApplicationHistoryProtocolService", 1, _ApplicationHistoryProtocolService_methods)

ApplicationHistoryProtocolService(impl::Module) = ProtoService(_ApplicationHistoryProtocolService_desc, impl)

type ApplicationHistoryProtocolServiceStub <: AbstractProtoServiceStub{false}
    impl::ProtoServiceStub
    ApplicationHistoryProtocolServiceStub(channel::ProtoRpcChannel) = new(ProtoServiceStub(_ApplicationHistoryProtocolService_desc, channel))
end # type ApplicationHistoryProtocolServiceStub

type ApplicationHistoryProtocolServiceBlockingStub <: AbstractProtoServiceStub{true}
    impl::ProtoServiceBlockingStub
    ApplicationHistoryProtocolServiceBlockingStub(channel::ProtoRpcChannel) = new(ProtoServiceBlockingStub(_ApplicationHistoryProtocolService_desc, channel))
end # type ApplicationHistoryProtocolServiceBlockingStub

getApplicationReport(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::GetApplicationReportRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[1], controller, inp, done)
getApplicationReport(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetApplicationReportRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[1], controller, inp)

getApplications(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::GetApplicationsRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[2], controller, inp, done)
getApplications(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetApplicationsRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[2], controller, inp)

getApplicationAttemptReport(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::GetApplicationAttemptReportRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[3], controller, inp, done)
getApplicationAttemptReport(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetApplicationAttemptReportRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[3], controller, inp)

getApplicationAttempts(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::GetApplicationAttemptsRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[4], controller, inp, done)
getApplicationAttempts(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetApplicationAttemptsRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[4], controller, inp)

getContainerReport(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::GetContainerReportRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[5], controller, inp, done)
getContainerReport(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetContainerReportRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[5], controller, inp)

getContainers(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::GetContainersRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[6], controller, inp, done)
getContainers(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetContainersRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[6], controller, inp)

getDelegationToken(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::GetDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[7], controller, inp, done)
getDelegationToken(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetDelegationTokenRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[7], controller, inp)

renewDelegationToken(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::RenewDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[8], controller, inp, done)
renewDelegationToken(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::RenewDelegationTokenRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[8], controller, inp)

cancelDelegationToken(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::CancelDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[9], controller, inp, done)
cancelDelegationToken(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::CancelDelegationTokenRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[9], controller, inp)

export ApplicationHistoryProtocolService, ApplicationHistoryProtocolServiceStub, ApplicationHistoryProtocolServiceBlockingStub, getApplicationReport, getApplications, getApplicationAttemptReport, getApplicationAttempts, getContainerReport, getContainers, getDelegationToken, renewDelegationToken, cancelDelegationToken
