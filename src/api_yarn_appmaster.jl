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
    managed::Bool
    
    registration::Nullable{RegisterApplicationMasterResponseProto}
    

    function YarnAppMaster(rmhost::AbstractString, rmport::Integer, ugi::UserGroupInformation,
                amhost::AbstractString="", amport::Integer=0, amurl::AbstractString="")
        channel = HadoopRpcChannel(rmhost, rmport, ugi, :yarn_appmaster)
        controller = HadoopRpcController(false)
        stub = ApplicationMasterProtocolServiceBlockingStub(channel)

        new(channel, controller, stub, amhost, amport, amurl, 
            Int32(0), Int32(0), "",
            true, Nullable{RegisterApplicationMasterResponseProto}())
    end
end

function show(io::IO, client::YarnAppMaster)
    print(io, "YarnAppMaster: ")
    show(io, client.channel)
end

function submit(client::YarnClient, unmanagedappmaster::YarnAppMaster)
    #logmsg("submitting unmanaged application")
    clc = launchcontext()
    app = submit(client, clc, 4096, 1; unmanaged=true)
    tok = am_rm_token(app)
    add_token(unmanagedappmaster.channel.ugi, token_alias(unmanagedappmaster.channel), tok)
    unmanagedappmaster.managed = false
    register(unmanagedappmaster)
    wait_for_attempt_state(app, Int32(1), YarnApplicationAttemptStateProto.APP_ATTEMPT_RUNNING) || throw(YarnException("Application attempt could not be launched"))
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
