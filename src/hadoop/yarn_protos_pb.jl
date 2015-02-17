using ..common
using Compat
using ProtoBuf
import ProtoBuf.meta

type __enum_ContainerStateProto <: ProtoEnum
    C_NEW::Int32
    C_RUNNING::Int32
    C_COMPLETE::Int32
    __enum_ContainerStateProto() = new(1,2,3)
end #type __enum_ContainerStateProto
const ContainerStateProto = __enum_ContainerStateProto()

type __enum_YarnApplicationStateProto <: ProtoEnum
    NEW::Int32
    NEW_SAVING::Int32
    SUBMITTED::Int32
    ACCEPTED::Int32
    RUNNING::Int32
    FINISHED::Int32
    FAILED::Int32
    KILLED::Int32
    __enum_YarnApplicationStateProto() = new(1,2,3,4,5,6,7,8)
end #type __enum_YarnApplicationStateProto
const YarnApplicationStateProto = __enum_YarnApplicationStateProto()

type __enum_YarnApplicationAttemptStateProto <: ProtoEnum
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
end #type __enum_YarnApplicationAttemptStateProto
const YarnApplicationAttemptStateProto = __enum_YarnApplicationAttemptStateProto()

type __enum_FinalApplicationStatusProto <: ProtoEnum
    APP_UNDEFINED::Int32
    APP_SUCCEEDED::Int32
    APP_FAILED::Int32
    APP_KILLED::Int32
    __enum_FinalApplicationStatusProto() = new(0,1,2,3)
end #type __enum_FinalApplicationStatusProto
const FinalApplicationStatusProto = __enum_FinalApplicationStatusProto()

type __enum_LocalResourceVisibilityProto <: ProtoEnum
    PUBLIC::Int32
    PRIVATE::Int32
    APPLICATION::Int32
    __enum_LocalResourceVisibilityProto() = new(1,2,3)
end #type __enum_LocalResourceVisibilityProto
const LocalResourceVisibilityProto = __enum_LocalResourceVisibilityProto()

type __enum_LocalResourceTypeProto <: ProtoEnum
    ARCHIVE::Int32
    FILE::Int32
    PATTERN::Int32
    __enum_LocalResourceTypeProto() = new(1,2,3)
end #type __enum_LocalResourceTypeProto
const LocalResourceTypeProto = __enum_LocalResourceTypeProto()

type __enum_NodeStateProto <: ProtoEnum
    NS_NEW::Int32
    NS_RUNNING::Int32
    NS_UNHEALTHY::Int32
    NS_DECOMMISSIONED::Int32
    NS_LOST::Int32
    NS_REBOOTED::Int32
    __enum_NodeStateProto() = new(1,2,3,4,5,6)
end #type __enum_NodeStateProto
const NodeStateProto = __enum_NodeStateProto()

type __enum_AMCommandProto <: ProtoEnum
    AM_RESYNC::Int32
    AM_SHUTDOWN::Int32
    __enum_AMCommandProto() = new(1,2)
end #type __enum_AMCommandProto
const AMCommandProto = __enum_AMCommandProto()

type __enum_ApplicationAccessTypeProto <: ProtoEnum
    APPACCESS_VIEW_APP::Int32
    APPACCESS_MODIFY_APP::Int32
    __enum_ApplicationAccessTypeProto() = new(1,2)
end #type __enum_ApplicationAccessTypeProto
const ApplicationAccessTypeProto = __enum_ApplicationAccessTypeProto()

type __enum_QueueStateProto <: ProtoEnum
    Q_STOPPED::Int32
    Q_RUNNING::Int32
    __enum_QueueStateProto() = new(1,2)
end #type __enum_QueueStateProto
const QueueStateProto = __enum_QueueStateProto()

type __enum_QueueACLProto <: ProtoEnum
    QACL_SUBMIT_APPLICATIONS::Int32
    QACL_ADMINISTER_QUEUE::Int32
    __enum_QueueACLProto() = new(1,2)
end #type __enum_QueueACLProto
const QueueACLProto = __enum_QueueACLProto()

type __enum_ReservationRequestInterpreterProto <: ProtoEnum
    R_ANY::Int32
    R_ALL::Int32
    R_ORDER::Int32
    R_ORDER_NO_GAP::Int32
    __enum_ReservationRequestInterpreterProto() = new(0,1,2,3)
end #type __enum_ReservationRequestInterpreterProto
const ReservationRequestInterpreterProto = __enum_ReservationRequestInterpreterProto()

type __enum_ContainerExitStatusProto <: ProtoEnum
    SUCCESS::Int32
    INVALID::Int32
    ABORTED::Int32
    DISKS_FAILED::Int32
    __enum_ContainerExitStatusProto() = new(0,-1000,-100,-101)
