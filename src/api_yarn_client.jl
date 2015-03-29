#
# Contains APIs for an application client to interact with the resource manager.
# The underlying methods are implementations of the following protobuf services:
# - applicationclient_protocol.proto
# - application_history_client.proto

@doc doc"""
# YarnException
Thrown by Yarn APIs.
""" ->
type YarnException <: Exception
    message::AbstractString
end

typealias YarnClientProtocol HadoopRpcProtocol{ApplicationClientProtocolServiceBlockingStub}

for fn in (:getClusterMetrics, :getClusterNodes, :getNewApplication, :submitApplication, :forceKillApplication, :getApplicationReport, :getApplicationAttempts)
    @eval begin
       ( hadoop.yarn.$fn)(p::YarnClientProtocol, inp) = (hadoop.yarn.$fn)(p.stub, p.controller, inp)
    end
end


@doc doc"""
YarnClient holds a connection to the Yarn Resource Manager and provides
APIs for application clients to interact with Yarn.
""" ->
type YarnClient
    rm_conn::YarnClientProtocol

    function YarnClient(host::AbstractString, port::Integer, ugi::UserGroupInformation=UserGroupInformation())
        new(YarnClientProtocol(host, port, ugi))
    end
end

show(io::IO, client::YarnClient) = show(io, client.rm_conn)

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
    resp = getClusterMetrics(client.rm_conn, inp)
    isfilled(resp, :cluster_metrics) ? resp.cluster_metrics.num_node_managers : 0
end

function nodes(client::YarnClient, all::Bool=false)
    inp = GetClusterNodesRequestProto()
    if all
        set_field!(inp, :nodeStates, [NodeStateProto.NS_NEW, NodeStateProto.NS_RUNNING, NodeStateProto.NS_UNHEALTHY, NodeStateProto.NS_DECOMMISSIONED, NodeStateProto.NS_LOST, NodeStateProto.NS_REBOOTED])
    else
        set_field!(inp, :nodeStates, [NodeStateProto.NS_RUNNING])
    end
    resp = getClusterNodes(client.rm_conn, inp)
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
    report = status.report

    if isfilled(report, :final_application_status) && report.final_application_status > 0
        final_state = "-$(FINAL_APP_STATES[report.final_application_status])"
    else
        final_state = ""
    end
    if isfilled(report, :progress)
        final_state *= "-$(report.progress)"
    end
    println(io, "YarnApp $(report.applicationType) ($(report.name)/$(report.applicationId.id)): $(APP_STATES[report.yarn_application_state])$(final_state)")
    println(io, "    location: $(report.user)@$(report.host):$(report.rpc_port)/$(report.queue)")
    if report.yarn_application_state > YarnApplicationStateProto.RUNNING
        println(io, "    time: $(report.startTime) to $(report.finishTime)")
        if isfilled(report, :app_resource_Usage)
            rusage = report.app_resource_Usage
            println(io, "    rusage:")
            println(io, "        mem,vcore seconds: $(rusage.memory_seconds), $(rusage.vcore_seconds)")
            println(io, "        containers: used $(rusage.num_used_containers), reserved $(rusage.num_reserved_containers)")
            println(io, "        mem: used $(rusage.used_resources.memory), reserved $(rusage.reserved_resources.memory), needed $(rusage.needed_resources.memory)")
            println(io, "        vcores: used $(rusage.used_resources.virtual_cores), reserved $(rusage.reserved_resources.virtual_cores), needed $(rusage.needed_resources.virtual_cores)")
        end
        if isfilled(report, :diagnostics)
            println(io, "    diagnostics: $(report.diagnostics)")
        end
    elseif report.yarn_application_state == YarnApplicationStateProto.RUNNING
        println(io, "    start time: $(report.startTime)")
    end
    nothing
end

# get am-rm token for an unmanaged app
am_rm_token(status::YarnAppStatus) = status.report.am_rm_token


