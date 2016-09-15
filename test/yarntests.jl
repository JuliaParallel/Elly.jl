using Elly
using Base.Test

function test_yarn(host="localhost", port=8032)
    yarnclnt = YarnClient(host, port)
    nnodes = nodecount(yarnclnt)
    @test nnodes > 0
    println("number of yarn nodes: $nnodes")

    nlist = nodes(yarnclnt)
    show(STDOUT, nlist)
end