end #type __enum_ContainerExitStatusProto
const ContainerExitStatusProto = __enum_ContainerExitStatusProto()

type SerializedExceptionProto
    message::AbstractString
    trace::AbstractString
    class_name::AbstractString
    cause::SerializedExceptionProto
    SerializedExceptionProto() = (o=new(); fillunset(o); o)
end #type SerializedExceptionProto

type ApplicationIdProto
    id::Int32
    cluster_timestamp::Int64
    ApplicationIdProto() = (o=new(); fillunset(o); o)
end #type ApplicationIdProto

type ApplicationAttemptIdProto
    application_id::ApplicationIdProto
    attemptId::Int32
    ApplicationAttemptIdProto() = (o=new(); fillunset(o); o)
end #type ApplicationAttemptIdProto

type ContainerIdProto
    app_id::ApplicationIdProto
    app_attempt_id::ApplicationAttemptIdProto
    id::Int64
    ContainerIdProto() = (o=new(); fillunset(o); o)
end #type ContainerIdProto

type ResourceProto
    memory::Int32
    virtual_cores::Int32
    ResourceProto() = (o=new(); fillunset(o); o)
end #type ResourceProto

type ResourceOptionProto
    resource::ResourceProto
    over_commit_timeout::Int32
    ResourceOptionProto() = (o=new(); fillunset(o); o)
end #type ResourceOptionProto

type PriorityProto
    priority::Int32
    PriorityProto() = (o=new(); fillunset(o); o)
end #type PriorityProto

type URLProto
    scheme::AbstractString
    host::AbstractString
    port::Int32
    file::AbstractString
    userInfo::AbstractString
    URLProto() = (o=new(); fillunset(o); o)
end #type URLProto

type LocalResourceProto
    resource::URLProto
    size::Int64
    timestamp::Int64
    _type::Int32
    visibility::Int32
    pattern::AbstractString
    LocalResourceProto() = (o=new(); fillunset(o); o)
end #type LocalResourceProto

type ApplicationResourceUsageReportProto
    num_used_containers::Int32
    num_reserved_containers::Int32
    used_resources::ResourceProto
    reserved_resources::ResourceProto
    needed_resources::ResourceProto
    memory_seconds::Int64
    vcore_seconds::Int64
    ApplicationResourceUsageReportProto() = (o=new(); fillunset(o); o)
end #type ApplicationResourceUsageReportProto

type ApplicationReportProto
    applicationId::ApplicationIdProto
    user::AbstractString
    queue::AbstractString
    name::AbstractString
    host::AbstractString
    rpc_port::Int32
    client_to_am_token::TokenProto
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
    am_rm_token::TokenProto
    applicationTags::Array{AbstractString,1}
    ApplicationReportProto() = (o=new(); fillunset(o); o)
