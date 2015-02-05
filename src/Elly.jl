module Elly

using Compat
using ProtoBuf

import Base: connect, readdir, show
import ProtoBuf: write_bytes, read_bytes, call_method

export HDFSClient, readdir, show

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
# package code goes here

end # module
