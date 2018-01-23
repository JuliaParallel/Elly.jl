using Compat
using ProtoBuf
import ProtoBuf.meta
import Base: hash, isequal, ==

mutable struct __enum_XAttrSetFlagProto <: ProtoEnum
    XATTR_CREATE::Int32
    XATTR_REPLACE::Int32
    __enum_XAttrSetFlagProto() = new(1,2)
end #type __enum_XAttrSetFlagProto
const XAttrSetFlagProto = __enum_XAttrSetFlagProto()

mutable struct __enum_XAttrProto_XAttrNamespaceProto <: ProtoEnum
    USER::Int32
    TRUSTED::Int32
    SECURITY::Int32
    SYSTEM::Int32
    RAW::Int32
    __enum_XAttrProto_XAttrNamespaceProto() = new(0,1,2,3,4)
end #type __enum_XAttrProto_XAttrNamespaceProto
const XAttrProto_XAttrNamespaceProto = __enum_XAttrProto_XAttrNamespaceProto()

mutable struct XAttrProto
    namespace::Int32
    name::AbstractString
    value::Array{UInt8,1}
    XAttrProto() = (o=new(); fillunset(o); o)
end #type XAttrProto
const __req_XAttrProto = Symbol[:namespace,:name]
meta(t::Type{XAttrProto}) = meta(t, __req_XAttrProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::XAttrProto) = ProtoBuf.protohash(v)
isequal(v1::XAttrProto, v2::XAttrProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::XAttrProto, v2::XAttrProto) = ProtoBuf.protoeq(v1, v2)

mutable struct XAttrEditLogProto
    src::AbstractString
    xAttrs::Array{XAttrProto,1}
    XAttrEditLogProto() = (o=new(); fillunset(o); o)
end #type XAttrEditLogProto
hash(v::XAttrEditLogProto) = ProtoBuf.protohash(v)
isequal(v1::XAttrEditLogProto, v2::XAttrEditLogProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::XAttrEditLogProto, v2::XAttrEditLogProto) = ProtoBuf.protoeq(v1, v2)

mutable struct SetXAttrRequestProto
    src::AbstractString
    xAttr::XAttrProto
    flag::UInt32
    SetXAttrRequestProto() = (o=new(); fillunset(o); o)
end #type SetXAttrRequestProto
const __req_SetXAttrRequestProto = Symbol[:src]
meta(t::Type{SetXAttrRequestProto}) = meta(t, __req_SetXAttrRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::SetXAttrRequestProto) = ProtoBuf.protohash(v)
isequal(v1::SetXAttrRequestProto, v2::SetXAttrRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetXAttrRequestProto, v2::SetXAttrRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct SetXAttrResponseProto
    SetXAttrResponseProto() = (o=new(); fillunset(o); o)
end #type SetXAttrResponseProto
hash(v::SetXAttrResponseProto) = ProtoBuf.protohash(v)
isequal(v1::SetXAttrResponseProto, v2::SetXAttrResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::SetXAttrResponseProto, v2::SetXAttrResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetXAttrsRequestProto
    src::AbstractString
    xAttrs::Array{XAttrProto,1}
    GetXAttrsRequestProto() = (o=new(); fillunset(o); o)
end #type GetXAttrsRequestProto
const __req_GetXAttrsRequestProto = Symbol[:src]
meta(t::Type{GetXAttrsRequestProto}) = meta(t, __req_GetXAttrsRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::GetXAttrsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::GetXAttrsRequestProto, v2::GetXAttrsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetXAttrsRequestProto, v2::GetXAttrsRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct GetXAttrsResponseProto
    xAttrs::Array{XAttrProto,1}
    GetXAttrsResponseProto() = (o=new(); fillunset(o); o)
end #type GetXAttrsResponseProto
hash(v::GetXAttrsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::GetXAttrsResponseProto, v2::GetXAttrsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::GetXAttrsResponseProto, v2::GetXAttrsResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ListXAttrsRequestProto
    src::AbstractString
    ListXAttrsRequestProto() = (o=new(); fillunset(o); o)
end #type ListXAttrsRequestProto
const __req_ListXAttrsRequestProto = Symbol[:src]
meta(t::Type{ListXAttrsRequestProto}) = meta(t, __req_ListXAttrsRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::ListXAttrsRequestProto) = ProtoBuf.protohash(v)
isequal(v1::ListXAttrsRequestProto, v2::ListXAttrsRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ListXAttrsRequestProto, v2::ListXAttrsRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct ListXAttrsResponseProto
    xAttrs::Array{XAttrProto,1}
    ListXAttrsResponseProto() = (o=new(); fillunset(o); o)
end #type ListXAttrsResponseProto
hash(v::ListXAttrsResponseProto) = ProtoBuf.protohash(v)
isequal(v1::ListXAttrsResponseProto, v2::ListXAttrsResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::ListXAttrsResponseProto, v2::ListXAttrsResponseProto) = ProtoBuf.protoeq(v1, v2)

mutable struct RemoveXAttrRequestProto
    src::AbstractString
    xAttr::XAttrProto
    RemoveXAttrRequestProto() = (o=new(); fillunset(o); o)
end #type RemoveXAttrRequestProto
const __req_RemoveXAttrRequestProto = Symbol[:src]
meta(t::Type{RemoveXAttrRequestProto}) = meta(t, __req_RemoveXAttrRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)
hash(v::RemoveXAttrRequestProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveXAttrRequestProto, v2::RemoveXAttrRequestProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveXAttrRequestProto, v2::RemoveXAttrRequestProto) = ProtoBuf.protoeq(v1, v2)

mutable struct RemoveXAttrResponseProto
    RemoveXAttrResponseProto() = (o=new(); fillunset(o); o)
end #type RemoveXAttrResponseProto
hash(v::RemoveXAttrResponseProto) = ProtoBuf.protohash(v)
isequal(v1::RemoveXAttrResponseProto, v2::RemoveXAttrResponseProto) = ProtoBuf.protoisequal(v1, v2)
==(v1::RemoveXAttrResponseProto, v2::RemoveXAttrResponseProto) = ProtoBuf.protoeq(v1, v2)

export XAttrSetFlagProto, XAttrProto_XAttrNamespaceProto, XAttrProto, XAttrEditLogProto, SetXAttrRequestProto, SetXAttrResponseProto, GetXAttrsRequestProto, GetXAttrsResponseProto, ListXAttrsRequestProto, ListXAttrsResponseProto, RemoveXAttrRequestProto, RemoveXAttrResponseProto
