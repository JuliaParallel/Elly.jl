# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta

mutable struct CreateEncryptionZoneRequestProto <: ProtoType
    src::AbstractString
    keyName::AbstractString
    CreateEncryptionZoneRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CreateEncryptionZoneRequestProto
const __req_CreateEncryptionZoneRequestProto = Symbol[:src]
meta(t::Type{CreateEncryptionZoneRequestProto}) = meta(t, __req_CreateEncryptionZoneRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CreateEncryptionZoneResponseProto <: ProtoType
    CreateEncryptionZoneResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CreateEncryptionZoneResponseProto

mutable struct ListEncryptionZonesRequestProto <: ProtoType
    id::Int64
    ListEncryptionZonesRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ListEncryptionZonesRequestProto
const __req_ListEncryptionZonesRequestProto = Symbol[:id]
meta(t::Type{ListEncryptionZonesRequestProto}) = meta(t, __req_ListEncryptionZonesRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct EncryptionZoneProto <: ProtoType
    id::Int64
    path::AbstractString
    suite::Int32
    cryptoProtocolVersion::Int32
    keyName::AbstractString
    EncryptionZoneProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct EncryptionZoneProto
const __req_EncryptionZoneProto = Symbol[:id,:path,:suite,:cryptoProtocolVersion,:keyName]
meta(t::Type{EncryptionZoneProto}) = meta(t, __req_EncryptionZoneProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ListEncryptionZonesResponseProto <: ProtoType
    zones::Base.Vector{EncryptionZoneProto}
    hasMore::Bool
    ListEncryptionZonesResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ListEncryptionZonesResponseProto
const __req_ListEncryptionZonesResponseProto = Symbol[:hasMore]
meta(t::Type{ListEncryptionZonesResponseProto}) = meta(t, __req_ListEncryptionZonesResponseProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetEZForPathRequestProto <: ProtoType
    src::AbstractString
    GetEZForPathRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetEZForPathRequestProto
const __req_GetEZForPathRequestProto = Symbol[:src]
meta(t::Type{GetEZForPathRequestProto}) = meta(t, __req_GetEZForPathRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetEZForPathResponseProto <: ProtoType
    zone::EncryptionZoneProto
    GetEZForPathResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetEZForPathResponseProto

export CreateEncryptionZoneRequestProto, CreateEncryptionZoneResponseProto, ListEncryptionZonesRequestProto, EncryptionZoneProto, ListEncryptionZonesResponseProto, GetEZForPathRequestProto, GetEZForPathResponseProto
