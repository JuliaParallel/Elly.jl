# Implements the APIs required by an application master to communicate with the resource manager and the node managers.
# The underlying methods are implementations of the following protobuf services:
# - applicationmaster_protocol.proto
# - containermanagement_protocol.proto

# In managed mode, the AMRMToken available in file CONTAINER_TOKEN_FILE_ENV_NAME is in Java serialized format
#   - Example: https://github.com/apache/hadoop/blob/ab32762f4381449540e1580eeda1cd5198e1e5fa/hadoop-yarn-project/hadoop-yarn/hadoop-yarn-server/hadoop-yarn-server-nodemanager/src/main/java/org/apache/hadoop/yarn/server/nodemanager/containermanager/launcher/ContainerLaunch.java#L348-L351
#   - Some related debate about this here: https://issues.apache.org/jira/browse/HADOOP-6685
# Since that is unusable in anything other than Java, we are forced to operate only in unmanaged mode, where we get it from the application report.

"""
YarnAppMaster is a skeleton application master. It provides the generic scafolding methods which can be used to create specific
application masters for different purposes.

When initializing a YarnAppMaster instance as a managed app master, the scheduler address is picked up from the environment variable `JULIA_YARN_RESOURCEMANAGER_SCHEDULER_ADDRESS`.
Tokens set by Yarn in the file pointed to by `HADOOP_TOKEN_FILE_LOCATION` are also read in automatically.

When run as a managed app master, if a function is provided to be executed, then the application master is registered, the function is executed and then the application master is deregistered.
This provides a convenient way to run simple Julia applications in a Yarn cluster. E.g.:

```
using Elly

YarnAppMaster() do
    ...
    # execute Julia code
end
```
"""
mutable struct YarnAppMaster
    amrm_conn::YarnAMRMProtocol

    host::AbstractString
    port::Integer
    tracking_url::AbstractString

    max_mem::Int32
    max_cores::Int32
    available_mem::Int32
    available_cores::Int32
    nodes::YarnNodes
    containers::YarnContainers
    queue::AbstractString
    response_id::Int32      # initial value must be 0, update with response_id sent from server on every response
    registration::Union{Nothing,RegisterApplicationMasterResponseProto}
    am_rm_task::Union{Nothing,Task}
    lck::ReentrantLock

    function YarnAppMaster(rmhost::AbstractString, rmport::Integer, ugi::UserGroupInformation=UserGroupInformation(),
                amhost::AbstractString="", amport::Integer=0, amurl::AbstractString="")
        amrm_conn = YarnAMRMProtocol(rmhost, rmport, ugi)

        new(amrm_conn, amhost, amport, amurl, 
            Int32(0), Int32(0), Int32(0), Int32(0),
            YarnNodes(ugi), YarnContainers(),
            "", 0,
            nothing, nothing, ReentrantLock())
    end

    function YarnAppMaster(ugi::UserGroupInformation=UserGroupInformation())
        rmschedaddress = ENV["JULIA_YARN_RESOURCEMANAGER_SCHEDULER_ADDRESS"]
        @debug("got rm address", rmschedaddress)
        parts = split(rmschedaddress, ":")
        host = parts[1]
        schedport = parse(Int, parts[2])
        am = YarnAppMaster(host, schedport, ugi)
        for token in find_tokens(ugi; kind="YARN_AM_RM_TOKEN")
            add_token!(ugi, token_alias(am.amrm_conn.channel), token)
        end
        am
    end
end

function YarnAppMaster(fn::Function, ugi::UserGroupInformation=UserGroupInformation())
    yam = YarnAppMaster(ugi)
    register(yam)
    try
        fn()
    finally
        unregister(yam, true)
    end
end

function show(io::IO, yam::YarnAppMaster)
    show(io, yam.amrm_conn)
    if yam.registration !== nothing
        println(io, "    Memory: available:$(yam.available_mem), max:$(yam.max_mem), can schecule:$(can_schedule_mem(yam))")
        println(io, "    Cores: available:$(yam.available_cores), max:$(yam.max_cores), can schedule:$(can_schedule_cores(yam))")
        println(io, "    Queue: $(yam.queue)")
        show(io, yam.nodes)
        show(io, yam.containers)
    end
end

