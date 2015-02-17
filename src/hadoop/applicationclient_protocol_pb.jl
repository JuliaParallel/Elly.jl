using ..common
using Compat
using ProtoBuf
import ProtoBuf.meta

# service methods for ApplicationClientProtocolService
const _ApplicationClientProtocolService_methods = MethodDescriptor[
        MethodDescriptor("getNewApplication", 1, GetNewApplicationRequestProto, GetNewApplicationResponseProto),
        MethodDescriptor("getApplicationReport", 2, GetApplicationReportRequestProto, GetApplicationReportResponseProto),
        MethodDescriptor("submitApplication", 3, SubmitApplicationRequestProto, SubmitApplicationResponseProto),
        MethodDescriptor("forceKillApplication", 4, KillApplicationRequestProto, KillApplicationResponseProto),
        MethodDescriptor("getClusterMetrics", 5, GetClusterMetricsRequestProto, GetClusterMetricsResponseProto),
        MethodDescriptor("getApplications", 6, GetApplicationsRequestProto, GetApplicationsResponseProto),
        MethodDescriptor("getClusterNodes", 7, GetClusterNodesRequestProto, GetClusterNodesResponseProto),
        MethodDescriptor("getQueueInfo", 8, GetQueueInfoRequestProto, GetQueueInfoResponseProto),
        MethodDescriptor("getQueueUserAcls", 9, GetQueueUserAclsInfoRequestProto, GetQueueUserAclsInfoResponseProto),
        MethodDescriptor("getDelegationToken", 10, GetDelegationTokenRequestProto, GetDelegationTokenResponseProto),
        MethodDescriptor("renewDelegationToken", 11, RenewDelegationTokenRequestProto, RenewDelegationTokenResponseProto),
        MethodDescriptor("cancelDelegationToken", 12, CancelDelegationTokenRequestProto, CancelDelegationTokenResponseProto),
        MethodDescriptor("moveApplicationAcrossQueues", 13, MoveApplicationAcrossQueuesRequestProto, MoveApplicationAcrossQueuesResponseProto),
        MethodDescriptor("getApplicationAttemptReport", 14, GetApplicationAttemptReportRequestProto, GetApplicationAttemptReportResponseProto),
        MethodDescriptor("getApplicationAttempts", 15, GetApplicationAttemptsRequestProto, GetApplicationAttemptsResponseProto),
        MethodDescriptor("getContainerReport", 16, GetContainerReportRequestProto, GetContainerReportResponseProto),
        MethodDescriptor("getContainers", 17, GetContainersRequestProto, GetContainersResponseProto),
        MethodDescriptor("submitReservation", 18, ReservationSubmissionRequestProto, ReservationSubmissionResponseProto),
        MethodDescriptor("updateReservation", 19, ReservationUpdateRequestProto, ReservationUpdateResponseProto),
        MethodDescriptor("deleteReservation", 20, ReservationDeleteRequestProto, ReservationDeleteResponseProto),
        MethodDescriptor("getNodeToLabels", 21, GetNodesToLabelsRequestProto, GetNodesToLabelsResponseProto),
        MethodDescriptor("getClusterNodeLabels", 22, GetClusterNodeLabelsRequestProto, GetClusterNodeLabelsResponseProto)
    ] # const _ApplicationClientProtocolService_methods
const _ApplicationClientProtocolService_desc = ServiceDescriptor("ApplicationClientProtocolService", 1, _ApplicationClientProtocolService_methods)

ApplicationClientProtocolService(impl::Module) = ProtoService(_ApplicationClientProtocolService_desc, impl)

type ApplicationClientProtocolServiceStub <: AbstractProtoServiceStub{false}
    impl::ProtoServiceStub
    ApplicationClientProtocolServiceStub(channel::ProtoRpcChannel) = new(ProtoServiceStub(_ApplicationClientProtocolService_desc, channel))
end # type ApplicationClientProtocolServiceStub

type ApplicationClientProtocolServiceBlockingStub <: AbstractProtoServiceStub{true}
    impl::ProtoServiceBlockingStub
    ApplicationClientProtocolServiceBlockingStub(channel::ProtoRpcChannel) = new(ProtoServiceBlockingStub(_ApplicationClientProtocolService_desc, channel))
