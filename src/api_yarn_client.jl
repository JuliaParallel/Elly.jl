#
# Contains APIs for an application client to interact with the resource manager.
# The underlying methods are implementations of the following protobuf services:
# - applicationclient_protocol.proto
# - application_history_client.proto

@doc doc"""
YarnClient holds a connection to the Yarn Resource Manager and provides
APIs for application clients to interact with Yarn.
""" ->
type YarnClient
    channel::HadoopRpcChannel
    controller::HadoopRpcController
    stub::ApplicationClientProtocolServiceBlockingStub

    function YarnClient(host::AbstractString, port::Integer, user::AbstractString)
        channel = HadoopRpcChannel(host, port, user, :yarn_client)
        controller = HadoopRpcController(false)
        stub = ApplicationClientProtocolServiceBlockingStub(channel)

        new(channel, controller, stub)
    end
end

function show(io::IO, client::YarnClient)
    ch = client.channel
    user_spec = isempty(ch.user) ? ch.user : "$(ch.user)@"
    println(io, "YarnClient: $(user_spec)$(ch.host):$(ch.port)/")
    println(io, "    id: $(ch.clnt_id)")
    println(io, "    connected: $(isconnected(ch))")
    nothing
end

@doc doc"""
YarnNode represents a node manager in the yarn cluster and its
communication address, resource state and run state.
""" ->
type YarnNode
    host::AbstractString
    port::Int32
    rack::AbstractString
    ncontainers::Int32
    mem::Int32
    cores::Int32
    memused::Int32
    coresused::Int32
    state::Int32
    isrunning::Bool

    function YarnNode(node::NodeReportProto)
        host = node.nodeId.host
        port = node.nodeId.port
        rack = node.rackName
        ncontainers = node.numContainers

        state = node.node_state
        isrunning = (state == NodeStateProto.NS_RUNNING)

        if isrunning
            mem = node.capability.memory
            cores = node.capability.virtual_cores

            memused = node.used.memory
            coresused = node.used.virtual_cores
        else
            mem = cores = memused = coresused = 0
        end

        new(host, port, rack, ncontainers, mem, cores, memused, coresused, state, isrunning)
    end
end

@doc doc"""
NODE_STATES: enum value to state map. Used for converting state for display.
""" ->
const NODE_STATES = [:new, :running, :unhealthy, :decommissioned, :lost, :rebooted]

function show(io::IO, node::YarnNode)
    println(io, "YarnNode: $(node.rack)/$(node.host):$(node.port) $(NODE_STATES[node.state])")
    if node.isrunning
        println(io, "    mem used: $(node.memused)/$(node.mem)")
        println(io, "    cores used: $(node.coresused)/$(node.cores)")
    end
    nothing
end

function nodecount(client::YarnClient)
    inp = GetClusterMetricsRequestProto()
    resp = getClusterMetrics(client.stub, client.controller, inp)
    isfilled(resp, :cluster_metrics) ? resp.cluster_metrics.num_node_managers : 0
end

function nodes(client::YarnClient, all::Bool=false)
    inp = GetClusterNodesRequestProto()
    if all
        set_field(inp, :nodeStates, [NodeStateProto.NS_NEW, NodeStateProto.NS_RUNNING, NodeStateProto.NS_UNHEALTHY, NodeStateProto.NS_DECOMMISSIONED, NodeStateProto.NS_LOST, NodeStateProto.NS_REBOOTED])
    else
        set_field(inp, :nodeStates, [NodeStateProto.NS_RUNNING])
    end
    resp = getClusterNodes(client.stub, client.controller, inp)
    nlist = resp.nodeReports
    [YarnNode(n) for n in nlist]
end



@doc doc"""
YarnAppStatus wraps the protobuf type for ease of use
""" ->
type YarnAppStatus
    report::ApplicationReportProto
    function YarnAppStatus(report::ApplicationReportProto)
        new(report)
    end
end

function show(io::IO, status::YarnAppStatus)
    println(io, "$(status.report)")
end


@doc doc"""
YarnApp represents one instance of application running on the yarn cluster
""" ->
type YarnApp
    client::YarnClient
    appid::ApplicationIdProto
    status::Nullable{YarnAppStatus}
    attempts::Nullable{Array}

    function YarnApp(client::YarnClient, appid::ApplicationIdProto)
        new(client, appid, Nullable{YarnAppStatus}(), Nullable{Array}())
    end
