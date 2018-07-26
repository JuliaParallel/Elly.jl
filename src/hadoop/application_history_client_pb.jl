# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta
import ..hadoop

# service methods for ApplicationHistoryProtocolService
const _ApplicationHistoryProtocolService_methods = MethodDescriptor[
        MethodDescriptor("getApplicationReport", 1, hadoop.yarn.GetApplicationReportRequestProto, hadoop.yarn.GetApplicationReportResponseProto),
        MethodDescriptor("getApplications", 2, hadoop.yarn.GetApplicationsRequestProto, hadoop.yarn.GetApplicationsResponseProto),
        MethodDescriptor("getApplicationAttemptReport", 3, hadoop.yarn.GetApplicationAttemptReportRequestProto, hadoop.yarn.GetApplicationAttemptReportResponseProto),
        MethodDescriptor("getApplicationAttempts", 4, hadoop.yarn.GetApplicationAttemptsRequestProto, hadoop.yarn.GetApplicationAttemptsResponseProto),
        MethodDescriptor("getContainerReport", 5, hadoop.yarn.GetContainerReportRequestProto, hadoop.yarn.GetContainerReportResponseProto),
        MethodDescriptor("getContainers", 6, hadoop.yarn.GetContainersRequestProto, hadoop.yarn.GetContainersResponseProto),
        MethodDescriptor("getDelegationToken", 7, hadoop.common.GetDelegationTokenRequestProto, hadoop.common.GetDelegationTokenResponseProto),
        MethodDescriptor("renewDelegationToken", 8, hadoop.common.RenewDelegationTokenRequestProto, hadoop.common.RenewDelegationTokenResponseProto),
        MethodDescriptor("cancelDelegationToken", 9, hadoop.common.CancelDelegationTokenRequestProto, hadoop.common.CancelDelegationTokenResponseProto)
    ] # const _ApplicationHistoryProtocolService_methods
const _ApplicationHistoryProtocolService_desc = ServiceDescriptor("hadoop.yarn.ApplicationHistoryProtocolService", 1, _ApplicationHistoryProtocolService_methods)

ApplicationHistoryProtocolService(impl::Module) = ProtoService(_ApplicationHistoryProtocolService_desc, impl)

mutable struct ApplicationHistoryProtocolServiceStub <: AbstractProtoServiceStub{false}
    impl::ProtoServiceStub
    ApplicationHistoryProtocolServiceStub(channel::ProtoRpcChannel) = new(ProtoServiceStub(_ApplicationHistoryProtocolService_desc, channel))
end # mutable struct ApplicationHistoryProtocolServiceStub

mutable struct ApplicationHistoryProtocolServiceBlockingStub <: AbstractProtoServiceStub{true}
    impl::ProtoServiceBlockingStub
    ApplicationHistoryProtocolServiceBlockingStub(channel::ProtoRpcChannel) = new(ProtoServiceBlockingStub(_ApplicationHistoryProtocolService_desc, channel))
end # mutable struct ApplicationHistoryProtocolServiceBlockingStub

getApplicationReport(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetApplicationReportRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[1], controller, inp, done)
getApplicationReport(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetApplicationReportRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[1], controller, inp)

getApplications(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetApplicationsRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[2], controller, inp, done)
getApplications(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetApplicationsRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[2], controller, inp)

getApplicationAttemptReport(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetApplicationAttemptReportRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[3], controller, inp, done)
getApplicationAttemptReport(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetApplicationAttemptReportRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[3], controller, inp)

getApplicationAttempts(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetApplicationAttemptsRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[4], controller, inp, done)
getApplicationAttempts(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetApplicationAttemptsRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[4], controller, inp)

getContainerReport(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetContainerReportRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[5], controller, inp, done)
getContainerReport(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetContainerReportRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[5], controller, inp)

getContainers(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetContainersRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[6], controller, inp, done)
getContainers(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetContainersRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[6], controller, inp)

getDelegationToken(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.common.GetDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[7], controller, inp, done)
getDelegationToken(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.common.GetDelegationTokenRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[7], controller, inp)

renewDelegationToken(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.common.RenewDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[8], controller, inp, done)
renewDelegationToken(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.common.RenewDelegationTokenRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[8], controller, inp)

cancelDelegationToken(stub::ApplicationHistoryProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.common.CancelDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[9], controller, inp, done)
cancelDelegationToken(stub::ApplicationHistoryProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.common.CancelDelegationTokenRequestProto) = call_method(stub.impl, _ApplicationHistoryProtocolService_methods[9], controller, inp)

export ApplicationHistoryProtocolService, ApplicationHistoryProtocolServiceStub, ApplicationHistoryProtocolServiceBlockingStub, getApplicationReport, getApplications, getApplicationAttemptReport, getApplicationAttempts, getContainerReport, getContainers, getDelegationToken, renewDelegationToken, cancelDelegationToken
