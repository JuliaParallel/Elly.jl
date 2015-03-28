#
# Implements the APIs required by an application master to communicate with the resource manager and the node managers.
# The underlying methods are implementations of the following protobuf services:
# - applicationmaster_protocol.proto
# - containermanagement_protocol.proto

# In managed mode, the AMRMToken available in file CONTAINER_TOKEN_FILE_ENV_NAME is in Java serialized format (https://apache.googlesource.com/hadoop-common/+/HADOOP-6685/src/java/org/apache/hadoop/security/Credentials.java).
# Since that is unusable, we are forced to operate only in unmanaged mode, where we get it from the application report.


# get container id from AM_CONTAINER_ID_ENV env

# two async callback handlers: RMCallbackHandler, NMCallbackHandler

# registerApplicationMaster
# ContainerRequest setupContainerAskForRM setupContainerAskForRM
# onContainersAllocated
# startContainerAsync
# unregisterApplicationMaster

const YARN_CONTAINER_MEM_DEFAULT = 4096
const YARN_CONTAINER_CPU_DEFAULT = 1
const YARN_CONTAINER_LOCATION_DEFAULT = "*"
const YARN_CONTAINER_DEFAULT_PRIORITY = 1
const YARN_NM_CONN_KEEPALIVE_SECS = 5*60

type YarnContainer
    cont::ContainerProto
end

type YarnContainerStatus
    status::ContainerStatusProto
end

@doc doc"""
YarnNodes holds node information as visible to the application master.
It also caches connection to node masters. Connection are reused if they are required before a set keepalivesecs time.
""" ->
type YarnNodes
    count::Int32
    status::Dict{NodeIdProto,NodeReportProto}
    conn::Dict{NodeIdProto,Tuple}
    keepalivesecs::UInt64

    function YarnNodes()
        new(0, Dict{NodeIdProto,NodeReportProto}(), Dict{NodeIdProto,Tuple}(), YARN_NM_CONN_KEEPALIVE_SECS)
    end
end

function show(io::IO, nodes::YarnNodes)
    println(io, "Nodes: $(nodes.count) (connected to $(length(nodes.conn)))")
    nothing
end

function update(nodes::YarnNodes, arp::AllocateResponseProto)
    isfilled(arp, :num_cluster_nodes) && (nodes.count = arp.num_cluster_nodes)
    if isfilled(arp, :updated_nodes)
        for nrep in arp.updated_nodes
            nodes.status[nrep.nodeId] = nrep
        end
    end
    nothing
end

@doc doc"""
RequestPipeline holds entities while they are requested for from yarn resource manager.
Application master thread extracts pending items and requests them from RM, whereupon they are moved on to the requested state.
""" ->
type RequestPipeline{T}
    pending::Vector{T}
    requested::Vector{T}

    function RequestPipeline()
        new(T[], T[])
    end
end

pending{T}(pipe::RequestPipeline{T}, item::T) = push!(pipe, item)
function torequest{T}(pipe::RequestPipeline{T})
    ret = pipe.pending
    if !isempty(ret)
        append!(pipe.requested, ret)
        pipe.pending = T[]
    end
    ret
end
haverequests(pipe::RequestPipeline) = !isempty(pipe.pending)


@doc doc"""
YarnContainers holds all containers related to the application.
It also holds the allocation and release pipelines that are used by application master for requesting actions from resource manager.
Also schedules callbacks as tasks when containers are allocated or terminated.
""" ->
type YarnContainers
    containers::Dict{ContainerIdProto,ContainerProto}
    status::Dict{ContainerIdProto,ContainerStatusProto}
    active::Set{ContainerIdProto}

    alloc_pipeline::RequestPipeline{ResourceRequestProto}
    release_pipeline::RequestPipeline{ContainerIdProto}
    ndesired::Int

    on_container_alloc::Nullable{Function}
    on_container_finish::Nullable{Function}

    function YarnContainers()
        new(Dict{ContainerIdProto,ContainerProto}(), Dict{ContainerIdProto,ContainerStatusProto}(), Set{ContainerIdProto}(),
            RequestPipeline{ResourceRequestProto}(), RequestPipeline{ContainerIdProto}(), 0,
            Nullable{Function}(), Nullable{Function}())
    end
