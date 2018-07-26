# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta

mutable struct TokenProto <: ProtoType
    identifier::Array{UInt8,1}
    password::Array{UInt8,1}
    kind::AbstractString
    service::AbstractString
    TokenProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct TokenProto
const __req_TokenProto = Symbol[:identifier,:password,:kind,:service]
meta(t::Type{TokenProto}) = meta(t, __req_TokenProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetDelegationTokenRequestProto <: ProtoType
    renewer::AbstractString
    GetDelegationTokenRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetDelegationTokenRequestProto
const __req_GetDelegationTokenRequestProto = Symbol[:renewer]
meta(t::Type{GetDelegationTokenRequestProto}) = meta(t, __req_GetDelegationTokenRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetDelegationTokenResponseProto <: ProtoType
    token::TokenProto
    GetDelegationTokenResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetDelegationTokenResponseProto

mutable struct RenewDelegationTokenRequestProto <: ProtoType
    token::TokenProto
    RenewDelegationTokenRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RenewDelegationTokenRequestProto
const __req_RenewDelegationTokenRequestProto = Symbol[:token]
meta(t::Type{RenewDelegationTokenRequestProto}) = meta(t, __req_RenewDelegationTokenRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RenewDelegationTokenResponseProto <: ProtoType
    newExpiryTime::UInt64
    RenewDelegationTokenResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RenewDelegationTokenResponseProto
const __req_RenewDelegationTokenResponseProto = Symbol[:newExpiryTime]
meta(t::Type{RenewDelegationTokenResponseProto}) = meta(t, __req_RenewDelegationTokenResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CancelDelegationTokenRequestProto <: ProtoType
    token::TokenProto
    CancelDelegationTokenRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CancelDelegationTokenRequestProto
const __req_CancelDelegationTokenRequestProto = Symbol[:token]
meta(t::Type{CancelDelegationTokenRequestProto}) = meta(t, __req_CancelDelegationTokenRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CancelDelegationTokenResponseProto <: ProtoType
    CancelDelegationTokenResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CancelDelegationTokenResponseProto

export TokenProto, GetDelegationTokenRequestProto, GetDelegationTokenResponseProto, RenewDelegationTokenRequestProto, RenewDelegationTokenResponseProto, CancelDelegationTokenRequestProto, CancelDelegationTokenResponseProto
