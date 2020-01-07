# Note: Test environment is setup by https://github.com/JuliaCI/PkgEvalHadoopEnv
include("hdfstests.jl")
include("yarntests.jl")

test_ugi()
test_hdfs()
test_credential_tokens()
test_container_id()
test_yarn_client()
test_unmanaged_yarn_clustermanager()
test_managed_yarn_clustermanager()
@info("runtests.jl done")