end # type ApplicationClientProtocolServiceBlockingStub

getNewApplication(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::GetNewApplicationRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[1], controller, inp, done)
getNewApplication(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetNewApplicationRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[1], controller, inp)

getApplicationReport(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::GetApplicationReportRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[2], controller, inp, done)
getApplicationReport(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetApplicationReportRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[2], controller, inp)

submitApplication(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::SubmitApplicationRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[3], controller, inp, done)
submitApplication(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::SubmitApplicationRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[3], controller, inp)

forceKillApplication(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::KillApplicationRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[4], controller, inp, done)
forceKillApplication(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::KillApplicationRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[4], controller, inp)

getClusterMetrics(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::GetClusterMetricsRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[5], controller, inp, done)
getClusterMetrics(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetClusterMetricsRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[5], controller, inp)

getApplications(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::GetApplicationsRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[6], controller, inp, done)
getApplications(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetApplicationsRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[6], controller, inp)

getClusterNodes(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::GetClusterNodesRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[7], controller, inp, done)
getClusterNodes(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetClusterNodesRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[7], controller, inp)

getQueueInfo(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::GetQueueInfoRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[8], controller, inp, done)
getQueueInfo(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetQueueInfoRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[8], controller, inp)

getQueueUserAcls(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::GetQueueUserAclsInfoRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[9], controller, inp, done)
getQueueUserAcls(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetQueueUserAclsInfoRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[9], controller, inp)

getDelegationToken(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::GetDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[10], controller, inp, done)
getDelegationToken(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetDelegationTokenRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[10], controller, inp)

renewDelegationToken(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::RenewDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[11], controller, inp, done)
renewDelegationToken(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::RenewDelegationTokenRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[11], controller, inp)

cancelDelegationToken(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::CancelDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[12], controller, inp, done)
cancelDelegationToken(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::CancelDelegationTokenRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[12], controller, inp)

moveApplicationAcrossQueues(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::MoveApplicationAcrossQueuesRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[13], controller, inp, done)
moveApplicationAcrossQueues(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::MoveApplicationAcrossQueuesRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[13], controller, inp)

getApplicationAttemptReport(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::GetApplicationAttemptReportRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[14], controller, inp, done)
getApplicationAttemptReport(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetApplicationAttemptReportRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[14], controller, inp)

getApplicationAttempts(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::GetApplicationAttemptsRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[15], controller, inp, done)
getApplicationAttempts(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetApplicationAttemptsRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[15], controller, inp)

getContainerReport(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::GetContainerReportRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[16], controller, inp, done)
getContainerReport(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetContainerReportRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[16], controller, inp)

getContainers(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::GetContainersRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[17], controller, inp, done)
getContainers(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetContainersRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[17], controller, inp)

submitReservation(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::ReservationSubmissionRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[18], controller, inp, done)
submitReservation(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::ReservationSubmissionRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[18], controller, inp)

updateReservation(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::ReservationUpdateRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[19], controller, inp, done)
updateReservation(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::ReservationUpdateRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[19], controller, inp)

deleteReservation(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::ReservationDeleteRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[20], controller, inp, done)
deleteReservation(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::ReservationDeleteRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[20], controller, inp)

getNodeToLabels(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::GetNodesToLabelsRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[21], controller, inp, done)
getNodeToLabels(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetNodesToLabelsRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[21], controller, inp)

getClusterNodeLabels(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::GetClusterNodeLabelsRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[22], controller, inp, done)
getClusterNodeLabels(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::GetClusterNodeLabelsRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[22], controller, inp)

export ApplicationClientProtocolService, ApplicationClientProtocolServiceStub, ApplicationClientProtocolServiceBlockingStub, getNewApplication, getApplicationReport, submitApplication, forceKillApplication, getClusterMetrics, getApplications, getClusterNodes, getQueueInfo, getQueueUserAcls, getDelegationToken, renewDelegationToken, cancelDelegationToken, moveApplicationAcrossQueues, getApplicationAttemptReport, getApplicationAttempts, getContainerReport, getContainers, submitReservation, updateReservation, deleteReservation, getNodeToLabels, getClusterNodeLabels
