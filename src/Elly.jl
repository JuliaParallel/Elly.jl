module Elly

using Compat
using ProtoBuf
using URIParser
using CRC

import Base: connect, readdir, show, isfile, isdir, islink, stat, filesize, filemode, mtime, mkdir, 
        mv, rm, abspath, cd, pwd, touch, open, nb_available, cp,
        eof, position, seek, seekend, seekstart, skip, read, write, read!, readbytes, readall, close
import ProtoBuf: write_bytes, read_bytes, call_method
import URIParser: URI

export show, convert, URI

export HDFSClient, HDFSFile, HDFSFileInfo,
        hdfs_server_defaults, hdfs_default_block_size, hdfs_default_replication, hdfs_blocks, hdfs_set_replication,
        hdfs_status, hdfs_capacity, hdfs_capacity_used, hdfs_capacity_remaining, hdfs_renewlease, 
        isfile, isdir, islink, stat, filesize, filemode, mtime, atime, du, exists, readdir,
        mkdir, touch, mv, rm, abspath, cd, pwd, 
        eof, position, seek, seekend, seekstart, skip, nb_available,
        read!, read, write, readbytes, readall, open, close, cp

export YarnClient, YarnNode, YarnAppStatus, YarnAppAttemptStatus, nodecount, nodes, launchcontext, submit, kill, status, attempts

# enable logging only during debugging
using Logging
const logger = Logging.configure(level=DEBUG)
#const logger = Logging.configure(filename="elly.log", level=DEBUG)
#logmsg(s) = debug(s)
#logmsg(s) = nothing

include("hadoop/hadoop.jl")
using Elly.hadoop
using Elly.hadoop.common
using Elly.hadoop.hdfs
using Elly.hadoop.yarn

const ELLY_CLIENTNAME = "elly"

include("rpc.jl")
include("api_hdfs_base.jl")
include("api_hdfs_io.jl")
include("api_yarn_client.jl")

end # module
