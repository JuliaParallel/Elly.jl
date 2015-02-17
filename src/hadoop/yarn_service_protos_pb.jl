using ..common
using Compat
using ProtoBuf
import ProtoBuf.meta

type __enum_SchedulerResourceTypes <: ProtoEnum
    MEMORY::Int32
    CPU::Int32
    __enum_SchedulerResourceTypes() = new(0,1)
end #type __enum_SchedulerResourceTypes
const SchedulerResourceTypes = __enum_SchedulerResourceTypes()

type __enum_ApplicationsRequestScopeProto <: ProtoEnum
    ALL::Int32
    VIEWABLE::Int32
    OWN::Int32
    __enum_ApplicationsRequestScopeProto() = new(0,1,2)
end #type __enum_ApplicationsRequestScopeProto
const ApplicationsRequestScopeProto = __enum_ApplicationsRequestScopeProto()

type RegisterApplicationMasterRequestProto
    host::AbstractString
    rpc_port::Int32
    tracking_url::AbstractString
    RegisterApplicationMasterRequestProto() = (o=new(); fillunset(o); o)
end #type RegisterApplicationMasterRequestProto

type FinishApplicationMasterRequestProto
    diagnostics::AbstractString
    tracking_url::AbstractString
    final_application_status::Int32
    FinishApplicationMasterRequestProto() = (o=new(); fillunset(o); o)
end #type FinishApplicationMasterRequestProto

type FinishApplicationMasterResponseProto
    isUnregistered::Bool
    FinishApplicationMasterResponseProto() = (o=new(); fillunset(o); o)
