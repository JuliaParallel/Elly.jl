# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==
using ..common

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
hash(v::RegisterApplicationMasterRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RegisterApplicationMasterRequestProto, v2::RegisterApplicationMasterRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RegisterApplicationMasterRequestProto, v2::RegisterApplicationMasterRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct FinishApplicationMasterRequestProto <: ProtoType
    diagnostics::AbstractString
    tracking_url::AbstractString
    final_application_status::Int32
    FinishApplicationMasterRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FinishApplicationMasterRequestProto
hash(v::FinishApplicationMasterRequestProto) = ProtoBuf.protohash(v)
isequal(v1::FinishApplicationMasterRequestProto, v2::FinishApplicationMasterRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::FinishApplicationMasterRequestProto, v2::FinishApplicationMasterRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct FinishApplicationMasterResponseProto <: ProtoType
    isUnregistered::Bool
    FinishApplicationMasterResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FinishApplicationMasterResponseProto
const __val_FinishApplicationMasterResponseProto = Dict(:isUnregistered => false)
meta(t::Type{FinishApplicationMasterResponseProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_FinishApplicationMasterResponseProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::FinishApplicationMasterResponseProto) = ProtoBuf.protohash(v)
isequal(v1::FinishApplicationMasterResponseProto, v2::FinishApplicationMasterResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::FinishApplicationMasterResponseProto, v2::FinishApplicationMasterResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct AllocateRequestProto <: ProtoType
    ask::Vector{ResourceRequestProto}
    release::Vector{ContainerIdProto}
    blacklist_request::ResourceBlacklistRequestProto
    response_id::Int32
    progress::Float32
    increase_request::Vector{ContainerResourceIncreaseRequestProto}
    AllocateRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AllocateRequestProto
hash(v::AllocateRequestProto) = ProtoBuf.protohash(v)
isequal(v1::AllocateRequestProto, v2::AllocateRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AllocateRequestProto, v2::AllocateRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct NMTokenProto <: ProtoType
    nodeId::NodeIdProto
    token::TokenProto
    NMTokenProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct NMTokenProto
hash(v::NMTokenProto) = ProtoBuf.protohash(v)
isequal(v1::NMTokenProto, v2::NMTokenProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::NMTokenProto, v2::NMTokenProto) = ProtoBuf.protoeq(v1, v2)

mutable struct RegisterApplicationMasterResponseProto <: ProtoType
    maximumCapability::ResourceProto
    client_to_am_token_master_key::Array{UInt8,1}
    application_ACLs::Vector{ApplicationACLMapProto}
    containers_from_previous_attempts::Vector{ContainerProto}
    queue::AbstractString
    nm_tokens_from_previous_attempts::Vector{NMTokenProto}
    scheduler_resource_types::Vector{Int32}
    RegisterApplicationMasterResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RegisterApplicationMasterResponseProto
hash(v::RegisterApplicationMasterResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RegisterApplicationMasterResponseProto, v2::RegisterApplicationMasterResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RegisterApplicationMasterResponseProto, v2::RegisterApplicationMasterResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct AllocateResponseProto <: ProtoType
    a_m_command::Int32
    response_id::Int32
    allocated_containers::Vector{ContainerProto}
    completed_container_statuses::Vector{ContainerStatusProto}
    limit::ResourceProto
    updated_nodes::Vector{NodeReportProto}
    num_cluster_nodes::Int32
    preempt::PreemptionMessageProto
    nm_tokens::Vector{NMTokenProto}
    increased_containers::Vector{ContainerResourceIncreaseProto}
    decreased_containers::Vector{ContainerResourceDecreaseProto}
    am_rm_token::TokenProto
    AllocateResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AllocateResponseProto
hash(v::AllocateResponseProto) = ProtoBuf.protohash(v)
isequal(v1::AllocateResponseProto, v2::AllocateResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::AllocateResponseProto, v2::AllocateResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetNewApplicationRequestProto <: ProtoType
    GetNewApplicationRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetNewApplicationRequestProto
hash(v::GetNewApplicationRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetNewApplicationRequestProto, v2::GetNewApplicationRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetNewApplicationRequestProto, v2::GetNewApplicationRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetNewApplicationResponseProto <: ProtoType
    application_id::ApplicationIdProto
    maximumCapability::ResourceProto
    GetNewApplicationResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetNewApplicationResponseProto
hash(v::GetNewApplicationResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetNewApplicationResponseProto, v2::GetNewApplicationResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetNewApplicationResponseProto, v2::GetNewApplicationResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetApplicationReportRequestProto <: ProtoType
    application_id::ApplicationIdProto
    GetApplicationReportRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetApplicationReportRequestProto
hash(v::GetApplicationReportRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetApplicationReportRequestProto, v2::GetApplicationReportRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetApplicationReportRequestProto, v2::GetApplicationReportRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetApplicationReportResponseProto <: ProtoType
    application_report::ApplicationReportProto
    GetApplicationReportResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetApplicationReportResponseProto
hash(v::GetApplicationReportResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetApplicationReportResponseProto, v2::GetApplicationReportResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetApplicationReportResponseProto, v2::GetApplicationReportResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct SubmitApplicationRequestProto <: ProtoType
    application_submission_context::ApplicationSubmissionContextProto
    SubmitApplicationRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SubmitApplicationRequestProto
hash(v::SubmitApplicationRequestProto) = ProtoBuf.protohash(v)
isequal(v1::SubmitApplicationRequestProto, v2::SubmitApplicationRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SubmitApplicationRequestProto, v2::SubmitApplicationRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct SubmitApplicationResponseProto <: ProtoType
    SubmitApplicationResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SubmitApplicationResponseProto
hash(v::SubmitApplicationResponseProto) = ProtoBuf.protohash(v)
isequal(v1::SubmitApplicationResponseProto, v2::SubmitApplicationResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SubmitApplicationResponseProto, v2::SubmitApplicationResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct KillApplicationRequestProto <: ProtoType
    application_id::ApplicationIdProto
    KillApplicationRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct KillApplicationRequestProto
hash(v::KillApplicationRequestProto) = ProtoBuf.protohash(v)
isequal(v1::KillApplicationRequestProto, v2::KillApplicationRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::KillApplicationRequestProto, v2::KillApplicationRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct KillApplicationResponseProto <: ProtoType
    is_kill_completed::Bool
    KillApplicationResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct KillApplicationResponseProto
const __val_KillApplicationResponseProto = Dict(:is_kill_completed => false)
meta(t::Type{KillApplicationResponseProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_KillApplicationResponseProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::KillApplicationResponseProto) = ProtoBuf.protohash(v)
isequal(v1::KillApplicationResponseProto, v2::KillApplicationResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::KillApplicationResponseProto, v2::KillApplicationResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetClusterMetricsRequestProto <: ProtoType
    GetClusterMetricsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetClusterMetricsRequestProto
hash(v::GetClusterMetricsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetClusterMetricsRequestProto, v2::GetClusterMetricsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetClusterMetricsRequestProto, v2::GetClusterMetricsRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetClusterMetricsResponseProto <: ProtoType
    cluster_metrics::YarnClusterMetricsProto
    GetClusterMetricsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetClusterMetricsResponseProto
hash(v::GetClusterMetricsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetClusterMetricsResponseProto, v2::GetClusterMetricsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetClusterMetricsResponseProto, v2::GetClusterMetricsResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct MoveApplicationAcrossQueuesRequestProto <: ProtoType
    application_id::ApplicationIdProto
    target_queue::AbstractString
    MoveApplicationAcrossQueuesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MoveApplicationAcrossQueuesRequestProto
const __req_MoveApplicationAcrossQueuesRequestProto = Symbol[:application_id,:target_queue]
meta(t::Type{MoveApplicationAcrossQueuesRequestProto}) = meta(t, __req_MoveApplicationAcrossQueuesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::MoveApplicationAcrossQueuesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::MoveApplicationAcrossQueuesRequestProto, v2::MoveApplicationAcrossQueuesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::MoveApplicationAcrossQueuesRequestProto, v2::MoveApplicationAcrossQueuesRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct MoveApplicationAcrossQueuesResponseProto <: ProtoType
    MoveApplicationAcrossQueuesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct MoveApplicationAcrossQueuesResponseProto
hash(v::MoveApplicationAcrossQueuesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::MoveApplicationAcrossQueuesResponseProto, v2::MoveApplicationAcrossQueuesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::MoveApplicationAcrossQueuesResponseProto, v2::MoveApplicationAcrossQueuesResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetApplicationsRequestProto <: ProtoType
    application_types::Vector{AbstractString}
    application_states::Vector{Int32}
    users::Vector{AbstractString}
    queues::Vector{AbstractString}
    limit::Int64
    start_begin::Int64
    start_end::Int64
    finish_begin::Int64
    finish_end::Int64
    applicationTags::Vector{AbstractString}
    scope::Int32
    GetApplicationsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetApplicationsRequestProto
const __val_GetApplicationsRequestProto = Dict(:scope => ApplicationsRequestScopeProto.ALL)
meta(t::Type{GetApplicationsRequestProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_GetApplicationsRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::GetApplicationsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetApplicationsRequestProto, v2::GetApplicationsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetApplicationsRequestProto, v2::GetApplicationsRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetApplicationsResponseProto <: ProtoType
    applications::Vector{ApplicationReportProto}
    GetApplicationsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetApplicationsResponseProto
hash(v::GetApplicationsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetApplicationsResponseProto, v2::GetApplicationsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetApplicationsResponseProto, v2::GetApplicationsResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetClusterNodesRequestProto <: ProtoType
    nodeStates::Vector{Int32}
    GetClusterNodesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetClusterNodesRequestProto
hash(v::GetClusterNodesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetClusterNodesRequestProto, v2::GetClusterNodesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetClusterNodesRequestProto, v2::GetClusterNodesRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetClusterNodesResponseProto <: ProtoType
    nodeReports::Vector{NodeReportProto}
    GetClusterNodesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetClusterNodesResponseProto
hash(v::GetClusterNodesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetClusterNodesResponseProto, v2::GetClusterNodesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetClusterNodesResponseProto, v2::GetClusterNodesResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetQueueInfoRequestProto <: ProtoType
    queueName::AbstractString
    includeApplications::Bool
    includeChildQueues::Bool
    recursive::Bool
    GetQueueInfoRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetQueueInfoRequestProto
hash(v::GetQueueInfoRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetQueueInfoRequestProto, v2::GetQueueInfoRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetQueueInfoRequestProto, v2::GetQueueInfoRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetQueueInfoResponseProto <: ProtoType
    queueInfo::QueueInfoProto
    GetQueueInfoResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetQueueInfoResponseProto
hash(v::GetQueueInfoResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetQueueInfoResponseProto, v2::GetQueueInfoResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetQueueInfoResponseProto, v2::GetQueueInfoResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetQueueUserAclsInfoRequestProto <: ProtoType
    GetQueueUserAclsInfoRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetQueueUserAclsInfoRequestProto
hash(v::GetQueueUserAclsInfoRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetQueueUserAclsInfoRequestProto, v2::GetQueueUserAclsInfoRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetQueueUserAclsInfoRequestProto, v2::GetQueueUserAclsInfoRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetQueueUserAclsInfoResponseProto <: ProtoType
    queueUserAcls::Vector{QueueUserACLInfoProto}
    GetQueueUserAclsInfoResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetQueueUserAclsInfoResponseProto
hash(v::GetQueueUserAclsInfoResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetQueueUserAclsInfoResponseProto, v2::GetQueueUserAclsInfoResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetQueueUserAclsInfoResponseProto, v2::GetQueueUserAclsInfoResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetNodesToLabelsRequestProto <: ProtoType
    GetNodesToLabelsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetNodesToLabelsRequestProto
hash(v::GetNodesToLabelsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetNodesToLabelsRequestProto, v2::GetNodesToLabelsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetNodesToLabelsRequestProto, v2::GetNodesToLabelsRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetNodesToLabelsResponseProto <: ProtoType
    nodeToLabels::Vector{NodeIdToLabelsProto}
    GetNodesToLabelsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetNodesToLabelsResponseProto
hash(v::GetNodesToLabelsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetNodesToLabelsResponseProto, v2::GetNodesToLabelsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetNodesToLabelsResponseProto, v2::GetNodesToLabelsResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetLabelsToNodesRequestProto <: ProtoType
    nodeLabels::Vector{AbstractString}
    GetLabelsToNodesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetLabelsToNodesRequestProto
hash(v::GetLabelsToNodesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetLabelsToNodesRequestProto, v2::GetLabelsToNodesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetLabelsToNodesRequestProto, v2::GetLabelsToNodesRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetLabelsToNodesResponseProto <: ProtoType
    labelsToNodes::Vector{LabelsToNodeIdsProto}
    GetLabelsToNodesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetLabelsToNodesResponseProto
hash(v::GetLabelsToNodesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetLabelsToNodesResponseProto, v2::GetLabelsToNodesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetLabelsToNodesResponseProto, v2::GetLabelsToNodesResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetClusterNodeLabelsRequestProto <: ProtoType
    GetClusterNodeLabelsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetClusterNodeLabelsRequestProto
hash(v::GetClusterNodeLabelsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetClusterNodeLabelsRequestProto, v2::GetClusterNodeLabelsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetClusterNodeLabelsRequestProto, v2::GetClusterNodeLabelsRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetClusterNodeLabelsResponseProto <: ProtoType
    nodeLabels::Vector{AbstractString}
    GetClusterNodeLabelsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetClusterNodeLabelsResponseProto
hash(v::GetClusterNodeLabelsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetClusterNodeLabelsResponseProto, v2::GetClusterNodeLabelsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetClusterNodeLabelsResponseProto, v2::GetClusterNodeLabelsResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct StartContainerRequestProto <: ProtoType
    container_launch_context::ContainerLaunchContextProto
    container_token::TokenProto
    StartContainerRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StartContainerRequestProto
hash(v::StartContainerRequestProto) = ProtoBuf.protohash(v)
isequal(v1::StartContainerRequestProto, v2::StartContainerRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StartContainerRequestProto, v2::StartContainerRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct StartContainerResponseProto <: ProtoType
    services_meta_data::Vector{StringBytesMapProto}
    StartContainerResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StartContainerResponseProto
hash(v::StartContainerResponseProto) = ProtoBuf.protohash(v)
isequal(v1::StartContainerResponseProto, v2::StartContainerResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StartContainerResponseProto, v2::StartContainerResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct StopContainerRequestProto <: ProtoType
    container_id::ContainerIdProto
    StopContainerRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StopContainerRequestProto
hash(v::StopContainerRequestProto) = ProtoBuf.protohash(v)
isequal(v1::StopContainerRequestProto, v2::StopContainerRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StopContainerRequestProto, v2::StopContainerRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct StopContainerResponseProto <: ProtoType
    StopContainerResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StopContainerResponseProto
hash(v::StopContainerResponseProto) = ProtoBuf.protohash(v)
isequal(v1::StopContainerResponseProto, v2::StopContainerResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StopContainerResponseProto, v2::StopContainerResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetContainerStatusRequestProto <: ProtoType
    container_id::ContainerIdProto
    GetContainerStatusRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContainerStatusRequestProto
hash(v::GetContainerStatusRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetContainerStatusRequestProto, v2::GetContainerStatusRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContainerStatusRequestProto, v2::GetContainerStatusRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetContainerStatusResponseProto <: ProtoType
    status::ContainerStatusProto
    GetContainerStatusResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContainerStatusResponseProto
hash(v::GetContainerStatusResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetContainerStatusResponseProto, v2::GetContainerStatusResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContainerStatusResponseProto, v2::GetContainerStatusResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct StartContainersRequestProto <: ProtoType
    start_container_request::Vector{StartContainerRequestProto}
    StartContainersRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StartContainersRequestProto
hash(v::StartContainersRequestProto) = ProtoBuf.protohash(v)
isequal(v1::StartContainersRequestProto, v2::StartContainersRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StartContainersRequestProto, v2::StartContainersRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ContainerExceptionMapProto <: ProtoType
    container_id::ContainerIdProto
    exception::SerializedExceptionProto
    ContainerExceptionMapProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ContainerExceptionMapProto
hash(v::ContainerExceptionMapProto) = ProtoBuf.protohash(v)
isequal(v1::ContainerExceptionMapProto, v2::ContainerExceptionMapProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ContainerExceptionMapProto, v2::ContainerExceptionMapProto) = ProtoBuf.protoeq(v1, v2)

mutable struct StartContainersResponseProto <: ProtoType
    services_meta_data::Vector{StringBytesMapProto}
    succeeded_requests::Vector{ContainerIdProto}
    failed_requests::Vector{ContainerExceptionMapProto}
    StartContainersResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StartContainersResponseProto
hash(v::StartContainersResponseProto) = ProtoBuf.protohash(v)
isequal(v1::StartContainersResponseProto, v2::StartContainersResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StartContainersResponseProto, v2::StartContainersResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct StopContainersRequestProto <: ProtoType
    container_id::Vector{ContainerIdProto}
    StopContainersRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StopContainersRequestProto
hash(v::StopContainersRequestProto) = ProtoBuf.protohash(v)
isequal(v1::StopContainersRequestProto, v2::StopContainersRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StopContainersRequestProto, v2::StopContainersRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct StopContainersResponseProto <: ProtoType
    succeeded_requests::Vector{ContainerIdProto}
    failed_requests::Vector{ContainerExceptionMapProto}
    StopContainersResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StopContainersResponseProto
hash(v::StopContainersResponseProto) = ProtoBuf.protohash(v)
isequal(v1::StopContainersResponseProto, v2::StopContainersResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::StopContainersResponseProto, v2::StopContainersResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetContainerStatusesRequestProto <: ProtoType
    container_id::Vector{ContainerIdProto}
    GetContainerStatusesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContainerStatusesRequestProto
hash(v::GetContainerStatusesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetContainerStatusesRequestProto, v2::GetContainerStatusesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContainerStatusesRequestProto, v2::GetContainerStatusesRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetContainerStatusesResponseProto <: ProtoType
    status::Vector{ContainerStatusProto}
    failed_requests::Vector{ContainerExceptionMapProto}
    GetContainerStatusesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContainerStatusesResponseProto
hash(v::GetContainerStatusesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetContainerStatusesResponseProto, v2::GetContainerStatusesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContainerStatusesResponseProto, v2::GetContainerStatusesResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetApplicationAttemptReportRequestProto <: ProtoType
    application_attempt_id::ApplicationAttemptIdProto
    GetApplicationAttemptReportRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetApplicationAttemptReportRequestProto
hash(v::GetApplicationAttemptReportRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetApplicationAttemptReportRequestProto, v2::GetApplicationAttemptReportRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetApplicationAttemptReportRequestProto, v2::GetApplicationAttemptReportRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetApplicationAttemptReportResponseProto <: ProtoType
    application_attempt_report::ApplicationAttemptReportProto
    GetApplicationAttemptReportResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetApplicationAttemptReportResponseProto
hash(v::GetApplicationAttemptReportResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetApplicationAttemptReportResponseProto, v2::GetApplicationAttemptReportResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetApplicationAttemptReportResponseProto, v2::GetApplicationAttemptReportResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetApplicationAttemptsRequestProto <: ProtoType
    application_id::ApplicationIdProto
    GetApplicationAttemptsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetApplicationAttemptsRequestProto
hash(v::GetApplicationAttemptsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetApplicationAttemptsRequestProto, v2::GetApplicationAttemptsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetApplicationAttemptsRequestProto, v2::GetApplicationAttemptsRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetApplicationAttemptsResponseProto <: ProtoType
    application_attempts::Vector{ApplicationAttemptReportProto}
    GetApplicationAttemptsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetApplicationAttemptsResponseProto
hash(v::GetApplicationAttemptsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetApplicationAttemptsResponseProto, v2::GetApplicationAttemptsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetApplicationAttemptsResponseProto, v2::GetApplicationAttemptsResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetContainerReportRequestProto <: ProtoType
    container_id::ContainerIdProto
    GetContainerReportRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContainerReportRequestProto
hash(v::GetContainerReportRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetContainerReportRequestProto, v2::GetContainerReportRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContainerReportRequestProto, v2::GetContainerReportRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetContainerReportResponseProto <: ProtoType
    container_report::ContainerReportProto
    GetContainerReportResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContainerReportResponseProto
hash(v::GetContainerReportResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetContainerReportResponseProto, v2::GetContainerReportResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContainerReportResponseProto, v2::GetContainerReportResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetContainersRequestProto <: ProtoType
    application_attempt_id::ApplicationAttemptIdProto
    GetContainersRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContainersRequestProto
hash(v::GetContainersRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetContainersRequestProto, v2::GetContainersRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContainersRequestProto, v2::GetContainersRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetContainersResponseProto <: ProtoType
    containers::Vector{ContainerReportProto}
    GetContainersResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetContainersResponseProto
hash(v::GetContainersResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetContainersResponseProto, v2::GetContainersResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetContainersResponseProto, v2::GetContainersResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct UseSharedCacheResourceRequestProto <: ProtoType
    applicationId::ApplicationIdProto
    resourceKey::AbstractString
    UseSharedCacheResourceRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UseSharedCacheResourceRequestProto
hash(v::UseSharedCacheResourceRequestProto) = ProtoBuf.protohash(v)
isequal(v1::UseSharedCacheResourceRequestProto, v2::UseSharedCacheResourceRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::UseSharedCacheResourceRequestProto, v2::UseSharedCacheResourceRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct UseSharedCacheResourceResponseProto <: ProtoType
    path::AbstractString
    UseSharedCacheResourceResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UseSharedCacheResourceResponseProto
hash(v::UseSharedCacheResourceResponseProto) = ProtoBuf.protohash(v)
isequal(v1::UseSharedCacheResourceResponseProto, v2::UseSharedCacheResourceResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::UseSharedCacheResourceResponseProto, v2::UseSharedCacheResourceResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ReleaseSharedCacheResourceRequestProto <: ProtoType
    applicationId::ApplicationIdProto
    resourceKey::AbstractString
    ReleaseSharedCacheResourceRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReleaseSharedCacheResourceRequestProto
hash(v::ReleaseSharedCacheResourceRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ReleaseSharedCacheResourceRequestProto, v2::ReleaseSharedCacheResourceRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReleaseSharedCacheResourceRequestProto, v2::ReleaseSharedCacheResourceRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ReleaseSharedCacheResourceResponseProto <: ProtoType
    ReleaseSharedCacheResourceResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReleaseSharedCacheResourceResponseProto
hash(v::ReleaseSharedCacheResourceResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ReleaseSharedCacheResourceResponseProto, v2::ReleaseSharedCacheResourceResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReleaseSharedCacheResourceResponseProto, v2::ReleaseSharedCacheResourceResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ReservationSubmissionRequestProto <: ProtoType
    queue::AbstractString
    reservation_definition::ReservationDefinitionProto
    ReservationSubmissionRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationSubmissionRequestProto
hash(v::ReservationSubmissionRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ReservationSubmissionRequestProto, v2::ReservationSubmissionRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReservationSubmissionRequestProto, v2::ReservationSubmissionRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ReservationSubmissionResponseProto <: ProtoType
    reservation_id::ReservationIdProto
    ReservationSubmissionResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationSubmissionResponseProto
hash(v::ReservationSubmissionResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ReservationSubmissionResponseProto, v2::ReservationSubmissionResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReservationSubmissionResponseProto, v2::ReservationSubmissionResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ReservationUpdateRequestProto <: ProtoType
    reservation_definition::ReservationDefinitionProto
    reservation_id::ReservationIdProto
    ReservationUpdateRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationUpdateRequestProto
hash(v::ReservationUpdateRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ReservationUpdateRequestProto, v2::ReservationUpdateRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReservationUpdateRequestProto, v2::ReservationUpdateRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ReservationUpdateResponseProto <: ProtoType
    ReservationUpdateResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationUpdateResponseProto
hash(v::ReservationUpdateResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ReservationUpdateResponseProto, v2::ReservationUpdateResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReservationUpdateResponseProto, v2::ReservationUpdateResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ReservationDeleteRequestProto <: ProtoType
    reservation_id::ReservationIdProto
    ReservationDeleteRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationDeleteRequestProto
hash(v::ReservationDeleteRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ReservationDeleteRequestProto, v2::ReservationDeleteRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReservationDeleteRequestProto, v2::ReservationDeleteRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ReservationDeleteResponseProto <: ProtoType
    ReservationDeleteResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationDeleteResponseProto
hash(v::ReservationDeleteResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ReservationDeleteResponseProto, v2::ReservationDeleteResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ReservationDeleteResponseProto, v2::ReservationDeleteResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct RunSharedCacheCleanerTaskRequestProto <: ProtoType
    RunSharedCacheCleanerTaskRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RunSharedCacheCleanerTaskRequestProto
hash(v::RunSharedCacheCleanerTaskRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RunSharedCacheCleanerTaskRequestProto, v2::RunSharedCacheCleanerTaskRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RunSharedCacheCleanerTaskRequestProto, v2::RunSharedCacheCleanerTaskRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct RunSharedCacheCleanerTaskResponseProto <: ProtoType
    accepted::Bool
    RunSharedCacheCleanerTaskResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RunSharedCacheCleanerTaskResponseProto
hash(v::RunSharedCacheCleanerTaskResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RunSharedCacheCleanerTaskResponseProto, v2::RunSharedCacheCleanerTaskResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RunSharedCacheCleanerTaskResponseProto, v2::RunSharedCacheCleanerTaskResponseProto) = ProtoBuf.protoeq(v1, v2)

export SchedulerResourceTypes, ApplicationsRequestScopeProto, RegisterApplicationMasterRequestProto, RegisterApplicationMasterResponseProto, FinishApplicationMasterRequestProto, FinishApplicationMasterResponseProto, AllocateRequestProto, NMTokenProto, AllocateResponseProto, GetNewApplicationRequestProto, GetNewApplicationResponseProto, GetApplicationReportRequestProto, GetApplicationReportResponseProto, SubmitApplicationRequestProto, SubmitApplicationResponseProto, KillApplicationRequestProto, KillApplicationResponseProto, GetClusterMetricsRequestProto, GetClusterMetricsResponseProto, MoveApplicationAcrossQueuesRequestProto, MoveApplicationAcrossQueuesResponseProto, GetApplicationsRequestProto, GetApplicationsResponseProto, GetClusterNodesRequestProto, GetClusterNodesResponseProto, GetQueueInfoRequestProto, GetQueueInfoResponseProto, GetQueueUserAclsInfoRequestProto, GetQueueUserAclsInfoResponseProto, GetNodesToLabelsRequestProto, GetNodesToLabelsResponseProto, GetLabelsToNodesRequestProto, GetLabelsToNodesResponseProto, GetClusterNodeLabelsRequestProto, GetClusterNodeLabelsResponseProto, StartContainerRequestProto, StartContainerResponseProto, StopContainerRequestProto, StopContainerResponseProto, GetContainerStatusRequestProto, GetContainerStatusResponseProto, StartContainersRequestProto, ContainerExceptionMapProto, StartContainersResponseProto, StopContainersRequestProto, StopContainersResponseProto, GetContainerStatusesRequestProto, GetContainerStatusesResponseProto, GetApplicationAttemptReportRequestProto, GetApplicationAttemptReportResponseProto, GetApplicationAttemptsRequestProto, GetApplicationAttemptsResponseProto, GetContainerReportRequestProto, GetContainerReportResponseProto, GetContainersRequestProto, GetContainersResponseProto, UseSharedCacheResourceRequestProto, UseSharedCacheResourceResponseProto, ReleaseSharedCacheResourceRequestProto, ReleaseSharedCacheResourceResponseProto, ReservationSubmissionRequestProto, ReservationSubmissionResponseProto, ReservationUpdateRequestProto, ReservationUpdateResponseProto, ReservationDeleteRequestProto, ReservationDeleteResponseProto, RunSharedCacheCleanerTaskRequestProto, RunSharedCacheCleanerTaskResponseProto
