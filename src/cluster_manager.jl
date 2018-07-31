struct YarnManager <: ClusterManager
    ugi::UserGroupInformation
    clnt::YarnClient
    am::YarnAppMaster
    app::YarnApp
    stdout_ios::Vector{IO}
    launch_timeout::Integer
    keep_connected::Bool

    function YarnManager(; kwargs...)
        params = Dict()
        for (n,v) in kwargs
            params[n] = v
        end
        paramkeys = keys(params)
        @debug("YarnManager constructor: params: $params")
        
        user            = (:user            in paramkeys) ? params[:user]           : ""
        rmport          = (:rmport          in paramkeys) ? params[:rmport]         : 8032
        yarnhost        = (:yarnhost        in paramkeys) ? params[:yarnhost]       : "localhost"
        schedport       = (:schedport       in paramkeys) ? params[:schedport]      : 8030
        launch_timeout  = (:launch_timeout  in paramkeys) ? params[:launch_timeout] : 60
        keep_connected  = (:keep_connected  in paramkeys) ? params[:keep_connected] : true

        ugi     = UserGroupInformation(user)
        clnt    = YarnClient(yarnhost, rmport, ugi)
        am      = YarnAppMaster(yarnhost, schedport, ugi)
        app     = submit(clnt, am)

        new(ugi, clnt, am, app, IO[], launch_timeout, keep_connected)
    end
end

function disconnect(yarncm::YarnManager)
    ret = unregister(yarncm.am, true)
end

function show(io::IO, yarncm::YarnManager)
    print(io, "YarnManager for ")
    show(io, yarncm.clnt)
end

function setup_worker(host, port, cookie)
    @debug("YarnManager setup_worker: host:$host port:$port cookie:$cookie for container $(ENV[CONTAINER_ID])")
    c = connect(IPv4(host), port)
    Base.wait_connected(c)
    redirect_stdout(c)
    redirect_stderr(c)
    # identify container id so that rmprocs can clean things up nicely if required
    serialize(c, ENV[CONTAINER_ID])
    if cookie == nothing
        start_worker(c)
    else
        if isa(cookie, Symbol)
            cookie = string(cookie)[8:end] # strip the leading "cookie_"
        end
        start_worker(c, cookie)
    end
end

# used to reconstruct container id object from the environment string
function _container(cid::String)
    parts = split(cid, '_')
    (parts[1] == "container") || throw(YarnException("Invalid container id $cid"))
    cluster_timestamp = parse(Int64, parts[2])
    app_id = parse(Int32, parts[3])
    attempt_id = parse(Int32, parts[4])
    container_id = parse(Int64, parts[5])

    appid_proto = protobuild(ApplicationIdProto, Dict(:id => app_id, :cluster_timestamp => cluster_timestamp))
    app_attempt_id_proto = protobuild(ApplicationAttemptIdProto, Dict(:application_id => appid_proto, :attemptId => attempt_id))
    protobuild(ContainerIdProto, Dict(:app_id => appid_proto, :app_attempt_id => app_attempt_id_proto, :id => container_id))
end

_envdict(envdict::Dict) = envdict
function _envdict(envhash::Base.EnvDict)
    envdict = Dict{String,String}()
    for (n,v) in envhash
        envdict[n] = v
    end
    envdict
end

function _currprocname()
    p = joinpath(Sys.BINDIR, Sys.get_process_title())
    exists(p) && (return p)

    ("_" in keys(ENV)) && contains(ENV["_"], "julia") && (return ENV["_"])

    "julia"
end

function launch(manager::YarnManager, params::Dict, instances_arr::Array, c::Condition)
    @debug("YarnManager launch: params: $params")

    paramkeys   = keys(params)
    np          = (:np       in paramkeys)  ? params[:np]               : 1
    cmd         = (:exename  in paramkeys)  ? params[:exename]          : _currprocname()
    appenv      = (:env      in paramkeys)  ? _envdict(params[:env])    : Dict{String,String}()
    mem         = (:mem      in paramkeys)  ? params[:mem]              : YARN_CONTAINER_MEM_DEFAULT
    cpu         = (:cpu      in paramkeys)  ? params[:cpu]              : YARN_CONTAINER_CPU_DEFAULT
    loc         = (:loc      in paramkeys)  ? params[:loc]              : YARN_CONTAINER_LOCATION_DEFAULT
    priority    = (:priority in paramkeys)  ? params[:priority]         : YARN_CONTAINER_PRIORITY_DEFAULT

    stdout_ios = manager.stdout_ios
    ipaddr = getipaddr()
    (port, server) = listenany(ipaddr, 11000)
    rcv_stdouts = @async begin
        while length(stdout_ios) < np
            sock = accept(server)
            push!(stdout_ios, sock)
        end
    end

    cookie = ":cookie_" * cluster_cookie()
    initargs = "using Elly; Elly.setup_worker($(ipaddr.host), $(port), $(cookie))"
    clc = launchcontext(cmd="$cmd -e '$initargs'", env=appenv)

    @debug("YarnManager launch: initargs: $initargs")
    @debug("YarnManager launch: context: $clc")
    on_alloc = (cid) -> container_start(manager.am, cid, clc)
    callback(manager.am, on_alloc, nothing)

    container_allocate(manager.am, convert(Int, np); mem=mem, cpu=cpu, loc=loc, priority=priority)

    tend = time() + manager.launch_timeout
    while (time() < tend) && !istaskdone(rcv_stdouts)
        sleep(1)
    end

    (length(stdout_ios) == np) || throw(YarnException("Error starting all workers. $(length(stdout_ios)) of $(np) started."))

    configs = WorkerConfig[]
    @sync begin
        for io in manager.stdout_ios
            @async let io=io
                config = WorkerConfig()
                config.io = io

                # keep the container id in userdata to be used with rmprocs if required
                cidstr = deserialize(io)
                userdata = Dict(:container_id => _container(cidstr))
                config.userdata = userdata

                push!(configs, config)
            end
        end
        empty!(manager.stdout_ios)
    end

    append!(instances_arr, configs)
    notify(c)
    nothing
end

function manage(manager::YarnManager, id::Integer, config::WorkerConfig, op::Symbol)
    # This function needs to exist, but so far we don't do anything
    if op == :deregister
        @debug("YarnManager manage: id:$id, op:$op, nprocs:$(nprocs())")
        !manager.keep_connected && (1 == nprocs()) && (@async disconnect(manager))
    end
    nothing
end
