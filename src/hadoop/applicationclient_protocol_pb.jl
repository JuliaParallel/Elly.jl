# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta
import ..hadoop

# service methods for ApplicationClientProtocolService
const _ApplicationClientProtocolService_methods = MethodDescriptor[
        MethodDescriptor("getNewApplication", 1, hadoop.yarn.GetNewApplicationRequestProto, hadoop.yarn.GetNewApplicationResponseProto),
        MethodDescriptor("getApplicationReport", 2, hadoop.yarn.GetApplicationReportRequestProto, hadoop.yarn.GetApplicationReportResponseProto),
        MethodDescriptor("submitApplication", 3, hadoop.yarn.SubmitApplicationRequestProto, hadoop.yarn.SubmitApplicationResponseProto),
        MethodDescriptor("forceKillApplication", 4, hadoop.yarn.KillApplicationRequestProto, hadoop.yarn.KillApplicationResponseProto),
        MethodDescriptor("getClusterMetrics", 5, hadoop.yarn.GetClusterMetricsRequestProto, hadoop.yarn.GetClusterMetricsResponseProto),
        MethodDescriptor("getApplications", 6, hadoop.yarn.GetApplicationsRequestProto, hadoop.yarn.GetApplicationsResponseProto),
        MethodDescriptor("getClusterNodes", 7, hadoop.yarn.GetClusterNodesRequestProto, hadoop.yarn.GetClusterNodesResponseProto),
        MethodDescriptor("getQueueInfo", 8, hadoop.yarn.GetQueueInfoRequestProto, hadoop.yarn.GetQueueInfoResponseProto),
        MethodDescriptor("getQueueUserAcls", 9, hadoop.yarn.GetQueueUserAclsInfoRequestProto, hadoop.yarn.GetQueueUserAclsInfoResponseProto),
        MethodDescriptor("getDelegationToken", 10, hadoop.common.GetDelegationTokenRequestProto, hadoop.common.GetDelegationTokenResponseProto),
        MethodDescriptor("renewDelegationToken", 11, hadoop.common.RenewDelegationTokenRequestProto, hadoop.common.RenewDelegationTokenResponseProto),
        MethodDescriptor("cancelDelegationToken", 12, hadoop.common.CancelDelegationTokenRequestProto, hadoop.common.CancelDelegationTokenResponseProto),
        MethodDescriptor("moveApplicationAcrossQueues", 13, hadoop.yarn.MoveApplicationAcrossQueuesRequestProto, hadoop.yarn.MoveApplicationAcrossQueuesResponseProto),
        MethodDescriptor("getApplicationAttemptReport", 14, hadoop.yarn.GetApplicationAttemptReportRequestProto, hadoop.yarn.GetApplicationAttemptReportResponseProto),
        MethodDescriptor("getApplicationAttempts", 15, hadoop.yarn.GetApplicationAttemptsRequestProto, hadoop.yarn.GetApplicationAttemptsResponseProto),
        MethodDescriptor("getContainerReport", 16, hadoop.yarn.GetContainerReportRequestProto, hadoop.yarn.GetContainerReportResponseProto),
        MethodDescriptor("getContainers", 17, hadoop.yarn.GetContainersRequestProto, hadoop.yarn.GetContainersResponseProto),
        MethodDescriptor("submitReservation", 18, hadoop.yarn.ReservationSubmissionRequestProto, hadoop.yarn.ReservationSubmissionResponseProto),
        MethodDescriptor("updateReservation", 19, hadoop.yarn.ReservationUpdateRequestProto, hadoop.yarn.ReservationUpdateResponseProto),
        MethodDescriptor("deleteReservation", 20, hadoop.yarn.ReservationDeleteRequestProto, hadoop.yarn.ReservationDeleteResponseProto),
        MethodDescriptor("getNodeToLabels", 21, hadoop.yarn.GetNodesToLabelsRequestProto, hadoop.yarn.GetNodesToLabelsResponseProto),
        MethodDescriptor("getLabelsToNodes", 22, hadoop.yarn.GetLabelsToNodesRequestProto, hadoop.yarn.GetLabelsToNodesResponseProto),
        MethodDescriptor("getClusterNodeLabels", 23, hadoop.yarn.GetClusterNodeLabelsRequestProto, hadoop.yarn.GetClusterNodeLabelsResponseProto)
    ] # const _ApplicationClientProtocolService_methods
const _ApplicationClientProtocolService_desc = ServiceDescriptor("hadoop.yarn.ApplicationClientProtocolService", 1, _ApplicationClientProtocolService_methods)

ApplicationClientProtocolService(impl::Module) = ProtoService(_ApplicationClientProtocolService_desc, impl)

mutable struct ApplicationClientProtocolServiceStub <: AbstractProtoServiceStub{false}
    impl::ProtoServiceStub
    ApplicationClientProtocolServiceStub(channel::ProtoRpcChannel) = new(ProtoServiceStub(_ApplicationClientProtocolService_desc, channel))
