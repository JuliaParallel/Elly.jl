using Elly
using Test
using Distributed

function test_credential_tokens()
    @info("testing credential token interpretation")
    token_file = joinpath(@__DIR__, "token", "container_tokens")
    creds = Elly.read_credentials!(token_file)
    tokens = find_tokens(creds, alias="YARN_AM_RM_TOKEN")
    @test !isempty(tokens)
    tokens = find_tokens(creds, kind="YARN_AM_RM_TOKEN")
    @test !isempty(tokens)
    nothing
end

function test_container_id()
    @info("testing container ids")
    cidstr = "container_1577681661884_0005_01_000001"
    cid = Elly.parse_container_id(cidstr)
    @test cid.id == 1
    @test cid.app_id.cluster_timestamp == 1577681661884
    @test cid.app_id.id == 5
    @test cid.app_attempt_id.attemptId == 1
    @test Elly.container_id_string(cid) == cidstr

    cidstr = "container_e17_1410901177871_0001_01_000005"
    cid = Elly.parse_container_id(cidstr)
    @test cid.id == 18691697672197
    @test cid.app_id.cluster_timestamp == 1410901177871
    @test cid.app_id.id == 1
    @test cid.app_attempt_id.attemptId == 1
    @test Elly.container_id_string(cid) == cidstr

    cidstr = "container_e03_1465095377475_0007_02_000001"
    cid = Elly.parse_container_id(cidstr)
    @test cid.id == 3298534883329
    @test cid.app_id.cluster_timestamp == 1465095377475
    @test cid.app_id.id == 7
    @test cid.app_attempt_id.attemptId == 2
    @test Elly.container_id_string(cid) == cidstr

    nothing
end

function test_yarn_client(host="localhost", rmport=8032)
    @info("testing yarn client")
    yarnclnt = YarnClient(host, rmport)
    nnodes = nodecount(yarnclnt)
    @test nnodes > 0
    nlist = nodes(yarnclnt)
    @info("yarn nodes", nnodes, nlist)
    nothing
end

function make_julia_env()
    env = Dict{String,String}()
    for envname in ("USER", "LD_LIBRARY_PATH", "USERNAME", "HOME", "PATH", "LOGNAME", "JULIA_LOAD_PATH", "LIBDIR", "CI")
        if haskey(ENV, envname)
            env[envname] = ENV[envname]
        end
    end
    if !("JULIA_LOAD_PATH" in keys(env))
        home = ENV["HOME"]
        env["JULIA_LOAD_PATH"] = join(Base.LOAD_PATH, ':') * ":$(home)/.julia/dev:$(home)/.julia/packages"
    end
    if !("JULIA_DEPOT_PATH" in keys(env))
        env["JULIA_DEPOT_PATH"] = join(Base.DEPOT_PATH, ':')
    end
    env
end

function test_yarn_clustermanager(yarncm::YarnManager, limitedtestenv::Bool)
    env = make_julia_env()
    @info("starting workers with environment", env)

    addprocs(yarncm; np=1, env=env);
    @test nprocs() == 2

    if !limitedtestenv
        addprocs(yarncm; np=2, env=env);
        @test nprocs() == 4
    end

    @everywhere println("hi")
    rmprocs(workers())
    @test nprocs() == 1
    nothing
end

function test_unmanaged_yarn_clustermanager(host="localhost", rmport=8032, schedport=8030)
    @info("testing unmanaged yarn clustermanager")
    limitedtestenv = (get(ENV, "CI", "false") == "true")
    YarnManager(yarnhost=host, rmport=rmport, schedport=schedport, launch_timeout=60) do yarncm
        test_yarn_clustermanager(yarncm, limitedtestenv)
    end
    nothing
end

function test_managed_yarn_clustermanager(host="localhost", rmport=8032, schedport=8030)
    @info("testing managed yarn clustermanager")
    ugi = UserGroupInformation()
    clnt = YarnClient(host, rmport, ugi)

    env = make_julia_env()
    @info("starting managed julia with environment", env)

    testscript = joinpath(@__DIR__, "yarnmanagedcm.jl")
    app = submit(clnt, [Elly._currprocname(), testscript], env; schedaddr="$(host):$(schedport)")
    Elly.wait_for_state(app, Elly.YarnApplicationStateProto.FINISHED)
    @info("app complete", status=status(app))
    @test isfile("/tmp/ellytest.log")
    @info("app output", testlogs=read("/tmp/ellytest.log", String))
    nothing
end

function run_managed_yarn_clustermanager()
    limitedtestenv = (get(ENV, "CI", "false") == "true")
    YarnManager(launch_timeout=60, unmanaged=false) do yarncm
        test_yarn_clustermanager(yarncm, limitedtestenv)
    end
    nothing
end
