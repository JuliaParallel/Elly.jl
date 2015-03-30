using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

type CreateEncryptionZoneRequestProto
    src::AbstractString
    keyName::AbstractString
    CreateEncryptionZoneRequestProto() = (o=new(); fillunset(o); o)
end #type CreateEncryptionZoneRequestProto
const __req_CreateEncryptionZoneRequestProto = Symbol[:src]
meta(t::Type{CreateEncryptionZoneRequestProto}) = meta(t, __req_CreateEncryptionZoneRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::CreateEncryptionZoneRequestProto) = ProtoBuf.protohash(v)
isequal(v1::CreateEncryptionZoneRequestProto, v2::CreateEncryptionZoneRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CreateEncryptionZoneRequestProto, v2::CreateEncryptionZoneRequestProto) = ProtoBuf.protoeq(v1, v2)

type CreateEncryptionZoneResponseProto
    CreateEncryptionZoneResponseProto() = (o=new(); fillunset(o); o)
end #type CreateEncryptionZoneResponseProto
hash(v::CreateEncryptionZoneResponseProto) = ProtoBuf.protohash(v)
isequal(v1::CreateEncryptionZoneResponseProto, v2::CreateEncryptionZoneResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::CreateEncryptionZoneResponseProto, v2::CreateEncryptionZoneResponseProto) = ProtoBuf.protoeq(v1, v2)

type ListEncryptionZonesRequestProto
    id::Int64
    ListEncryptionZonesRequestProto() = (o=new(); fillunset(o); o)
end #type ListEncryptionZonesRequestProto
const __req_ListEncryptionZonesRequestProto = Symbol[:id]
meta(t::Type{ListEncryptionZonesRequestProto}) = meta(t, __req_ListEncryptionZonesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ListEncryptionZonesRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ListEncryptionZonesRequestProto, v2::ListEncryptionZonesRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ListEncryptionZonesRequestProto, v2::ListEncryptionZonesRequestProto) = ProtoBuf.protoeq(v1, v2)

type EncryptionZoneProto
    id::Int64
    path::AbstractString
    suite::Int32
    cryptoProtocolVersion::Int32
    keyName::AbstractString
    EncryptionZoneProto() = (o=new(); fillunset(o); o)
end #type EncryptionZoneProto
const __req_EncryptionZoneProto = Symbol[:id,:path,:suite,:cryptoProtocolVersion,:keyName]
meta(t::Type{EncryptionZoneProto}) = meta(t, __req_EncryptionZoneProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::EncryptionZoneProto) = ProtoBuf.protohash(v)
isequal(v1::EncryptionZoneProto, v2::EncryptionZoneProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::EncryptionZoneProto, v2::EncryptionZoneProto) = ProtoBuf.protoeq(v1, v2)

type ListEncryptionZonesResponseProto
    zones::Array{EncryptionZoneProto,1}
    hasMore::Bool
    ListEncryptionZonesResponseProto() = (o=new(); fillunset(o); o)
end #type ListEncryptionZonesResponseProto
const __req_ListEncryptionZonesResponseProto = Symbol[:hasMore]
meta(t::Type{ListEncryptionZonesResponseProto}) = meta(t, __req_ListEncryptionZonesResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ListEncryptionZonesResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ListEncryptionZonesResponseProto, v2::ListEncryptionZonesResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ListEncryptionZonesResponseProto, v2::ListEncryptionZonesResponseProto) = ProtoBuf.protoeq(v1, v2)

type GetEZForPathRequestProto
    src::AbstractString
    GetEZForPathRequestProto() = (o=new(); fillunset(o); o)
end #type GetEZForPathRequestProto
const __req_GetEZForPathRequestProto = Symbol[:src]
meta(t::Type{GetEZForPathRequestProto}) = meta(t, __req_GetEZForPathRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetEZForPathRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetEZForPathRequestProto, v2::GetEZForPathRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetEZForPathRequestProto, v2::GetEZForPathRequestProto) = ProtoBuf.protoeq(v1, v2)

type GetEZForPathResponseProto
    zone::EncryptionZoneProto
    GetEZForPathResponseProto() = (o=new(); fillunset(o); o)
end #type GetEZForPathResponseProto
hash(v::GetEZForPathResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetEZForPathResponseProto, v2::GetEZForPathResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetEZForPathResponseProto, v2::GetEZForPathResponseProto) = ProtoBuf.protoeq(v1, v2)

export CreateEncryptionZoneRequestProto, CreateEncryptionZoneResponseProto, ListEncryptionZonesRequestProto, EncryptionZoneProto, ListEncryptionZonesResponseProto, GetEZForPathRequestProto, GetEZForPathResponseProto
