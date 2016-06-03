module Elly

using Compat
using ProtoBuf
using URIParser
using CRC

import Base: connect, readdir, show, isfile, isdir, islink, stat, filesize, filemode, mtime, mkdir, mkpath,
        mv, rm, abspath, cd, pwd, touch, open, nb_available, cp, joinpath, dirname,
        eof, position, seek, seekend, seekstart, skip, read, write, read!, readbytes, readall, close,
        launch, manage, convert
import ProtoBuf: write_bytes, read_bytes, call_method
import URIParser: URI

export show, convert, URI

export UserGroupInformation, add_token, find_tokens, username

export HDFSClient, HDFSFile, HDFSFileInfo,
        hdfs_server_defaults, hdfs_default_block_size, hdfs_default_replication, hdfs_blocks, hdfs_set_replication,
        hdfs_status, hdfs_capacity, hdfs_capacity_used, hdfs_capacity_remaining, hdfs_renewlease, 
        isfile, isdir, islink, stat, filesize, filemode, mtime, atime, du, exists, readdir,
        mkdir, mkpath, touch, mv, rm, abspath, cd, pwd, joinpath, dirname,
        eof, position, seek, seekend, seekstart, skip, nb_available,
        read!, read, write, readbytes, readall, open, close, cp

export YarnClient, YarnNode, YarnApp, YarnAppStatus, YarnAppAttemptStatus, nodecount, nodes, launchcontext, submit, kill, status, attempts, am_rm_token

export YarnAppMaster, register, unregister, kill, can_schedule_mem, can_schedule_cores, container_allocate, container_release, container_start, container_stop, callback

export YarnManager, launch, manage

if VERSION < v"0.5.0-"
typealias Lock RemoteRef
makelock() = RemoteRef()
byte2str(x) = bytestring(x)
else
typealias Lock Channel
makelock() = Channel{Int}(1)
byte2str(x) = String(x)
end

function tstr()
    t = time()
    string(Libc.strftime("%Y-%m-%dT%H:%M:%S",t), Libc.strftime("%z",t)[1:end-2], ":", Libc.strftime("%z",t)[end-1:end])
end

# enable logging only during debugging
#using Logging
##const logger = Logging.configure(filename="elly.log", level=DEBUG)
#const logger = Logging.configure(level=DEBUG)
#macro logmsg(s)
#    quote
#        debug("[", myid(), "-", "] ", $(esc(s)))
#    end
#end
macro logmsg(s)
end
#macro logmsg(s)
#    quote
#        info(tstr(), " [", myid(), "-", "] ", $(esc(s)))
#    end
#end

include("hadoop/hadoop.jl")
using Elly.hadoop
using Elly.hadoop.common
using Elly.hadoop.hdfs
using Elly.hadoop.yarn

const ELLY_CLIENTNAME = "elly"

include("digest.jl")
md5init()

include("ugi.jl")
include("rpc.jl")
include("sasl.jl")
include("envconsts.jl")

include("api_hdfs_base.jl")
include("api_hdfs_io.jl")

include("api_yarn_base.jl")
include("api_yarn_client.jl")
include("api_yarn_appmaster.jl")

include("cluster_manager.jl")

end # module
