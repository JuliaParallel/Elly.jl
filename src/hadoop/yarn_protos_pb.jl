# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta
import ..hadoop

struct __enum_ContainerStateProto <: ProtoEnum
    C_NEW::Int32
    C_RUNNING::Int32
    C_COMPLETE::Int32
    __enum_ContainerStateProto() = new(1,2,3)
end #struct __enum_ContainerStateProto
const ContainerStateProto = __enum_ContainerStateProto()

struct __enum_YarnApplicationStateProto <: ProtoEnum
    NEW::Int32
    NEW_SAVING::Int32
    SUBMITTED::Int32
    ACCEPTED::Int32
    RUNNING::Int32
    FINISHED::Int32
    FAILED::Int32
    KILLED::Int32
    __enum_YarnApplicationStateProto() = new(1,2,3,4,5,6,7,8)
end #struct __enum_YarnApplicationStateProto
const YarnApplicationStateProto = __enum_YarnApplicationStateProto()

struct __enum_YarnApplicationAttemptStateProto <: ProtoEnum
    APP_ATTEMPT_NEW::Int32
    APP_ATTEMPT_SUBMITTED::Int32
    APP_ATTEMPT_SCHEDULED::Int32
    APP_ATTEMPT_ALLOCATED_SAVING::Int32
    APP_ATTEMPT_ALLOCATED::Int32
    APP_ATTEMPT_LAUNCHED::Int32
    APP_ATTEMPT_FAILED::Int32
    APP_ATTEMPT_RUNNING::Int32
    APP_ATTEMPT_FINISHING::Int32
    APP_ATTEMPT_FINISHED::Int32
    APP_ATTEMPT_KILLED::Int32
    __enum_YarnApplicationAttemptStateProto() = new(1,2,3,4,5,6,7,8,9,10,11)
end #struct __enum_YarnApplicationAttemptStateProto
const YarnApplicationAttemptStateProto = __enum_YarnApplicationAttemptStateProto()

struct __enum_FinalApplicationStatusProto <: ProtoEnum
    APP_UNDEFINED::Int32
    APP_SUCCEEDED::Int32
    APP_FAILED::Int32
    APP_KILLED::Int32
    __enum_FinalApplicationStatusProto() = new(0,1,2,3)
end #struct __enum_FinalApplicationStatusProto
const FinalApplicationStatusProto = __enum_FinalApplicationStatusProto()

struct __enum_LocalResourceVisibilityProto <: ProtoEnum
    PUBLIC::Int32
    PRIVATE::Int32
    APPLICATION::Int32
    __enum_LocalResourceVisibilityProto() = new(1,2,3)
end #struct __enum_LocalResourceVisibilityProto
const LocalResourceVisibilityProto = __enum_LocalResourceVisibilityProto()

struct __enum_LocalResourceTypeProto <: ProtoEnum
    ARCHIVE::Int32
    FILE::Int32
    PATTERN::Int32
    __enum_LocalResourceTypeProto() = new(1,2,3)
end #struct __enum_LocalResourceTypeProto
const LocalResourceTypeProto = __enum_LocalResourceTypeProto()

struct __enum_NodeStateProto <: ProtoEnum
    NS_NEW::Int32
    NS_RUNNING::Int32
    NS_UNHEALTHY::Int32
    NS_DECOMMISSIONED::Int32
    NS_LOST::Int32
    NS_REBOOTED::Int32
    __enum_NodeStateProto() = new(1,2,3,4,5,6)
end #struct __enum_NodeStateProto
const NodeStateProto = __enum_NodeStateProto()

struct __enum_AMCommandProto <: ProtoEnum
    AM_RESYNC::Int32
    AM_SHUTDOWN::Int32
    __enum_AMCommandProto() = new(1,2)
end #struct __enum_AMCommandProto
const AMCommandProto = __enum_AMCommandProto()

struct __enum_ApplicationAccessTypeProto <: ProtoEnum
    APPACCESS_VIEW_APP::Int32
    APPACCESS_MODIFY_APP::Int32
    __enum_ApplicationAccessTypeProto() = new(1,2)
