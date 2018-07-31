__precompile__(true)

module Elly

using Compat
using ProtoBuf
using URIParser
using MbedTLS

# using from stdlib
using CRC32c
using Random
using UUIDs
using Base64
using Dates
using Sockets
using Serialization
import Sockets: connect
using Distributed
import Distributed: launch, manage

import Base: readdir, show, isfile, isdir, islink, stat, filesize, filemode, mtime, mkdir, mkpath,
        mv, rm, abspath, cd, pwd, touch, open, bytesavailable, cp, joinpath, dirname,
        eof, position, seek, seekend, seekstart, skip, read, write, read!, close, convert
import ProtoBuf: write_bytes, read_bytes, call_method
import URIParser: URI

export show, convert, URI

export UserGroupInformation, add_token, find_tokens, username

export HDFSClient, HDFSFile, HDFSFileInfo,
        hdfs_server_defaults, hdfs_default_block_size, hdfs_default_replication, hdfs_blocks, hdfs_set_replication,
        hdfs_status, hdfs_capacity, hdfs_capacity_used, hdfs_capacity_remaining, hdfs_renewlease, 
        isfile, isdir, islink, stat, filesize, filemode, mtime, atime, du, exists, readdir,
        mkdir, mkpath, touch, mv, rm, abspath, cd, pwd, joinpath, dirname,
        eof, position, seek, seekend, seekstart, skip, bytesavailable,
        read!, read, write, readbytes, readall, open, close, cp

export YarnClient, YarnNode, YarnApp, YarnAppStatus, YarnAppAttemptStatus, nodecount, nodes, launchcontext, submit, kill, status, attempts, am_rm_token

export YarnAppMaster, register, unregister, kill, can_schedule_mem, can_schedule_cores, container_allocate, container_release, container_start, container_stop, callback

export YarnManager, launch, manage

const Lock = Channel
makelock() = Channel{Int}(1)

include("hadoop/hadoop.jl")
using Elly.hadoop
using Elly.hadoop.common
using Elly.hadoop.hdfs
using Elly.hadoop.yarn

const ELLY_CLIENTNAME = "elly"

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
