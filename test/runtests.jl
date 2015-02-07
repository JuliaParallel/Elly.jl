using Elly
using Base.Test

clnt = HDFSClient("localhost", 9000, ENV["USER"])

println("listing files in root folder...")
dirtree = readdir(clnt, "/")
println(dirtree)
@test "tmp" in dirtree

println("getting server defaults...")
defs = hdfs_server_defaults(clnt)
for k in keys(defs)
    println("\t$k => $(defs[k])")
end
@test hdfs_default_block_size(clnt) > 0
@test hdfs_default_replication(clnt) > 0

println("getting file system status...")
fs_status = hdfs_status(clnt)
for k in keys(fs_status)
    println("\t$k => $(fs_status[k])")
end
@test hdfs_capacity(clnt) > 0

println("/tmp should be a directory")
@test isdir(clnt, "/tmp")

println("du should be > 0")
@test du(clnt, "/") > 0

println("stat /tmp")
st = stat(clnt, "/tmp")
println(st)
@test st.name == "/tmp"

println("blocks for /tmp/hadoop-yarn/staging/history/done_intermediate/tan/job_1421916128583_0001.summary")
blocks = hdfs_blocks(clnt, "/tmp/hadoop-yarn/staging/history/done_intermediate/tan/job_1421916128583_0001.summary")
println(blocks)

println("setting replication factor for /tmp/hadoop-yarn/staging/history/done_intermediate/tan/job_1421916128583_0001.summary")
@test hdfs_set_replication(clnt, "/tmp/hadoop-yarn/staging/history/done_intermediate/tan/job_1421916128583_0001.summary", 2)
