using Elly
using Base.Test

function test_hdfs()
    hdfsclnt = HDFSClient("localhost", 9000)

    println("listing files in root folder...")
    dirtree = readdir(hdfsclnt, "/")
    println(dirtree)
    @test "tmp" in dirtree

    println("getting server defaults...")
    defs = hdfs_server_defaults(hdfsclnt)
    for k in keys(defs)
        println("\t$k => $(defs[k])")
    end
    @test hdfs_default_block_size(hdfsclnt) > 0
    @test hdfs_default_replication(hdfsclnt) > 0

    println("getting file system status...")
    fs_status = hdfs_status(hdfsclnt)
    for k in keys(fs_status)
        println("\t$k => $(fs_status[k])")
    end
    @test hdfs_capacity(hdfsclnt) > 0

    println("/tmp should be a directory")
    @test isdir(hdfsclnt, "/tmp")

    println("du should be > 0")
    @test du(hdfsclnt, "/") > 0

    println("stat /tmp")
    st = stat(hdfsclnt, "/tmp")
    println(st)
    @test st.name == "/tmp"

    println("blocks for /tmp/hadoop-yarn/staging/history/done_intermediate/tan/job_1421916128583_0001.summary")
    blocks = hdfs_blocks(hdfsclnt, "/tmp/hadoop-yarn/staging/history/done_intermediate/tan/job_1421916128583_0001.summary")
    println(blocks)

    println("setting replication factor for /tmp/hadoop-yarn/staging/history/done_intermediate/tan/job_1421916128583_0001.summary")
    @test hdfs_set_replication(hdfsclnt, "/tmp/hadoop-yarn/staging/history/done_intermediate/tan/job_1421916128583_0001.summary", 2)
end

test_hdfs()
