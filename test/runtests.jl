# Note: Test environment is setup by https://github.com/JuliaCI/PkgEvalHadoopEnv
include("hdfstests.jl")
include("yarntests.jl")

test_ugi()
test_hdfs()
test_credential_tokens()
test_yarn()