end #struct __enum_ApplicationAccessTypeProto
const ApplicationAccessTypeProto = __enum_ApplicationAccessTypeProto()

struct __enum_QueueStateProto <: ProtoEnum
    Q_STOPPED::Int32
    Q_RUNNING::Int32
    __enum_QueueStateProto() = new(1,2)
end #struct __enum_QueueStateProto
const QueueStateProto = __enum_QueueStateProto()

struct __enum_QueueACLProto <: ProtoEnum
    QACL_SUBMIT_APPLICATIONS::Int32
    QACL_ADMINISTER_QUEUE::Int32
    __enum_QueueACLProto() = new(1,2)
end #struct __enum_QueueACLProto
const QueueACLProto = __enum_QueueACLProto()

struct __enum_ReservationRequestInterpreterProto <: ProtoEnum
    R_ANY::Int32
    R_ALL::Int32
    R_ORDER::Int32
    R_ORDER_NO_GAP::Int32
    __enum_ReservationRequestInterpreterProto() = new(0,1,2,3)
end #struct __enum_ReservationRequestInterpreterProto
const ReservationRequestInterpreterProto = __enum_ReservationRequestInterpreterProto()

struct __enum_ContainerExitStatusProto <: ProtoEnum
    SUCCESS::Int32
    INVALID::Int32
    ABORTED::Int32
    DISKS_FAILED::Int32
    __enum_ContainerExitStatusProto() = new(0,-1000,-100,-101)
end #struct __enum_ContainerExitStatusProto
const ContainerExitStatusProto = __enum_ContainerExitStatusProto()

mutable struct SerializedExceptionProto <: ProtoType
    message::AbstractString
    trace::AbstractString
    class_name::AbstractString
    cause::SerializedExceptionProto
    SerializedExceptionProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SerializedExceptionProto

mutable struct ApplicationIdProto <: ProtoType
    id::Int32
    cluster_timestamp::Int64
    ApplicationIdProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ApplicationIdProto

mutable struct ApplicationAttemptIdProto <: ProtoType
    application_id::ApplicationIdProto
    attemptId::Int32
    ApplicationAttemptIdProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ApplicationAttemptIdProto

mutable struct ContainerIdProto <: ProtoType
    app_id::ApplicationIdProto
    app_attempt_id::ApplicationAttemptIdProto
    id::Int64
    ContainerIdProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ContainerIdProto

mutable struct ResourceProto <: ProtoType
    memory::Int32
    virtual_cores::Int32
    ResourceProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ResourceProto

mutable struct ResourceOptionProto <: ProtoType
    resource::ResourceProto
    over_commit_timeout::Int32
    ResourceOptionProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ResourceOptionProto

mutable struct PriorityProto <: ProtoType
    priority::Int32
    PriorityProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct PriorityProto

mutable struct URLProto <: ProtoType
    scheme::AbstractString
    host::AbstractString
    port::Int32
    file::AbstractString
    userInfo::AbstractString
    URLProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct URLProto

mutable struct LocalResourceProto <: ProtoType
    resource::URLProto
    size::Int64
    timestamp::Int64
    _type::Int32
    visibility::Int32
    pattern::AbstractString
    should_be_uploaded_to_shared_cache::Bool
    LocalResourceProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct LocalResourceProto

mutable struct ApplicationResourceUsageReportProto <: ProtoType
    num_used_containers::Int32
    num_reserved_containers::Int32
    used_resources::ResourceProto
    reserved_resources::ResourceProto
    needed_resources::ResourceProto
    memory_seconds::Int64
    vcore_seconds::Int64
    ApplicationResourceUsageReportProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ApplicationResourceUsageReportProto

mutable struct ApplicationReportProto <: ProtoType
    applicationId::ApplicationIdProto
    user::AbstractString
    queue::AbstractString
    name::AbstractString
    host::AbstractString
    rpc_port::Int32
    client_to_am_token::hadoop.common.TokenProto
    yarn_application_state::Int32
    trackingUrl::AbstractString
    diagnostics::AbstractString
    startTime::Int64
    finishTime::Int64
    final_application_status::Int32
    app_resource_Usage::ApplicationResourceUsageReportProto
    originalTrackingUrl::AbstractString
    currentApplicationAttemptId::ApplicationAttemptIdProto
    progress::Float32
    applicationType::AbstractString
    am_rm_token::hadoop.common.TokenProto
    applicationTags::Base.Vector{AbstractString}
    ApplicationReportProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ApplicationReportProto
