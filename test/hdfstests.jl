using Elly
using Base.Test

function test_hdfs()
    hdfsclnt = HDFSClient("localhost", 9000)

    exists(hdfsclnt, "/tmp") || mkdir(hdfsclnt, "/tmp")

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

    println("du should be >= 0")
    @test du(hdfsclnt, "/") >= 0

    println("stat /tmp")
    st = stat(hdfsclnt, "/tmp")
    println(st)
    @test st.name == "/tmp"

    println("create a temporary dir...")
    cd(hdfsclnt, "/tmp")
    foo_dir = HDFSFile(hdfsclnt, "foo")
    mkdir(foo_dir)

    println("create a temporary file...")
    cd(hdfsclnt, "foo")
    bar_file = HDFSFile(hdfsclnt, "bar")
    teststr = "hello world\n"
    nloops = 1000
    tic()
    open(bar_file, "w") do f
        for idx in 1:nloops
            write(f, teststr)
        end
    end
    println("...done in $(toc()) secs")
    println("verify file size to be $(length(teststr)*nloops)...")
    @test filesize(bar_file) == length(teststr) * nloops

    println("delete file...")
    rm(bar_file)
 
    println("create a large file...")
    size_bytes = 128 * 1000 * 1000
    nloops = 5
    A = rand(UInt8, size_bytes)
    open(bar_file, "w") do f
        for idx in 1:nloops
            tic()
            write(f, A)
            println("...block written in $(toc()) secs")
        end
    end
    println("verify file size to be $(sizeof(A) * nloops)...")
    @test filesize(bar_file) == sizeof(A) * nloops

    println("read and verify...")
    B = Array(UInt8, size_bytes)
    open(bar_file, "r") do f
        for idx in 1:nloops
            tic()
            read!(f, B)
            println("...block read in $(toc()) secs")
            @test A == B
        end
    end

    println("blocks for $bar_file")
    blocks = hdfs_blocks(bar_file)
    println(blocks)

    println("setting replication factor for $bar_file")
    @test hdfs_set_replication(bar_file, 2)

    cd(hdfsclnt, "/tmp/foo")
    NFILES = 1000
    println("create many ($NFILES) files...")
    for idx in 1:NFILES
        bar_file = HDFSFile(hdfsclnt, "bar$idx")
        open(bar_file, "w") do f
            for idx in 1:nloops
                write(f, teststr)
            end
        end
    end
    allfiles = readdir(hdfsclnt, "/tmp/foo")
    println("delete many ($NFILES) files...")
    for idx in 1:NFILES
        bar_file = HDFSFile(hdfsclnt, "bar$idx")
        rm(bar_file)
    end
    @test length(allfiles) >= NFILES
end

test_hdfs()