end #type ApplicationReportProto
const __val_ApplicationReportProto = @compat Dict(:diagnostics => "N/A")
meta(t::Type{ApplicationReportProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ApplicationReportProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type ApplicationAttemptReportProto
    application_attempt_id::ApplicationAttemptIdProto
    host::AbstractString
    rpc_port::Int32
    tracking_url::AbstractString
    diagnostics::AbstractString
    yarn_application_attempt_state::Int32
    am_container_id::ContainerIdProto
    original_tracking_url::AbstractString
    ApplicationAttemptReportProto() = (o=new(); fillunset(o); o)
end #type ApplicationAttemptReportProto
const __val_ApplicationAttemptReportProto = @compat Dict(:diagnostics => "N/A")
meta(t::Type{ApplicationAttemptReportProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ApplicationAttemptReportProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type NodeIdProto
    host::AbstractString
    port::Int32
    NodeIdProto() = (o=new(); fillunset(o); o)
end #type NodeIdProto

type NodeResourceMapProto
    node_id::NodeIdProto
    resource_option::ResourceOptionProto
    NodeResourceMapProto() = (o=new(); fillunset(o); o)
end #type NodeResourceMapProto

type ContainerReportProto
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
    ContainerReportProto() = (o=new(); fillunset(o); o)
end #type ContainerReportProto
const __val_ContainerReportProto = @compat Dict(:diagnostics_info => "N/A")
meta(t::Type{ContainerReportProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ContainerReportProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type ContainerProto
    id::ContainerIdProto
    nodeId::NodeIdProto
    node_http_address::AbstractString
    resource::ResourceProto
    priority::PriorityProto
    container_token::TokenProto
    ContainerProto() = (o=new(); fillunset(o); o)
end #type ContainerProto

type NodeReportProto
    nodeId::NodeIdProto
    httpAddress::AbstractString
    rackName::AbstractString
    used::ResourceProto
    capability::ResourceProto
    numContainers::Int32
    node_state::Int32
    health_report::AbstractString
    last_health_report_time::Int64
    node_labels::Array{AbstractString,1}
    NodeReportProto() = (o=new(); fillunset(o); o)
end #type NodeReportProto

type NodeIdToLabelsProto
    nodeId::NodeIdProto
    nodeLabels::Array{AbstractString,1}
    NodeIdToLabelsProto() = (o=new(); fillunset(o); o)
end #type NodeIdToLabelsProto

type ResourceRequestProto
    priority::PriorityProto
    resource_name::AbstractString
    capability::ResourceProto
    num_containers::Int32
    relax_locality::Bool
    node_label_expression::AbstractString
    ResourceRequestProto() = (o=new(); fillunset(o); o)
end #type ResourceRequestProto
const __val_ResourceRequestProto = @compat Dict(:relax_locality => true)
meta(t::Type{ResourceRequestProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ResourceRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type PreemptionContainerProto
    id::ContainerIdProto
    PreemptionContainerProto() = (o=new(); fillunset(o); o)
end #type PreemptionContainerProto

type StrictPreemptionContractProto
    container::Array{PreemptionContainerProto,1}
    StrictPreemptionContractProto() = (o=new(); fillunset(o); o)
end #type StrictPreemptionContractProto

type PreemptionResourceRequestProto
    resource::ResourceRequestProto
    PreemptionResourceRequestProto() = (o=new(); fillunset(o); o)
end #type PreemptionResourceRequestProto

type PreemptionContractProto
    resource::Array{PreemptionResourceRequestProto,1}
    container::Array{PreemptionContainerProto,1}
    PreemptionContractProto() = (o=new(); fillunset(o); o)
end #type PreemptionContractProto

type PreemptionMessageProto
    strictContract::StrictPreemptionContractProto
    contract::PreemptionContractProto
    PreemptionMessageProto() = (o=new(); fillunset(o); o)
end #type PreemptionMessageProto

type ResourceBlacklistRequestProto
    blacklist_additions::Array{AbstractString,1}
    blacklist_removals::Array{AbstractString,1}
    ResourceBlacklistRequestProto() = (o=new(); fillunset(o); o)
end #type ResourceBlacklistRequestProto

type LogAggregationContextProto
    include_pattern::AbstractString
    exclude_pattern::AbstractString
    LogAggregationContextProto() = (o=new(); fillunset(o); o)
end #type LogAggregationContextProto
const __val_LogAggregationContextProto = @compat Dict(:include_pattern => ".*")
meta(t::Type{LogAggregationContextProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_LogAggregationContextProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type ApplicationACLMapProto
    accessType::Int32
    acl::AbstractString
    ApplicationACLMapProto() = (o=new(); fillunset(o); o)
end #type ApplicationACLMapProto
const __val_ApplicationACLMapProto = @compat Dict(:acl => " ")
meta(t::Type{ApplicationACLMapProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ApplicationACLMapProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type YarnClusterMetricsProto
    num_node_managers::Int32
    YarnClusterMetricsProto() = (o=new(); fillunset(o); o)
end #type YarnClusterMetricsProto

type QueueInfoProto
    queueName::AbstractString
    capacity::Float32
    maximumCapacity::Float32
    currentCapacity::Float32
    state::Int32
    childQueues::Array{QueueInfoProto,1}
    applications::Array{ApplicationReportProto,1}
    accessibleNodeLabels::Array{AbstractString,1}
    defaultNodeLabelExpression::AbstractString
    QueueInfoProto() = (o=new(); fillunset(o); o)
end #type QueueInfoProto

type QueueUserACLInfoProto
    queueName::AbstractString
    userAcls::Array{Int32,1}
    QueueUserACLInfoProto() = (o=new(); fillunset(o); o)
end #type QueueUserACLInfoProto

type ReservationIdProto
    id::Int64
    cluster_timestamp::Int64
    ReservationIdProto() = (o=new(); fillunset(o); o)
end #type ReservationIdProto

type ReservationRequestProto
    capability::ResourceProto
    num_containers::Int32
    concurrency::Int32
    duration::Int64
    ReservationRequestProto() = (o=new(); fillunset(o); o)
end #type ReservationRequestProto
const __val_ReservationRequestProto = @compat Dict(:num_containers => 1, :concurrency => 1, :duration => -1)
meta(t::Type{ReservationRequestProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ReservationRequestProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type ReservationRequestsProto
    reservation_resources::Array{ReservationRequestProto,1}
    interpreter::Int32
    ReservationRequestsProto() = (o=new(); fillunset(o); o)
end #type ReservationRequestsProto
const __val_ReservationRequestsProto = @compat Dict(:interpreter => ReservationRequestInterpreterProto.R_ALL)
meta(t::Type{ReservationRequestsProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ReservationRequestsProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type ReservationDefinitionProto
    reservation_requests::ReservationRequestsProto
    arrival::Int64
    deadline::Int64
    reservation_name::AbstractString
    ReservationDefinitionProto() = (o=new(); fillunset(o); o)
end #type ReservationDefinitionProto

type ContainerStatusProto
    container_id::ContainerIdProto
    state::Int32
    diagnostics::AbstractString
    exit_status::Int32
    ContainerStatusProto() = (o=new(); fillunset(o); o)
end #type ContainerStatusProto
const __val_ContainerStatusProto = @compat Dict(:diagnostics => "N/A", :exit_status => -1000)
meta(t::Type{ContainerStatusProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ContainerStatusProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type ContainerResourceIncreaseRequestProto
    container_id::ContainerIdProto
    capability::ResourceProto
    ContainerResourceIncreaseRequestProto() = (o=new(); fillunset(o); o)
end #type ContainerResourceIncreaseRequestProto

type ContainerResourceIncreaseProto
    container_id::ContainerIdProto
    capability::ResourceProto
    container_token::TokenProto
    ContainerResourceIncreaseProto() = (o=new(); fillunset(o); o)
end #type ContainerResourceIncreaseProto

type ContainerResourceDecreaseProto
    container_id::ContainerIdProto
    capability::ResourceProto
    ContainerResourceDecreaseProto() = (o=new(); fillunset(o); o)
end #type ContainerResourceDecreaseProto

type StringLocalResourceMapProto
    key::AbstractString
    value::LocalResourceProto
    StringLocalResourceMapProto() = (o=new(); fillunset(o); o)
end #type StringLocalResourceMapProto

type StringStringMapProto
    key::AbstractString
    value::AbstractString
    StringStringMapProto() = (o=new(); fillunset(o); o)
end #type StringStringMapProto

type StringBytesMapProto
    key::AbstractString
    value::Array{UInt8,1}
    StringBytesMapProto() = (o=new(); fillunset(o); o)
end #type StringBytesMapProto

type ContainerLaunchContextProto
    localResources::Array{StringLocalResourceMapProto,1}
    tokens::Array{UInt8,1}
    service_data::Array{StringBytesMapProto,1}
    environment::Array{StringStringMapProto,1}
    command::Array{AbstractString,1}
    application_ACLs::Array{ApplicationACLMapProto,1}
    ContainerLaunchContextProto() = (o=new(); fillunset(o); o)
end #type ContainerLaunchContextProto

type ApplicationSubmissionContextProto
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
    applicationTags::Array{AbstractString,1}
    attempt_failures_validity_interval::Int64
    log_aggregation_context::LogAggregationContextProto
    reservation_id::ReservationIdProto
    node_label_expression::AbstractString
    am_container_resource_request::ResourceRequestProto
    ApplicationSubmissionContextProto() = (o=new(); fillunset(o); o)
end #type ApplicationSubmissionContextProto
const __val_ApplicationSubmissionContextProto = @compat Dict(:application_name => "N/A", :queue => "default", :cancel_tokens_when_complete => true, :unmanaged_am => false, :maxAppAttempts => 0, :applicationType => "YARN", :keep_containers_across_application_attempts => false, :attempt_failures_validity_interval => -1)
meta(t::Type{ApplicationSubmissionContextProto}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_ApplicationSubmissionContextProto, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

export ContainerStateProto, YarnApplicationStateProto, YarnApplicationAttemptStateProto, FinalApplicationStatusProto, LocalResourceVisibilityProto, LocalResourceTypeProto, NodeStateProto, AMCommandProto, ApplicationAccessTypeProto, QueueStateProto, QueueACLProto, ReservationRequestInterpreterProto, ContainerExitStatusProto, SerializedExceptionProto, ApplicationIdProto, ApplicationAttemptIdProto, ContainerIdProto, ResourceProto, ResourceOptionProto, NodeResourceMapProto, PriorityProto, ContainerProto, ContainerReportProto, URLProto, LocalResourceProto, ApplicationResourceUsageReportProto, ApplicationReportProto, ApplicationAttemptReportProto, NodeIdProto, NodeReportProto, NodeIdToLabelsProto, ResourceRequestProto, PreemptionMessageProto, StrictPreemptionContractProto, PreemptionContractProto, PreemptionContainerProto, PreemptionResourceRequestProto, ResourceBlacklistRequestProto, ApplicationSubmissionContextProto, LogAggregationContextProto, ApplicationACLMapProto, YarnClusterMetricsProto, QueueInfoProto, QueueUserACLInfoProto, ReservationIdProto, ReservationRequestProto, ReservationRequestsProto, ReservationDefinitionProto, ContainerLaunchContextProto, ContainerStatusProto, ContainerResourceIncreaseRequestProto, ContainerResourceIncreaseProto, ContainerResourceDecreaseProto, StringLocalResourceMapProto, StringStringMapProto, StringBytesMapProto
