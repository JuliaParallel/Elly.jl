# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta
import ..hadoop

struct __enum_SchedulerResourceTypes <: ProtoEnum
    MEMORY::Int32
    CPU::Int32
    __enum_SchedulerResourceTypes() = new(0,1)
end #struct __enum_SchedulerResourceTypes
const SchedulerResourceTypes = __enum_SchedulerResourceTypes()

struct __enum_ApplicationsRequestScopeProto <: ProtoEnum
    ALL::Int32
    VIEWABLE::Int32
    OWN::Int32
    __enum_ApplicationsRequestScopeProto() = new(0,1,2)
end #struct __enum_ApplicationsRequestScopeProto
const ApplicationsRequestScopeProto = __enum_ApplicationsRequestScopeProto()

mutable struct RegisterApplicationMasterRequestProto <: ProtoType
    host::AbstractString
    rpc_port::Int32
    tracking_url::AbstractString
    RegisterApplicationMasterRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RegisterApplicationMasterRequestProto

mutable struct FinishApplicationMasterRequestProto <: ProtoType
    diagnostics::AbstractString
    tracking_url::AbstractString
    final_application_status::Int32
    FinishApplicationMasterRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FinishApplicationMasterRequestProto

mutable struct FinishApplicationMasterResponseProto <: ProtoType
    isUnregistered::Bool
    FinishApplicationMasterResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FinishApplicationMasterResponseProto
