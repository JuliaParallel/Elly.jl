#
# Contains APIs for an application client to interact with the resource manager.
# The underlying methods are implementations of the following protobuf services:
# - applicationclient_protocol.proto
# - application_history_client.proto

"""
YarnClient holds a connection to the Yarn Resource Manager and provides
APIs for application clients to interact with Yarn.
"""
mutable struct YarnClient
    rm_conn::YarnClientProtocol

    function YarnClient(host::AbstractString, port::Integer, ugi::UserGroupInformation=UserGroupInformation())
        new(YarnClientProtocol(host, port, ugi))
    end
end

show(io::IO, client::YarnClient) = show(io, client.rm_conn)

function nodecount(client::YarnClient)
    inp = GetClusterMetricsRequestProto()
    resp = getClusterMetrics(client.rm_conn, inp)
    isfilled(resp, :cluster_metrics) ? resp.cluster_metrics.num_node_managers : 0
end

function nodes(client::YarnClient; all::Bool=false, nodelist::YarnNodes=YarnNodes(client.rm_conn.channel.ugi))
    inp = GetClusterNodesRequestProto()
    if all
        set_field!(inp, :nodeStates, [NodeStateProto.NS_NEW, NodeStateProto.NS_RUNNING, NodeStateProto.NS_UNHEALTHY, NodeStateProto.NS_DECOMMISSIONED, NodeStateProto.NS_LOST, NodeStateProto.NS_REBOOTED])
    else
        set_field!(inp, :nodeStates, [NodeStateProto.NS_RUNNING])
    end
    resp = getClusterNodes(client.rm_conn, inp)
    update(nodelist, resp)
    nodelist
end



"""
YarnAppStatus wraps the protobuf type for ease of use
"""
mutable struct YarnAppStatus
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


"""
YarnAppAttemptStatus wraps the protobuf type for ease of use
"""
mutable struct YarnAppAttemptStatus
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

"""
YarnApp represents one instance of application running on the yarn cluster
"""
mutable struct YarnApp
    client::YarnClient
    appid::ApplicationIdProto
    status::Union{Nothing,YarnAppStatus}
    attempts::Array{YarnAppAttemptStatus}

    function YarnApp(client::YarnClient, appid::ApplicationIdProto)
        new(client, appid, nothing, YarnAppAttemptStatus[])
    end
end

"""
APP_STATES: enum value to state map. Used for converting state for display.
"""
const APP_STATES = [:new, :new_saving, :submitted, :accepted, :running, :finished, :failed, :killed]

"""
FINAL_APP_STATES: enum value to state map. Used for converting state for display.
"""
const FINAL_APP_STATES = [:succeeded, :failed, :killed]

"""
ATTEMPT_STATES: enum value to state map. Used for converting state for display.
"""
const ATTEMPT_STATES = [:new, :submitted, :scheduled, :scheduled, :allocated_saving, :allocated, :launched, :failed, :running, :finishing, :finished, :killed]

function show(io::IO, app::YarnApp)
    if app.status === nothing
        println(io, "YarnApp: $(app.appid.id)")
    else
        show(io, app.status)
    end
    nothing
end

function _new_app(client::YarnClient)
    inp = GetNewApplicationRequestProto()
    resp = getNewApplication(client.rm_conn, inp)
    resp.application_id, resp.maximumCapability.memory, resp.maximumCapability.virtual_cores
end

function submit(client::YarnClient, container_spec::ContainerLaunchContextProto, mem::Integer, cores::Integer; 
        priority::Int32=one(Int32), appname::AbstractString="EllyApp", queue::AbstractString="default", apptype::AbstractString="YARN", 
        reuse::Bool=false, unmanaged::Bool=false)
    appid, maxmem, maxcores = _new_app(client)

    prio = protobuild(PriorityProto, Dict(:priority => priority))
    res = protobuild(ResourceProto, Dict(:memory => mem, :virtual_cores => cores))
    asc = protobuild(ApplicationSubmissionContextProto, Dict(:application_id => appid,
                :application_name => appname,
                :queue => queue,
                :priority => prio,
                :unmanaged_am => unmanaged,
                :am_container_spec => container_spec,
                :resource => res,
                :maxAppAttempts => 2,
                :applicationType => apptype,
                :keep_containers_across_application_attempts => reuse))
  
    inp = protobuild(SubmitApplicationRequestProto, Dict(:application_submission_context => asc))

    submitApplication(client.rm_conn, inp)
    YarnApp(client, appid)
end

function kill(app::YarnApp)
    client = app.client
    inp = protobuild(KillApplicationRequestProto, Dict(:application_id => app.appid))

    resp = forceKillApplication(client.rm_conn, inp)
    resp.is_kill_completed
end

function status(app::YarnApp, refresh::Bool=true)
    if refresh || (app.status === nothing)
        client = app.client
        inp = protobuild(GetApplicationReportRequestProto, Dict(:application_id => app.appid))

        resp = getApplicationReport(client.rm_conn, inp) 
        app.status = isfilled(resp.application_report) ?  YarnAppStatus(resp.application_report) : nothing
    end
    app.status
end

function wait_for_state(app::YarnApp, state::Int32, timeout_secs::Int=60)
    @debug("waiting for application to reach $(APP_STATES[state]) ($state) state")
    t1 = time() + timeout_secs
    finalstates = (YarnApplicationStateProto.KILLED, YarnApplicationStateProto.FAILED, YarnApplicationStateProto.FINISHED)
    isfinalstate = state in finalstates
    while time() < t1
        nst = status(app)
        if nst !== nothing
            appstate = nst.report.yarn_application_state
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
    am_rm_token(status(app))
end

function attempts(app::YarnApp, refresh::Bool=true)
    if refresh || isempty(app.attempts)
        client = app.client
        inp = protobuild(GetApplicationAttemptsRequestProto, Dict(:application_id => app.appid))

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
    @debug("waiting for application attempt $attemptid to reach $(ATTEMPT_STATES[state]) ($state) state")
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
                @debug("application attempt $attemptid is in state $(ATTEMPT_STATES[atmptstate]) ($atmptstate) state")
                break
            end
        end
        sleep(1)
    end
    false
end
