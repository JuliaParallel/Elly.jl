using Compat
using ProtoBuf
import ProtoBuf.meta

type __enum_XAttrSetFlagProto <: ProtoEnum
    XATTR_CREATE::Int32
    XATTR_REPLACE::Int32
    __enum_XAttrSetFlagProto() = new(1,2)
end #type __enum_XAttrSetFlagProto
const XAttrSetFlagProto = __enum_XAttrSetFlagProto()

type __enum_XAttrProto_XAttrNamespaceProto <: ProtoEnum
    USER::Int32
    TRUSTED::Int32
    SECURITY::Int32
    SYSTEM::Int32
    RAW::Int32
    __enum_XAttrProto_XAttrNamespaceProto() = new(0,1,2,3,4)
end #type __enum_XAttrProto_XAttrNamespaceProto
const XAttrProto_XAttrNamespaceProto = __enum_XAttrProto_XAttrNamespaceProto()

type XAttrProto
    namespace::Int32
    name::AbstractString
    value::Array{UInt8,1}
    XAttrProto() = (o=new(); fillunset(o); o)
end #type XAttrProto
const __req_XAttrProto = Symbol[:namespace,:name]
meta(t::Type{XAttrProto}) = meta(t, __req_XAttrProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type XAttrEditLogProto
    src::AbstractString
    xAttrs::Array{XAttrProto,1}
    XAttrEditLogProto() = (o=new(); fillunset(o); o)
end #type XAttrEditLogProto

type SetXAttrRequestProto
    src::AbstractString
    xAttr::XAttrProto
    flag::UInt32
    SetXAttrRequestProto() = (o=new(); fillunset(o); o)
end #type SetXAttrRequestProto
const __req_SetXAttrRequestProto = Symbol[:src]
meta(t::Type{SetXAttrRequestProto}) = meta(t, __req_SetXAttrRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type SetXAttrResponseProto
    SetXAttrResponseProto() = (o=new(); fillunset(o); o)
end #type SetXAttrResponseProto

type GetXAttrsRequestProto
    src::AbstractString
    xAttrs::Array{XAttrProto,1}
    GetXAttrsRequestProto() = (o=new(); fillunset(o); o)
end #type GetXAttrsRequestProto
const __req_GetXAttrsRequestProto = Symbol[:src]
meta(t::Type{GetXAttrsRequestProto}) = meta(t, __req_GetXAttrsRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type GetXAttrsResponseProto
    xAttrs::Array{XAttrProto,1}
    GetXAttrsResponseProto() = (o=new(); fillunset(o); o)
end #type GetXAttrsResponseProto

type ListXAttrsRequestProto
    src::AbstractString
    ListXAttrsRequestProto() = (o=new(); fillunset(o); o)
end #type ListXAttrsRequestProto
const __req_ListXAttrsRequestProto = Symbol[:src]
meta(t::Type{ListXAttrsRequestProto}) = meta(t, __req_ListXAttrsRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type ListXAttrsResponseProto
    xAttrs::Array{XAttrProto,1}
    ListXAttrsResponseProto() = (o=new(); fillunset(o); o)
end #type ListXAttrsResponseProto

type RemoveXAttrRequestProto
    src::AbstractString
    xAttr::XAttrProto
    RemoveXAttrRequestProto() = (o=new(); fillunset(o); o)
end #type RemoveXAttrRequestProto
const __req_RemoveXAttrRequestProto = Symbol[:src]
meta(t::Type{RemoveXAttrRequestProto}) = meta(t, __req_RemoveXAttrRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES)

type RemoveXAttrResponseProto
    RemoveXAttrResponseProto() = (o=new(); fillunset(o); o)
end #type RemoveXAttrResponseProto

export XAttrSetFlagProto, XAttrProto_XAttrNamespaceProto, XAttrProto, XAttrEditLogProto, SetXAttrRequestProto, SetXAttrResponseProto, GetXAttrsRequestProto, GetXAttrsResponseProto, ListXAttrsRequestProto, ListXAttrsResponseProto, RemoveXAttrRequestProto, RemoveXAttrResponseProto
