# Note: Test environment is setup by https://github.com/JuliaCI/PkgEvalHadoopEnv
include("hdfstests.jl")
include("yarntests.jl")

test_hdfs()
test_yarn()
