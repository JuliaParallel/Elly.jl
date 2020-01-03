"""
The Yarn ClusterManager for Julia.

ugi: UserGroupInformation representing the user to represent (default is current logged in user)
yarnhost: yarn host name
rmport: yarn resource manager port
schedport: yarn scheduler port
launch_timeout: number of seconds to wait until all workers are launched (default is 60, provide larger value for more workers)
keep_connected: if false, YarnManager will disconnect from the cluster once all workers are removed (default true, use false if you do not plan to add more workers after removing all existing workers)
"""
struct YarnManager <: ClusterManager
    ugi::UserGroupInformation
    clnt::YarnClient
    am::YarnAppMaster
    app::YarnApp
    launch_timeout::Integer
    keep_connected::Bool

    function YarnManager(; kwargs...)
        params = Dict(kwargs)
        paramkeys = keys(params)
        @debug("YarnManager constructor", params)
        
        ugi             = (:ugi             in paramkeys) ? params[:ugi]            : UserGroupInformation()
        rmport          = (:rmport          in paramkeys) ? params[:rmport]         : 8032
        yarnhost        = (:yarnhost        in paramkeys) ? params[:yarnhost]       : "localhost"
        schedport       = (:schedport       in paramkeys) ? params[:schedport]      : 8030
        launch_timeout  = (:launch_timeout  in paramkeys) ? params[:launch_timeout] : 60
        keep_connected  = (:keep_connected  in paramkeys) ? params[:keep_connected] : true

        clnt    = YarnClient(yarnhost, rmport, ugi)
        am      = YarnAppMaster(yarnhost, schedport, ugi)
        app     = submit(clnt, am)

        new(ugi, clnt, am, app, launch_timeout, keep_connected)
    end
end

function disconnect(yarncm::YarnManager)
    ret = unregister(yarncm.am, true)
end

function show(io::IO, yarncm::YarnManager)
    print(io, "YarnManager for ")
    show(io, yarncm.clnt)
end

function setup_worker(host, port)
    @debug("YarnManager setup_worker", host, port)

    c = connect(IPv4(host), port)
    if :wait_connected in names(Base; all=true) # < Julia 1.3
        Base.wait_connected(c)
    else
        Sockets.wait_connected(c) # >= Julia 1.3
    end
    # identify container id so that rmprocs can clean things up nicely if required
    serialize(c, ENV["CONTAINER_ID"])

    redirect_stdout(c)
    redirect_stderr(c)

    start_worker(c, ENV["JULIA_YARN_KUKI"])
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

function container_start(manager::YarnManager, cmd::String, env::Dict{String,String}, ipaddr::IPv4, port::UInt16, cid::ContainerIdProto)
    try
        env["JULIA_YARN_KUKI"] = cluster_cookie()

        initargs = "using Elly; Elly.setup_worker($(ipaddr.host), $(port))"

        clc = launchcontext(cmd="$cmd -e '$initargs'", env=env)
        # TODO: do we need to add tokens into clc?

        @debug("YarnManager container_start", initargs, clc)
        container_start(manager.am, cid, clc)
    catch ex
        @error("error starting yarn container", exception=ex)
        rethrow(ex)
    end
end

function launch(manager::YarnManager, params::Dict, instances_arr::Array, c::Condition)
    @debug("YarnManager launch", params)

    paramkeys   = keys(params)
    np          = (:np       in paramkeys)  ? params[:np]               : 1
    cmd         = (:exename  in paramkeys)  ? params[:exename]          : _currprocname()
    appenv      = (:env      in paramkeys)  ? _envdict(params[:env])    : Dict{String,String}()
    mem         = (:mem      in paramkeys)  ? params[:mem]              : YARN_CONTAINER_MEM_DEFAULT
    cpu         = (:cpu      in paramkeys)  ? params[:cpu]              : YARN_CONTAINER_CPU_DEFAULT
    loc         = (:loc      in paramkeys)  ? params[:loc]              : YARN_CONTAINER_LOCATION_DEFAULT
    priority    = (:priority in paramkeys)  ? params[:priority]         : YARN_CONTAINER_PRIORITY_DEFAULT

    acceptors = Task[]
    ipaddr = getipaddr()
    (port, server) = listenany(ipaddr, 11000)
    accept_task = @async begin
        while length(acceptors) < np
            sock = accept(server)
            push!(acceptors, @async begin
                config = WorkerConfig()
                config.io = sock
                # keep the container id in userdata to be used with rmprocs if required
                cidstr = deserialize(sock)
                @debug("got container id string", cidstr)
                cid = parse_container_id(cidstr)
                @debug("got container id", cid)
                config.userdata = Dict(:container_id => cid)
                push!(instances_arr, config)
            end)
        end
    end

    on_alloc = (cid) -> container_start(manager, cmd, appenv, ipaddr, port, cid)
    callback(manager.am, on_alloc, nothing)

    container_allocate(manager.am, convert(Int, np); mem=mem, cpu=cpu, loc=loc, priority=priority)

    timedwait(()->istaskdone(accept_task), Float64(manager.launch_timeout))
    nconnected = 0
    nsuccess = 0
    while !isempty(acceptors)
        acceptor = pop!(acceptors)
        nconnected += 1
        try
            wait(acceptor)
            nsuccess += 1
        catch ex
            @error("Could not decipher worker connection", exception=ex)
        end
    end

    (nconnected == np) || @warn("Not all workers connected back", nconnected, nsuccess, nrequested=np)
    notify(c)
    nothing
end

function manage(manager::YarnManager, id::Integer, config::WorkerConfig, op::Symbol)
    # This function needs to exist, but so far we don't do anything
    if op == :deregister
        @debug("YarnManager manage", id, op, nprocs=nprocs())
        !manager.keep_connected && (1 == nprocs()) && (@async disconnect(manager))
    end
    nothing
end
