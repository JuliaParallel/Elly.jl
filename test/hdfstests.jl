using Elly
using Test
using Random

function test_ugi()
    @info("test UserGroupInformation...")
    ugi = UserGroupInformation()
    @test !isempty(ugi.userinfo.realUser)
    iob = IOBuffer()
    show(iob, ugi)
    @test !isempty(take!(iob))

    ugi = UserGroupInformation(; proxy=true)
    @test !isempty(ugi.userinfo.realUser)
    @test !isempty(ugi.userinfo.effectiveUser)
    iob = IOBuffer()
    show(iob, ugi)
    @test !isempty(take!(iob))

    proxyuser = ugi.userinfo.realUser * "proxy"
    ugi = UserGroupInformation(; proxy=true, proxyuser=proxyuser)
    @test !isempty(ugi.userinfo.realUser)
    @test !isempty(ugi.userinfo.effectiveUser)
    @test ugi.userinfo.effectiveUser == proxyuser
    iob = IOBuffer()
    show(iob, ugi)
    @test !isempty(take!(iob))

    user = ENV["USER"]
    delete!(ENV, "USER")
    @test_throws Exception Elly.default_username()
    ENV["USER"] = user

    nothing
end

function test_hdfs(host="localhost", port=9000)
    limitedtestenv = (get(ENV, "CI", "false") == "true")

    ugi = UserGroupInformation()
    hdfsclnt = HDFSClient(host, port, ugi)

    exists(hdfsclnt, "/tmp") || mkdir(hdfsclnt, "/tmp")

    result = readdir(hdfsclnt, "/")
    @info("listing files in root folder", result)
    @test "tmp" in result

    result = hdfs_server_defaults(hdfsclnt)
    @info("server defaults", result)
    @test hdfs_default_block_size(hdfsclnt) > 0
    @test hdfs_default_replication(hdfsclnt) > 0

    result = hdfs_status(hdfsclnt)
    @info("file system status", result)

    result = hdfs_capacity(hdfsclnt)
    @info("hdfs capacity", result)
    @test result > 0

    result = isdir(hdfsclnt, "/tmp")
    @info("/tmp should be a directory", result)
    @test result

    result = du(hdfsclnt, "/")
    @info("du should be >= 0", result)
    @test result >= 0

    st = stat(hdfsclnt, "/tmp")
    @info("stat /tmp", st)
    @test st.name == "/tmp"

    @info("create a temporary dir...")
    t1 = time()
    cd(hdfsclnt, "/tmp")
    foo_dir = HDFSFile(hdfsclnt, "foo")
    mkdir(foo_dir, Elly.DEFAULT_FOLDER_MODE)
    @info("...done in $(time() - t1) secs")

    @info("create a temporary file...")
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
    @info("...done in $(time() - t1) secs")
    expected_len = length(teststr)*nloops
    actual_len = filesize(bar_file)
    @info("verify file size", expected_len, actual_len=Int(actual_len))
    @test expected_len == actual_len

    @info("touch, move and delete file...")
    touch(bar_file)
    @test isfile(bar_file)
    st = stat(bar_file)
    @info("stat file", st)
    @test st.name == "bar"
    mv(bar_file, "/tmp/foo/bar2")
    bar2_file = HDFSFile("hdfs://$(host):$(port)/tmp/foo/bar2"; ugi=ugi)
    @test isfile(bar2_file)
    rm(bar2_file)

    @info("touch and delete a new file...")
    touch(bar_file)
    @test exists(bar_file)
    @test isfile(bar_file)
    rm(bar_file)

    @info("create a large file...")
    size_bytes = limitedtestenv ? (128 * 10 * 1000) : (128 * 1000 * 1000)
    nloops = limitedtestenv ? 2 : 5
    A = rand(UInt8, size_bytes)
    open(bar_file, "w"; blocksz=UInt64(size_bytes)) do f
        for idx in 1:nloops
            t1 = time()
            write(f, A)
            @info("...block written in $(time() - t1) secs")
        end
    end
    expected_size = sizeof(A) * nloops
    actual_size = filesize(bar_file)
    @info("verify file size", expected_size, actual_size)
    @test expected_size == actual_size

    @info("read and verify...")
    B = Array{UInt8}(undef, size_bytes)
    open(bar_file, "r") do f
        for idx in 1:nloops
            t1 = time()
            read!(f, B)
            @info("...block read in $(time() - t1) secs")
            @test A == B
        end
    end

    @info("read and verify with crc...")
    B = Array{UInt8}(undef, size_bytes)
    open(bar_file, "r"; crc=true) do f
        for idx in 1:nloops
            t1 = time()
            read!(f, B)
            @info("...block read in $(time() - t1) secs")
            @test A == B
        end
    end

    blocks = hdfs_blocks(bar_file)
    @info("file blocks", file=bar_file, blocks)

    @info("setting replication factor for $bar_file")
    @test hdfs_set_replication(bar_file, 2)

    cd(hdfsclnt, "/tmp/foo")
    NFILES = limitedtestenv ? 10 : 1000
    @info("create many ($NFILES) files...")
    for fidx in 1:NFILES
        bar_file = HDFSFile(hdfsclnt, "bar$fidx")
        open(bar_file, "w") do f
            for idx in 1:nloops
                write(f, teststr)
            end
        end
        ((fidx % 10) == 0) && @info("...created file #$fidx")
    end
    @info("reading directory...")
    allfiles = readdir(hdfsclnt, "/tmp/foo")
    @info("delete many ($NFILES) files...")
    for idx in 1:NFILES
        bar_file = HDFSFile(hdfsclnt, "bar$idx")
        rm(bar_file)
        ((idx % 10) == 0) && @info("...deleted file #$idx")
    end
    @test length(allfiles) >= NFILES

    @info("test renew lease")
    hdfs_renewlease(hdfsclnt)
    iob = IOBuffer()
    show(iob, hdfsclnt)
    @test !isempty(take!(iob))

    nothing
end