callback(yam::YarnAppMaster, on_container_alloc::Union{Nothing,Function}, on_container_finish::Union{Nothing,Function}) = 
    callback(yam.containers, on_container_alloc, on_container_finish)

function submit(client::YarnClient, unmanagedappmaster::YarnAppMaster)
    @debug("submitting unmanaged application")
    clc = launchcontext()
    app = submit(client, clc; unmanaged=true)

    # keep the am_rm token
    tok = am_rm_token(app)
    channel = unmanagedappmaster.amrm_conn.channel
    @debug("adding token", alias=token_alias(channel))
    add_token!(channel.ugi, token_alias(channel), tok)

    # register the unmanaged appmaster
    register(unmanagedappmaster)
    wait_for_attempt_state(app, Int32(1), YarnApplicationAttemptStateProto.APP_ATTEMPT_RUNNING) || throw(YarnException("Application attempt could not be launched"))

    # initialize complete node list for appmaster
    nodes(client; nodelist=unmanagedappmaster.nodes)

    app
end

function register(yam::YarnAppMaster)
    inp = RegisterApplicationMasterRequestProto()
    if !isempty(yam.host) && (yam.port > 0)
        setproperty!(inp, :host, yam.host)
        setproperty!(inp, :port, convert(Int32,yam.port))
    end
    !isempty(yam.tracking_url) && setproperty!(inp, :tracking_url, yam.tracking_url)

    resp = lock(yam.lck) do
        registerApplicationMaster(yam.amrm_conn, inp)
    end
    yam.registration = resp

    if hasproperty(resp, :maximumCapability)
        yam.max_mem = resp.maximumCapability.memory
        yam.max_cores = resp.maximumCapability.virtual_cores
    end
    @debug("max capability", mem=yam.max_mem, cores=yam.max_cores)
    if hasproperty(resp, :queue)
        yam.queue = resp.queue
    end

    # start the am_rm processing task on registration if it is a managed application master
    yam.am_rm_task = @async process_am_rm(yam)

    nothing
end

can_schedule_mem(yam::YarnAppMaster) = can_schedule(yam, SchedulerResourceTypes.MEMORY)
can_schedule_cores(yam::YarnAppMaster) = can_schedule(yam, SchedulerResourceTypes.CPU)
function can_schedule(yam::YarnAppMaster, restype::Int32)
    reg = yam.registration
    !hasproperty(reg, :scheduler_resource_types) && (return false)
    restype in reg.scheduler_resource_types
end

function _unregister(yam::YarnAppMaster, finalstatus::Int32, diagnostics::AbstractString)
    inp = FinishApplicationMasterRequestProto(final_application_status=finalstatus)
    !isempty(yam.tracking_url) && setproperty!(inp, :tracking_url, yam.tracking_url)
    !isempty(diagnostics) && setproperty!(inp, :diagnostics, diagnostics)
  
    resp = lock(yam.lck) do
        finishApplicationMaster(yam.amrm_conn, inp)
    end
    resp.isUnregistered && (yam.registration = nothing)
    resp.isUnregistered
end

unregister(yam::YarnAppMaster, success::Bool, diagnostics::AbstractString="") = _unregister(yam, success ? FinalApplicationStatusProto.APP_SUCCEEDED : FinalApplicationStatusProto.APP_FAILED, diagnostics)
kill(yam::YarnAppMaster, diagnostics::AbstractString="") = _unregister(yam, FinalApplicationStatusProto.APP_KILLED, diagnostics)


container_allocate(yam::YarnAppMaster, numcontainers::Int; opts...) = request_alloc(yam.containers, numcontainers; opts...)
container_release(yam::YarnAppMaster, cids::ContainerIdProto...) = request_release(yam.containers, cids...)

