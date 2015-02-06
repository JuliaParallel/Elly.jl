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
