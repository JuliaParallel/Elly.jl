using Logging
include("yarntests.jl")
open("/tmp/ellytest.log", "a") do io
    global_logger(SimpleLogger(io, Logging.Info))
    run_managed_yarn_clustermanager()
end
