using Elly
using Test
using Random

function test_hdfs(host="localhost", port=9000)
    limitedtestenv = (get(ENV, "CI", "false") == "true")

    hdfsclnt = HDFSClient(host, port)

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
    mkdir(foo_dir, Elly.DEFAULT_FOLDER_MODE)

    println("create a temporary file...")
    cd(hdfsclnt, "foo")
    bar_file = HDFSFile(hdfsclnt, "bar")
    teststr = "hello world\n"
    nloops = 1000
    t1 = time()
    open(bar_file, "w") do f
        for idx in 1:nloops
            write(f, teststr)
        end
    end
    println("...done in $(time() - t1) secs")
    println("verify file size to be $(length(teststr)*nloops)...")
    @test filesize(bar_file) == length(teststr) * nloops

    println("touch, move and delete file...")
    touch(bar_file)
    @test isfile(bar_file)
    st = stat(bar_file)
    println(st)
    @test st.name == "bar"
    mv(bar_file, "/tmp/foo/bar2")
    bar2_file = HDFSFile("hdfs://$(host):$(port)/tmp/foo/bar2")
    @test isfile(bar2_file)
    rm(bar2_file)

    println("touch and delete a new file...")
    touch(bar_file)
    @test exists(bar_file)
    @test isfile(bar_file)
    rm(bar_file)

    println("create a large file...")
    size_bytes = limitedtestenv ? (128 * 10 * 1000) : (128 * 1000 * 1000)
    nloops = limitedtestenv ? 2 : 5
    A = rand(UInt8, size_bytes)
    open(bar_file, "w"; blocksz=UInt64(size_bytes)) do f
        for idx in 1:nloops
            t1 = time()
            write(f, A)
            println("...block written in $(time() - t1) secs")
        end
    end
    println("verify file size to be $(sizeof(A) * nloops)...")
    @test filesize(bar_file) == sizeof(A) * nloops

    println("read and verify...")
    B = Array{UInt8}(undef, size_bytes)
    open(bar_file, "r") do f
        for idx in 1:nloops
            t1 = time()
            read!(f, B)
            println("...block read in $(time() - t1) secs")
            @test A == B
        end
    end

    println("read and verify with crc...")
    B = Array{UInt8}(undef, size_bytes)
    open(bar_file, "r"; crc=true) do f
        for idx in 1:nloops
            t1 = time()
            read!(f, B)
            println("...block read in $(time() - t1) secs")
            @test A == B
        end
    end

    println("blocks for $bar_file")
    blocks = hdfs_blocks(bar_file)
    println(blocks)

    println("setting replication factor for $bar_file")
    @test hdfs_set_replication(bar_file, 2)

    cd(hdfsclnt, "/tmp/foo")
    NFILES = limitedtestenv ? 10 : 1000
    println("create many ($NFILES) files...")
    for fidx in 1:NFILES
        bar_file = HDFSFile(hdfsclnt, "bar$fidx")
        open(bar_file, "w") do f
            for idx in 1:nloops
                write(f, teststr)
            end
        end
        ((fidx % 10) == 0) && println("...created file #$fidx")
    end
    println("reading directory...")
    allfiles = readdir(hdfsclnt, "/tmp/foo")
    println("delete many ($NFILES) files...")
    for idx in 1:NFILES
        bar_file = HDFSFile(hdfsclnt, "bar$idx")
        rm(bar_file)
        ((idx % 10) == 0) && println("...deleted file #$idx")
    end
    @test length(allfiles) >= NFILES

    println("test renew lease")
    hdfs_renewlease(hdfsclnt)
    iob = IOBuffer()
    show(iob, hdfsclnt)
    @test !isempty(take!(iob))

    nothing
end