const __val_ApplicationReportProto = Dict(:diagnostics => "N/A")
meta(t::Type{ApplicationReportProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ApplicationReportProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ApplicationAttemptReportProto <: ProtoType
    application_attempt_id::ApplicationAttemptIdProto
    host::AbstractString
    rpc_port::Int32
    tracking_url::AbstractString
    diagnostics::AbstractString
    yarn_application_attempt_state::Int32
    am_container_id::ContainerIdProto
    original_tracking_url::AbstractString
    ApplicationAttemptReportProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ApplicationAttemptReportProto
const __val_ApplicationAttemptReportProto = Dict(:diagnostics => "N/A")
meta(t::Type{ApplicationAttemptReportProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ApplicationAttemptReportProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct NodeIdProto <: ProtoType
    host::AbstractString
    port::Int32
    NodeIdProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct NodeIdProto

mutable struct NodeResourceMapProto <: ProtoType
    node_id::NodeIdProto
    resource_option::ResourceOptionProto
    NodeResourceMapProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct NodeResourceMapProto

mutable struct ContainerReportProto <: ProtoType
    container_id::ContainerIdProto
    resource::ResourceProto
    node_id::NodeIdProto
    priority::PriorityProto
    creation_time::Int64
    finish_time::Int64
    diagnostics_info::AbstractString
    log_url::AbstractString
    container_exit_status::Int32
    container_state::Int32
    node_http_address::AbstractString
    ContainerReportProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ContainerReportProto
const __val_ContainerReportProto = Dict(:diagnostics_info => "N/A")
meta(t::Type{ContainerReportProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ContainerReportProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ContainerProto <: ProtoType
    id::ContainerIdProto
    nodeId::NodeIdProto
    node_http_address::AbstractString
    resource::ResourceProto
    priority::PriorityProto
    container_token::hadoop.common.TokenProto
    ContainerProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ContainerProto

mutable struct NodeReportProto <: ProtoType
    nodeId::NodeIdProto
    httpAddress::AbstractString
    rackName::AbstractString
    used::ResourceProto
    capability::ResourceProto
    numContainers::Int32
    node_state::Int32
    health_report::AbstractString
    last_health_report_time::Int64
    node_labels::Base.Vector{AbstractString}
    NodeReportProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct NodeReportProto

mutable struct NodeIdToLabelsProto <: ProtoType
    nodeId::NodeIdProto
    nodeLabels::Base.Vector{AbstractString}
    NodeIdToLabelsProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct NodeIdToLabelsProto

mutable struct LabelsToNodeIdsProto <: ProtoType
    nodeLabels::AbstractString
    nodeId::Base.Vector{NodeIdProto}
    LabelsToNodeIdsProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct LabelsToNodeIdsProto

mutable struct ResourceRequestProto <: ProtoType
    priority::PriorityProto
    resource_name::AbstractString
    capability::ResourceProto
    num_containers::Int32
    relax_locality::Bool
    node_label_expression::AbstractString
    ResourceRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ResourceRequestProto
const __val_ResourceRequestProto = Dict(:relax_locality => true)
meta(t::Type{ResourceRequestProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ResourceRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct PreemptionContainerProto <: ProtoType
    id::ContainerIdProto
    PreemptionContainerProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct PreemptionContainerProto

mutable struct StrictPreemptionContractProto <: ProtoType
    container::Base.Vector{PreemptionContainerProto}
    StrictPreemptionContractProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StrictPreemptionContractProto

mutable struct PreemptionResourceRequestProto <: ProtoType
    resource::ResourceRequestProto
    PreemptionResourceRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct PreemptionResourceRequestProto

mutable struct PreemptionContractProto <: ProtoType
    resource::Base.Vector{PreemptionResourceRequestProto}
    container::Base.Vector{PreemptionContainerProto}
    PreemptionContractProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct PreemptionContractProto

mutable struct PreemptionMessageProto <: ProtoType
    strictContract::StrictPreemptionContractProto
    contract::PreemptionContractProto
    PreemptionMessageProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct PreemptionMessageProto

mutable struct ResourceBlacklistRequestProto <: ProtoType
    blacklist_additions::Base.Vector{AbstractString}
    blacklist_removals::Base.Vector{AbstractString}
    ResourceBlacklistRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ResourceBlacklistRequestProto

mutable struct LogAggregationContextProto <: ProtoType
    include_pattern::AbstractString
    exclude_pattern::AbstractString
    rolled_logs_include_pattern::AbstractString
    rolled_logs_exclude_pattern::AbstractString
    LogAggregationContextProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct LogAggregationContextProto
const __val_LogAggregationContextProto = Dict(:include_pattern => ".*", :rolled_logs_exclude_pattern => ".*")
meta(t::Type{LogAggregationContextProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_LogAggregationContextProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ApplicationACLMapProto <: ProtoType
    accessType::Int32
    acl::AbstractString
    ApplicationACLMapProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ApplicationACLMapProto
const __val_ApplicationACLMapProto = Dict(:acl => " ")
meta(t::Type{ApplicationACLMapProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ApplicationACLMapProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct YarnClusterMetricsProto <: ProtoType
    num_node_managers::Int32
    YarnClusterMetricsProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct YarnClusterMetricsProto

mutable struct QueueInfoProto <: ProtoType
    queueName::AbstractString
    capacity::Float32
    maximumCapacity::Float32
    currentCapacity::Float32
    state::Int32
    childQueues::Base.Vector{QueueInfoProto}
    applications::Base.Vector{ApplicationReportProto}
    accessibleNodeLabels::Base.Vector{AbstractString}
    defaultNodeLabelExpression::AbstractString
    QueueInfoProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct QueueInfoProto

mutable struct QueueUserACLInfoProto <: ProtoType
    queueName::AbstractString
    userAcls::Base.Vector{Int32}
    QueueUserACLInfoProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct QueueUserACLInfoProto

mutable struct ReservationIdProto <: ProtoType
    id::Int64
    cluster_timestamp::Int64
    ReservationIdProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationIdProto

mutable struct ReservationRequestProto <: ProtoType
    capability::ResourceProto
    num_containers::Int32
    concurrency::Int32
    duration::Int64
    ReservationRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationRequestProto
const __val_ReservationRequestProto = Dict(:num_containers => 1, :concurrency => 1, :duration => -1)
meta(t::Type{ReservationRequestProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ReservationRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ReservationRequestsProto <: ProtoType
    reservation_resources::Base.Vector{ReservationRequestProto}
    interpreter::Int32
    ReservationRequestsProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationRequestsProto
const __val_ReservationRequestsProto = Dict(:interpreter => ReservationRequestInterpreterProto.R_ALL)
meta(t::Type{ReservationRequestsProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ReservationRequestsProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ReservationDefinitionProto <: ProtoType
    reservation_requests::ReservationRequestsProto
    arrival::Int64
    deadline::Int64
    reservation_name::AbstractString
    ReservationDefinitionProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ReservationDefinitionProto

mutable struct ContainerStatusProto <: ProtoType
    container_id::ContainerIdProto
    state::Int32
    diagnostics::AbstractString
    exit_status::Int32
    ContainerStatusProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ContainerStatusProto
const __val_ContainerStatusProto = Dict(:diagnostics => "N/A", :exit_status => -1000)
meta(t::Type{ContainerStatusProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ContainerStatusProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ContainerResourceIncreaseRequestProto <: ProtoType
    container_id::ContainerIdProto
    capability::ResourceProto
    ContainerResourceIncreaseRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ContainerResourceIncreaseRequestProto

mutable struct ContainerResourceIncreaseProto <: ProtoType
    container_id::ContainerIdProto
    capability::ResourceProto
    container_token::hadoop.common.TokenProto
    ContainerResourceIncreaseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ContainerResourceIncreaseProto

mutable struct ContainerResourceDecreaseProto <: ProtoType
    container_id::ContainerIdProto
    capability::ResourceProto
    ContainerResourceDecreaseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ContainerResourceDecreaseProto

mutable struct StringLocalResourceMapProto <: ProtoType
    key::AbstractString
    value::LocalResourceProto
    StringLocalResourceMapProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StringLocalResourceMapProto

mutable struct StringStringMapProto <: ProtoType
    key::AbstractString
    value::AbstractString
    StringStringMapProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StringStringMapProto

mutable struct StringBytesMapProto <: ProtoType
    key::AbstractString
    value::Array{UInt8,1}
    StringBytesMapProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StringBytesMapProto

mutable struct ContainerLaunchContextProto <: ProtoType
    localResources::Base.Vector{StringLocalResourceMapProto}
    tokens::Array{UInt8,1}
    service_data::Base.Vector{StringBytesMapProto}
    environment::Base.Vector{StringStringMapProto}
    command::Base.Vector{AbstractString}
    application_ACLs::Base.Vector{ApplicationACLMapProto}
    ContainerLaunchContextProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ContainerLaunchContextProto

mutable struct ApplicationSubmissionContextProto <: ProtoType
    application_id::ApplicationIdProto
    application_name::AbstractString
    queue::AbstractString
    priority::PriorityProto
    am_container_spec::ContainerLaunchContextProto
    cancel_tokens_when_complete::Bool
    unmanaged_am::Bool
    maxAppAttempts::Int32
    resource::ResourceProto
    applicationType::AbstractString
    keep_containers_across_application_attempts::Bool
    applicationTags::Base.Vector{AbstractString}
    attempt_failures_validity_interval::Int64
    log_aggregation_context::LogAggregationContextProto
    reservation_id::ReservationIdProto
    node_label_expression::AbstractString
    am_container_resource_request::ResourceRequestProto
    ApplicationSubmissionContextProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ApplicationSubmissionContextProto
const __val_ApplicationSubmissionContextProto = Dict(:application_name => "N/A", :queue => "default", :cancel_tokens_when_complete => true, :unmanaged_am => false, :maxAppAttempts => 0, :applicationType => "YARN", :keep_containers_across_application_attempts => false, :attempt_failures_validity_interval => -1)
meta(t::Type{ApplicationSubmissionContextProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ApplicationSubmissionContextProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

export ContainerStateProto, YarnApplicationStateProto, YarnApplicationAttemptStateProto, FinalApplicationStatusProto, LocalResourceVisibilityProto, LocalResourceTypeProto, NodeStateProto, AMCommandProto, ApplicationAccessTypeProto, QueueStateProto, QueueACLProto, ReservationRequestInterpreterProto, ContainerExitStatusProto, SerializedExceptionProto, ApplicationIdProto, ApplicationAttemptIdProto, ContainerIdProto, ResourceProto, ResourceOptionProto, NodeResourceMapProto, PriorityProto, ContainerProto, ContainerReportProto, URLProto, LocalResourceProto, ApplicationResourceUsageReportProto, ApplicationReportProto, ApplicationAttemptReportProto, NodeIdProto, NodeReportProto, NodeIdToLabelsProto, LabelsToNodeIdsProto, ResourceRequestProto, PreemptionMessageProto, StrictPreemptionContractProto, PreemptionContractProto, PreemptionContainerProto, PreemptionResourceRequestProto, ResourceBlacklistRequestProto, ApplicationSubmissionContextProto, LogAggregationContextProto, ApplicationACLMapProto, YarnClusterMetricsProto, QueueInfoProto, QueueUserACLInfoProto, ReservationIdProto, ReservationRequestProto, ReservationRequestsProto, ReservationDefinitionProto, ContainerLaunchContextProto, ContainerStatusProto, ContainerResourceIncreaseRequestProto, ContainerResourceIncreaseProto, ContainerResourceDecreaseProto, StringLocalResourceMapProto, StringStringMapProto, StringBytesMapProto