@doc doc"""
YarnAppAttemptStatus wraps the protobuf type for ease of use
""" ->
type YarnAppAttemptStatus
    report::ApplicationAttemptReportProto
    function YarnAppAttemptStatus(report::ApplicationAttemptReportProto)
        new(report)
    end
end

function show(io::IO, status::YarnAppAttemptStatus)
    report = status.report

    atmpt_id = report.application_attempt_id

    atmpt_str = "$(atmpt_id.application_id.id)"
    if isfilled(report, :am_container_id)
        atmpt_str *= "/$(report.am_container_id.id)"
    else
        atmpt_str *= "/-"
    end
    atmpt_str *= "/$(atmpt_id.attemptId)"

    println(io, "YarnAppAttempt $(atmpt_str): $(ATTEMPT_STATES[report.yarn_application_attempt_state])")
    println(io, "    location: $(report.host):$(report.rpc_port)")
    if isfilled(report, :diagnostics)
        println(io, "    diagnostics: $(report.diagnostics)")
    end
    nothing
end

@doc doc"""
YarnApp represents one instance of application running on the yarn cluster
""" ->
type YarnApp
    client::YarnClient
    appid::ApplicationIdProto
    status::Nullable{YarnAppStatus}
    attempts::Array{YarnAppAttemptStatus}

    function YarnApp(client::YarnClient, appid::ApplicationIdProto)
        new(client, appid, Nullable{YarnAppStatus}(), YarnAppAttemptStatus[])
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

@doc doc"""
ATTEMPT_STATES: enum value to state map. Used for converting state for display.
""" ->
const ATTEMPT_STATES = [:new, :submitted, :scheduled, :scheduled, :allocated_saving, :allocated, :launched, :failed, :running, :finishing, :finished, :killed]

function show(io::IO, app::YarnApp)
    if isnull(app.status)
        println(io, "YarnApp: $(app.appid.id)")
    else
        show(io, get(app.status))
    end
    nothing
end

function _new_app(client::YarnClient)
    inp = GetNewApplicationRequestProto()
    resp = getNewApplication(client.rm_conn, inp)
    resp.application_id, resp.maximumCapability.memory, resp.maximumCapability.virtual_cores
end

# TODO: support local resources
# TODO: support tokens
function launchcontext(;cmd::AbstractString="", env::Dict=Dict(), service_data::Dict=Dict())
    clc = ContainerLaunchContextProto()
    if !isempty(cmd)
        set_field!(clc, :command, AbstractString[cmd])
    end
    if !isempty(env)
        envproto = StringStringMapProto[]
        for (n,v) in env
            (isa(n, AbstractString) && isa(v, AbstractString)) || throw(ArgumentError("non string environment variable specified: $(typeof(n)) => $(typeof(v))"))
            push!(envproto, protobuild(StringStringMapProto, @compat Dict(:key => n, :value => v)))
        end
        set_field!(clc, :environment, envproto)
    end
    if !isempty(service_data)
        svcdataproto = StringBytesMapProto[]
        for (n,v) in service_data
            (isa(n, AbstractString) && isa(v, Vector{UInt8})) || throw(ArgumentError("incompatible service data type specified: $(typeof(n)) => $(typeof(v))"))
            push!(svcdataproto, protobuild(StringBytesMapProto, @compat Dict(:key => n, :value => v)))
        end
        set_field!(clc, :service_data, servicedataproto)
    end
    clc
end

