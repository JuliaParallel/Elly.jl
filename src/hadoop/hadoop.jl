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
  module yarn
    include("yarn_protos_pb.jl")
    include("yarn_service_protos_pb.jl")
    include("applicationmaster_protocol_pb.jl")
    include("applicationclient_protocol_pb.jl")
    include("containermanagement_protocol_pb.jl")
    include("application_history_client_pb.jl")
  end
end
