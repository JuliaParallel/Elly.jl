using Elly
using Test
using Distributed

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