container_start(yam::YarnAppMaster, cid::ContainerIdProto, container_spec::ContainerLaunchContextProto) = container_start(yam, container_id_string(cid), container_spec)
container_start(yam::YarnAppMaster, cidstr::String, container_spec::ContainerLaunchContextProto) = container_start(yam, yam.containers.containers[cidstr], container_spec)
function container_start(yam::YarnAppMaster, container::ContainerProto, container_spec::ContainerLaunchContextProto)
    @debug("starting", container)
    req = StartContainerRequestProto(container_launch_context=container_spec, container_token=container.container_token)
    inp = StartContainersRequestProto(start_container_request=[req])

    nodeid = container.nodeId
    nm_conn = get_connection(yam.nodes, nodeid)
    success = false
    resp = StartContainersResponseProto()
    try
        resp = startContainers(nm_conn, inp)
        success = true
    catch ex
        rethrow(ex)
    finally
        release_connection(yam.nodes, nodeid, nm_conn, success)
    end
    success || throw(YarnException("Error starting container"))
    hasproperty(resp, :succeeded_requests) || throw(YarnException(hasproperty(resp,:failed_requests) ? resp.failed_requests[1] : "Error starting container"))
    cid = resp.succeeded_requests[1]
    (cid == container.id) || throw(YarnException("Unexpected container id mismatch"))
    set_busy(yam.containers, cid)
    cid
end

container_stop(yam::YarnAppMaster, cid::ContainerIdProto) = container_stop(yam, container_id_string(cid))
container_stop(yam::YarnAppMaster, cidstr::String) = container_stop(yam, yam.containers.containers[cidstr])
function container_stop(yam::YarnAppMaster, container::ContainerProto)
    @debug("stopping", container)

    inp = StopContainersRequestProto(container_id=[container.id])
    nodeid = container.nodeId
    nm_conn = get_connection(yam.nodes, nodeid)
    success = false
    resp = StopContainersResponseProto()
    try
        resp = stopContainers(nm_conn, inp)
        success = true
    catch ex
        rethrow(ex)
    finally
        release_connection(yam.nodes, nodeid, nm_conn, success)
    end
    success || throw(YarnException("Error stopping container"))
    hasproperty(resp, :succeeded_requests) || throw(YarnException(hasproperty(resp,:failed_requests) ? resp.failed_requests[1] : "Error stopping container"))
    cid = resp.succeeded_requests[1]
    (cid == container.id) || throw(YarnException("Unexpected container id mismatch"))
    set_free(yam.containers, cid)
    cid
end

function _update_rm(yam::YarnAppMaster)
    @debug("started processing am-rm messages")
    inp = AllocateRequestProto()

    # allocation and release requests
    (alloc_pending,release_pending) = torequest(yam.containers)
    @debug("pending", alloc_pending, release_pending)
    !isempty(alloc_pending) && setproperty!(inp, :ask, alloc_pending)
    !isempty(release_pending) && setproperty!(inp, :release, release_pending)

    # send last received response id as response_id in this request
    setproperty!(inp, :response_id, yam.response_id)

    #@debug(inp)
    resp = lock(yam.lck) do
        allocate_resp = allocate(yam.amrm_conn, inp)
        yam.response_id = allocate_resp.response_id # next response id must match this
        allocate_resp
    end
    #@debug(resp)

    # store/update tokens
    channel = yam.amrm_conn.channel
    ugi = channel.ugi
    hasproperty(resp, :am_rm_token) && add_token!(ugi, token_alias(channel), resp.am_rm_token)
    if hasproperty(resp, :nm_tokens)
        for nmtok in resp.nm_tokens
            add_token!(ugi, token_alias(nmtok.nodeId), nmtok.token)
        end
    end

    # update available headroom
    if hasproperty(resp, :limit)
        yam.available_mem = resp.limit.memory
        yam.available_cores = resp.limit.virtual_cores
    end

    # update node and container status
    update(yam.nodes, resp)
    update(yam.containers, resp)
    @debug("finished processing am-rm messages")
    #@debug(yam)
    nothing
end

haverequests(yam::YarnAppMaster) = haverequests(yam.containers)

function process_am_rm(yam::YarnAppMaster)
    @debug("started am-rm processor task")
    stopped = ()->(yam.registration === nothing)
    stopwaiting = ()->(haverequests(yam) || (yam.registration === nothing))
    waittime = 10.
    while !stopped()
        t1 = time()
        _update_rm(yam)
        t2 = time()
        interval = t1 + 60 - t2
        if interval > 0
            timedwait(stopwaiting, interval; pollint=5.0)
            t3 = time()
            waittime = (waittime*5 + (t3 - t2))/6
            (waittime < 10) && sleep(10-waittime)
        end
    end
    @debug("stopped am-rm processor task")
    nothing
end
