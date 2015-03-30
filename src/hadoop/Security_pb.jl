using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

type TokenProto
    identifier::Array{UInt8,1}
    password::Array{UInt8,1}
    kind::AbstractString
    service::AbstractString
    TokenProto() = (o=new(); fillunset(o); o)
end #type TokenProto
const __req_TokenProto = Symbol[:identifier,:password,:kind,:service]
meta(t::Type{TokenProto}) = meta(t, __req_TokenProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::TokenProto) = ProtoBuf.protohash(v)
isequal(v1::TokenProto, v2::TokenProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::TokenProto, v2::TokenProto) = ProtoBuf.protoeq(v1, v2)

type GetDelegationTokenRequestProto
    renewer::AbstractString
    GetDelegationTokenRequestProto() = (o=new(); fillunset(o); o)
end #type GetDelegationTokenRequestProto
const __req_GetDelegationTokenRequestProto = Symbol[:renewer]
meta(t::Type{GetDelegationTokenRequestProto}) = meta(t, __req_GetDelegationTokenRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetDelegationTokenRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetDelegationTokenRequestProto, v2::GetDelegationTokenRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetDelegationTokenRequestProto, v2::GetDelegationTokenRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetDelegationTokenResponseProto
    token::TokenProto
    GetDelegationTokenResponseProto() = (o=new(); fillunset(o); o)
end #type GetDelegationTokenResponseProto
hash(v::GetDelegationTokenResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetDelegationTokenResponseProto, v2::GetDelegationTokenResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetDelegationTokenResponseProto, v2::GetDelegationTokenResponseProto) = ProtoBuf.protoeq(v1, v2)

type RenewDelegationTokenRequestProto
    token::TokenProto
    RenewDelegationTokenRequestProto() = (o=new(); fillunset(o); o)
end #type RenewDelegationTokenRequestProto
const __req_RenewDelegationTokenRequestProto = Symbol[:token]
meta(t::Type{RenewDelegationTokenRequestProto}) = meta(t, __req_RenewDelegationTokenRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RenewDelegationTokenRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RenewDelegationTokenRequestProto, v2::RenewDelegationTokenRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RenewDelegationTokenRequestProto, v2::RenewDelegationTokenRequestProto) = ProtoBuf.protoeq(v1, v2)

type RenewDelegationTokenResponseProto
    newExpiryTime::UInt64
    RenewDelegationTokenResponseProto() = (o=new(); fillunset(o); o)
end #type RenewDelegationTokenResponseProto
const __req_RenewDelegationTokenResponseProto = Symbol[:newExpiryTime]
meta(t::Type{RenewDelegationTokenResponseProto}) = meta(t, __req_RenewDelegationTokenResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RenewDelegationTokenResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RenewDelegationTokenResponseProto, v2::RenewDelegationTokenResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RenewDelegationTokenResponseProto, v2::RenewDelegationTokenResponseProto) = ProtoBuf.protoeq(v1, v2)

type CancelDelegationTokenRequestProto
    token::TokenProto
    CancelDelegationTokenRequestProto() = (o=new(); fillunset(o); o)
end #type CancelDelegationTokenRequestProto
const __req_CancelDelegationTokenRequestProto = Symbol[:token]
meta(t::Type{CancelDelegationTokenRequestProto}) = meta(t, __req_CancelDelegationTokenRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CancelDelegationTokenRequestProto) = ProtoBuf.protohash(v)
isequal(v1::CancelDelegationTokenRequestProto, v2::CancelDelegationTokenRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CancelDelegationTokenRequestProto, v2::CancelDelegationTokenRequestProto) = ProtoBuf.protoeq(v1, v2)

type CancelDelegationTokenResponseProto
    CancelDelegationTokenResponseProto() = (o=new(); fillunset(o); o)
end #type CancelDelegationTokenResponseProto
hash(v::CancelDelegationTokenResponseProto) = ProtoBuf.protohash(v)
isequal(v1::CancelDelegationTokenResponseProto, v2::CancelDelegationTokenResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CancelDelegationTokenResponseProto, v2::CancelDelegationTokenResponseProto) = ProtoBuf.protoeq(v1, v2)

export TokenProto, GetDelegationTokenRequestProto, GetDelegationTokenResponseProto, RenewDelegationTokenRequestProto, RenewDelegationTokenResponseProto, CancelDelegationTokenRequestProto, CancelDelegationTokenResponseProto
