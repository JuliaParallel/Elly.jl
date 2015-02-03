using Compat
using ProtoBuf
import ProtoBuf.meta

type TokenProto
    identifier::Array{UInt8,1}
    password::Array{UInt8,1}
    kind::AbstractString
    service::AbstractString
    TokenProto() = (o=new(); fillunset(o); o)
end #type TokenProto
const __req_TokenProto = Symbol[:identifier,:password,:kind,:service]
meta(t::Type{TokenProto}) = meta(t, __req_TokenProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type GetDelegationTokenRequestProto
    renewer::AbstractString
    GetDelegationTokenRequestProto() = (o=new(); fillunset(o); o)
end #type GetDelegationTokenRequestProto
const __req_GetDelegationTokenRequestProto = Symbol[:renewer]
meta(t::Type{GetDelegationTokenRequestProto}) = meta(t, __req_GetDelegationTokenRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type GetDelegationTokenResponseProto
    token::TokenProto
    GetDelegationTokenResponseProto() = (o=new(); fillunset(o); o)
end #type GetDelegationTokenResponseProto

type RenewDelegationTokenRequestProto
    token::TokenProto
    RenewDelegationTokenRequestProto() = (o=new(); fillunset(o); o)
end #type RenewDelegationTokenRequestProto
const __req_RenewDelegationTokenRequestProto = Symbol[:token]
meta(t::Type{RenewDelegationTokenRequestProto}) = meta(t, __req_RenewDelegationTokenRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type RenewDelegationTokenResponseProto
    newExpiryTime::UInt64
    RenewDelegationTokenResponseProto() = (o=new(); fillunset(o); o)
end #type RenewDelegationTokenResponseProto
const __req_RenewDelegationTokenResponseProto = Symbol[:newExpiryTime]
meta(t::Type{RenewDelegationTokenResponseProto}) = meta(t, __req_RenewDelegationTokenResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type CancelDelegationTokenRequestProto
    token::TokenProto
    CancelDelegationTokenRequestProto() = (o=new(); fillunset(o); o)
end #type CancelDelegationTokenRequestProto
const __req_CancelDelegationTokenRequestProto = Symbol[:token]
meta(t::Type{CancelDelegationTokenRequestProto}) = meta(t, __req_CancelDelegationTokenRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type CancelDelegationTokenResponseProto
    CancelDelegationTokenResponseProto() = (o=new(); fillunset(o); o)
end #type CancelDelegationTokenResponseProto

export TokenProto, GetDelegationTokenRequestProto, GetDelegationTokenResponseProto, RenewDelegationTokenRequestProto, RenewDelegationTokenResponseProto, CancelDelegationTokenRequestProto, CancelDelegationTokenResponseProto
