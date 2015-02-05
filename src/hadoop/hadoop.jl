module hadoop
  module common
    include("ProtobufRpcEngine_pb.jl")
    include("RpcHeader_pb.jl")
    include("Security_pb.jl")
    include("IpcConnectionContext_pb.jl")
  end
  module hdfs
    include("hdfs_pb.jl")
    include("datatransfer_pb.jl")
    include("acl_pb.jl")
    include("xattr_pb.jl")
    include("encryption_pb.jl")
    include("inotify_pb.jl")
    include("ClientNamenodeProtocol_pb.jl")
  end
end
