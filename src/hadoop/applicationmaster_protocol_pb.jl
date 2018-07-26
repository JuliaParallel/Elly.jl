# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta

# service methods for ApplicationMasterProtocolService
const _ApplicationMasterProtocolService_methods = MethodDescriptor[
        MethodDescriptor("registerApplicationMaster", 1, hadoop.yarn.RegisterApplicationMasterRequestProto, hadoop.yarn.RegisterApplicationMasterResponseProto),
        MethodDescriptor("finishApplicationMaster", 2, hadoop.yarn.FinishApplicationMasterRequestProto, hadoop.yarn.FinishApplicationMasterResponseProto),
        MethodDescriptor("allocate", 3, hadoop.yarn.AllocateRequestProto, hadoop.yarn.AllocateResponseProto)
    ] # const _ApplicationMasterProtocolService_methods
const _ApplicationMasterProtocolService_desc = ServiceDescriptor("hadoop.yarn.ApplicationMasterProtocolService", 1, _ApplicationMasterProtocolService_methods)

ApplicationMasterProtocolService(impl::Module) = ProtoService(_ApplicationMasterProtocolService_desc, impl)

mutable struct ApplicationMasterProtocolServiceStub <: AbstractProtoServiceStub{false}
    impl::ProtoServiceStub
    ApplicationMasterProtocolServiceStub(channel::ProtoRpcChannel) = new(ProtoServiceStub(_ApplicationMasterProtocolService_desc, channel))
end # mutable struct ApplicationMasterProtocolServiceStub

mutable struct ApplicationMasterProtocolServiceBlockingStub <: AbstractProtoServiceStub{true}
    impl::ProtoServiceBlockingStub
    ApplicationMasterProtocolServiceBlockingStub(channel::ProtoRpcChannel) = new(ProtoServiceBlockingStub(_ApplicationMasterProtocolService_desc, channel))
end # mutable struct ApplicationMasterProtocolServiceBlockingStub

registerApplicationMaster(stub::ApplicationMasterProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.RegisterApplicationMasterRequestProto, done::Function) = call_method(stub.impl, _ApplicationMasterProtocolService_methods[1], controller, inp, done)
registerApplicationMaster(stub::ApplicationMasterProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.RegisterApplicationMasterRequestProto) = call_method(stub.impl, _ApplicationMasterProtocolService_methods[1], controller, inp)

finishApplicationMaster(stub::ApplicationMasterProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.FinishApplicationMasterRequestProto, done::Function) = call_method(stub.impl, _ApplicationMasterProtocolService_methods[2], controller, inp, done)
finishApplicationMaster(stub::ApplicationMasterProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.FinishApplicationMasterRequestProto) = call_method(stub.impl, _ApplicationMasterProtocolService_methods[2], controller, inp)

allocate(stub::ApplicationMasterProtocolServiceStub, controller::ProtoRpcController, inp::hadoop.yarn.AllocateRequestProto, done::Function) = call_method(stub.impl, _ApplicationMasterProtocolService_methods[3], controller, inp, done)
allocate(stub::ApplicationMasterProtocolServiceBlockingStub, controller::ProtoRpcController, inp::hadoop.yarn.AllocateRequestProto) = call_method(stub.impl, _ApplicationMasterProtocolService_methods[3], controller, inp)

export ApplicationMasterProtocolService, ApplicationMasterProtocolServiceStub, ApplicationMasterProtocolServiceBlockingStub, registerApplicationMaster, finishApplicationMaster, allocate