const __val_FinishApplicationMasterResponseProto = Dict(:isUnregistered => false)
meta(t::Type{FinishApplicationMasterResponseProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_FinishApplicationMasterResponseProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct AllocateRequestProto <: ProtoType
    ask::Base.Vector{ResourceRequestProto}
    release::Base.Vector{ContainerIdProto}
    blacklist_request::ResourceBlacklistRequestProto
    response_id::Int32
    progress::Float32
    increase_request::Base.Vector{ContainerResourceIncreaseRequestProto}
    AllocateRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AllocateRequestProto

mutable struct NMTokenProto <: ProtoType
    nodeId::NodeIdProto
    token::hadoop.common.TokenProto
    NMTokenProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct NMTokenProto

mutable struct RegisterApplicationMasterResponseProto <: ProtoType
    maximumCapability::ResourceProto
    client_to_am_token_master_key::Array{UInt8,1}
    application_ACLs::Base.Vector{ApplicationACLMapProto}
    containers_from_previous_attempts::Base.Vector{ContainerProto}
    queue::AbstractString
    nm_tokens_from_previous_attempts::Base.Vector{NMTokenProto}
    scheduler_resource_types::Base.Vector{Int32}
    RegisterApplicationMasterResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RegisterApplicationMasterResponseProto

mutable struct AllocateResponseProto <: ProtoType
    a_m_command::Int32
    response_id::Int32
    allocated_containers::Base.Vector{ContainerProto}
    completed_container_statuses::Base.Vector{ContainerStatusProto}
    limit::ResourceProto
    updated_nodes::Base.Vector{NodeReportProto}
    num_cluster_nodes::Int32
    preempt::PreemptionMessageProto
    nm_tokens::Base.Vector{NMTokenProto}
    increased_containers::Base.Vector{ContainerResourceIncreaseProto}
    decreased_containers::Base.Vector{ContainerResourceDecreaseProto}
    am_rm_token::hadoop.common.TokenProto
    AllocateResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AllocateResponseProto

mutable struct GetNewApplicationRequestProto <: ProtoType
    GetNewApplicationRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetNewApplicationRequestProto

mutable struct GetNewApplicationResponseProto <: ProtoType
    application_id::ApplicationIdProto
    maximumCapability::ResourceProto
    GetNewApplicationResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetNewApplicationResponseProto

mutable struct GetApplicationReportRequestProto <: ProtoType
    application_id::ApplicationIdProto
    GetApplicationReportRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetApplicationReportRequestProto

mutable struct GetApplicationReportResponseProto <: ProtoType
    application_report::ApplicationReportProto
    GetApplicationReportResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetApplicationReportResponseProto

mutable struct SubmitApplicationRequestProto <: ProtoType
    application_submission_context::ApplicationSubmissionContextProto
    SubmitApplicationRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SubmitApplicationRequestProto

mutable struct SubmitApplicationResponseProto <: ProtoType
    SubmitApplicationResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SubmitApplicationResponseProto

mutable struct KillApplicationRequestProto <: ProtoType
    application_id::ApplicationIdProto
    KillApplicationRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct KillApplicationRequestProto

mutable struct KillApplicationResponseProto <: ProtoType
    is_kill_completed::Bool
    KillApplicationResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct KillApplicationResponseProto
const __val_KillApplicationResponseProto = Dict(:is_kill_completed => false)
meta(t::Type{KillApplicationResponseProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_KillApplicationResponseProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetClusterMetricsRequestProto <: ProtoType
    GetClusterMetricsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetClusterMetricsRequestProto

mutable struct GetClusterMetricsResponseProto <: ProtoType
    cluster_metrics::YarnClusterMetricsProto
    GetClusterMetricsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetClusterMetricsResponseProto

mutable struct MoveApplicationAcrossQueuesRequestProto <: ProtoType
    application_id::ApplicationIdProto
    target_queue::AbstractString
    MoveApplicationAcrossQueuesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MoveApplicationAcrossQueuesRequestProto
const __req_MoveApplicationAcrossQueuesRequestProto = Symbol[:application_id,:target_queue]
meta(t::Type{MoveApplicationAcrossQueuesRequestProto}) = meta(t, __req_MoveApplicationAcrossQueuesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct MoveApplicationAcrossQueuesResponseProto <: ProtoType
    MoveApplicationAcrossQueuesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MoveApplicationAcrossQueuesResponseProto

mutable struct GetApplicationsRequestProto <: ProtoType
    application_types::Base.Vector{AbstractString}
    application_states::Base.Vector{Int32}
    users::Base.Vector{AbstractString}
    queues::Base.Vector{AbstractString}
    limit::Int64
    start_begin::Int64
    start_end::Int64
    finish_begin::Int64
    finish_end::Int64
    applicationTags::Base.Vector{AbstractString}
    scope::Int32
    GetApplicationsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetApplicationsRequestProto
const __val_GetApplicationsRequestProto = Dict(:scope => ApplicationsRequestScopeProto.ALL)
meta(t::Type{GetApplicationsRequestProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_GetApplicationsRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetApplicationsResponseProto <: ProtoType
    applications::Base.Vector{ApplicationReportProto}
    GetApplicationsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetApplicationsResponseProto

mutable struct GetClusterNodesRequestProto <: ProtoType
    nodeStates::Base.Vector{Int32}
    GetClusterNodesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetClusterNodesRequestProto

mutable struct GetClusterNodesResponseProto <: ProtoType
    nodeReports::Base.Vector{NodeReportProto}
    GetClusterNodesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetClusterNodesResponseProto

mutable struct GetQueueInfoRequestProto <: ProtoType
    queueName::AbstractString
    includeApplications::Bool
    includeChildQueues::Bool
    recursive::Bool
    GetQueueInfoRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetQueueInfoRequestProto

mutable struct GetQueueInfoResponseProto <: ProtoType
    queueInfo::QueueInfoProto
    GetQueueInfoResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetQueueInfoResponseProto

mutable struct GetQueueUserAclsInfoRequestProto <: ProtoType
    GetQueueUserAclsInfoRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetQueueUserAclsInfoRequestProto

mutable struct GetQueueUserAclsInfoResponseProto <: ProtoType
    queueUserAcls::Base.Vector{QueueUserACLInfoProto}
    GetQueueUserAclsInfoResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetQueueUserAclsInfoResponseProto

mutable struct GetNodesToLabelsRequestProto <: ProtoType
    GetNodesToLabelsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetNodesToLabelsRequestProto

mutable struct GetNodesToLabelsResponseProto <: ProtoType
    nodeToLabels::Base.Vector{NodeIdToLabelsProto}
    GetNodesToLabelsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetNodesToLabelsResponseProto

mutable struct GetLabelsToNodesRequestProto <: ProtoType
    nodeLabels::Base.Vector{AbstractString}
    GetLabelsToNodesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetLabelsToNodesRequestProto

mutable struct GetLabelsToNodesResponseProto <: ProtoType
    labelsToNodes::Base.Vector{LabelsToNodeIdsProto}
    GetLabelsToNodesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetLabelsToNodesResponseProto

mutable struct GetClusterNodeLabelsRequestProto <: ProtoType
    GetClusterNodeLabelsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetClusterNodeLabelsRequestProto

mutable struct GetClusterNodeLabelsResponseProto <: ProtoType
    nodeLabels::Base.Vector{AbstractString}
    GetClusterNodeLabelsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetClusterNodeLabelsResponseProto

mutable struct StartContainerRequestProto <: ProtoType
    container_launch_context::ContainerLaunchContextProto
    container_token::hadoop.common.TokenProto
    StartContainerRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StartContainerRequestProto

mutable struct StartContainerResponseProto <: ProtoType
    services_meta_data::Base.Vector{StringBytesMapProto}
    StartContainerResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StartContainerResponseProto

mutable struct StopContainerRequestProto <: ProtoType
    container_id::ContainerIdProto
    StopContainerRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StopContainerRequestProto

mutable struct StopContainerResponseProto <: ProtoType
    StopContainerResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StopContainerResponseProto

mutable struct GetContainerStatusRequestProto <: ProtoType
    container_id::ContainerIdProto
    GetContainerStatusRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContainerStatusRequestProto

mutable struct GetContainerStatusResponseProto <: ProtoType
    status::ContainerStatusProto
    GetContainerStatusResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContainerStatusResponseProto

mutable struct StartContainersRequestProto <: ProtoType
    start_container_request::Base.Vector{StartContainerRequestProto}
    StartContainersRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StartContainersRequestProto

mutable struct ContainerExceptionMapProto <: ProtoType
    container_id::ContainerIdProto
    exception::SerializedExceptionProto
    ContainerExceptionMapProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ContainerExceptionMapProto

mutable struct StartContainersResponseProto <: ProtoType
    services_meta_data::Base.Vector{StringBytesMapProto}
    succeeded_requests::Base.Vector{ContainerIdProto}
    failed_requests::Base.Vector{ContainerExceptionMapProto}
    StartContainersResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StartContainersResponseProto

mutable struct StopContainersRequestProto <: ProtoType
    container_id::Base.Vector{ContainerIdProto}
    StopContainersRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StopContainersRequestProto

mutable struct StopContainersResponseProto <: ProtoType
    succeeded_requests::Base.Vector{ContainerIdProto}
    failed_requests::Base.Vector{ContainerExceptionMapProto}
    StopContainersResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StopContainersResponseProto

mutable struct GetContainerStatusesRequestProto <: ProtoType
    container_id::Base.Vector{ContainerIdProto}
    GetContainerStatusesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContainerStatusesRequestProto

mutable struct GetContainerStatusesResponseProto <: ProtoType
    status::Base.Vector{ContainerStatusProto}
    failed_requests::Base.Vector{ContainerExceptionMapProto}
    GetContainerStatusesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContainerStatusesResponseProto

mutable struct GetApplicationAttemptReportRequestProto <: ProtoType
    application_attempt_id::ApplicationAttemptIdProto
    GetApplicationAttemptReportRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetApplicationAttemptReportRequestProto

mutable struct GetApplicationAttemptReportResponseProto <: ProtoType
    application_attempt_report::ApplicationAttemptReportProto
    GetApplicationAttemptReportResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetApplicationAttemptReportResponseProto

mutable struct GetApplicationAttemptsRequestProto <: ProtoType
    application_id::ApplicationIdProto
    GetApplicationAttemptsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetApplicationAttemptsRequestProto

mutable struct GetApplicationAttemptsResponseProto <: ProtoType
    application_attempts::Base.Vector{ApplicationAttemptReportProto}
    GetApplicationAttemptsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetApplicationAttemptsResponseProto

mutable struct GetContainerReportRequestProto <: ProtoType
    container_id::ContainerIdProto
    GetContainerReportRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContainerReportRequestProto

mutable struct GetContainerReportResponseProto <: ProtoType
    container_report::ContainerReportProto
    GetContainerReportResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContainerReportResponseProto

mutable struct GetContainersRequestProto <: ProtoType
    application_attempt_id::ApplicationAttemptIdProto
    GetContainersRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContainersRequestProto

mutable struct GetContainersResponseProto <: ProtoType
    containers::Base.Vector{ContainerReportProto}
    GetContainersResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContainersResponseProto

mutable struct UseSharedCacheResourceRequestProto <: ProtoType
    applicationId::ApplicationIdProto
    resourceKey::AbstractString
    UseSharedCacheResourceRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UseSharedCacheResourceRequestProto

mutable struct UseSharedCacheResourceResponseProto <: ProtoType
    path::AbstractString
    UseSharedCacheResourceResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UseSharedCacheResourceResponseProto

mutable struct ReleaseSharedCacheResourceRequestProto <: ProtoType
    applicationId::ApplicationIdProto
    resourceKey::AbstractString
    ReleaseSharedCacheResourceRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReleaseSharedCacheResourceRequestProto

mutable struct ReleaseSharedCacheResourceResponseProto <: ProtoType
    ReleaseSharedCacheResourceResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReleaseSharedCacheResourceResponseProto

mutable struct ReservationSubmissionRequestProto <: ProtoType
    queue::AbstractString
    reservation_definition::ReservationDefinitionProto
    ReservationSubmissionRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationSubmissionRequestProto

mutable struct ReservationSubmissionResponseProto <: ProtoType
    reservation_id::ReservationIdProto
    ReservationSubmissionResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationSubmissionResponseProto

mutable struct ReservationUpdateRequestProto <: ProtoType
    reservation_definition::ReservationDefinitionProto
    reservation_id::ReservationIdProto
    ReservationUpdateRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationUpdateRequestProto

mutable struct ReservationUpdateResponseProto <: ProtoType
    ReservationUpdateResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationUpdateResponseProto

mutable struct ReservationDeleteRequestProto <: ProtoType
    reservation_id::ReservationIdProto
    ReservationDeleteRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationDeleteRequestProto

mutable struct ReservationDeleteResponseProto <: ProtoType
    ReservationDeleteResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationDeleteResponseProto

mutable struct RunSharedCacheCleanerTaskRequestProto <: ProtoType
    RunSharedCacheCleanerTaskRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RunSharedCacheCleanerTaskRequestProto

mutable struct RunSharedCacheCleanerTaskResponseProto <: ProtoType
    accepted::Bool
    RunSharedCacheCleanerTaskResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RunSharedCacheCleanerTaskResponseProto

export SchedulerResourceTypes, ApplicationsRequestScopeProto, RegisterApplicationMasterRequestProto, RegisterApplicationMasterResponseProto, FinishApplicationMasterRequestProto, FinishApplicationMasterResponseProto, AllocateRequestProto, NMTokenProto, AllocateResponseProto, GetNewApplicationRequestProto, GetNewApplicationResponseProto, GetApplicationReportRequestProto, GetApplicationReportResponseProto, SubmitApplicationRequestProto, SubmitApplicationResponseProto, KillApplicationRequestProto, KillApplicationResponseProto, GetClusterMetricsRequestProto, GetClusterMetricsResponseProto, MoveApplicationAcrossQueuesRequestProto, MoveApplicationAcrossQueuesResponseProto, GetApplicationsRequestProto, GetApplicationsResponseProto, GetClusterNodesRequestProto, GetClusterNodesResponseProto, GetQueueInfoRequestProto, GetQueueInfoResponseProto, GetQueueUserAclsInfoRequestProto, GetQueueUserAclsInfoResponseProto, GetNodesToLabelsRequestProto, GetNodesToLabelsResponseProto, GetLabelsToNodesRequestProto, GetLabelsToNodesResponseProto, GetClusterNodeLabelsRequestProto, GetClusterNodeLabelsResponseProto, StartContainerRequestProto, StartContainerResponseProto, StopContainerRequestProto, StopContainerResponseProto, GetContainerStatusRequestProto, GetContainerStatusResponseProto, StartContainersRequestProto, ContainerExceptionMapProto, StartContainersResponseProto, StopContainersRequestProto, StopContainersResponseProto, GetContainerStatusesRequestProto, GetContainerStatusesResponseProto, GetApplicationAttemptReportRequestProto, GetApplicationAttemptReportResponseProto, GetApplicationAttemptsRequestProto, GetApplicationAttemptsResponseProto, GetContainerReportRequestProto, GetContainerReportResponseProto, GetContainersRequestProto, GetContainersResponseProto, UseSharedCacheResourceRequestProto, UseSharedCacheResourceResponseProto, ReleaseSharedCacheResourceRequestProto, ReleaseSharedCacheResourceResponseProto, ReservationSubmissionRequestProto, ReservationSubmissionResponseProto, ReservationUpdateRequestProto, ReservationUpdateResponseProto, ReservationDeleteRequestProto, ReservationDeleteResponseProto, RunSharedCacheCleanerTaskRequestProto, RunSharedCacheCleanerTaskResponseProto
