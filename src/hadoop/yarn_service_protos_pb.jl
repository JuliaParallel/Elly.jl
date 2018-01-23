using ..common
using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

mutable struct __enum_SchedulerResourceTypes <: ProtoEnum
    MEMORY::Int32
    CPU::Int32
    __enum_SchedulerResourceTypes() = new(0,1)
end #type __enum_SchedulerResourceTypes
const SchedulerResourceTypes = __enum_SchedulerResourceTypes()

mutable struct __enum_ApplicationsRequestScopeProto <: ProtoEnum
    ALL::Int32
    VIEWABLE::Int32
    OWN::Int32
    __enum_ApplicationsRequestScopeProto() = new(0,1,2)
end #type __enum_ApplicationsRequestScopeProto
const ApplicationsRequestScopeProto = __enum_ApplicationsRequestScopeProto()

mutable struct RegisterApplicationMasterRequestProto
    host::AbstractString
    rpc_port::Int32
    tracking_url::AbstractString
    RegisterApplicationMasterRequestProto() = (o=new(); fillunset(o); o)
end #type RegisterApplicationMasterRequestProto
hash(v::RegisterApplicationMasterRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RegisterApplicationMasterRequestProto, v2::RegisterApplicationMasterRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RegisterApplicationMasterRequestProto, v2::RegisterApplicationMasterRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct FinishApplicationMasterRequestProto
    diagnostics::AbstractString
    tracking_url::AbstractString
    final_application_status::Int32
    FinishApplicationMasterRequestProto() = (o=new(); fillunset(o); o)
end #type FinishApplicationMasterRequestProto
hash(v::FinishApplicationMasterRequestProto) = ProtoBuf.protohash(v)
isequal(v1::FinishApplicationMasterRequestProto, v2::FinishApplicationMasterRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::FinishApplicationMasterRequestProto, v2::FinishApplicationMasterRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct FinishApplicationMasterResponseProto
    isUnregistered::Bool
    FinishApplicationMasterResponseProto() = (o=new(); fillunset(o); o)
end #type FinishApplicationMasterResponseProto
const __val_FinishApplicationMasterResponseProto = Dict(:isUnregistered => false)
meta(t::Type{FinishApplicationMasterResponseProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_FinishApplicationMasterResponseProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::FinishApplicationMasterResponseProto) = ProtoBuf.protohash(v)
isequal(v1::FinishApplicationMasterResponseProto, v2::FinishApplicationMasterResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::FinishApplicationMasterResponseProto, v2::FinishApplicationMasterResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct AllocateRequestProto
    ask::Array{ResourceRequestProto,1}
    release::Array{ContainerIdProto,1}
    blacklist_request::ResourceBlacklistRequestProto
    response_id::Int32
    progress::Float32
    increase_request::Array{ContainerResourceIncreaseRequestProto,1}
    AllocateRequestProto() = (o=new(); fillunset(o); o)
end #type AllocateRequestProto
hash(v::AllocateRequestProto) = ProtoBuf.protohash(v)
isequal(v1::AllocateRequestProto, v2::AllocateRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AllocateRequestProto, v2::AllocateRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct NMTokenProto
    nodeId::NodeIdProto
    token::TokenProto
    NMTokenProto() = (o=new(); fillunset(o); o)
end #type NMTokenProto
hash(v::NMTokenProto) = ProtoBuf.protohash(v)
isequal(v1::NMTokenProto, v2::NMTokenProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::NMTokenProto, v2::NMTokenProto) = ProtoBuf.protoeq(v1, v2)

mutable struct RegisterApplicationMasterResponseProto
    maximumCapability::ResourceProto
    client_to_am_token_master_key::Array{UInt8,1}
    application_ACLs::Array{ApplicationACLMapProto,1}
    containers_from_previous_attempts::Array{ContainerProto,1}
    queue::AbstractString
    nm_tokens_from_previous_attempts::Array{NMTokenProto,1}
    scheduler_resource_types::Array{Int32,1}
    RegisterApplicationMasterResponseProto() = (o=new(); fillunset(o); o)
end #type RegisterApplicationMasterResponseProto
hash(v::RegisterApplicationMasterResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RegisterApplicationMasterResponseProto, v2::RegisterApplicationMasterResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RegisterApplicationMasterResponseProto, v2::RegisterApplicationMasterResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct AllocateResponseProto
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
hash(v::AllocateResponseProto) = ProtoBuf.protohash(v)
isequal(v1::AllocateResponseProto, v2::AllocateResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AllocateResponseProto, v2::AllocateResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetNewApplicationRequestProto
    GetNewApplicationRequestProto() = (o=new(); fillunset(o); o)
end #type GetNewApplicationRequestProto
hash(v::GetNewApplicationRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetNewApplicationRequestProto, v2::GetNewApplicationRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetNewApplicationRequestProto, v2::GetNewApplicationRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetNewApplicationResponseProto
    application_id::ApplicationIdProto
    maximumCapability::ResourceProto
    GetNewApplicationResponseProto() = (o=new(); fillunset(o); o)
end #type GetNewApplicationResponseProto
hash(v::GetNewApplicationResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetNewApplicationResponseProto, v2::GetNewApplicationResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetNewApplicationResponseProto, v2::GetNewApplicationResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetApplicationReportRequestProto
    application_id::ApplicationIdProto
    GetApplicationReportRequestProto() = (o=new(); fillunset(o); o)
end #type GetApplicationReportRequestProto
hash(v::GetApplicationReportRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetApplicationReportRequestProto, v2::GetApplicationReportRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetApplicationReportRequestProto, v2::GetApplicationReportRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetApplicationReportResponseProto
    application_report::ApplicationReportProto
    GetApplicationReportResponseProto() = (o=new(); fillunset(o); o)
end #type GetApplicationReportResponseProto
hash(v::GetApplicationReportResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetApplicationReportResponseProto, v2::GetApplicationReportResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetApplicationReportResponseProto, v2::GetApplicationReportResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct SubmitApplicationRequestProto
    application_submission_context::ApplicationSubmissionContextProto
    SubmitApplicationRequestProto() = (o=new(); fillunset(o); o)
end #type SubmitApplicationRequestProto
hash(v::SubmitApplicationRequestProto) = ProtoBuf.protohash(v)
isequal(v1::SubmitApplicationRequestProto, v2::SubmitApplicationRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SubmitApplicationRequestProto, v2::SubmitApplicationRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct SubmitApplicationResponseProto
    SubmitApplicationResponseProto() = (o=new(); fillunset(o); o)
end #type SubmitApplicationResponseProto
hash(v::SubmitApplicationResponseProto) = ProtoBuf.protohash(v)
isequal(v1::SubmitApplicationResponseProto, v2::SubmitApplicationResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SubmitApplicationResponseProto, v2::SubmitApplicationResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct KillApplicationRequestProto
    application_id::ApplicationIdProto
    KillApplicationRequestProto() = (o=new(); fillunset(o); o)
end #type KillApplicationRequestProto
hash(v::KillApplicationRequestProto) = ProtoBuf.protohash(v)
isequal(v1::KillApplicationRequestProto, v2::KillApplicationRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::KillApplicationRequestProto, v2::KillApplicationRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct KillApplicationResponseProto
    is_kill_completed::Bool
    KillApplicationResponseProto() = (o=new(); fillunset(o); o)
end #type KillApplicationResponseProto
const __val_KillApplicationResponseProto = Dict(:is_kill_completed => false)
meta(t::Type{KillApplicationResponseProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_KillApplicationResponseProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::KillApplicationResponseProto) = ProtoBuf.protohash(v)
isequal(v1::KillApplicationResponseProto, v2::KillApplicationResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::KillApplicationResponseProto, v2::KillApplicationResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetClusterMetricsRequestProto
    GetClusterMetricsRequestProto() = (o=new(); fillunset(o); o)
end #type GetClusterMetricsRequestProto
hash(v::GetClusterMetricsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetClusterMetricsRequestProto, v2::GetClusterMetricsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetClusterMetricsRequestProto, v2::GetClusterMetricsRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetClusterMetricsResponseProto
    cluster_metrics::YarnClusterMetricsProto
    GetClusterMetricsResponseProto() = (o=new(); fillunset(o); o)
end #type GetClusterMetricsResponseProto
hash(v::GetClusterMetricsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetClusterMetricsResponseProto, v2::GetClusterMetricsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetClusterMetricsResponseProto, v2::GetClusterMetricsResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct MoveApplicationAcrossQueuesRequestProto
    application_id::ApplicationIdProto
    target_queue::AbstractString
    MoveApplicationAcrossQueuesRequestProto() = (o=new(); fillunset(o); o)
end #type MoveApplicationAcrossQueuesRequestProto
const __req_MoveApplicationAcrossQueuesRequestProto = Symbol[:application_id,:target_queue]
meta(t::Type{MoveApplicationAcrossQueuesRequestProto}) = meta(t, __req_MoveApplicationAcrossQueuesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::MoveApplicationAcrossQueuesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::MoveApplicationAcrossQueuesRequestProto, v2::MoveApplicationAcrossQueuesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::MoveApplicationAcrossQueuesRequestProto, v2::MoveApplicationAcrossQueuesRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct MoveApplicationAcrossQueuesResponseProto
    MoveApplicationAcrossQueuesResponseProto() = (o=new(); fillunset(o); o)
end #type MoveApplicationAcrossQueuesResponseProto
hash(v::MoveApplicationAcrossQueuesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::MoveApplicationAcrossQueuesResponseProto, v2::MoveApplicationAcrossQueuesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::MoveApplicationAcrossQueuesResponseProto, v2::MoveApplicationAcrossQueuesResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetApplicationsRequestProto
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
const __val_GetApplicationsRequestProto = Dict(:scope => ApplicationsRequestScopeProto.ALL)
meta(t::Type{GetApplicationsRequestProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_GetApplicationsRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetApplicationsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetApplicationsRequestProto, v2::GetApplicationsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetApplicationsRequestProto, v2::GetApplicationsRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetApplicationsResponseProto
    applications::Array{ApplicationReportProto,1}
    GetApplicationsResponseProto() = (o=new(); fillunset(o); o)
end #type GetApplicationsResponseProto
hash(v::GetApplicationsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetApplicationsResponseProto, v2::GetApplicationsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetApplicationsResponseProto, v2::GetApplicationsResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetClusterNodesRequestProto
    nodeStates::Array{Int32,1}
    GetClusterNodesRequestProto() = (o=new(); fillunset(o); o)
end #type GetClusterNodesRequestProto
hash(v::GetClusterNodesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetClusterNodesRequestProto, v2::GetClusterNodesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetClusterNodesRequestProto, v2::GetClusterNodesRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetClusterNodesResponseProto
    nodeReports::Array{NodeReportProto,1}
    GetClusterNodesResponseProto() = (o=new(); fillunset(o); o)
end #type GetClusterNodesResponseProto
hash(v::GetClusterNodesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetClusterNodesResponseProto, v2::GetClusterNodesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetClusterNodesResponseProto, v2::GetClusterNodesResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetQueueInfoRequestProto
    queueName::AbstractString
    includeApplications::Bool
    includeChildQueues::Bool
    recursive::Bool
    GetQueueInfoRequestProto() = (o=new(); fillunset(o); o)
end #type GetQueueInfoRequestProto
hash(v::GetQueueInfoRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetQueueInfoRequestProto, v2::GetQueueInfoRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetQueueInfoRequestProto, v2::GetQueueInfoRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetQueueInfoResponseProto
    queueInfo::QueueInfoProto
    GetQueueInfoResponseProto() = (o=new(); fillunset(o); o)
end #type GetQueueInfoResponseProto
hash(v::GetQueueInfoResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetQueueInfoResponseProto, v2::GetQueueInfoResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetQueueInfoResponseProto, v2::GetQueueInfoResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetQueueUserAclsInfoRequestProto
    GetQueueUserAclsInfoRequestProto() = (o=new(); fillunset(o); o)
end #type GetQueueUserAclsInfoRequestProto
hash(v::GetQueueUserAclsInfoRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetQueueUserAclsInfoRequestProto, v2::GetQueueUserAclsInfoRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetQueueUserAclsInfoRequestProto, v2::GetQueueUserAclsInfoRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetQueueUserAclsInfoResponseProto
    queueUserAcls::Array{QueueUserACLInfoProto,1}
    GetQueueUserAclsInfoResponseProto() = (o=new(); fillunset(o); o)
end #type GetQueueUserAclsInfoResponseProto
hash(v::GetQueueUserAclsInfoResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetQueueUserAclsInfoResponseProto, v2::GetQueueUserAclsInfoResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetQueueUserAclsInfoResponseProto, v2::GetQueueUserAclsInfoResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetNodesToLabelsRequestProto
    GetNodesToLabelsRequestProto() = (o=new(); fillunset(o); o)
end #type GetNodesToLabelsRequestProto
hash(v::GetNodesToLabelsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetNodesToLabelsRequestProto, v2::GetNodesToLabelsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetNodesToLabelsRequestProto, v2::GetNodesToLabelsRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetNodesToLabelsResponseProto
    nodeToLabels::Array{NodeIdToLabelsProto,1}
    GetNodesToLabelsResponseProto() = (o=new(); fillunset(o); o)
end #type GetNodesToLabelsResponseProto
hash(v::GetNodesToLabelsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetNodesToLabelsResponseProto, v2::GetNodesToLabelsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetNodesToLabelsResponseProto, v2::GetNodesToLabelsResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetLabelsToNodesRequestProto
    nodeLabels::Array{AbstractString,1}
    GetLabelsToNodesRequestProto() = (o=new(); fillunset(o); o)
end #type GetLabelsToNodesRequestProto
hash(v::GetLabelsToNodesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetLabelsToNodesRequestProto, v2::GetLabelsToNodesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetLabelsToNodesRequestProto, v2::GetLabelsToNodesRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetLabelsToNodesResponseProto
    labelsToNodes::Array{LabelsToNodeIdsProto,1}
    GetLabelsToNodesResponseProto() = (o=new(); fillunset(o); o)
end #type GetLabelsToNodesResponseProto
hash(v::GetLabelsToNodesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetLabelsToNodesResponseProto, v2::GetLabelsToNodesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetLabelsToNodesResponseProto, v2::GetLabelsToNodesResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetClusterNodeLabelsRequestProto
    GetClusterNodeLabelsRequestProto() = (o=new(); fillunset(o); o)
end #type GetClusterNodeLabelsRequestProto
hash(v::GetClusterNodeLabelsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetClusterNodeLabelsRequestProto, v2::GetClusterNodeLabelsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetClusterNodeLabelsRequestProto, v2::GetClusterNodeLabelsRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetClusterNodeLabelsResponseProto
    nodeLabels::Array{AbstractString,1}
    GetClusterNodeLabelsResponseProto() = (o=new(); fillunset(o); o)
end #type GetClusterNodeLabelsResponseProto
hash(v::GetClusterNodeLabelsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetClusterNodeLabelsResponseProto, v2::GetClusterNodeLabelsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetClusterNodeLabelsResponseProto, v2::GetClusterNodeLabelsResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct StartContainerRequestProto
    container_launch_context::ContainerLaunchContextProto
    container_token::TokenProto
    StartContainerRequestProto() = (o=new(); fillunset(o); o)
end #type StartContainerRequestProto
hash(v::StartContainerRequestProto) = ProtoBuf.protohash(v)
isequal(v1::StartContainerRequestProto, v2::StartContainerRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StartContainerRequestProto, v2::StartContainerRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct StartContainerResponseProto
    services_meta_data::Array{StringBytesMapProto,1}
    StartContainerResponseProto() = (o=new(); fillunset(o); o)
end #type StartContainerResponseProto
hash(v::StartContainerResponseProto) = ProtoBuf.protohash(v)
isequal(v1::StartContainerResponseProto, v2::StartContainerResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StartContainerResponseProto, v2::StartContainerResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct StopContainerRequestProto
    container_id::ContainerIdProto
    StopContainerRequestProto() = (o=new(); fillunset(o); o)
end #type StopContainerRequestProto
hash(v::StopContainerRequestProto) = ProtoBuf.protohash(v)
isequal(v1::StopContainerRequestProto, v2::StopContainerRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StopContainerRequestProto, v2::StopContainerRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct StopContainerResponseProto
    StopContainerResponseProto() = (o=new(); fillunset(o); o)
end #type StopContainerResponseProto
hash(v::StopContainerResponseProto) = ProtoBuf.protohash(v)
isequal(v1::StopContainerResponseProto, v2::StopContainerResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StopContainerResponseProto, v2::StopContainerResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetContainerStatusRequestProto
    container_id::ContainerIdProto
    GetContainerStatusRequestProto() = (o=new(); fillunset(o); o)
end #type GetContainerStatusRequestProto
hash(v::GetContainerStatusRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetContainerStatusRequestProto, v2::GetContainerStatusRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContainerStatusRequestProto, v2::GetContainerStatusRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetContainerStatusResponseProto
    status::ContainerStatusProto
    GetContainerStatusResponseProto() = (o=new(); fillunset(o); o)
end #type GetContainerStatusResponseProto
hash(v::GetContainerStatusResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetContainerStatusResponseProto, v2::GetContainerStatusResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContainerStatusResponseProto, v2::GetContainerStatusResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct StartContainersRequestProto
    start_container_request::Array{StartContainerRequestProto,1}
    StartContainersRequestProto() = (o=new(); fillunset(o); o)
end #type StartContainersRequestProto
hash(v::StartContainersRequestProto) = ProtoBuf.protohash(v)
isequal(v1::StartContainersRequestProto, v2::StartContainersRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StartContainersRequestProto, v2::StartContainersRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ContainerExceptionMapProto
    container_id::ContainerIdProto
    exception::SerializedExceptionProto
    ContainerExceptionMapProto() = (o=new(); fillunset(o); o)
end #type ContainerExceptionMapProto
hash(v::ContainerExceptionMapProto) = ProtoBuf.protohash(v)
isequal(v1::ContainerExceptionMapProto, v2::ContainerExceptionMapProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ContainerExceptionMapProto, v2::ContainerExceptionMapProto) = ProtoBuf.protoeq(v1, v2)

mutable struct StartContainersResponseProto
    services_meta_data::Array{StringBytesMapProto,1}
    succeeded_requests::Array{ContainerIdProto,1}
    failed_requests::Array{ContainerExceptionMapProto,1}
    StartContainersResponseProto() = (o=new(); fillunset(o); o)
end #type StartContainersResponseProto
hash(v::StartContainersResponseProto) = ProtoBuf.protohash(v)
isequal(v1::StartContainersResponseProto, v2::StartContainersResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StartContainersResponseProto, v2::StartContainersResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct StopContainersRequestProto
    container_id::Array{ContainerIdProto,1}
    StopContainersRequestProto() = (o=new(); fillunset(o); o)
end #type StopContainersRequestProto
hash(v::StopContainersRequestProto) = ProtoBuf.protohash(v)
isequal(v1::StopContainersRequestProto, v2::StopContainersRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StopContainersRequestProto, v2::StopContainersRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct StopContainersResponseProto
    succeeded_requests::Array{ContainerIdProto,1}
    failed_requests::Array{ContainerExceptionMapProto,1}
    StopContainersResponseProto() = (o=new(); fillunset(o); o)
end #type StopContainersResponseProto
hash(v::StopContainersResponseProto) = ProtoBuf.protohash(v)
isequal(v1::StopContainersResponseProto, v2::StopContainersResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StopContainersResponseProto, v2::StopContainersResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetContainerStatusesRequestProto
    container_id::Array{ContainerIdProto,1}
    GetContainerStatusesRequestProto() = (o=new(); fillunset(o); o)
end #type GetContainerStatusesRequestProto
hash(v::GetContainerStatusesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetContainerStatusesRequestProto, v2::GetContainerStatusesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContainerStatusesRequestProto, v2::GetContainerStatusesRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetContainerStatusesResponseProto
    status::Array{ContainerStatusProto,1}
    failed_requests::Array{ContainerExceptionMapProto,1}
    GetContainerStatusesResponseProto() = (o=new(); fillunset(o); o)
end #type GetContainerStatusesResponseProto
hash(v::GetContainerStatusesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetContainerStatusesResponseProto, v2::GetContainerStatusesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContainerStatusesResponseProto, v2::GetContainerStatusesResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetApplicationAttemptReportRequestProto
    application_attempt_id::ApplicationAttemptIdProto
    GetApplicationAttemptReportRequestProto() = (o=new(); fillunset(o); o)
end #type GetApplicationAttemptReportRequestProto
hash(v::GetApplicationAttemptReportRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetApplicationAttemptReportRequestProto, v2::GetApplicationAttemptReportRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetApplicationAttemptReportRequestProto, v2::GetApplicationAttemptReportRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetApplicationAttemptReportResponseProto
    application_attempt_report::ApplicationAttemptReportProto
    GetApplicationAttemptReportResponseProto() = (o=new(); fillunset(o); o)
end #type GetApplicationAttemptReportResponseProto
hash(v::GetApplicationAttemptReportResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetApplicationAttemptReportResponseProto, v2::GetApplicationAttemptReportResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetApplicationAttemptReportResponseProto, v2::GetApplicationAttemptReportResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetApplicationAttemptsRequestProto
    application_id::ApplicationIdProto
    GetApplicationAttemptsRequestProto() = (o=new(); fillunset(o); o)
end #type GetApplicationAttemptsRequestProto
hash(v::GetApplicationAttemptsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetApplicationAttemptsRequestProto, v2::GetApplicationAttemptsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetApplicationAttemptsRequestProto, v2::GetApplicationAttemptsRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetApplicationAttemptsResponseProto
    application_attempts::Array{ApplicationAttemptReportProto,1}
    GetApplicationAttemptsResponseProto() = (o=new(); fillunset(o); o)
end #type GetApplicationAttemptsResponseProto
hash(v::GetApplicationAttemptsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetApplicationAttemptsResponseProto, v2::GetApplicationAttemptsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetApplicationAttemptsResponseProto, v2::GetApplicationAttemptsResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetContainerReportRequestProto
    container_id::ContainerIdProto
    GetContainerReportRequestProto() = (o=new(); fillunset(o); o)
end #type GetContainerReportRequestProto
hash(v::GetContainerReportRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetContainerReportRequestProto, v2::GetContainerReportRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContainerReportRequestProto, v2::GetContainerReportRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetContainerReportResponseProto
    container_report::ContainerReportProto
    GetContainerReportResponseProto() = (o=new(); fillunset(o); o)
end #type GetContainerReportResponseProto
hash(v::GetContainerReportResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetContainerReportResponseProto, v2::GetContainerReportResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContainerReportResponseProto, v2::GetContainerReportResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetContainersRequestProto
    application_attempt_id::ApplicationAttemptIdProto
    GetContainersRequestProto() = (o=new(); fillunset(o); o)
end #type GetContainersRequestProto
hash(v::GetContainersRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetContainersRequestProto, v2::GetContainersRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContainersRequestProto, v2::GetContainersRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetContainersResponseProto
    containers::Array{ContainerReportProto,1}
    GetContainersResponseProto() = (o=new(); fillunset(o); o)
end #type GetContainersResponseProto
hash(v::GetContainersResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetContainersResponseProto, v2::GetContainersResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContainersResponseProto, v2::GetContainersResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct UseSharedCacheResourceRequestProto
    applicationId::ApplicationIdProto
    resourceKey::AbstractString
    UseSharedCacheResourceRequestProto() = (o=new(); fillunset(o); o)
end #type UseSharedCacheResourceRequestProto
hash(v::UseSharedCacheResourceRequestProto) = ProtoBuf.protohash(v)
isequal(v1::UseSharedCacheResourceRequestProto, v2::UseSharedCacheResourceRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::UseSharedCacheResourceRequestProto, v2::UseSharedCacheResourceRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct UseSharedCacheResourceResponseProto
    path::AbstractString
    UseSharedCacheResourceResponseProto() = (o=new(); fillunset(o); o)
end #type UseSharedCacheResourceResponseProto
hash(v::UseSharedCacheResourceResponseProto) = ProtoBuf.protohash(v)
isequal(v1::UseSharedCacheResourceResponseProto, v2::UseSharedCacheResourceResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::UseSharedCacheResourceResponseProto, v2::UseSharedCacheResourceResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ReleaseSharedCacheResourceRequestProto
    applicationId::ApplicationIdProto
    resourceKey::AbstractString
    ReleaseSharedCacheResourceRequestProto() = (o=new(); fillunset(o); o)
end #type ReleaseSharedCacheResourceRequestProto
hash(v::ReleaseSharedCacheResourceRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ReleaseSharedCacheResourceRequestProto, v2::ReleaseSharedCacheResourceRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReleaseSharedCacheResourceRequestProto, v2::ReleaseSharedCacheResourceRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ReleaseSharedCacheResourceResponseProto
    ReleaseSharedCacheResourceResponseProto() = (o=new(); fillunset(o); o)
end #type ReleaseSharedCacheResourceResponseProto
hash(v::ReleaseSharedCacheResourceResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ReleaseSharedCacheResourceResponseProto, v2::ReleaseSharedCacheResourceResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReleaseSharedCacheResourceResponseProto, v2::ReleaseSharedCacheResourceResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ReservationSubmissionRequestProto
    queue::AbstractString
    reservation_definition::ReservationDefinitionProto
    ReservationSubmissionRequestProto() = (o=new(); fillunset(o); o)
end #type ReservationSubmissionRequestProto
hash(v::ReservationSubmissionRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ReservationSubmissionRequestProto, v2::ReservationSubmissionRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReservationSubmissionRequestProto, v2::ReservationSubmissionRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ReservationSubmissionResponseProto
    reservation_id::ReservationIdProto
    ReservationSubmissionResponseProto() = (o=new(); fillunset(o); o)
end #type ReservationSubmissionResponseProto
hash(v::ReservationSubmissionResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ReservationSubmissionResponseProto, v2::ReservationSubmissionResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReservationSubmissionResponseProto, v2::ReservationSubmissionResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ReservationUpdateRequestProto
    reservation_definition::ReservationDefinitionProto
    reservation_id::ReservationIdProto
    ReservationUpdateRequestProto() = (o=new(); fillunset(o); o)
end #type ReservationUpdateRequestProto
hash(v::ReservationUpdateRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ReservationUpdateRequestProto, v2::ReservationUpdateRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReservationUpdateRequestProto, v2::ReservationUpdateRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ReservationUpdateResponseProto
    ReservationUpdateResponseProto() = (o=new(); fillunset(o); o)
end #type ReservationUpdateResponseProto
hash(v::ReservationUpdateResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ReservationUpdateResponseProto, v2::ReservationUpdateResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReservationUpdateResponseProto, v2::ReservationUpdateResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ReservationDeleteRequestProto
    reservation_id::ReservationIdProto
    ReservationDeleteRequestProto() = (o=new(); fillunset(o); o)
end #type ReservationDeleteRequestProto
hash(v::ReservationDeleteRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ReservationDeleteRequestProto, v2::ReservationDeleteRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReservationDeleteRequestProto, v2::ReservationDeleteRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ReservationDeleteResponseProto
    ReservationDeleteResponseProto() = (o=new(); fillunset(o); o)
end #type ReservationDeleteResponseProto
hash(v::ReservationDeleteResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ReservationDeleteResponseProto, v2::ReservationDeleteResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReservationDeleteResponseProto, v2::ReservationDeleteResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct RunSharedCacheCleanerTaskRequestProto
    RunSharedCacheCleanerTaskRequestProto() = (o=new(); fillunset(o); o)
end #type RunSharedCacheCleanerTaskRequestProto
hash(v::RunSharedCacheCleanerTaskRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RunSharedCacheCleanerTaskRequestProto, v2::RunSharedCacheCleanerTaskRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RunSharedCacheCleanerTaskRequestProto, v2::RunSharedCacheCleanerTaskRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct RunSharedCacheCleanerTaskResponseProto
    accepted::Bool
    RunSharedCacheCleanerTaskResponseProto() = (o=new(); fillunset(o); o)
end #type RunSharedCacheCleanerTaskResponseProto
hash(v::RunSharedCacheCleanerTaskResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RunSharedCacheCleanerTaskResponseProto, v2::RunSharedCacheCleanerTaskResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RunSharedCacheCleanerTaskResponseProto, v2::RunSharedCacheCleanerTaskResponseProto) = ProtoBuf.protoeq(v1, v2)

export SchedulerResourceTypes, ApplicationsRequestScopeProto, RegisterApplicationMasterRequestProto, RegisterApplicationMasterResponseProto, FinishApplicationMasterRequestProto, FinishApplicationMasterResponseProto, AllocateRequestProto, NMTokenProto, AllocateResponseProto, GetNewApplicationRequestProto, GetNewApplicationResponseProto, GetApplicationReportRequestProto, GetApplicationReportResponseProto, SubmitApplicationRequestProto, SubmitApplicationResponseProto, KillApplicationRequestProto, KillApplicationResponseProto, GetClusterMetricsRequestProto, GetClusterMetricsResponseProto, MoveApplicationAcrossQueuesRequestProto, MoveApplicationAcrossQueuesResponseProto, GetApplicationsRequestProto, GetApplicationsResponseProto, GetClusterNodesRequestProto, GetClusterNodesResponseProto, GetQueueInfoRequestProto, GetQueueInfoResponseProto, GetQueueUserAclsInfoRequestProto, GetQueueUserAclsInfoResponseProto, GetNodesToLabelsRequestProto, GetNodesToLabelsResponseProto, GetLabelsToNodesRequestProto, GetLabelsToNodesResponseProto, GetClusterNodeLabelsRequestProto, GetClusterNodeLabelsResponseProto, StartContainerRequestProto, StartContainerResponseProto, StopContainerRequestProto, StopContainerResponseProto, GetContainerStatusRequestProto, GetContainerStatusResponseProto, StartContainersRequestProto, ContainerExceptionMapProto, StartContainersResponseProto, StopContainersRequestProto, StopContainersResponseProto, GetContainerStatusesRequestProto, GetContainerStatusesResponseProto, GetApplicationAttemptReportRequestProto, GetApplicationAttemptReportResponseProto, GetApplicationAttemptsRequestProto, GetApplicationAttemptsResponseProto, GetContainerReportRequestProto, GetContainerReportResponseProto, GetContainersRequestProto, GetContainersResponseProto, UseSharedCacheResourceRequestProto, UseSharedCacheResourceResponseProto, ReleaseSharedCacheResourceRequestProto, ReleaseSharedCacheResourceResponseProto, ReservationSubmissionRequestProto, ReservationSubmissionResponseProto, ReservationUpdateRequestProto, ReservationUpdateResponseProto, ReservationDeleteRequestProto, ReservationDeleteResponseProto, RunSharedCacheCleanerTaskRequestProto, RunSharedCacheCleanerTaskResponseProto