end # mutable struct ApplicationClientProtocolServiceStub

mutable struct ApplicationClientProtocolServiceBlockingStub <: AbstractProtoServiceStub{true}
    impl::ProtoServiceBlockingStub
    ApplicationClientProtocolServiceBlockingStub(channel::ProtoRpcChannel) = new(ProtoServiceBlockingStub(_ApplicationClientProtocolService_desc, channel))
end # mutable struct ApplicationClientProtocolServiceBlockingStub

getNewApplication(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetNewApplicationRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[1], controller, inp, done)
getNewApplication(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetNewApplicationRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[1], controller, inp)

getApplicationReport(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetApplicationReportRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[2], controller, inp, done)
getApplicationReport(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetApplicationReportRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[2], controller, inp)

submitApplication(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.SubmitApplicationRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[3], controller, inp, done)
submitApplication(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.SubmitApplicationRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[3], controller, inp)

forceKillApplication(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.KillApplicationRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[4], controller, inp, done)
forceKillApplication(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.KillApplicationRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[4], controller, inp)

getClusterMetrics(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetClusterMetricsRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[5], controller, inp, done)
getClusterMetrics(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetClusterMetricsRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[5], controller, inp)

getApplications(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetApplicationsRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[6], controller, inp, done)
getApplications(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetApplicationsRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[6], controller, inp)

getClusterNodes(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetClusterNodesRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[7], controller, inp, done)
getClusterNodes(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetClusterNodesRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[7], controller, inp)

getQueueInfo(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetQueueInfoRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[8], controller, inp, done)
getQueueInfo(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetQueueInfoRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[8], controller, inp)

getQueueUserAcls(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetQueueUserAclsInfoRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[9], controller, inp, done)
getQueueUserAcls(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetQueueUserAclsInfoRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[9], controller, inp)

getDelegationToken(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.common.GetDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[10], controller, inp, done)
getDelegationToken(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.common.GetDelegationTokenRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[10], controller, inp)

renewDelegationToken(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.common.RenewDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[11], controller, inp, done)
renewDelegationToken(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.common.RenewDelegationTokenRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[11], controller, inp)

cancelDelegationToken(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.common.CancelDelegationTokenRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[12], controller, inp, done)
cancelDelegationToken(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.common.CancelDelegationTokenRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[12], controller, inp)

moveApplicationAcrossQueues(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.MoveApplicationAcrossQueuesRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[13], controller, inp, done)
moveApplicationAcrossQueues(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.MoveApplicationAcrossQueuesRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[13], controller, inp)

getApplicationAttemptReport(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetApplicationAttemptReportRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[14], controller, inp, done)
getApplicationAttemptReport(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetApplicationAttemptReportRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[14], controller, inp)

getApplicationAttempts(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetApplicationAttemptsRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[15], controller, inp, done)
getApplicationAttempts(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetApplicationAttemptsRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[15], controller, inp)

getContainerReport(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetContainerReportRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[16], controller, inp, done)
getContainerReport(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetContainerReportRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[16], controller, inp)

getContainers(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetContainersRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[17], controller, inp, done)
getContainers(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetContainersRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[17], controller, inp)

submitReservation(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.ReservationSubmissionRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[18], controller, inp, done)
submitReservation(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.ReservationSubmissionRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[18], controller, inp)

updateReservation(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.ReservationUpdateRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[19], controller, inp, done)
updateReservation(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.ReservationUpdateRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[19], controller, inp)

deleteReservation(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.ReservationDeleteRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[20], controller, inp, done)
deleteReservation(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.ReservationDeleteRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[20], controller, inp)

getNodeToLabels(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetNodesToLabelsRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[21], controller, inp, done)
getNodeToLabels(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetNodesToLabelsRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[21], controller, inp)

getLabelsToNodes(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetLabelsToNodesRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[22], controller, inp, done)
getLabelsToNodes(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetLabelsToNodesRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[22], controller, inp)

getClusterNodeLabels(stub::ApplicationClientProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.GetClusterNodeLabelsRequestProto, done::Function) = call_method(stub.impl, _ApplicationClientProtocolService_methods[23], controller, inp, done)
getClusterNodeLabels(stub::ApplicationClientProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.GetClusterNodeLabelsRequestProto) = call_method(stub.impl, _ApplicationClientProtocolService_methods[23], controller, inp)

export ApplicationClientProtocolService, ApplicationClientProtocolServiceStub, ApplicationClientProtocolServiceBlockingStub, getNewApplication, getApplicationReport, submitApplication, forceKillApplication, getClusterMetrics, getApplications, getClusterNodes, getQueueInfo, getQueueUserAcls, getDelegationToken, renewDelegationToken, cancelDelegationToken, moveApplicationAcrossQueues, getApplicationAttemptReport, getApplicationAttempts, getContainerReport, getContainers, submitReservation, updateReservation, deleteReservation, getNodeToLabels, getLabelsToNodes, getClusterNodeLabels
