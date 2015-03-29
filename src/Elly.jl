module Elly

using Compat
using ProtoBuf
using URIParser
using CRC
using Crypto
Crypto.init()

import Base: connect, readdir, show, isfile, isdir, islink, stat, filesize, filemode, mtime, mkdir, 
        mv, rm, abspath, cd, pwd, touch, open, nb_available, cp,
        eof, position, seek, seekend, seekstart, skip, read, write, read!, readbytes, readall, close,
        hash, isequal, ==
import ProtoBuf: write_bytes, read_bytes, call_method
import URIParser: URI

export show, convert, URI

export UserGroupInformation, add_token, find_tokens, username

export HDFSClient, HDFSFile, HDFSFileInfo,
        hdfs_server_defaults, hdfs_default_block_size, hdfs_default_replication, hdfs_blocks, hdfs_set_replication,
        hdfs_status, hdfs_capacity, hdfs_capacity_used, hdfs_capacity_remaining, hdfs_renewlease, 
        isfile, isdir, islink, stat, filesize, filemode, mtime, atime, du, exists, readdir,
        mkdir, touch, mv, rm, abspath, cd, pwd, 
        eof, position, seek, seekend, seekstart, skip, nb_available,
        read!, read, write, readbytes, readall, open, close, cp

export YarnClient, YarnNode, YarnAppStatus, YarnAppAttemptStatus, nodecount, nodes, launchcontext, submit, kill, status, attempts, am_rm_token

export YarnAppMaster, register, unregister, kill, can_schedule_mem, can_schedule_cores, container_allocate, container_release

# enable logging only during debugging
using Logging
#const logger = Logging.configure(level=DEBUG)
const logger = Logging.configure(filename="elly.log", level=DEBUG)
logmsg(s) = debug(s)
#logmsg(s) = nothing

include("hadoop/hadoop.jl")
using Elly.hadoop
using Elly.hadoop.common
using Elly.hadoop.hdfs
using Elly.hadoop.yarn

function protohash(v)
    h = 0
    for f in fieldnames(v)
        isfilled(v, f) && (h += hash(getfield(v, f)))
    end
    hash(h)
end

function protoeq{T}(v1::T, v2::T)
    for f in fieldnames(v1)
        (isfilled(v1, f) == isfilled(v2, f)) || (return false)
        if isfilled(v1, f)
            (getfield(v1,f) == getfield(v2,f)) || (return false)
        end
    end
    true
end

function protoisequal{T}(v1::T, v2::T)
    for f in fieldnames(v1)
        (isfilled(v1, f) == isfilled(v2, f)) || (return false)
        if isfilled(v1, f)
            isequal(getfield(v1,f), getfield(v2,f)) || (return false)
        end
    end
    true
end

for t in (:ApplicationAttemptIdProto, :ApplicationIdProto, :ContainerIdProto, :NodeIdProto)
    @eval hash(v::$t) = protohash(v)
    @eval isequal(v1::$t, v2::$t) = protoisequal(v1, v2)
    @eval ==(v1::$t, v2::$t) = protoeq(v1, v2)
end

const ELLY_CLIENTNAME = "elly"

include("ugi.jl")
include("rpc.jl")
include("sasl.jl")
include("api_hdfs_base.jl")
include("api_hdfs_io.jl")

include("envconsts.jl")
include("api_yarn_client.jl")
include("api_yarn_appmaster.jl")

end # module