end #type FinishApplicationMasterResponseProto
const __val_FinishApplicationMasterResponseProto = @compat Dict(:isUnregistered => false)
meta(t::Type{FinishApplicationMasterResponseProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_FinishApplicationMasterResponseProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type AllocateRequestProto
    ask::Array{ResourceRequestProto,1}
    release::Array{ContainerIdProto,1}
    blacklist_request::ResourceBlacklistRequestProto
    response_id::Int32
    progress::Float32
    increase_request::Array{ContainerResourceIncreaseRequestProto,1}
    AllocateRequestProto() = (o=new(); fillunset(o); o)
end #type AllocateRequestProto

type NMTokenProto
    nodeId::NodeIdProto
    token::TokenProto
    NMTokenProto() = (o=new(); fillunset(o); o)
end #type NMTokenProto

type RegisterApplicationMasterResponseProto
    maximumCapability::ResourceProto
    client_to_am_token_master_key::Array{UInt8,1}
    application_ACLs::Array{ApplicationACLMapProto,1}
    containers_from_previous_attempts::Array{ContainerProto,1}
    queue::AbstractString
    nm_tokens_from_previous_attempts::Array{NMTokenProto,1}
    scheduler_resource_types::Array{Int32,1}
    RegisterApplicationMasterResponseProto() = (o=new(); fillunset(o); o)
end #type RegisterApplicationMasterResponseProto

type AllocateResponseProto
    a_m_command::Int32
    response_id::Int32
    allocated_containers::Array{ContainerProto,1}
    completed_container_statuses::Array{ContainerStatusProto,1}
    limit::ResourceProto
    updated_nodes::Array{NodeReportProto,1}
    num_cluster_nodes::Int32
    preempt::PreemptionMessageProto
    nm_tokens::Array{NMTokenProto,1}
    increased_containers::Array{ContainerResourceIncreaseProto,1}
    decreased_containers::Array{ContainerResourceDecreaseProto,1}
    am_rm_token::TokenProto
    AllocateResponseProto() = (o=new(); fillunset(o); o)
end #type AllocateResponseProto

type GetNewApplicationRequestProto
    GetNewApplicationRequestProto() = (o=new(); fillunset(o); o)
end #type GetNewApplicationRequestProto

type GetNewApplicationResponseProto
    application_id::ApplicationIdProto
    maximumCapability::ResourceProto
    GetNewApplicationResponseProto() = (o=new(); fillunset(o); o)
end #type GetNewApplicationResponseProto

type GetApplicationReportRequestProto
    application_id::ApplicationIdProto
    GetApplicationReportRequestProto() = (o=new(); fillunset(o); o)
end #type GetApplicationReportRequestProto

type GetApplicationReportResponseProto
    application_report::ApplicationReportProto
    GetApplicationReportResponseProto() = (o=new(); fillunset(o); o)
end #type GetApplicationReportResponseProto

type SubmitApplicationRequestProto
    application_submission_context::ApplicationSubmissionContextProto
    SubmitApplicationRequestProto() = (o=new(); fillunset(o); o)
end #type SubmitApplicationRequestProto

type SubmitApplicationResponseProto
    SubmitApplicationResponseProto() = (o=new(); fillunset(o); o)
end #type SubmitApplicationResponseProto

type KillApplicationRequestProto
    application_id::ApplicationIdProto
    KillApplicationRequestProto() = (o=new(); fillunset(o); o)
end #type KillApplicationRequestProto

type KillApplicationResponseProto
    is_kill_completed::Bool
    KillApplicationResponseProto() = (o=new(); fillunset(o); o)
end #type KillApplicationResponseProto
const __val_KillApplicationResponseProto = @compat Dict(:is_kill_completed => false)
meta(t::Type{KillApplicationResponseProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_KillApplicationResponseProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type GetClusterMetricsRequestProto
    GetClusterMetricsRequestProto() = (o=new(); fillunset(o); o)
end #type GetClusterMetricsRequestProto

type GetClusterMetricsResponseProto
    cluster_metrics::YarnClusterMetricsProto
    GetClusterMetricsResponseProto() = (o=new(); fillunset(o); o)
end #type GetClusterMetricsResponseProto

type MoveApplicationAcrossQueuesRequestProto
    application_id::ApplicationIdProto
    target_queue::AbstractString
    MoveApplicationAcrossQueuesRequestProto() = (o=new(); fillunset(o); o)
end #type MoveApplicationAcrossQueuesRequestProto
const __req_MoveApplicationAcrossQueuesRequestProto = Symbol[:application_id,:target_queue]
meta(t::Type{MoveApplicationAcrossQueuesRequestProto}) = meta(t, __req_MoveApplicationAcrossQueuesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type MoveApplicationAcrossQueuesResponseProto
    MoveApplicationAcrossQueuesResponseProto() = (o=new(); fillunset(o); o)
end #type MoveApplicationAcrossQueuesResponseProto

type GetApplicationsRequestProto
    application_types::Array{AbstractString,1}
    application_states::Array{Int32,1}
    users::Array{AbstractString,1}
    queues::Array{AbstractString,1}
    limit::Int64
    start_begin::Int64
    start_end::Int64
    finish_begin::Int64
    finish_end::Int64
    applicationTags::Array{AbstractString,1}
    scope::Int32
    GetApplicationsRequestProto() = (o=new(); fillunset(o); o)
end #type GetApplicationsRequestProto
const __val_GetApplicationsRequestProto = @compat Dict(:scope => ApplicationsRequestScopeProto.ALL)
meta(t::Type{GetApplicationsRequestProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_GetApplicationsRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type GetApplicationsResponseProto
    applications::Array{ApplicationReportProto,1}
    GetApplicationsResponseProto() = (o=new(); fillunset(o); o)
end #type GetApplicationsResponseProto

type GetClusterNodesRequestProto
    nodeStates::Array{Int32,1}
    GetClusterNodesRequestProto() = (o=new(); fillunset(o); o)
end #type GetClusterNodesRequestProto

type GetClusterNodesResponseProto
    nodeReports::Array{NodeReportProto,1}
    GetClusterNodesResponseProto() = (o=new(); fillunset(o); o)
end #type GetClusterNodesResponseProto

type GetQueueInfoRequestProto
    queueName::AbstractString
    includeApplications::Bool
    includeChildQueues::Bool
    recursive::Bool
    GetQueueInfoRequestProto() = (o=new(); fillunset(o); o)
end #type GetQueueInfoRequestProto

type GetQueueInfoResponseProto
    queueInfo::QueueInfoProto
    GetQueueInfoResponseProto() = (o=new(); fillunset(o); o)
end #type GetQueueInfoResponseProto

type GetQueueUserAclsInfoRequestProto
    GetQueueUserAclsInfoRequestProto() = (o=new(); fillunset(o); o)
end #type GetQueueUserAclsInfoRequestProto

type GetQueueUserAclsInfoResponseProto
    queueUserAcls::Array{QueueUserACLInfoProto,1}
    GetQueueUserAclsInfoResponseProto() = (o=new(); fillunset(o); o)
end #type GetQueueUserAclsInfoResponseProto

type GetNodesToLabelsRequestProto
    GetNodesToLabelsRequestProto() = (o=new(); fillunset(o); o)
end #type GetNodesToLabelsRequestProto

type GetNodesToLabelsResponseProto
    nodeToLabels::Array{NodeIdToLabelsProto,1}
    GetNodesToLabelsResponseProto() = (o=new(); fillunset(o); o)
end #type GetNodesToLabelsResponseProto

type GetClusterNodeLabelsRequestProto
    GetClusterNodeLabelsRequestProto() = (o=new(); fillunset(o); o)
end #type GetClusterNodeLabelsRequestProto

type GetClusterNodeLabelsResponseProto
    nodeLabels::Array{AbstractString,1}
    GetClusterNodeLabelsResponseProto() = (o=new(); fillunset(o); o)
end #type GetClusterNodeLabelsResponseProto

type StartContainerRequestProto
    container_launch_context::ContainerLaunchContextProto
    container_token::TokenProto
    StartContainerRequestProto() = (o=new(); fillunset(o); o)
end #type StartContainerRequestProto

type StartContainerResponseProto
    services_meta_data::Array{StringBytesMapProto,1}
    StartContainerResponseProto() = (o=new(); fillunset(o); o)
end #type StartContainerResponseProto

type StopContainerRequestProto
    container_id::ContainerIdProto
    StopContainerRequestProto() = (o=new(); fillunset(o); o)
end #type StopContainerRequestProto

type StopContainerResponseProto
    StopContainerResponseProto() = (o=new(); fillunset(o); o)
end #type StopContainerResponseProto

type GetContainerStatusRequestProto
    container_id::ContainerIdProto
    GetContainerStatusRequestProto() = (o=new(); fillunset(o); o)
end #type GetContainerStatusRequestProto

type GetContainerStatusResponseProto
    status::ContainerStatusProto
    GetContainerStatusResponseProto() = (o=new(); fillunset(o); o)
end #type GetContainerStatusResponseProto

type StartContainersRequestProto
    start_container_request::Array{StartContainerRequestProto,1}
    StartContainersRequestProto() = (o=new(); fillunset(o); o)
end #type StartContainersRequestProto

type ContainerExceptionMapProto
    container_id::ContainerIdProto
    exception::SerializedExceptionProto
    ContainerExceptionMapProto() = (o=new(); fillunset(o); o)
end #type ContainerExceptionMapProto

type StartContainersResponseProto
    services_meta_data::Array{StringBytesMapProto,1}
    succeeded_requests::Array{ContainerIdProto,1}
    failed_requests::Array{ContainerExceptionMapProto,1}
    StartContainersResponseProto() = (o=new(); fillunset(o); o)
end #type StartContainersResponseProto

type StopContainersRequestProto
    container_id::Array{ContainerIdProto,1}
    StopContainersRequestProto() = (o=new(); fillunset(o); o)
end #type StopContainersRequestProto

type StopContainersResponseProto
    succeeded_requests::Array{ContainerIdProto,1}
    failed_requests::Array{ContainerExceptionMapProto,1}
    StopContainersResponseProto() = (o=new(); fillunset(o); o)
end #type StopContainersResponseProto

type GetContainerStatusesRequestProto
    container_id::Array{ContainerIdProto,1}
    GetContainerStatusesRequestProto() = (o=new(); fillunset(o); o)
end #type GetContainerStatusesRequestProto

type GetContainerStatusesResponseProto
    status::Array{ContainerStatusProto,1}
    failed_requests::Array{ContainerExceptionMapProto,1}
    GetContainerStatusesResponseProto() = (o=new(); fillunset(o); o)
end #type GetContainerStatusesResponseProto

type GetApplicationAttemptReportRequestProto
    application_attempt_id::ApplicationAttemptIdProto
    GetApplicationAttemptReportRequestProto() = (o=new(); fillunset(o); o)
end #type GetApplicationAttemptReportRequestProto

type GetApplicationAttemptReportResponseProto
    application_attempt_report::ApplicationAttemptReportProto
    GetApplicationAttemptReportResponseProto() = (o=new(); fillunset(o); o)
end #type GetApplicationAttemptReportResponseProto

type GetApplicationAttemptsRequestProto
    application_id::ApplicationIdProto
    GetApplicationAttemptsRequestProto() = (o=new(); fillunset(o); o)
end #type GetApplicationAttemptsRequestProto

type GetApplicationAttemptsResponseProto
    application_attempts::Array{ApplicationAttemptReportProto,1}
    GetApplicationAttemptsResponseProto() = (o=new(); fillunset(o); o)
end #type GetApplicationAttemptsResponseProto

type GetContainerReportRequestProto
    container_id::ContainerIdProto
    GetContainerReportRequestProto() = (o=new(); fillunset(o); o)
end #type GetContainerReportRequestProto

type GetContainerReportResponseProto
    container_report::ContainerReportProto
    GetContainerReportResponseProto() = (o=new(); fillunset(o); o)
end #type GetContainerReportResponseProto

type GetContainersRequestProto
    application_attempt_id::ApplicationAttemptIdProto
    GetContainersRequestProto() = (o=new(); fillunset(o); o)
end #type GetContainersRequestProto

type GetContainersResponseProto
    containers::Array{ContainerReportProto,1}
    GetContainersResponseProto() = (o=new(); fillunset(o); o)
end #type GetContainersResponseProto

type ReservationSubmissionRequestProto
    queue::AbstractString
    reservation_definition::ReservationDefinitionProto
    ReservationSubmissionRequestProto() = (o=new(); fillunset(o); o)
end #type ReservationSubmissionRequestProto

type ReservationSubmissionResponseProto
    reservation_id::ReservationIdProto
    ReservationSubmissionResponseProto() = (o=new(); fillunset(o); o)
end #type ReservationSubmissionResponseProto

type ReservationUpdateRequestProto
    reservation_definition::ReservationDefinitionProto
    reservation_id::ReservationIdProto
    ReservationUpdateRequestProto() = (o=new(); fillunset(o); o)
end #type ReservationUpdateRequestProto

type ReservationUpdateResponseProto
    ReservationUpdateResponseProto() = (o=new(); fillunset(o); o)
end #type ReservationUpdateResponseProto

type ReservationDeleteRequestProto
    reservation_id::ReservationIdProto
    ReservationDeleteRequestProto() = (o=new(); fillunset(o); o)
end #type ReservationDeleteRequestProto

type ReservationDeleteResponseProto
    ReservationDeleteResponseProto() = (o=new(); fillunset(o); o)
end #type ReservationDeleteResponseProto

export SchedulerResourceTypes, ApplicationsRequestScopeProto, RegisterApplicationMasterRequestProto, RegisterApplicationMasterResponseProto, FinishApplicationMasterRequestProto, FinishApplicationMasterResponseProto, AllocateRequestProto, NMTokenProto, AllocateResponseProto, GetNewApplicationRequestProto, GetNewApplicationResponseProto, GetApplicationReportRequestProto, GetApplicationReportResponseProto, SubmitApplicationRequestProto, SubmitApplicationResponseProto, KillApplicationRequestProto, KillApplicationResponseProto, GetClusterMetricsRequestProto, GetClusterMetricsResponseProto, MoveApplicationAcrossQueuesRequestProto, MoveApplicationAcrossQueuesResponseProto, GetApplicationsRequestProto, GetApplicationsResponseProto, GetClusterNodesRequestProto, GetClusterNodesResponseProto, GetQueueInfoRequestProto, GetQueueInfoResponseProto, GetQueueUserAclsInfoRequestProto, GetQueueUserAclsInfoResponseProto, GetNodesToLabelsRequestProto, GetNodesToLabelsResponseProto, GetClusterNodeLabelsRequestProto, GetClusterNodeLabelsResponseProto, StartContainerRequestProto, StartContainerResponseProto, StopContainerRequestProto, StopContainerResponseProto, GetContainerStatusRequestProto, GetContainerStatusResponseProto, StartContainersRequestProto, ContainerExceptionMapProto, StartContainersResponseProto, StopContainersRequestProto, StopContainersResponseProto, GetContainerStatusesRequestProto, GetContainerStatusesResponseProto, GetApplicationAttemptReportRequestProto, GetApplicationAttemptReportResponseProto, GetApplicationAttemptsRequestProto, GetApplicationAttemptsResponseProto, GetContainerReportRequestProto, GetContainerReportResponseProto, GetContainersRequestProto, GetContainersResponseProto, ReservationSubmissionRequestProto, ReservationSubmissionResponseProto, ReservationUpdateRequestProto, ReservationUpdateResponseProto, ReservationDeleteRequestProto, ReservationDeleteResponseProto
