using Elly
using Base.Test

function test_yarn()
    yarnclnt = YarnClient("localhost", 8032)
    nnodes = nodecount(yarnclnt)
    @test nnodes > 0
    println("number of yarn nodes: $nnodes")

    nlist = nodes(yarnclnt)
    for n in nlist
        show(STDOUT, n)
    end
end

test_yarn()

