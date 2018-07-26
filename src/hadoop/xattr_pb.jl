# syntax: proto2
using Compat
using ProtoBuf
import ProtoBuf.meta

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

mutable struct XAttrEditLogProto <: ProtoType
    src::AbstractString
    xAttrs::Base.Vector{XAttrProto}
    XAttrEditLogProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct XAttrEditLogProto

mutable struct SetXAttrRequestProto <: ProtoType
    src::AbstractString
    xAttr::XAttrProto
    flag::UInt32
    SetXAttrRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetXAttrRequestProto
const __req_SetXAttrRequestProto = Symbol[:src]
meta(t::Type{SetXAttrRequestProto}) = meta(t, __req_SetXAttrRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SetXAttrResponseProto <: ProtoType
    SetXAttrResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SetXAttrResponseProto

mutable struct GetXAttrsRequestProto <: ProtoType
    src::AbstractString
    xAttrs::Base.Vector{XAttrProto}
    GetXAttrsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetXAttrsRequestProto
const __req_GetXAttrsRequestProto = Symbol[:src]
meta(t::Type{GetXAttrsRequestProto}) = meta(t, __req_GetXAttrsRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct GetXAttrsResponseProto <: ProtoType
    xAttrs::Base.Vector{XAttrProto}
    GetXAttrsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GetXAttrsResponseProto

mutable struct ListXAttrsRequestProto <: ProtoType
    src::AbstractString
    ListXAttrsRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ListXAttrsRequestProto
const __req_ListXAttrsRequestProto = Symbol[:src]
meta(t::Type{ListXAttrsRequestProto}) = meta(t, __req_ListXAttrsRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ListXAttrsResponseProto <: ProtoType
    xAttrs::Base.Vector{XAttrProto}
    ListXAttrsResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ListXAttrsResponseProto

mutable struct RemoveXAttrRequestProto <: ProtoType
    src::AbstractString
    xAttr::XAttrProto
    RemoveXAttrRequestProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveXAttrRequestProto
const __req_RemoveXAttrRequestProto = Symbol[:src]
meta(t::Type{RemoveXAttrRequestProto}) = meta(t, __req_RemoveXAttrRequestProto, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct RemoveXAttrResponseProto <: ProtoType
    RemoveXAttrResponseProto(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct RemoveXAttrResponseProto

export XAttrSetFlagProto, XAttrProto_XAttrNamespaceProto, XAttrProto, XAttrEditLogProto, SetXAttrRequestProto, SetXAttrResponseProto, GetXAttrsRequestProto, GetXAttrsResponseProto, ListXAttrsRequestProto, ListXAttrsResponseProto, RemoveXAttrRequestProto, RemoveXAttrResponseProto
