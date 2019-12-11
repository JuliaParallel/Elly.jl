module hadoop
  const _ProtoBuf_Top_ = @static isdefined(parentmodule(@__MODULE__), :_ProtoBuf_Top_) ? (parentmodule(@__MODULE__))._ProtoBuf_Top_ : parentmodule(@__MODULE__)
  module common
    const _ProtoBuf_Top_ = @static isdefined(parentmodule(@__MODULE__), :_ProtoBuf_Top_) ? (parentmodule(@__MODULE__))._ProtoBuf_Top_ : parentmodule(@__MODULE__)
    include("ProtobufRpcEngine_pb.jl")
    include("RpcHeader_pb.jl")
    include("Security_pb.jl")
    include("IpcConnectionContext_pb.jl")
  end
  module hdfs
    const _ProtoBuf_Top_ = @static isdefined(parentmodule(@__MODULE__), :_ProtoBuf_Top_) ? (parentmodule(@__MODULE__))._ProtoBuf_Top_ : parentmodule(@__MODULE__)
    include("hdfs_pb.jl")
    include("datatransfer_pb.jl")
    include("acl_pb.jl")
    include("xattr_pb.jl")
    include("encryption_pb.jl")
    include("inotify_pb.jl")
    include("ClientNamenodeProtocol_pb.jl")
  end
  module yarn
    const _ProtoBuf_Top_ = @static isdefined(parentmodule(@__MODULE__), :_ProtoBuf_Top_) ? (parentmodule(@__MODULE__))._ProtoBuf_Top_ : parentmodule(@__MODULE__)
    include("yarn_protos_pb.jl")
    include("yarn_service_protos_pb.jl")
    include("applicationmaster_protocol_pb.jl")
    include("applicationclient_protocol_pb.jl")
    include("containermanagement_protocol_pb.jl")
    include("application_history_client_pb.jl")
  end
end
