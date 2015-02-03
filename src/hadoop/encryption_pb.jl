using Compat
using ProtoBuf
import ProtoBuf.meta

type CreateEncryptionZoneRequestProto
    src::AbstractString
    keyName::AbstractString
    CreateEncryptionZoneRequestProto() = (o=new(); fillunset(o); o)
end #type CreateEncryptionZoneRequestProto
const __req_CreateEncryptionZoneRequestProto = Symbol[:src]
meta(t::Type{CreateEncryptionZoneRequestProto}) = meta(t, __req_CreateEncryptionZoneRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type CreateEncryptionZoneResponseProto
    CreateEncryptionZoneResponseProto() = (o=new(); fillunset(o); o)
end #type CreateEncryptionZoneResponseProto

type ListEncryptionZonesRequestProto
    id::Int64
    ListEncryptionZonesRequestProto() = (o=new(); fillunset(o); o)
end #type ListEncryptionZonesRequestProto
const __req_ListEncryptionZonesRequestProto = Symbol[:id]
meta(t::Type{ListEncryptionZonesRequestProto}) = meta(t, __req_ListEncryptionZonesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

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

type ListEncryptionZonesResponseProto
    zones::Array{EncryptionZoneProto,1}
    hasMore::Bool
    ListEncryptionZonesResponseProto() = (o=new(); fillunset(o); o)
end #type ListEncryptionZonesResponseProto
const __req_ListEncryptionZonesResponseProto = Symbol[:hasMore]
meta(t::Type{ListEncryptionZonesResponseProto}) = meta(t, __req_ListEncryptionZonesResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type GetEZForPathRequestProto
    src::AbstractString
    GetEZForPathRequestProto() = (o=new(); fillunset(o); o)
end #type GetEZForPathRequestProto
const __req_GetEZForPathRequestProto = Symbol[:src]
meta(t::Type{GetEZForPathRequestProto}) = meta(t, __req_GetEZForPathRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type GetEZForPathResponseProto
    zone::EncryptionZoneProto
    GetEZForPathResponseProto() = (o=new(); fillunset(o); o)
end #type GetEZForPathResponseProto

export CreateEncryptionZoneRequestProto, CreateEncryptionZoneResponseProto, ListEncryptionZonesRequestProto, EncryptionZoneProto, ListEncryptionZonesResponseProto, GetEZForPathRequestProto, GetEZForPathResponseProto
