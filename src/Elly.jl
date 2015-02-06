module Elly

using Compat
using ProtoBuf

import Base: connect, readdir, show, isfile, isdir, islink, stat, filesize, filemode, mtime, convert
import ProtoBuf: write_bytes, read_bytes, call_method

export HDFSClient, readdir, show, convert,
        hdfs_server_defaults, hdfs_default_block_size, hdfs_default_replication,
        hdfs_status, hdfs_capacity, hdfs_capacity_used, hdfs_capacity_remaining,
        isfile, isdir, islink, stat, filesize, filemode, mtime, atime, du, exists

# enable logging only during debugging
using Logging
const logger = Logging.configure(level=DEBUG)
#const logger = Logging.configure(filename="elly.log", level=DEBUG)
logmsg(s) = debug(s)
#logmsg(s) = nothing

include("hadoop/hadoop.jl")
using Elly.hadoop
using Elly.hadoop.common
using Elly.hadoop.hdfs

include("rpc.jl")
include("api.jl")

end # module