end

function show(io::IO, containers::YarnContainers)
    println(io, "Containers: $(length(containers.active))/$(length(containers.containers)) active")
    nothing
end

function callback(containers::YarnContainers, on_container_alloc::Nullable{Function}, on_container_finish::Nullable{Function})
    containers.on_container_alloc = on_container_alloc
    containers.on_container_finish = on_container_finish
end

function update(containers::YarnContainers, arp::AllocateResponseProto)
    active = containers.active
    status = containers.status
    contlist = containers.containers
    cballoc = containers.on_container_alloc
    cbfinish = containers.on_container_finish

    if isfilled(arp, :allocated_containers)
        for cont in arp.allocated_containers
            id = cont.id
            contlist[id] = cont
            push!(active, id)
            isnull(cballoc) || @async(get(cballoc)(id))
        end
    end
    if isfilled(arp, :completed_container_statuses)
        for contst in arp.completed_container_statuses
            id = contst.container_id
            status[id] = contst
            (id in active) && pop!(active, id)
            isnull(cbfinish) || @async(get(cbfinish)(id))
        end
    end
    nothing
end

function request_alloc(containers::YarnContainers, numcontainers::Int; 
                    mem::Integer=YARN_CONTAINER_MEM_DEFAULT, cpu::Integer=YARN_CONTAINER_CPU_DEFAULT, 
                    loc::AbstractString=YARN_CONTAINER_LOCATION_DEFAULT, priority::Integer=YARN_CONTAINER_PRIORITY_DEFAULT)
    prio = protobuild(PriorityProto, @compat Dict(:priority => priority))
    capability = protobuild(ResourceProto, @compat Dict(:memory => mem, :virtual_cores => cpu))
    req = protobuild(ResourceRequestProto, @compat Dict(:priority => prio,
            :resource_name => loc,
            :num_containers => numcontainers,
            :capability => capability))
    pending(containers.alloc_pipeline, req)
    containers.ndesired += numcontainers
    nothing
end

function request_release(containers::YarnContainers, cids::ContainerIdProto...)
    for cid in cids
        pending(containers.release_pipeline, cid)
    end
    containers.ndesired -= length(cids)
    nothing
end

torequest(containers::YarnContainers) = (torequest(containers.alloc_pipeline), torequest(containers.release_pipeline))
haverequests(containers::YarnContainers) = containers.ndesired != length(containers.active)


@doc doc"""
YarnAppMaster is a skeleton application master. It provides the generic scafolding methods which can be used to create specific
application masters for different purposes.
""" ->
type YarnAppMaster
    channel::HadoopRpcChannel
    controller::HadoopRpcController
    stub::ApplicationMasterProtocolServiceBlockingStub

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
    
    registration::Nullable{RegisterApplicationMasterResponseProto}

    function YarnAppMaster(rmhost::AbstractString, rmport::Integer, ugi::UserGroupInformation,
                amhost::AbstractString="", amport::Integer=0, amurl::AbstractString="")
        channel = HadoopRpcChannel(rmhost, rmport, ugi, :yarn_appmaster)
        controller = HadoopRpcController(false)
        stub = ApplicationMasterProtocolServiceBlockingStub(channel)

        new(channel, controller, stub, amhost, amport, amurl, 
            Int32(0), Int32(0), Int32(0), Int32(0),
            YarnNodes(), YarnContainers(),
            "", true, 1,
            Nullable{RegisterApplicationMasterResponseProto}())
    end
end

function show(io::IO, yam::YarnAppMaster)
    print(io, "YarnAppMaster: ")
    show(io, yam.channel)
    println(io, "    Memory: available:$(yam.available_mem), max:$(yam.max_mem)")
    println(io, "    Cores: available:$(yam.available_cores), max:$(yam.max_cores)")
    println(io, "    Queue: $(yam.queue)")
    show(io, yam.nodes)
    show(io, yam.containers)
