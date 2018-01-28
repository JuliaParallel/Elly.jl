# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

struct __enum_XAttrSetFlagProto <: ProtoEnum
    XATTR_CREATE::Int32
    XATTR_REPLACE::Int32
    __enum_XAttrSetFlagProto() = new(1,2)
end #struct __enum_XAttrSetFlagProto
const XAttrSetFlagProto = __enum_XAttrSetFlagProto()

struct __enum_XAttrProto_XAttrNamespaceProto <: ProtoEnum
    USER::Int32
    TRUSTED::Int32
    SECURITY::Int32
    SYSTEM::Int32
    RAW::Int32
    __enum_XAttrProto_XAttrNamespaceProto() = new(0,1,2,3,4)
end #struct __enum_XAttrProto_XAttrNamespaceProto
const XAttrProto_XAttrNamespaceProto = __enum_XAttrProto_XAttrNamespaceProto()

mutable struct XAttrProto <: ProtoType
    namespace::Int32
    name::AbstractString
    value::Array{UInt8,1}
    XAttrProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct XAttrProto
const __req_XAttrProto = Symbol[:namespace,:name]
meta(t::Type{XAttrProto}) = meta(t, __req_XAttrProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::XAttrProto) = ProtoBuf.protohash(v)
isequal(v1::XAttrProto, v2::XAttrProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::XAttrProto, v2::XAttrProto) = ProtoBuf.protoeq(v1, v2)

mutable struct XAttrEditLogProto <: ProtoType
    src::AbstractString
    xAttrs::Vector{XAttrProto}
    XAttrEditLogProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct XAttrEditLogProto
hash(v::XAttrEditLogProto) = ProtoBuf.protohash(v)
isequal(v1::XAttrEditLogProto, v2::XAttrEditLogProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::XAttrEditLogProto, v2::XAttrEditLogProto) = ProtoBuf.protoeq(v1, v2)

mutable struct SetXAttrRequestProto <: ProtoType
    src::AbstractString
    xAttr::XAttrProto
    flag::UInt32
    SetXAttrRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetXAttrRequestProto
const __req_SetXAttrRequestProto = Symbol[:src]
meta(t::Type{SetXAttrRequestProto}) = meta(t, __req_SetXAttrRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::SetXAttrRequestProto) = ProtoBuf.protohash(v)
isequal(v1::SetXAttrRequestProto, v2::SetXAttrRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetXAttrRequestProto, v2::SetXAttrRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct SetXAttrResponseProto <: ProtoType
    SetXAttrResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetXAttrResponseProto
hash(v::SetXAttrResponseProto) = ProtoBuf.protohash(v)
isequal(v1::SetXAttrResponseProto, v2::SetXAttrResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetXAttrResponseProto, v2::SetXAttrResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetXAttrsRequestProto <: ProtoType
    src::AbstractString
    xAttrs::Vector{XAttrProto}
    GetXAttrsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetXAttrsRequestProto
const __req_GetXAttrsRequestProto = Symbol[:src]
meta(t::Type{GetXAttrsRequestProto}) = meta(t, __req_GetXAttrsRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::GetXAttrsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetXAttrsRequestProto, v2::GetXAttrsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetXAttrsRequestProto, v2::GetXAttrsRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetXAttrsResponseProto <: ProtoType
    xAttrs::Vector{XAttrProto}
    GetXAttrsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetXAttrsResponseProto
hash(v::GetXAttrsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetXAttrsResponseProto, v2::GetXAttrsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetXAttrsResponseProto, v2::GetXAttrsResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ListXAttrsRequestProto <: ProtoType
    src::AbstractString
    ListXAttrsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ListXAttrsRequestProto
const __req_ListXAttrsRequestProto = Symbol[:src]
meta(t::Type{ListXAttrsRequestProto}) = meta(t, __req_ListXAttrsRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::ListXAttrsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ListXAttrsRequestProto, v2::ListXAttrsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ListXAttrsRequestProto, v2::ListXAttrsRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ListXAttrsResponseProto <: ProtoType
    xAttrs::Vector{XAttrProto}
    ListXAttrsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ListXAttrsResponseProto
hash(v::ListXAttrsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ListXAttrsResponseProto, v2::ListXAttrsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ListXAttrsResponseProto, v2::ListXAttrsResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct RemoveXAttrRequestProto <: ProtoType
    src::AbstractString
    xAttr::XAttrProto
    RemoveXAttrRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveXAttrRequestProto
const __req_RemoveXAttrRequestProto = Symbol[:src]
meta(t::Type{RemoveXAttrRequestProto}) = meta(t, __req_RemoveXAttrRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)
hash(v::RemoveXAttrRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveXAttrRequestProto, v2::RemoveXAttrRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveXAttrRequestProto, v2::RemoveXAttrRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct RemoveXAttrResponseProto <: ProtoType
    RemoveXAttrResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveXAttrResponseProto
hash(v::RemoveXAttrResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveXAttrResponseProto, v2::RemoveXAttrResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveXAttrResponseProto, v2::RemoveXAttrResponseProto) = ProtoBuf.protoeq(v1, v2)

export XAttrSetFlagProto, XAttrProto_XAttrNamespaceProto, XAttrProto, XAttrEditLogProto, SetXAttrRequestProto, SetXAttrResponseProto, GetXAttrsRequestProto, GetXAttrsResponseProto, ListXAttrsRequestProto, ListXAttrsResponseProto, RemoveXAttrRequestProto, RemoveXAttrResponseProto
