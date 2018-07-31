# Implements the APIs required by an application master to communicate with the resource manager and the node managers.
# The underlying methods are implementations of the following protobuf services:
# - applicationmaster_protocol.proto
# - containermanagement_protocol.proto

# In managed mode, the AMRMToken available in file CONTAINER_TOKEN_FILE_ENV_NAME is in Java serialized format (https://apache.googlesource.com/hadoop-common/+/HADOOP-6685/src/java/org/apache/hadoop/security/Credentials.java).
# Since that is unusable, we are forced to operate only in unmanaged mode, where we get it from the application report.

const YARN_CONTAINER_MEM_DEFAULT = 128
const YARN_CONTAINER_CPU_DEFAULT = 1
const YARN_CONTAINER_LOCATION_DEFAULT = "*"
const YARN_CONTAINER_PRIORITY_DEFAULT = 1
const YARN_NM_CONN_KEEPALIVE_SECS = 5*60


"""
YarnAppMaster is a skeleton application master. It provides the generic scafolding methods which can be used to create specific
application masters for different purposes.
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
    managed::Bool

    response_id::Int32
    
    registration::Union{Nothing,RegisterApplicationMasterResponseProto}
    lck::Lock

    function YarnAppMaster(rmhost::AbstractString, rmport::Integer, ugi::UserGroupInformation,
                amhost::AbstractString="", amport::Integer=0, amurl::AbstractString="")
        amrm_conn = YarnAMRMProtocol(rmhost, rmport, ugi)
        lck = makelock()
        put!(lck, 1)

        new(amrm_conn, amhost, amport, amurl, 
            Int32(0), Int32(0), Int32(0), Int32(0),
            YarnNodes(ugi), YarnContainers(),
            "", true, 1,
            nothing, lck)
    end
end

function withlock(fn, yam)
    try
        take!(yam.lck)
        return fn()
    catch ex
        rethrow(ex)
    finally
        put!(yam.lck, 1)
    end
end

function show(io::IO, yam::YarnAppMaster)
    show(io, yam.amrm_conn)
    println(io, "    Memory: available:$(yam.available_mem), max:$(yam.max_mem), can schecule:$(can_schedule_mem(yam))")
    println(io, "    Cores: available:$(yam.available_cores), max:$(yam.max_cores), can schedule:$(can_schedule_cores(yam))")
    println(io, "    Queue: $(yam.queue)")
    show(io, yam.nodes)
    show(io, yam.containers)
end

callback(yam::YarnAppMaster, on_container_alloc::Union{Nothing,Function}, on_container_finish::Union{Nothing,Function}) = 
    callback(yam.containers, on_container_alloc, on_container_finish)

function submit(client::YarnClient, unmanagedappmaster::YarnAppMaster)
    @debug("submitting unmanaged application")
    clc = launchcontext()
    app = submit(client, clc, YARN_CONTAINER_MEM_DEFAULT, YARN_CONTAINER_CPU_DEFAULT; unmanaged=true)

    # keep the am_rm token
    tok = am_rm_token(app)
    channel = unmanagedappmaster.amrm_conn.channel
    add_token(channel.ugi, token_alias(channel), tok)

    # register the unmanaged appmaster
    unmanagedappmaster.managed = false
    register(unmanagedappmaster)
    wait_for_attempt_state(app, Int32(1), YarnApplicationAttemptStateProto.APP_ATTEMPT_RUNNING) || throw(YarnException("Application attempt could not be launched"))

    # initialize complete node list for appmaster
    nodes(client; nodelist=unmanagedappmaster.nodes)

    # start the am_rm processing task once the app attempt starts running if it is an unmanaged application master
    @async(process_am_rm(unmanagedappmaster))
    app
end

function register(yam::YarnAppMaster)
    inp = RegisterApplicationMasterRequestProto()
    if !isempty(yam.host) && (yam.port > 0)
        set_field!(inp, :host, yam.host)
        set_field!(inp, :port, convert(Int32,yam.port))
    end
    !isempty(yam.tracking_url) && set_field!(inp, :tracking_url, yam.tracking_url)

    resp = withlock(yam) do
        registerApplicationMaster(yam.amrm_conn, inp)
    end
    yam.registration = resp

    if isfilled(resp, :maximumCapability)
        yam.max_mem = resp.maximumCapability.memory
        yam.max_cores = resp.maximumCapability.virtual_cores
    end
    @debug("max capability: mem:$(yam.max_mem), cores:$(yam.max_cores)")
    if isfilled(resp, :queue)
        yam.queue = resp.queue
    end

    # start the am_rm processing task on registration if it is a managed application master
    yam.managed && @async(process_am_rm(yam))
    nothing
end

can_schedule_mem(yam::YarnAppMaster) = can_schedule(yam, SchedulerResourceTypes.MEMORY)
can_schedule_cores(yam::YarnAppMaster) = can_schedule(yam, SchedulerResourceTypes.CPU)
function can_schedule(yam::YarnAppMaster, restype::Int32)
    reg = yam.registration
    !isfilled(reg, :scheduler_resource_types) && (return false)
    restype in reg.scheduler_resource_types
end

function _unregister(yam::YarnAppMaster, finalstatus::Int32, diagnostics::AbstractString)
    inp = protobuild(FinishApplicationMasterRequestProto, Dict(:final_application_status => finalstatus))
    !isempty(yam.tracking_url) && set_field!(inp, :tracking_url, yam.tracking_url)
    !isempty(diagnostics) && set_field!(inp, :diagnostics, diagnostics)
  
    resp = withlock(yam) do
        finishApplicationMaster(yam.amrm_conn, inp)
    end
    resp.isUnregistered && (yam.registration = nothing)
    resp.isUnregistered
end

unregister(yam::YarnAppMaster, success::Bool, diagnostics::AbstractString="") = _unregister(yam, success ? FinalApplicationStatusProto.APP_SUCCEEDED : FinalApplicationStatusProto.APP_FAILED, diagnostics)
kill(yam::YarnAppMaster, diagnostics::AbstractString="") = _unregister(yam, FinalApplicationStatusProto.APP_KILLED, diagnostics)


container_allocate(yam::YarnAppMaster, numcontainers::Int; opts...) = request_alloc(yam.containers, numcontainers; opts...)
container_release(yam::YarnAppMaster, cids::ContainerIdProto...) = request_release(yam.containers, cids...)

container_start(yam::YarnAppMaster, cid::ContainerIdProto, container_spec::ContainerLaunchContextProto) = container_start(yam, yam.containers.containers[cid], container_spec)
function container_start(yam::YarnAppMaster, container::ContainerProto, container_spec::ContainerLaunchContextProto)
    @debug("starting container $(container)")
    req = protobuild(StartContainerRequestProto, Dict(:container_launch_context => container_spec, :container_token => container.container_token))
    inp = protobuild(StartContainersRequestProto, Dict(:start_container_request => [req]))

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
    isfilled(resp, :succeeded_requests) || throw(YarnException(isfilled(resp,:failed_requests) ? resp.failed_requests[1] : "Error starting container"))
    cid = resp.succeeded_requests[1]
    (cid == container.id) || throw(YarnException("Unexpected container id mismatch"))
    set_busy(yam.containers, cid)
    cid
end

container_stop(yam::YarnAppMaster, cid::ContainerIdProto) = container_stop(yam, yam.containers.containers[cid])
function container_stop(yam::YarnAppMaster, container::ContainerProto)
    @debug("stopping container $container")

    inp = protobuild(StopContainersRequestProto, Dict(:container_id => [container.id]))
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
    isfilled(resp, :succeeded_requests) || throw(YarnException(isfilled(resp,:failed_requests) ? resp.failed_requests[1] : "Error stopping container"))
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
    @debug("alloc pending: $alloc_pending")
    @debug("release pending: $release_pending")
    !isempty(alloc_pending) && set_field!(inp, :ask, alloc_pending)
    !isempty(release_pending) && set_field!(inp, :release, release_pending)

    # send one-up response id
    if yam.response_id == typemax(Int32)
        yam.response_id = 1
    else
        yam.response_id += 1
    end
    set_field!(inp, :response_id, yam.response_id)

    #@debug(inp)
    resp = withlock(yam) do
        allocate(yam.amrm_conn, inp)
    end
    #@debug(resp)

    # store/update tokens
    channel = yam.amrm_conn.channel
    ugi = channel.ugi
    isfilled(resp, :am_rm_token) && add_token(ugi, token_alias(channel), resp.am_rm_token)
    if isfilled(resp, :nm_tokens)
        for nmtok in resp.nm_tokens
            add_token(ugi, token_alias(nmtok.nodeId), nmtok.token)
        end
    end

    # update available headroom
    if isfilled(resp, :limit)
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