end

callback(yam::YarnAppMaster, on_container_alloc::Nullable{Function}, on_container_finish::Nullable{Function}) = 
    callback(yam.containers, on_container_alloc, on_container_finish)

function submit(client::YarnClient, unmanagedappmaster::YarnAppMaster)
    #logmsg("submitting unmanaged application")
    clc = launchcontext()
    app = submit(client, clc, YARN_CONTAINER_MEM_DEFAULT, YARN_CONTAINER_CPU_DEFAULT; unmanaged=true)
    tok = am_rm_token(app)
    add_token(unmanagedappmaster.channel.ugi, token_alias(unmanagedappmaster.channel), tok)
    unmanagedappmaster.managed = false
    register(unmanagedappmaster)
    wait_for_attempt_state(app, Int32(1), YarnApplicationAttemptStateProto.APP_ATTEMPT_RUNNING) || throw(YarnException("Application attempt could not be launched"))

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

    resp = registerApplicationMaster(yam.stub, yam.controller, inp)
    yam.registration = Nullable(resp)

    if isfilled(resp, :maximumCapability)
        yam.max_mem = resp.maximumCapability.memory
        yam.max_cores = resp.maximumCapability.virtual_cores
    end
    #logmsg("max capability: mem:$(yam.max_mem), cores:$(yam.max_cores)")
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
    inp = protobuild(FinishApplicationMasterRequestProto, @compat Dict(:final_application_status => finalstatus))
    !isempty(yam.tracking_url) && set_field!(inp, :tracking_url, yam.tracking_url)
    !isempty(diagnostics) && set_field!(inp, :diagnostics, diagnostics)
   
    resp = finishApplicationMaster(yam.stub, yam.controller, inp)
    resp.isUnregistered && (yam.registration = Nullable{RegisterApplicationMasterResponseProto}())
    resp.isUnregistered
end

unregister(yam::YarnAppMaster, success::Bool, diagnostics::AbstractString="") = _unregister(yam, success ? FinalApplicationStatusProto.APP_SUCCEEDED : FinalApplicationStatusProto.APP_FAILED, diagnostics)
kill(yam::YarnAppMaster, diagnostics::AbstractString="") = _unregister(yam, FinalApplicationStatusProto.APP_KILLED, diagnostics)


container_allocate(yam::YarnAppMaster, numcontainers::Int; opts...) = request_alloc(yam.containers, numcontainers; opts...)
container_release(yam::YarnAppMaster, cids::ContainerIdProto...) = request_release(yam.containers, cids...)

function _update_rm(yam::YarnAppMaster)
    #logmsg("started processing am-rm messages")
    inp = AllocateRequestProto()

    # allocation and release requests
    (alloc_pending,release_pending) = torequest(yam.containers)
    !isempty(alloc_pending) && set_field!(inp, :ask, alloc_pending)
    !isempty(release_pending) && set_field!(inp, :release, release_pending)

    # send one-up response id
    if yam.response_id == typemax(Int32)
        yam.response_id = 1
    else
        yam.response_id += 1
    end
    set_field!(inp, :response_id, yam.response_id)

    resp = allocate(yam.stub, yam.controller, inp)

    # store/update tokens
    ugi = yam.channel.ugi
    isfilled(resp, :am_rm_token) && add_token(ugi, token_alias(yam.channel), resp.am_rm_token)
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
    #logmsg("finished processing am-rm messages")
    #logmsg(yam)
    nothing
end

function process_am_rm(yam::YarnAppMaster)
    #logmsg("started am-rm processor task")
    stopped = ()->isnull(yam.registration)
    stopwaiting = ()->(haverequests(yam.containers) || isnull(yam.registration))
    while !stopped()
        t1 = time()
        _update_rm(yam)
        interval = t1 + 60 - time()
        (interval > 0) && timedwait(stopwaiting, interval; pollint=1.0)
    end
    #logmsg("stopped am-rm processor task")
    nothing
end