end

@doc doc"""
APP_STATES: enum value to state map. Used for converting state for display.
""" ->
const APP_STATES = [:new, :new_saving, :submitted, :accepted, :running, :finished, :failed, :killed]

@doc doc"""
FINAL_APP_STATES: enum value to state map. Used for converting state for display.
""" ->
const FINAL_APP_STATES = [:succeeded, :failed, :killed]

function show(io::IO, app::YarnApp)
    if isnull(app.status)
        println(io, "YarnApp: $(app.appid.id)")
        return
    end

    status = get(app.status)
    if isfilled(status, :final_application_status) && status.final_application_status > 0
        final_state = "-$(FINAL_APP_STATES[status.final_application_status])"
    else
        final_state = ""
    end
    if isfilled(status, :progress)
        final_state *= "-$(status.progress)"
    end
    println(io, "YarnApp $(status.applicationType) ($(status.name)/$(app.appid.id)): $(APP_STATES[status.yarn_application_state])$(final_state)")
    println(io, "    location: $(status.user)@$(status.host):$(status.rpc_port)/$(status.queue)")
    if status.yarn_application_state > YarnApplicationStateProto.RUNNING
        println(io, "    time: $(status.startTime) to $(status.finishTime)")
        if isfilled(status, :app_resource_Usage)
            rusage = status.app_resource_Usage
            println(io, "    rusage:")
            println(io, "        mem,vcore seconds: $(rusage.memory_seconds), $(rusage.vcore_seconds)")
            println(io, "        containers: used $(rusage.num_used_containers), reserved $(rusage.num_reserved_containers)")
            println(io, "        mem: used $(rusage.used_resources.memory), reserved $(rusage.reserved_resources.memory), needed $(rusage.needed_resources.memory)")
            println(io, "        vcores: used $(rusage.used_resources.virtual_cores), reserved $(rusage.reserved_resources.virtual_cores), needed $(rusage.needed_resources.virtual_cores)")
        end
    elseif status.yarn_application_state == YarnApplicationStateProto.RUNNING
        println(io, "    start time: $(status.startTime)")
    end
    nothing
end

function _new_app(client::YarnClient)
    inp = GetNewApplicationRequestProto()
    resp = getNewApplicaton(client.stub, client.controller, inp)
    resp.application_id, resp.maximumCapability.memory, resp.maximumCapability.virtual_cores
end

function launchcontext(cmd::AbstractString)
end

function submit(client::YarnClient, container_spec::ContainerLaunchContextProto, mem::Int32, cores::Int32; 
        priority::Int32=int32(1), appname::AbstractString="EllyApp", queue::AbstractString="default", apptype::AbstractString="YARN", reuse::Bool=false)
    appid, maxmem, maxcores = _new_app(client)

    prio = PriorityProto()
    set_field(prio, :priority, int32(priority))

    res = ResourceProto()
    set_field(res, :memory, mem)
    set_field(res, :virtual_cores, cores)

    asc = ApplicationSubmissionContextProto()
    set_field(asc, :application_id, appid)
    set_field(asc, :application_name, appname)
    set_field(asc, :queue, queue)
    set_field(asc, :priority, prio)
    set_field(asc, :am_container_spec, container_spec)
    set_field(asc, :resource, res)
    set_field(asc, :applicationType, apptype)
    set_field(asc, :keep_containers_across_application_attempts, reuse)
  
    inp = SubmitApplicationRequestProto()
    set_field(inp, :application_submission_context, asc)

    submitApplication(client.stub, client.controller, inp)
    YarnApp(client, appid)
end

function kill(app::YarnApp)
    client = app.client
    inp = KillApplicationRequestProto()
    set_field(inp, :application_id, client.appid)

    resp = forceKillApplication(client.stub, client.controller, inp)
    resp.is_kill_completed
end

function status(app::YarnApp, refresh::Bool=true)
    if refresh || isnull(app.status)
        client = app.client
        inp = GetApplicationReportRequestProto()
        set_field(inp, :application_id, app.appid)

        resp = getApplicationReport(client.stub, client.controller, inp) 
        app.status = isfilled(resp.application_report) ?  Nullable(YarnAppStatus(resp.application_report)) : Nullable{YarnAppStatus}()
    end
    app.status
end

# getApplications
# getNewApplication
# SubmitApplication
# GetApplicationReport
# GetApplicationAttemptReport

