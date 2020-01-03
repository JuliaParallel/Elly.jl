using Elly
using Test
using Distributed

function test_credential_tokens()
    token_file = joinpath(@__DIR__, "token", "container_tokens")
    creds = Elly.Credentials()
    Elly.read_credentials!(creds, token_file)
    tokens = find_tokens(creds, alias="YARN_AM_RM_TOKEN")
    @test !isempty(tokens)
    tokens = find_tokens(creds, kind="YARN_AM_RM_TOKEN")
    @test !isempty(tokens)
    nothing
end

function test_container_id()
    cid = Elly.parse_container_id("container_1577681661884_0005_01_000001")
    @test cid.id == 1
    @test cid.app_id.cluster_timestamp == 1577681661884
    @test cid.app_id.id == 5
    @test cid.app_attempt_id.attemptId == 1

    cid = Elly.parse_container_id("container_e17_1410901177871_0001_01_000005")
    @test cid.id == 18691697672197
    @test cid.app_id.cluster_timestamp == 1410901177871
    @test cid.app_id.id == 1
    @test cid.app_attempt_id.attemptId == 1

    nothing
end

function test_yarn(host="localhost", rmport=8032, schedport=8030)
    limitedtestenv = (get(ENV, "CI", "false") == "true")

    yarnclnt = YarnClient(host, rmport)
    nnodes = nodecount(yarnclnt)
    @test nnodes > 0
    println("number of yarn nodes: $nnodes")

    nlist = nodes(yarnclnt)
    show(stdout, nlist)

    yarncm = YarnManager(yarnhost=host, rmport=rmport, schedport=schedport, launch_timeout=60);

    env = Dict{String,String}()
    for envname in ("USER", "LD_LIBRARY_PATH", "USERNAME", "HOME", "PATH", "LOGNAME", "JULIA_LOAD_PATH", "LIBDIR")
        if envname in keys(ENV)
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
    println("starting workers with environment:")
    for (n,v) in env
        println("    - $n => $v")
    end

    addprocs(yarncm; np=1, env=env);
    @test nprocs() == 2

    if !limitedtestenv
        addprocs(yarncm; np=2, env=env);
        @test nprocs() == 4
    end

    @everywhere println("hi")
    rmprocs(workers())
    @test nprocs() == 1

    Elly.disconnect(yarncm)
end
