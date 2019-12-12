# syntax: proto2
using ProtoBuf
import ProtoBuf.meta
import ..hadoop

struct __enum_ContainerUpdateTypeProto <: ProtoEnum
    INCREASE_RESOURCE::Int32
    DECREASE_RESOURCE::Int32
    PROMOTE_EXECUTION_TYPE::Int32
    DEMOTE_EXECUTION_TYPE::Int32
    __enum_ContainerUpdateTypeProto() = new(0,1,2,3)
end #struct __enum_ContainerUpdateTypeProto
const ContainerUpdateTypeProto = __enum_ContainerUpdateTypeProto()

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

mutable struct UpdateContainerRequestProto <: ProtoType
    container_version::Int32
    container_id::ContainerIdProto
    update_type::Int32
    capability::ResourceProto
    execution_type::Int32
    UpdateContainerRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UpdateContainerRequestProto
const __req_UpdateContainerRequestProto = Symbol[:container_version,:container_id,:update_type]
meta(t::Type{UpdateContainerRequestProto}) = meta(t, __req_UpdateContainerRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct UpdateContainerErrorProto <: ProtoType
    reason::AbstractString
    update_request::UpdateContainerRequestProto
    current_container_version::Int32
    UpdateContainerErrorProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UpdateContainerErrorProto

mutable struct AllocateRequestProto <: ProtoType
    ask::Base.Vector{ResourceRequestProto}
    release::Base.Vector{ContainerIdProto}
    blacklist_request::ResourceBlacklistRequestProto
    response_id::Int32
    progress::Float32
    increase_request::Base.Vector{ContainerResourceIncreaseRequestProto}
    update_requests::Base.Vector{UpdateContainerRequestProto}
    tracking_url::AbstractString
    AllocateRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AllocateRequestProto
const __fnum_AllocateRequestProto = Int[1,2,3,4,5,6,7,11]
meta(t::Type{AllocateRequestProto}) = meta(t, ProtoBuf.DEF_REQ, __fnum_AllocateRequestProto, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

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

mutable struct UpdatedContainerProto <: ProtoType
    update_type::Int32
    container::ContainerProto
    UpdatedContainerProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UpdatedContainerProto
const __req_UpdatedContainerProto = Symbol[:update_type,:container]
meta(t::Type{UpdatedContainerProto}) = meta(t, __req_UpdatedContainerProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

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
    application_priority::PriorityProto
    collector_info::CollectorInfoProto
    update_errors::Base.Vector{UpdateContainerErrorProto}
    updated_containers::Base.Vector{UpdatedContainerProto}
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

mutable struct FailApplicationAttemptRequestProto <: ProtoType
    application_attempt_id::ApplicationAttemptIdProto
    FailApplicationAttemptRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FailApplicationAttemptRequestProto

mutable struct FailApplicationAttemptResponseProto <: ProtoType
    FailApplicationAttemptResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FailApplicationAttemptResponseProto

mutable struct KillApplicationRequestProto <: ProtoType
    application_id::ApplicationIdProto
    diagnostics::AbstractString
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
    deprecatedNodeLabels::Base.Vector{AbstractString}
    nodeLabels::Base.Vector{NodeLabelProto}
    GetClusterNodeLabelsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetClusterNodeLabelsResponseProto

mutable struct UpdateApplicationPriorityRequestProto <: ProtoType
    applicationId::ApplicationIdProto
    applicationPriority::PriorityProto
    UpdateApplicationPriorityRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UpdateApplicationPriorityRequestProto
const __req_UpdateApplicationPriorityRequestProto = Symbol[:applicationId,:applicationPriority]
meta(t::Type{UpdateApplicationPriorityRequestProto}) = meta(t, __req_UpdateApplicationPriorityRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct UpdateApplicationPriorityResponseProto <: ProtoType
    applicationPriority::PriorityProto
    UpdateApplicationPriorityResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UpdateApplicationPriorityResponseProto

mutable struct SignalContainerRequestProto <: ProtoType
    container_id::ContainerIdProto
    command::Int32
    SignalContainerRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SignalContainerRequestProto
const __req_SignalContainerRequestProto = Symbol[:container_id,:command]
meta(t::Type{SignalContainerRequestProto}) = meta(t, __req_SignalContainerRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SignalContainerResponseProto <: ProtoType
    SignalContainerResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SignalContainerResponseProto

mutable struct UpdateApplicationTimeoutsRequestProto <: ProtoType
    applicationId::ApplicationIdProto
    application_timeouts::Base.Vector{ApplicationUpdateTimeoutMapProto}
    UpdateApplicationTimeoutsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UpdateApplicationTimeoutsRequestProto
const __req_UpdateApplicationTimeoutsRequestProto = Symbol[:applicationId]
meta(t::Type{UpdateApplicationTimeoutsRequestProto}) = meta(t, __req_UpdateApplicationTimeoutsRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct UpdateApplicationTimeoutsResponseProto <: ProtoType
    application_timeouts::Base.Vector{ApplicationUpdateTimeoutMapProto}
    UpdateApplicationTimeoutsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UpdateApplicationTimeoutsResponseProto

mutable struct GetAllResourceTypeInfoRequestProto <: ProtoType
    GetAllResourceTypeInfoRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetAllResourceTypeInfoRequestProto

mutable struct GetAllResourceTypeInfoResponseProto <: ProtoType
    resource_type_info::Base.Vector{ResourceTypeInfoProto}
    GetAllResourceTypeInfoResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetAllResourceTypeInfoResponseProto

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

mutable struct ResourceLocalizationRequestProto <: ProtoType
    container_id::ContainerIdProto
    local_resources::Base.Vector{StringLocalResourceMapProto}
    ResourceLocalizationRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ResourceLocalizationRequestProto

mutable struct ResourceLocalizationResponseProto <: ProtoType
    ResourceLocalizationResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ResourceLocalizationResponseProto

mutable struct ReInitializeContainerRequestProto <: ProtoType
    container_id::ContainerIdProto
    container_launch_context::ContainerLaunchContextProto
    auto_commit::Bool
    ReInitializeContainerRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReInitializeContainerRequestProto
const __val_ReInitializeContainerRequestProto = Dict(:auto_commit => true)
meta(t::Type{ReInitializeContainerRequestProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ReInitializeContainerRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ReInitializeContainerResponseProto <: ProtoType
    ReInitializeContainerResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReInitializeContainerResponseProto

mutable struct RestartContainerResponseProto <: ProtoType
    RestartContainerResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RestartContainerResponseProto

mutable struct RollbackResponseProto <: ProtoType
    RollbackResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RollbackResponseProto

mutable struct CommitResponseProto <: ProtoType
    CommitResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CommitResponseProto

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

mutable struct IncreaseContainersResourceRequestProto <: ProtoType
    increase_containers::Base.Vector{hadoop.common.TokenProto}
    IncreaseContainersResourceRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct IncreaseContainersResourceRequestProto

mutable struct IncreaseContainersResourceResponseProto <: ProtoType
    succeeded_requests::Base.Vector{ContainerIdProto}
    failed_requests::Base.Vector{ContainerExceptionMapProto}
    IncreaseContainersResourceResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct IncreaseContainersResourceResponseProto

mutable struct ContainerUpdateRequestProto <: ProtoType
    update_container_token::Base.Vector{hadoop.common.TokenProto}
    ContainerUpdateRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ContainerUpdateRequestProto

mutable struct ContainerUpdateResponseProto <: ProtoType
    succeeded_requests::Base.Vector{ContainerIdProto}
    failed_requests::Base.Vector{ContainerExceptionMapProto}
    ContainerUpdateResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ContainerUpdateResponseProto

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

mutable struct GetNewReservationRequestProto <: ProtoType
    GetNewReservationRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetNewReservationRequestProto

mutable struct GetNewReservationResponseProto <: ProtoType
    reservation_id::ReservationIdProto
    GetNewReservationResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetNewReservationResponseProto

mutable struct ReservationSubmissionRequestProto <: ProtoType
    queue::AbstractString
    reservation_definition::ReservationDefinitionProto
    reservation_id::ReservationIdProto
    ReservationSubmissionRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationSubmissionRequestProto

mutable struct ReservationSubmissionResponseProto <: ProtoType
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

mutable struct ReservationListRequestProto <: ProtoType
    queue::AbstractString
    reservation_id::AbstractString
    start_time::Int64
    end_time::Int64
    include_resource_allocations::Bool
    ReservationListRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationListRequestProto
const __fnum_ReservationListRequestProto = Int[1,3,4,5,6]
meta(t::Type{ReservationListRequestProto}) = meta(t, ProtoBuf.DEF_REQ, __fnum_ReservationListRequestProto, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ReservationListResponseProto <: ProtoType
    reservations::Base.Vector{ReservationAllocationStateProto}
    ReservationListResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationListResponseProto

mutable struct RunSharedCacheCleanerTaskRequestProto <: ProtoType
    RunSharedCacheCleanerTaskRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RunSharedCacheCleanerTaskRequestProto

mutable struct RunSharedCacheCleanerTaskResponseProto <: ProtoType
    accepted::Bool
    RunSharedCacheCleanerTaskResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RunSharedCacheCleanerTaskResponseProto

export ContainerUpdateTypeProto, SchedulerResourceTypes, ApplicationsRequestScopeProto, RegisterApplicationMasterRequestProto, RegisterApplicationMasterResponseProto, FinishApplicationMasterRequestProto, FinishApplicationMasterResponseProto, UpdateContainerRequestProto, UpdateContainerErrorProto, AllocateRequestProto, NMTokenProto, UpdatedContainerProto, AllocateResponseProto, GetNewApplicationRequestProto, GetNewApplicationResponseProto, GetApplicationReportRequestProto, GetApplicationReportResponseProto, SubmitApplicationRequestProto, SubmitApplicationResponseProto, FailApplicationAttemptRequestProto, FailApplicationAttemptResponseProto, KillApplicationRequestProto, KillApplicationResponseProto, GetClusterMetricsRequestProto, GetClusterMetricsResponseProto, MoveApplicationAcrossQueuesRequestProto, MoveApplicationAcrossQueuesResponseProto, GetApplicationsRequestProto, GetApplicationsResponseProto, GetClusterNodesRequestProto, GetClusterNodesResponseProto, GetQueueInfoRequestProto, GetQueueInfoResponseProto, GetQueueUserAclsInfoRequestProto, GetQueueUserAclsInfoResponseProto, GetNodesToLabelsRequestProto, GetNodesToLabelsResponseProto, GetLabelsToNodesRequestProto, GetLabelsToNodesResponseProto, GetClusterNodeLabelsRequestProto, GetClusterNodeLabelsResponseProto, UpdateApplicationPriorityRequestProto, UpdateApplicationPriorityResponseProto, SignalContainerRequestProto, SignalContainerResponseProto, UpdateApplicationTimeoutsRequestProto, UpdateApplicationTimeoutsResponseProto, GetAllResourceTypeInfoRequestProto, GetAllResourceTypeInfoResponseProto, StartContainerRequestProto, StartContainerResponseProto, StopContainerRequestProto, StopContainerResponseProto, ResourceLocalizationRequestProto, ResourceLocalizationResponseProto, ReInitializeContainerRequestProto, ReInitializeContainerResponseProto, RestartContainerResponseProto, RollbackResponseProto, CommitResponseProto, StartContainersRequestProto, ContainerExceptionMapProto, StartContainersResponseProto, StopContainersRequestProto, StopContainersResponseProto, GetContainerStatusesRequestProto, GetContainerStatusesResponseProto, IncreaseContainersResourceRequestProto, IncreaseContainersResourceResponseProto, ContainerUpdateRequestProto, ContainerUpdateResponseProto, GetApplicationAttemptReportRequestProto, GetApplicationAttemptReportResponseProto, GetApplicationAttemptsRequestProto, GetApplicationAttemptsResponseProto, GetContainerReportRequestProto, GetContainerReportResponseProto, GetContainersRequestProto, GetContainersResponseProto, UseSharedCacheResourceRequestProto, UseSharedCacheResourceResponseProto, ReleaseSharedCacheResourceRequestProto, ReleaseSharedCacheResourceResponseProto, GetNewReservationRequestProto, GetNewReservationResponseProto, ReservationSubmissionRequestProto, ReservationSubmissionResponseProto, ReservationUpdateRequestProto, ReservationUpdateResponseProto, ReservationDeleteRequestProto, ReservationDeleteResponseProto, ReservationListRequestProto, ReservationListResponseProto, RunSharedCacheCleanerTaskRequestProto, RunSharedCacheCleanerTaskResponseProto
