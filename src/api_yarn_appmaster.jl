#
# Implements the APIs required by an application master to communicate with the resource manager and the node managers.
# The underlying methods are implementations of the following protobuf services:
# - applicationmaster_protocol.proto
# - containermanagement_protocol.proto

# get container id from AM_CONTAINER_ID_ENV env

# two async callback handlers: RMCallbackHandler, NMCallbackHandler

# registerApplicationMaster
# ContainerRequest setupContainerAskForRM setupContainerAskForRM
# onContainersAllocated
# startContainerAsync
# unregisterApplicationMaster

type YarnContainer
    cont::ContainerProto
end

type YarnContainerStatus
    status::ContainerStatusProto
end

type YarnAppMaster
    channel::HadoopRpcChannel
    controller::HadoopRpcController
    stub::ApplicationMasterProtocolServiceBlockingStub

    host::AbstractString
    port::Integer
    tracking_url::AbstractString

    mem::Int32
    cores::Int32

    queue::AbstractString
    
    registration::Nullable{RegisterApplicationMasterResponseProto}
    

    function YarnAppMaster(rmhost::AbstractString, rmport::Integer, user::AbstractString,
                amhost::AbstractString, amport::Integer, amurl::AbstractString)
        channel = HadoopRpcChannel(rmhost, rmport, user, :yarn_appmaster)
        controller = HadoopRpcController(false)
        stub = ApplicationMasterProtocolServiceBlockingStub(channel)

        new(channel, controller, stub, amhost, amport, amurl, 
            Int32(0), Int32(0), "", 
            Nullable{RegisterApplicationMasterResponseProto}())
    end
end

function show(io::IO, client::YarnAppMaster)
    ch = client.channel
    user_spec = isempty(ch.user) ? ch.user : "$(ch.user)@"
    println(io, "YarnAppMaster: $(user_spec)$(ch.host):$(ch.port)/")
    println(io, "    id: $(ch.clnt_id)")
    println(io, "    connected: $(isconnected(ch))")
    nothing
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
        yam.mem = resp.maximumCapability.memory
        yam.cores = resp.maximumCapability.virtual_cores
    end
    if isfilled(resp, :queue)
        yam.queue = resp.queue
    end
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
    resp.isUnregistered
end

unregister(yam::YarnAppMaster, success::Bool, diagnostics::AbstractString="") = _unregister(yam, success ? FinalApplicationStatusProto.APP_SUCCEEDED : FinalApplicationStatusProto.APP_FAILED, diagnostics)
kill(yam::YarnAppMaster, diagnostics::AbstractString="") = _unregister(yam, FinalApplicationStatusProto.APP_KILLED, diagnostics)