function submit(client::YarnClient, container_spec::ContainerLaunchContextProto, mem::Integer, cores::Integer; 
        priority::Int32=one(Int32), appname::AbstractString="EllyApp", queue::AbstractString="default", apptype::AbstractString="YARN", 
        reuse::Bool=false, unmanaged::Bool=false)
    appid, maxmem, maxcores = _new_app(client)

    prio = protobuild(PriorityProto, @compat Dict(:priority => priority))
    res = protobuild(ResourceProto, @compat Dict(:memory => mem, :virtual_cores => cores))
    asc = protobuild(ApplicationSubmissionContextProto, @compat Dict(:application_id => appid,
                :application_name => appname,
                :queue => queue,
                :priority => prio,
                :unmanaged_am => unmanaged,
                :am_container_spec => container_spec,
                :resource => res,
                :maxAppAttempts => 2,
                :applicationType => apptype,
                :keep_containers_across_application_attempts => reuse))
  
    inp = protobuild(SubmitApplicationRequestProto, @compat Dict(:application_submission_context => asc))

    submitApplication(client.rm_conn, inp)
    YarnApp(client, appid)
end

function kill(app::YarnApp)
    client = app.client
    inp = protobuild(KillApplicationRequestProto, @compat Dict(:application_id => app.appid))

    resp = forceKillApplication(client.rm_conn, inp)
    resp.is_kill_completed
end

function status(app::YarnApp, refresh::Bool=true)
    if refresh || isnull(app.status)
        client = app.client
        inp = protobuild(GetApplicationReportRequestProto, @compat Dict(:application_id => app.appid))

        resp = getApplicationReport(client.rm_conn, inp) 
        app.status = isfilled(resp.application_report) ?  Nullable(YarnAppStatus(resp.application_report)) : Nullable{YarnAppStatus}()
    end
    app.status
end

function wait_for_state(app::YarnApp, state::Int32, timeout_secs::Int=60)
    #logmsg("waiting for application to reach $(APP_STATES[state]) ($state) state")
    t1 = time() + timeout_secs
    finalstates = (YarnApplicationStateProto.KILLED, YarnApplicationStateProto.FAILED, YarnApplicationStateProto.FINISHED)
    isfinalstate = state in finalstates
    while time() < t1
        nst = status(app)
        if !isnull(nst)
            appstate = get(nst).report.yarn_application_state
            (appstate == state) && (return true)
            isfinalstate || ((appstate in finalstates) && (return false))
        end
        sleep(1)
    end
    false
end

# get am-rm token for an unmanaged app
function am_rm_token(app::YarnApp)
    wait_for_state(app, YarnApplicationStateProto.ACCEPTED) || throw(YarnException("Application was not accepted"))
    am_rm_token(get(status(app)))
end

function attempts(app::YarnApp, refresh::Bool=true)
    if refresh || isnull(app.attempts)
        client = app.client
        inp = protobuild(GetApplicationAttemptsRequestProto, @compat Dict(:application_id => app.appid))

        resp = getApplicationAttempts(client.rm_conn, inp)
        atmptlist = app.attempts
        empty!(atmptlist)
        if isfilled(resp.application_attempts)
            for atmpt in resp.application_attempts
                push!(atmptlist, YarnAppAttemptStatus(atmpt))
            end
        end
    end
    app.attempts
end

function wait_for_attempt_state(app::YarnApp, attemptid::Int32, state::Int32, timeout_secs::Int=60)
    #logmsg("waiting for application attempt $attemptid to reach $(ATTEMPT_STATES[state]) ($state) state")
    t1 = time() + timeout_secs
    finalstates = (YarnApplicationAttemptStateProto.APP_ATTEMPT_KILLED, YarnApplicationAttemptStateProto.APP_ATTEMPT_FAILED, YarnApplicationAttemptStateProto.APP_ATTEMPT_FINISHED)
    isfinalstate = state in finalstates
    while time() < t1
        atmptlist = attempts(app)
        for atmpt in atmptlist
            report = atmpt.report
            if report.application_attempt_id.attemptId == attemptid
                atmptstate = report.yarn_application_attempt_state
                (atmptstate == state) && (return true)
                isfinalstate || ((atmptstate in finalstates) && (return false))
                #logmsg("application attempt $attemptid is in state $(ATTEMPT_STATES[atmptstate]) ($atmptstate) state")
                break
            end
        end
        sleep(1)
    end
    false
end
