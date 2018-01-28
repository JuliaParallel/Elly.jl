using Elly
using Base.Test

function test_yarn(host="localhost", rmport=8032, schedport=8030)
    limitedtestenv = (get(ENV, "CI", "false") == "true")

    yarnclnt = YarnClient(host, rmport)
    nnodes = nodecount(yarnclnt)
    @test nnodes > 0
    println("number of yarn nodes: $nnodes")

    nlist = nodes(yarnclnt)
    show(STDOUT, nlist)

    yarncm = YarnManager(yarnhost=host, rmport=rmport, schedport=schedport, launch_timeout=60);

    addprocs(yarncm; np=1, env=Dict("JULIA_PKGDIR"=>Pkg.dir()));
    @test nprocs() == 2

    if !limitedtestenv
        addprocs(yarncm; np=2, env=Dict("JULIA_PKGDIR"=>Pkg.dir()));
        @test nprocs() == 4
    end

    @everywhere println("hi")
    rmprocs(workers())
    @test nprocs() == 1

    Elly.disconnect(yarncm)
end
