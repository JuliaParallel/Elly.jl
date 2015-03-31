## Using HDFS with Elly

The sections below show a some simple examples and cover most of the APIs available. A complete API documentation is not available yet.

### Connecting to HDFS
A connection is represented as `HDFSClient`. It is essentially a connection to the namenode, and all Elly APIs require this to be provided directly or indirectly.

````
julia> using Elly

julia> dfs = HDFSClient("localhost", 9000)
HDFSClient: hdfs://hdfs@localhost:9000/
    id: 3c9f6059-7e35-44
    connected: false
    pwd: /
````

In the example above, `dfs` is the instance of `HDFSClient` which needs to be used with other APIs. It will be connected automatically on first use. The dfs working directory is set to `/` on a new client.

### Navigating the DFS
The DFS can be navigated using the same Julia APIs as used for a traditional file system, except that the DFS equivalents need the `HDFSClient` connection to be passed to them.

````
...
julia> pwd(dfs)
"/"

julia> readdir(dfs)
5-element Array{AbstractString,1}:
 "testdir" 
 "tmp"     
 "user"    
 "x"       
 
julia> cd(dfs, "tmp")
"/tmp"

julia> mkdir(dfs, "foo")
true

julia> cd(dfs, "foo")
"/tmp/foo"
...
````

### Files on DFS
A file on the DFS is identified by a combination of an `HDFSClient` instance (to identify the DFS) and a path. A relative path will be resolved using the directory context as present in the associated `HDFSClient` instance. An `HDFSFile` instance can be created either by passing an `HDFSClient` and `path` or by providing a HDFS URL.

All familiar Julia APIs work on a `HDFSFile`.

````
...
julia> bar_file = HDFSFile(dfs, "bar")
HDFSFile: hdfs://userid@localhost:9000/tmp/foo/bar

julia> touch(bar_file)

julia> stat(bar_file)
HDFSFileInfo: bar
    type: file
    size: 0
    block_sz: 134217728
    owner: userid
    group: supergroup

julia> isfile(bar_file)
true
...
````

### File IO
At present Elly supports only reading and writing files (appends are not yet supported). Most Julia file IO methods work with HDFS files. There are a few differences to keep in mind though. When a file is opened for write, a lease for the file is obtained from the namenode. The lease must be updated periodically. If the file is actively being written to, or if the application often `yields` control to other tasks, the lease will be renewed automatically. Otherwise, the `renewlease` API must be called periodically (depends on the DFS configuration, but usually once in 10 minutes).

````
...

julia> baz_file = HDFSFile(dfs, "baz.txt")
HDFSFile: hdfs://userid@localhost:9000/tmp/foo/baz.txt

julia> cp("baz.txt", baz_file)

julia> stat(baz_file)
HDFSFileInfo: baz.txt
    type: file
    size: 76
    block_sz: 134217728
    owner: userid
    group: supergroup

julia> open(bar_file, "w") do f
           write(f, b"hello world")
       end
0x000000000000000b

julia> open(bar_file, "r") do f
           bytes = Array(UInt8, filesize(f))
           read!(f, bytes)
           println(bytestring(bytes))
       end
hello world
````

