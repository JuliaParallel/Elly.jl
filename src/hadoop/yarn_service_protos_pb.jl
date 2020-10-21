# syntax: proto2
using ProtoBuf
import ProtoBuf.meta
import ..hadoop

const ContainerUpdateTypeProto = (;[
    Symbol("INCREASE_RESOURCE") => Int32(0),
    Symbol("DECREASE_RESOURCE") => Int32(1),
    Symbol("PROMOTE_EXECUTION_TYPE") => Int32(2),
    Symbol("DEMOTE_EXECUTION_TYPE") => Int32(3),
]...)

const SchedulerResourceTypes = (;[
    Symbol("MEMORY") => Int32(0),
    Symbol("CPU") => Int32(1),
]...)

const ApplicationsRequestScopeProto = (;[
    Symbol("ALL") => Int32(0),
    Symbol("VIEWABLE") => Int32(1),
    Symbol("OWN") => Int32(2),
]...)

mutable struct RegisterApplicationMasterRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RegisterApplicationMasterRequestProto(; kwargs...)
        obj = new(meta(RegisterApplicationMasterRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RegisterApplicationMasterRequestProto
const __meta_RegisterApplicationMasterRequestProto = Ref{ProtoMeta}()
function meta(::Type{RegisterApplicationMasterRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RegisterApplicationMasterRequestProto)
            __meta_RegisterApplicationMasterRequestProto[] = target = ProtoMeta(RegisterApplicationMasterRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:host => AbstractString, :rpc_port => Int32, :tracking_url => AbstractString]
            meta(target, RegisterApplicationMasterRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RegisterApplicationMasterRequestProto[]
    end
end
function Base.getproperty(obj::RegisterApplicationMasterRequestProto, name::Symbol)
    if name === :host
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :rpc_port
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :tracking_url
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct FinishApplicationMasterRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function FinishApplicationMasterRequestProto(; kwargs...)
        obj = new(meta(FinishApplicationMasterRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct FinishApplicationMasterRequestProto
const __meta_FinishApplicationMasterRequestProto = Ref{ProtoMeta}()
function meta(::Type{FinishApplicationMasterRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FinishApplicationMasterRequestProto)
            __meta_FinishApplicationMasterRequestProto[] = target = ProtoMeta(FinishApplicationMasterRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:diagnostics => AbstractString, :tracking_url => AbstractString, :final_application_status => Int32]
            meta(target, FinishApplicationMasterRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FinishApplicationMasterRequestProto[]
    end
end
function Base.getproperty(obj::FinishApplicationMasterRequestProto, name::Symbol)
    if name === :diagnostics
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :tracking_url
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :final_application_status
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct FinishApplicationMasterResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function FinishApplicationMasterResponseProto(; kwargs...)
        obj = new(meta(FinishApplicationMasterResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct FinishApplicationMasterResponseProto
const __meta_FinishApplicationMasterResponseProto = Ref{ProtoMeta}()
function meta(::Type{FinishApplicationMasterResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FinishApplicationMasterResponseProto)
            __meta_FinishApplicationMasterResponseProto[] = target = ProtoMeta(FinishApplicationMasterResponseProto)
            val = Dict{Symbol,Any}(:isUnregistered => false)
            allflds = Pair{Symbol,Union{Type,String}}[:isUnregistered => Bool]
            meta(target, FinishApplicationMasterResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FinishApplicationMasterResponseProto[]
    end
end
function Base.getproperty(obj::FinishApplicationMasterResponseProto, name::Symbol)
    if name === :isUnregistered
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct UpdateContainerRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UpdateContainerRequestProto(; kwargs...)
        obj = new(meta(UpdateContainerRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct UpdateContainerRequestProto
const __meta_UpdateContainerRequestProto = Ref{ProtoMeta}()
function meta(::Type{UpdateContainerRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UpdateContainerRequestProto)
            __meta_UpdateContainerRequestProto[] = target = ProtoMeta(UpdateContainerRequestProto)
            req = Symbol[:container_version,:container_id,:update_type]
            allflds = Pair{Symbol,Union{Type,String}}[:container_version => Int32, :container_id => ContainerIdProto, :update_type => Int32, :capability => ResourceProto, :execution_type => Int32]
            meta(target, UpdateContainerRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UpdateContainerRequestProto[]
    end
end
function Base.getproperty(obj::UpdateContainerRequestProto, name::Symbol)
    if name === :container_version
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :container_id
        return (obj.__protobuf_jl_internal_values[name])::ContainerIdProto
    elseif name === :update_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :capability
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    elseif name === :execution_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct UpdateContainerErrorProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UpdateContainerErrorProto(; kwargs...)
        obj = new(meta(UpdateContainerErrorProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct UpdateContainerErrorProto
const __meta_UpdateContainerErrorProto = Ref{ProtoMeta}()
function meta(::Type{UpdateContainerErrorProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UpdateContainerErrorProto)
            __meta_UpdateContainerErrorProto[] = target = ProtoMeta(UpdateContainerErrorProto)
            allflds = Pair{Symbol,Union{Type,String}}[:reason => AbstractString, :update_request => UpdateContainerRequestProto, :current_container_version => Int32]
            meta(target, UpdateContainerErrorProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UpdateContainerErrorProto[]
    end
end
function Base.getproperty(obj::UpdateContainerErrorProto, name::Symbol)
    if name === :reason
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :update_request
        return (obj.__protobuf_jl_internal_values[name])::UpdateContainerRequestProto
    elseif name === :current_container_version
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct AllocateRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function AllocateRequestProto(; kwargs...)
        obj = new(meta(AllocateRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct AllocateRequestProto
const __meta_AllocateRequestProto = Ref{ProtoMeta}()
function meta(::Type{AllocateRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AllocateRequestProto)
            __meta_AllocateRequestProto[] = target = ProtoMeta(AllocateRequestProto)
            fnum = Int[1,2,3,4,5,6,7,11]
            allflds = Pair{Symbol,Union{Type,String}}[:ask => Base.Vector{ResourceRequestProto}, :release => Base.Vector{ContainerIdProto}, :blacklist_request => ResourceBlacklistRequestProto, :response_id => Int32, :progress => Float32, :increase_request => Base.Vector{ContainerResourceIncreaseRequestProto}, :update_requests => Base.Vector{UpdateContainerRequestProto}, :tracking_url => AbstractString]
            meta(target, AllocateRequestProto, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AllocateRequestProto[]
    end
end
function Base.getproperty(obj::AllocateRequestProto, name::Symbol)
    if name === :ask
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ResourceRequestProto}
    elseif name === :release
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerIdProto}
    elseif name === :blacklist_request
        return (obj.__protobuf_jl_internal_values[name])::ResourceBlacklistRequestProto
    elseif name === :response_id
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :progress
        return (obj.__protobuf_jl_internal_values[name])::Float32
    elseif name === :increase_request
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerResourceIncreaseRequestProto}
    elseif name === :update_requests
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{UpdateContainerRequestProto}
    elseif name === :tracking_url
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct NMTokenProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function NMTokenProto(; kwargs...)
        obj = new(meta(NMTokenProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct NMTokenProto
const __meta_NMTokenProto = Ref{ProtoMeta}()
function meta(::Type{NMTokenProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_NMTokenProto)
            __meta_NMTokenProto[] = target = ProtoMeta(NMTokenProto)
            allflds = Pair{Symbol,Union{Type,String}}[:nodeId => NodeIdProto, :token => hadoop.common.TokenProto]
            meta(target, NMTokenProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_NMTokenProto[]
    end
end
function Base.getproperty(obj::NMTokenProto, name::Symbol)
    if name === :nodeId
        return (obj.__protobuf_jl_internal_values[name])::NodeIdProto
    elseif name === :token
        return (obj.__protobuf_jl_internal_values[name])::hadoop.common.TokenProto
    else
        getfield(obj, name)
    end
end

mutable struct RegisterApplicationMasterResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RegisterApplicationMasterResponseProto(; kwargs...)
        obj = new(meta(RegisterApplicationMasterResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RegisterApplicationMasterResponseProto
const __meta_RegisterApplicationMasterResponseProto = Ref{ProtoMeta}()
function meta(::Type{RegisterApplicationMasterResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RegisterApplicationMasterResponseProto)
            __meta_RegisterApplicationMasterResponseProto[] = target = ProtoMeta(RegisterApplicationMasterResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:maximumCapability => ResourceProto, :client_to_am_token_master_key => Array{UInt8,1}, :application_ACLs => Base.Vector{ApplicationACLMapProto}, :containers_from_previous_attempts => Base.Vector{ContainerProto}, :queue => AbstractString, :nm_tokens_from_previous_attempts => Base.Vector{NMTokenProto}, :scheduler_resource_types => Base.Vector{Int32}]
            meta(target, RegisterApplicationMasterResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RegisterApplicationMasterResponseProto[]
    end
end
function Base.getproperty(obj::RegisterApplicationMasterResponseProto, name::Symbol)
    if name === :maximumCapability
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    elseif name === :client_to_am_token_master_key
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :application_ACLs
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ApplicationACLMapProto}
    elseif name === :containers_from_previous_attempts
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerProto}
    elseif name === :queue
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :nm_tokens_from_previous_attempts
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{NMTokenProto}
    elseif name === :scheduler_resource_types
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    else
        getfield(obj, name)
    end
end

mutable struct UpdatedContainerProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UpdatedContainerProto(; kwargs...)
        obj = new(meta(UpdatedContainerProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct UpdatedContainerProto
const __meta_UpdatedContainerProto = Ref{ProtoMeta}()
function meta(::Type{UpdatedContainerProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UpdatedContainerProto)
            __meta_UpdatedContainerProto[] = target = ProtoMeta(UpdatedContainerProto)
            req = Symbol[:update_type,:container]
            allflds = Pair{Symbol,Union{Type,String}}[:update_type => Int32, :container => ContainerProto]
            meta(target, UpdatedContainerProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UpdatedContainerProto[]
    end
end
function Base.getproperty(obj::UpdatedContainerProto, name::Symbol)
    if name === :update_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :container
        return (obj.__protobuf_jl_internal_values[name])::ContainerProto
    else
        getfield(obj, name)
    end
end

mutable struct AllocateResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function AllocateResponseProto(; kwargs...)
        obj = new(meta(AllocateResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct AllocateResponseProto
const __meta_AllocateResponseProto = Ref{ProtoMeta}()
function meta(::Type{AllocateResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AllocateResponseProto)
            __meta_AllocateResponseProto[] = target = ProtoMeta(AllocateResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:a_m_command => Int32, :response_id => Int32, :allocated_containers => Base.Vector{ContainerProto}, :completed_container_statuses => Base.Vector{ContainerStatusProto}, :limit => ResourceProto, :updated_nodes => Base.Vector{NodeReportProto}, :num_cluster_nodes => Int32, :preempt => PreemptionMessageProto, :nm_tokens => Base.Vector{NMTokenProto}, :increased_containers => Base.Vector{ContainerResourceIncreaseProto}, :decreased_containers => Base.Vector{ContainerResourceDecreaseProto}, :am_rm_token => hadoop.common.TokenProto, :application_priority => PriorityProto, :collector_info => CollectorInfoProto, :update_errors => Base.Vector{UpdateContainerErrorProto}, :updated_containers => Base.Vector{UpdatedContainerProto}]
            meta(target, AllocateResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AllocateResponseProto[]
    end
end
function Base.getproperty(obj::AllocateResponseProto, name::Symbol)
    if name === :a_m_command
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :response_id
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :allocated_containers
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerProto}
    elseif name === :completed_container_statuses
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerStatusProto}
    elseif name === :limit
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    elseif name === :updated_nodes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{NodeReportProto}
    elseif name === :num_cluster_nodes
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :preempt
        return (obj.__protobuf_jl_internal_values[name])::PreemptionMessageProto
    elseif name === :nm_tokens
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{NMTokenProto}
    elseif name === :increased_containers
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerResourceIncreaseProto}
    elseif name === :decreased_containers
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerResourceDecreaseProto}
    elseif name === :am_rm_token
        return (obj.__protobuf_jl_internal_values[name])::hadoop.common.TokenProto
    elseif name === :application_priority
        return (obj.__protobuf_jl_internal_values[name])::PriorityProto
    elseif name === :collector_info
        return (obj.__protobuf_jl_internal_values[name])::CollectorInfoProto
    elseif name === :update_errors
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{UpdateContainerErrorProto}
    elseif name === :updated_containers
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{UpdatedContainerProto}
    else
        getfield(obj, name)
    end
end

mutable struct GetNewApplicationRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetNewApplicationRequestProto(; kwargs...)
        obj = new(meta(GetNewApplicationRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetNewApplicationRequestProto
const __meta_GetNewApplicationRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetNewApplicationRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetNewApplicationRequestProto)
            __meta_GetNewApplicationRequestProto[] = target = ProtoMeta(GetNewApplicationRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, GetNewApplicationRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetNewApplicationRequestProto[]
    end
end

mutable struct GetNewApplicationResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetNewApplicationResponseProto(; kwargs...)
        obj = new(meta(GetNewApplicationResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetNewApplicationResponseProto
const __meta_GetNewApplicationResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetNewApplicationResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetNewApplicationResponseProto)
            __meta_GetNewApplicationResponseProto[] = target = ProtoMeta(GetNewApplicationResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:application_id => ApplicationIdProto, :maximumCapability => ResourceProto]
            meta(target, GetNewApplicationResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetNewApplicationResponseProto[]
    end
end
function Base.getproperty(obj::GetNewApplicationResponseProto, name::Symbol)
    if name === :application_id
        return (obj.__protobuf_jl_internal_values[name])::ApplicationIdProto
    elseif name === :maximumCapability
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    else
        getfield(obj, name)
    end
end

mutable struct GetApplicationReportRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetApplicationReportRequestProto(; kwargs...)
        obj = new(meta(GetApplicationReportRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetApplicationReportRequestProto
const __meta_GetApplicationReportRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetApplicationReportRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetApplicationReportRequestProto)
            __meta_GetApplicationReportRequestProto[] = target = ProtoMeta(GetApplicationReportRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:application_id => ApplicationIdProto]
            meta(target, GetApplicationReportRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetApplicationReportRequestProto[]
    end
end
function Base.getproperty(obj::GetApplicationReportRequestProto, name::Symbol)
    if name === :application_id
        return (obj.__protobuf_jl_internal_values[name])::ApplicationIdProto
    else
        getfield(obj, name)
    end
end

mutable struct GetApplicationReportResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetApplicationReportResponseProto(; kwargs...)
        obj = new(meta(GetApplicationReportResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetApplicationReportResponseProto
const __meta_GetApplicationReportResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetApplicationReportResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetApplicationReportResponseProto)
            __meta_GetApplicationReportResponseProto[] = target = ProtoMeta(GetApplicationReportResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:application_report => ApplicationReportProto]
            meta(target, GetApplicationReportResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetApplicationReportResponseProto[]
    end
end
function Base.getproperty(obj::GetApplicationReportResponseProto, name::Symbol)
    if name === :application_report
        return (obj.__protobuf_jl_internal_values[name])::ApplicationReportProto
    else
        getfield(obj, name)
    end
end

mutable struct SubmitApplicationRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SubmitApplicationRequestProto(; kwargs...)
        obj = new(meta(SubmitApplicationRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct SubmitApplicationRequestProto
const __meta_SubmitApplicationRequestProto = Ref{ProtoMeta}()
function meta(::Type{SubmitApplicationRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SubmitApplicationRequestProto)
            __meta_SubmitApplicationRequestProto[] = target = ProtoMeta(SubmitApplicationRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:application_submission_context => ApplicationSubmissionContextProto]
            meta(target, SubmitApplicationRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SubmitApplicationRequestProto[]
    end
end
function Base.getproperty(obj::SubmitApplicationRequestProto, name::Symbol)
    if name === :application_submission_context
        return (obj.__protobuf_jl_internal_values[name])::ApplicationSubmissionContextProto
    else
        getfield(obj, name)
    end
end

mutable struct SubmitApplicationResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SubmitApplicationResponseProto(; kwargs...)
        obj = new(meta(SubmitApplicationResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct SubmitApplicationResponseProto
const __meta_SubmitApplicationResponseProto = Ref{ProtoMeta}()
function meta(::Type{SubmitApplicationResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SubmitApplicationResponseProto)
            __meta_SubmitApplicationResponseProto[] = target = ProtoMeta(SubmitApplicationResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, SubmitApplicationResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SubmitApplicationResponseProto[]
    end
end

mutable struct FailApplicationAttemptRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function FailApplicationAttemptRequestProto(; kwargs...)
        obj = new(meta(FailApplicationAttemptRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct FailApplicationAttemptRequestProto
const __meta_FailApplicationAttemptRequestProto = Ref{ProtoMeta}()
function meta(::Type{FailApplicationAttemptRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FailApplicationAttemptRequestProto)
            __meta_FailApplicationAttemptRequestProto[] = target = ProtoMeta(FailApplicationAttemptRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:application_attempt_id => ApplicationAttemptIdProto]
            meta(target, FailApplicationAttemptRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FailApplicationAttemptRequestProto[]
    end
end
function Base.getproperty(obj::FailApplicationAttemptRequestProto, name::Symbol)
    if name === :application_attempt_id
        return (obj.__protobuf_jl_internal_values[name])::ApplicationAttemptIdProto
    else
        getfield(obj, name)
    end
end

mutable struct FailApplicationAttemptResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function FailApplicationAttemptResponseProto(; kwargs...)
        obj = new(meta(FailApplicationAttemptResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct FailApplicationAttemptResponseProto
const __meta_FailApplicationAttemptResponseProto = Ref{ProtoMeta}()
function meta(::Type{FailApplicationAttemptResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_FailApplicationAttemptResponseProto)
            __meta_FailApplicationAttemptResponseProto[] = target = ProtoMeta(FailApplicationAttemptResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, FailApplicationAttemptResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_FailApplicationAttemptResponseProto[]
    end
end

mutable struct KillApplicationRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function KillApplicationRequestProto(; kwargs...)
        obj = new(meta(KillApplicationRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct KillApplicationRequestProto
const __meta_KillApplicationRequestProto = Ref{ProtoMeta}()
function meta(::Type{KillApplicationRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_KillApplicationRequestProto)
            __meta_KillApplicationRequestProto[] = target = ProtoMeta(KillApplicationRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:application_id => ApplicationIdProto, :diagnostics => AbstractString]
            meta(target, KillApplicationRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_KillApplicationRequestProto[]
    end
end
function Base.getproperty(obj::KillApplicationRequestProto, name::Symbol)
    if name === :application_id
        return (obj.__protobuf_jl_internal_values[name])::ApplicationIdProto
    elseif name === :diagnostics
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct KillApplicationResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function KillApplicationResponseProto(; kwargs...)
        obj = new(meta(KillApplicationResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct KillApplicationResponseProto
const __meta_KillApplicationResponseProto = Ref{ProtoMeta}()
function meta(::Type{KillApplicationResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_KillApplicationResponseProto)
            __meta_KillApplicationResponseProto[] = target = ProtoMeta(KillApplicationResponseProto)
            val = Dict{Symbol,Any}(:is_kill_completed => false)
            allflds = Pair{Symbol,Union{Type,String}}[:is_kill_completed => Bool]
            meta(target, KillApplicationResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_KillApplicationResponseProto[]
    end
end
function Base.getproperty(obj::KillApplicationResponseProto, name::Symbol)
    if name === :is_kill_completed
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct GetClusterMetricsRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetClusterMetricsRequestProto(; kwargs...)
        obj = new(meta(GetClusterMetricsRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetClusterMetricsRequestProto
const __meta_GetClusterMetricsRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetClusterMetricsRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetClusterMetricsRequestProto)
            __meta_GetClusterMetricsRequestProto[] = target = ProtoMeta(GetClusterMetricsRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, GetClusterMetricsRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetClusterMetricsRequestProto[]
    end
end

mutable struct GetClusterMetricsResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetClusterMetricsResponseProto(; kwargs...)
        obj = new(meta(GetClusterMetricsResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetClusterMetricsResponseProto
const __meta_GetClusterMetricsResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetClusterMetricsResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetClusterMetricsResponseProto)
            __meta_GetClusterMetricsResponseProto[] = target = ProtoMeta(GetClusterMetricsResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:cluster_metrics => YarnClusterMetricsProto]
            meta(target, GetClusterMetricsResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetClusterMetricsResponseProto[]
    end
end
function Base.getproperty(obj::GetClusterMetricsResponseProto, name::Symbol)
    if name === :cluster_metrics
        return (obj.__protobuf_jl_internal_values[name])::YarnClusterMetricsProto
    else
        getfield(obj, name)
    end
end

mutable struct MoveApplicationAcrossQueuesRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function MoveApplicationAcrossQueuesRequestProto(; kwargs...)
        obj = new(meta(MoveApplicationAcrossQueuesRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct MoveApplicationAcrossQueuesRequestProto
const __meta_MoveApplicationAcrossQueuesRequestProto = Ref{ProtoMeta}()
function meta(::Type{MoveApplicationAcrossQueuesRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MoveApplicationAcrossQueuesRequestProto)
            __meta_MoveApplicationAcrossQueuesRequestProto[] = target = ProtoMeta(MoveApplicationAcrossQueuesRequestProto)
            req = Symbol[:application_id,:target_queue]
            allflds = Pair{Symbol,Union{Type,String}}[:application_id => ApplicationIdProto, :target_queue => AbstractString]
            meta(target, MoveApplicationAcrossQueuesRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MoveApplicationAcrossQueuesRequestProto[]
    end
end
function Base.getproperty(obj::MoveApplicationAcrossQueuesRequestProto, name::Symbol)
    if name === :application_id
        return (obj.__protobuf_jl_internal_values[name])::ApplicationIdProto
    elseif name === :target_queue
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct MoveApplicationAcrossQueuesResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function MoveApplicationAcrossQueuesResponseProto(; kwargs...)
        obj = new(meta(MoveApplicationAcrossQueuesResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct MoveApplicationAcrossQueuesResponseProto
const __meta_MoveApplicationAcrossQueuesResponseProto = Ref{ProtoMeta}()
function meta(::Type{MoveApplicationAcrossQueuesResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_MoveApplicationAcrossQueuesResponseProto)
            __meta_MoveApplicationAcrossQueuesResponseProto[] = target = ProtoMeta(MoveApplicationAcrossQueuesResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, MoveApplicationAcrossQueuesResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_MoveApplicationAcrossQueuesResponseProto[]
    end
end

mutable struct GetApplicationsRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetApplicationsRequestProto(; kwargs...)
        obj = new(meta(GetApplicationsRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetApplicationsRequestProto
const __meta_GetApplicationsRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetApplicationsRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetApplicationsRequestProto)
            __meta_GetApplicationsRequestProto[] = target = ProtoMeta(GetApplicationsRequestProto)
            val = Dict{Symbol,Any}(:scope => ApplicationsRequestScopeProto.ALL)
            allflds = Pair{Symbol,Union{Type,String}}[:application_types => Base.Vector{AbstractString}, :application_states => Base.Vector{Int32}, :users => Base.Vector{AbstractString}, :queues => Base.Vector{AbstractString}, :limit => Int64, :start_begin => Int64, :start_end => Int64, :finish_begin => Int64, :finish_end => Int64, :applicationTags => Base.Vector{AbstractString}, :scope => Int32]
            meta(target, GetApplicationsRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetApplicationsRequestProto[]
    end
end
function Base.getproperty(obj::GetApplicationsRequestProto, name::Symbol)
    if name === :application_types
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :application_states
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    elseif name === :users
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :queues
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :limit
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :start_begin
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :start_end
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :finish_begin
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :finish_end
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :applicationTags
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :scope
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct GetApplicationsResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetApplicationsResponseProto(; kwargs...)
        obj = new(meta(GetApplicationsResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetApplicationsResponseProto
const __meta_GetApplicationsResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetApplicationsResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetApplicationsResponseProto)
            __meta_GetApplicationsResponseProto[] = target = ProtoMeta(GetApplicationsResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:applications => Base.Vector{ApplicationReportProto}]
            meta(target, GetApplicationsResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetApplicationsResponseProto[]
    end
end
function Base.getproperty(obj::GetApplicationsResponseProto, name::Symbol)
    if name === :applications
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ApplicationReportProto}
    else
        getfield(obj, name)
    end
end

mutable struct GetClusterNodesRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetClusterNodesRequestProto(; kwargs...)
        obj = new(meta(GetClusterNodesRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetClusterNodesRequestProto
const __meta_GetClusterNodesRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetClusterNodesRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetClusterNodesRequestProto)
            __meta_GetClusterNodesRequestProto[] = target = ProtoMeta(GetClusterNodesRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:nodeStates => Base.Vector{Int32}]
            meta(target, GetClusterNodesRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetClusterNodesRequestProto[]
    end
end
function Base.getproperty(obj::GetClusterNodesRequestProto, name::Symbol)
    if name === :nodeStates
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    else
        getfield(obj, name)
    end
end

mutable struct GetClusterNodesResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetClusterNodesResponseProto(; kwargs...)
        obj = new(meta(GetClusterNodesResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetClusterNodesResponseProto
const __meta_GetClusterNodesResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetClusterNodesResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetClusterNodesResponseProto)
            __meta_GetClusterNodesResponseProto[] = target = ProtoMeta(GetClusterNodesResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:nodeReports => Base.Vector{NodeReportProto}]
            meta(target, GetClusterNodesResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetClusterNodesResponseProto[]
    end
end
function Base.getproperty(obj::GetClusterNodesResponseProto, name::Symbol)
    if name === :nodeReports
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{NodeReportProto}
    else
        getfield(obj, name)
    end
end

mutable struct GetQueueInfoRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetQueueInfoRequestProto(; kwargs...)
        obj = new(meta(GetQueueInfoRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetQueueInfoRequestProto
const __meta_GetQueueInfoRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetQueueInfoRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetQueueInfoRequestProto)
            __meta_GetQueueInfoRequestProto[] = target = ProtoMeta(GetQueueInfoRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:queueName => AbstractString, :includeApplications => Bool, :includeChildQueues => Bool, :recursive => Bool]
            meta(target, GetQueueInfoRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetQueueInfoRequestProto[]
    end
end
function Base.getproperty(obj::GetQueueInfoRequestProto, name::Symbol)
    if name === :queueName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :includeApplications
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :includeChildQueues
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :recursive
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct GetQueueInfoResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetQueueInfoResponseProto(; kwargs...)
        obj = new(meta(GetQueueInfoResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetQueueInfoResponseProto
const __meta_GetQueueInfoResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetQueueInfoResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetQueueInfoResponseProto)
            __meta_GetQueueInfoResponseProto[] = target = ProtoMeta(GetQueueInfoResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:queueInfo => QueueInfoProto]
            meta(target, GetQueueInfoResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetQueueInfoResponseProto[]
    end
end
function Base.getproperty(obj::GetQueueInfoResponseProto, name::Symbol)
    if name === :queueInfo
        return (obj.__protobuf_jl_internal_values[name])::QueueInfoProto
    else
        getfield(obj, name)
    end
end

mutable struct GetQueueUserAclsInfoRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetQueueUserAclsInfoRequestProto(; kwargs...)
        obj = new(meta(GetQueueUserAclsInfoRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetQueueUserAclsInfoRequestProto
const __meta_GetQueueUserAclsInfoRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetQueueUserAclsInfoRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetQueueUserAclsInfoRequestProto)
            __meta_GetQueueUserAclsInfoRequestProto[] = target = ProtoMeta(GetQueueUserAclsInfoRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, GetQueueUserAclsInfoRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetQueueUserAclsInfoRequestProto[]
    end
end

mutable struct GetQueueUserAclsInfoResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetQueueUserAclsInfoResponseProto(; kwargs...)
        obj = new(meta(GetQueueUserAclsInfoResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetQueueUserAclsInfoResponseProto
const __meta_GetQueueUserAclsInfoResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetQueueUserAclsInfoResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetQueueUserAclsInfoResponseProto)
            __meta_GetQueueUserAclsInfoResponseProto[] = target = ProtoMeta(GetQueueUserAclsInfoResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:queueUserAcls => Base.Vector{QueueUserACLInfoProto}]
            meta(target, GetQueueUserAclsInfoResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetQueueUserAclsInfoResponseProto[]
    end
end
function Base.getproperty(obj::GetQueueUserAclsInfoResponseProto, name::Symbol)
    if name === :queueUserAcls
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{QueueUserACLInfoProto}
    else
        getfield(obj, name)
    end
end

mutable struct GetNodesToLabelsRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetNodesToLabelsRequestProto(; kwargs...)
        obj = new(meta(GetNodesToLabelsRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetNodesToLabelsRequestProto
const __meta_GetNodesToLabelsRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetNodesToLabelsRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetNodesToLabelsRequestProto)
            __meta_GetNodesToLabelsRequestProto[] = target = ProtoMeta(GetNodesToLabelsRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, GetNodesToLabelsRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetNodesToLabelsRequestProto[]
    end
end

mutable struct GetNodesToLabelsResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetNodesToLabelsResponseProto(; kwargs...)
        obj = new(meta(GetNodesToLabelsResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetNodesToLabelsResponseProto
const __meta_GetNodesToLabelsResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetNodesToLabelsResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetNodesToLabelsResponseProto)
            __meta_GetNodesToLabelsResponseProto[] = target = ProtoMeta(GetNodesToLabelsResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:nodeToLabels => Base.Vector{NodeIdToLabelsProto}]
            meta(target, GetNodesToLabelsResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetNodesToLabelsResponseProto[]
    end
end
function Base.getproperty(obj::GetNodesToLabelsResponseProto, name::Symbol)
    if name === :nodeToLabels
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{NodeIdToLabelsProto}
    else
        getfield(obj, name)
    end
end

mutable struct GetLabelsToNodesRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetLabelsToNodesRequestProto(; kwargs...)
        obj = new(meta(GetLabelsToNodesRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetLabelsToNodesRequestProto
const __meta_GetLabelsToNodesRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetLabelsToNodesRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetLabelsToNodesRequestProto)
            __meta_GetLabelsToNodesRequestProto[] = target = ProtoMeta(GetLabelsToNodesRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:nodeLabels => Base.Vector{AbstractString}]
            meta(target, GetLabelsToNodesRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetLabelsToNodesRequestProto[]
    end
end
function Base.getproperty(obj::GetLabelsToNodesRequestProto, name::Symbol)
    if name === :nodeLabels
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    else
        getfield(obj, name)
    end
end

mutable struct GetLabelsToNodesResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetLabelsToNodesResponseProto(; kwargs...)
        obj = new(meta(GetLabelsToNodesResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetLabelsToNodesResponseProto
const __meta_GetLabelsToNodesResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetLabelsToNodesResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetLabelsToNodesResponseProto)
            __meta_GetLabelsToNodesResponseProto[] = target = ProtoMeta(GetLabelsToNodesResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:labelsToNodes => Base.Vector{LabelsToNodeIdsProto}]
            meta(target, GetLabelsToNodesResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetLabelsToNodesResponseProto[]
    end
end
function Base.getproperty(obj::GetLabelsToNodesResponseProto, name::Symbol)
    if name === :labelsToNodes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{LabelsToNodeIdsProto}
    else
        getfield(obj, name)
    end
end

mutable struct GetClusterNodeLabelsRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetClusterNodeLabelsRequestProto(; kwargs...)
        obj = new(meta(GetClusterNodeLabelsRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetClusterNodeLabelsRequestProto
const __meta_GetClusterNodeLabelsRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetClusterNodeLabelsRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetClusterNodeLabelsRequestProto)
            __meta_GetClusterNodeLabelsRequestProto[] = target = ProtoMeta(GetClusterNodeLabelsRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, GetClusterNodeLabelsRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetClusterNodeLabelsRequestProto[]
    end
end

mutable struct GetClusterNodeLabelsResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetClusterNodeLabelsResponseProto(; kwargs...)
        obj = new(meta(GetClusterNodeLabelsResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetClusterNodeLabelsResponseProto
const __meta_GetClusterNodeLabelsResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetClusterNodeLabelsResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetClusterNodeLabelsResponseProto)
            __meta_GetClusterNodeLabelsResponseProto[] = target = ProtoMeta(GetClusterNodeLabelsResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:deprecatedNodeLabels => Base.Vector{AbstractString}, :nodeLabels => Base.Vector{NodeLabelProto}]
            meta(target, GetClusterNodeLabelsResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetClusterNodeLabelsResponseProto[]
    end
end
function Base.getproperty(obj::GetClusterNodeLabelsResponseProto, name::Symbol)
    if name === :deprecatedNodeLabels
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :nodeLabels
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{NodeLabelProto}
    else
        getfield(obj, name)
    end
end

mutable struct UpdateApplicationPriorityRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UpdateApplicationPriorityRequestProto(; kwargs...)
        obj = new(meta(UpdateApplicationPriorityRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct UpdateApplicationPriorityRequestProto
const __meta_UpdateApplicationPriorityRequestProto = Ref{ProtoMeta}()
function meta(::Type{UpdateApplicationPriorityRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UpdateApplicationPriorityRequestProto)
            __meta_UpdateApplicationPriorityRequestProto[] = target = ProtoMeta(UpdateApplicationPriorityRequestProto)
            req = Symbol[:applicationId,:applicationPriority]
            allflds = Pair{Symbol,Union{Type,String}}[:applicationId => ApplicationIdProto, :applicationPriority => PriorityProto]
            meta(target, UpdateApplicationPriorityRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UpdateApplicationPriorityRequestProto[]
    end
end
function Base.getproperty(obj::UpdateApplicationPriorityRequestProto, name::Symbol)
    if name === :applicationId
        return (obj.__protobuf_jl_internal_values[name])::ApplicationIdProto
    elseif name === :applicationPriority
        return (obj.__protobuf_jl_internal_values[name])::PriorityProto
    else
        getfield(obj, name)
    end
end

mutable struct UpdateApplicationPriorityResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UpdateApplicationPriorityResponseProto(; kwargs...)
        obj = new(meta(UpdateApplicationPriorityResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct UpdateApplicationPriorityResponseProto
const __meta_UpdateApplicationPriorityResponseProto = Ref{ProtoMeta}()
function meta(::Type{UpdateApplicationPriorityResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UpdateApplicationPriorityResponseProto)
            __meta_UpdateApplicationPriorityResponseProto[] = target = ProtoMeta(UpdateApplicationPriorityResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:applicationPriority => PriorityProto]
            meta(target, UpdateApplicationPriorityResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UpdateApplicationPriorityResponseProto[]
    end
end
function Base.getproperty(obj::UpdateApplicationPriorityResponseProto, name::Symbol)
    if name === :applicationPriority
        return (obj.__protobuf_jl_internal_values[name])::PriorityProto
    else
        getfield(obj, name)
    end
end

mutable struct SignalContainerRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SignalContainerRequestProto(; kwargs...)
        obj = new(meta(SignalContainerRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct SignalContainerRequestProto
const __meta_SignalContainerRequestProto = Ref{ProtoMeta}()
function meta(::Type{SignalContainerRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SignalContainerRequestProto)
            __meta_SignalContainerRequestProto[] = target = ProtoMeta(SignalContainerRequestProto)
            req = Symbol[:container_id,:command]
            allflds = Pair{Symbol,Union{Type,String}}[:container_id => ContainerIdProto, :command => Int32]
            meta(target, SignalContainerRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SignalContainerRequestProto[]
    end
end
function Base.getproperty(obj::SignalContainerRequestProto, name::Symbol)
    if name === :container_id
        return (obj.__protobuf_jl_internal_values[name])::ContainerIdProto
    elseif name === :command
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct SignalContainerResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function SignalContainerResponseProto(; kwargs...)
        obj = new(meta(SignalContainerResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct SignalContainerResponseProto
const __meta_SignalContainerResponseProto = Ref{ProtoMeta}()
function meta(::Type{SignalContainerResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SignalContainerResponseProto)
            __meta_SignalContainerResponseProto[] = target = ProtoMeta(SignalContainerResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, SignalContainerResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SignalContainerResponseProto[]
    end
end

mutable struct UpdateApplicationTimeoutsRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UpdateApplicationTimeoutsRequestProto(; kwargs...)
        obj = new(meta(UpdateApplicationTimeoutsRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct UpdateApplicationTimeoutsRequestProto
const __meta_UpdateApplicationTimeoutsRequestProto = Ref{ProtoMeta}()
function meta(::Type{UpdateApplicationTimeoutsRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UpdateApplicationTimeoutsRequestProto)
            __meta_UpdateApplicationTimeoutsRequestProto[] = target = ProtoMeta(UpdateApplicationTimeoutsRequestProto)
            req = Symbol[:applicationId]
            allflds = Pair{Symbol,Union{Type,String}}[:applicationId => ApplicationIdProto, :application_timeouts => Base.Vector{ApplicationUpdateTimeoutMapProto}]
            meta(target, UpdateApplicationTimeoutsRequestProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UpdateApplicationTimeoutsRequestProto[]
    end
end
function Base.getproperty(obj::UpdateApplicationTimeoutsRequestProto, name::Symbol)
    if name === :applicationId
        return (obj.__protobuf_jl_internal_values[name])::ApplicationIdProto
    elseif name === :application_timeouts
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ApplicationUpdateTimeoutMapProto}
    else
        getfield(obj, name)
    end
end

mutable struct UpdateApplicationTimeoutsResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UpdateApplicationTimeoutsResponseProto(; kwargs...)
        obj = new(meta(UpdateApplicationTimeoutsResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct UpdateApplicationTimeoutsResponseProto
const __meta_UpdateApplicationTimeoutsResponseProto = Ref{ProtoMeta}()
function meta(::Type{UpdateApplicationTimeoutsResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UpdateApplicationTimeoutsResponseProto)
            __meta_UpdateApplicationTimeoutsResponseProto[] = target = ProtoMeta(UpdateApplicationTimeoutsResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:application_timeouts => Base.Vector{ApplicationUpdateTimeoutMapProto}]
            meta(target, UpdateApplicationTimeoutsResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UpdateApplicationTimeoutsResponseProto[]
    end
end
function Base.getproperty(obj::UpdateApplicationTimeoutsResponseProto, name::Symbol)
    if name === :application_timeouts
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ApplicationUpdateTimeoutMapProto}
    else
        getfield(obj, name)
    end
end

mutable struct GetAllResourceTypeInfoRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetAllResourceTypeInfoRequestProto(; kwargs...)
        obj = new(meta(GetAllResourceTypeInfoRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetAllResourceTypeInfoRequestProto
const __meta_GetAllResourceTypeInfoRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetAllResourceTypeInfoRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetAllResourceTypeInfoRequestProto)
            __meta_GetAllResourceTypeInfoRequestProto[] = target = ProtoMeta(GetAllResourceTypeInfoRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, GetAllResourceTypeInfoRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetAllResourceTypeInfoRequestProto[]
    end
end

mutable struct GetAllResourceTypeInfoResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetAllResourceTypeInfoResponseProto(; kwargs...)
        obj = new(meta(GetAllResourceTypeInfoResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetAllResourceTypeInfoResponseProto
const __meta_GetAllResourceTypeInfoResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetAllResourceTypeInfoResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetAllResourceTypeInfoResponseProto)
            __meta_GetAllResourceTypeInfoResponseProto[] = target = ProtoMeta(GetAllResourceTypeInfoResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:resource_type_info => Base.Vector{ResourceTypeInfoProto}]
            meta(target, GetAllResourceTypeInfoResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetAllResourceTypeInfoResponseProto[]
    end
end
function Base.getproperty(obj::GetAllResourceTypeInfoResponseProto, name::Symbol)
    if name === :resource_type_info
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ResourceTypeInfoProto}
    else
        getfield(obj, name)
    end
end

mutable struct StartContainerRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function StartContainerRequestProto(; kwargs...)
        obj = new(meta(StartContainerRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct StartContainerRequestProto
const __meta_StartContainerRequestProto = Ref{ProtoMeta}()
function meta(::Type{StartContainerRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StartContainerRequestProto)
            __meta_StartContainerRequestProto[] = target = ProtoMeta(StartContainerRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:container_launch_context => ContainerLaunchContextProto, :container_token => hadoop.common.TokenProto]
            meta(target, StartContainerRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StartContainerRequestProto[]
    end
end
function Base.getproperty(obj::StartContainerRequestProto, name::Symbol)
    if name === :container_launch_context
        return (obj.__protobuf_jl_internal_values[name])::ContainerLaunchContextProto
    elseif name === :container_token
        return (obj.__protobuf_jl_internal_values[name])::hadoop.common.TokenProto
    else
        getfield(obj, name)
    end
end

mutable struct StartContainerResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function StartContainerResponseProto(; kwargs...)
        obj = new(meta(StartContainerResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct StartContainerResponseProto
const __meta_StartContainerResponseProto = Ref{ProtoMeta}()
function meta(::Type{StartContainerResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StartContainerResponseProto)
            __meta_StartContainerResponseProto[] = target = ProtoMeta(StartContainerResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:services_meta_data => Base.Vector{StringBytesMapProto}]
            meta(target, StartContainerResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StartContainerResponseProto[]
    end
end
function Base.getproperty(obj::StartContainerResponseProto, name::Symbol)
    if name === :services_meta_data
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{StringBytesMapProto}
    else
        getfield(obj, name)
    end
end

mutable struct StopContainerRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function StopContainerRequestProto(; kwargs...)
        obj = new(meta(StopContainerRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct StopContainerRequestProto
const __meta_StopContainerRequestProto = Ref{ProtoMeta}()
function meta(::Type{StopContainerRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StopContainerRequestProto)
            __meta_StopContainerRequestProto[] = target = ProtoMeta(StopContainerRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:container_id => ContainerIdProto]
            meta(target, StopContainerRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StopContainerRequestProto[]
    end
end
function Base.getproperty(obj::StopContainerRequestProto, name::Symbol)
    if name === :container_id
        return (obj.__protobuf_jl_internal_values[name])::ContainerIdProto
    else
        getfield(obj, name)
    end
end

mutable struct StopContainerResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function StopContainerResponseProto(; kwargs...)
        obj = new(meta(StopContainerResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct StopContainerResponseProto
const __meta_StopContainerResponseProto = Ref{ProtoMeta}()
function meta(::Type{StopContainerResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StopContainerResponseProto)
            __meta_StopContainerResponseProto[] = target = ProtoMeta(StopContainerResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, StopContainerResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StopContainerResponseProto[]
    end
end

mutable struct ResourceLocalizationRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ResourceLocalizationRequestProto(; kwargs...)
        obj = new(meta(ResourceLocalizationRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ResourceLocalizationRequestProto
const __meta_ResourceLocalizationRequestProto = Ref{ProtoMeta}()
function meta(::Type{ResourceLocalizationRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ResourceLocalizationRequestProto)
            __meta_ResourceLocalizationRequestProto[] = target = ProtoMeta(ResourceLocalizationRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:container_id => ContainerIdProto, :local_resources => Base.Vector{StringLocalResourceMapProto}]
            meta(target, ResourceLocalizationRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ResourceLocalizationRequestProto[]
    end
end
function Base.getproperty(obj::ResourceLocalizationRequestProto, name::Symbol)
    if name === :container_id
        return (obj.__protobuf_jl_internal_values[name])::ContainerIdProto
    elseif name === :local_resources
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{StringLocalResourceMapProto}
    else
        getfield(obj, name)
    end
end

mutable struct ResourceLocalizationResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ResourceLocalizationResponseProto(; kwargs...)
        obj = new(meta(ResourceLocalizationResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ResourceLocalizationResponseProto
const __meta_ResourceLocalizationResponseProto = Ref{ProtoMeta}()
function meta(::Type{ResourceLocalizationResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ResourceLocalizationResponseProto)
            __meta_ResourceLocalizationResponseProto[] = target = ProtoMeta(ResourceLocalizationResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, ResourceLocalizationResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ResourceLocalizationResponseProto[]
    end
end

mutable struct ReInitializeContainerRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReInitializeContainerRequestProto(; kwargs...)
        obj = new(meta(ReInitializeContainerRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ReInitializeContainerRequestProto
const __meta_ReInitializeContainerRequestProto = Ref{ProtoMeta}()
function meta(::Type{ReInitializeContainerRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReInitializeContainerRequestProto)
            __meta_ReInitializeContainerRequestProto[] = target = ProtoMeta(ReInitializeContainerRequestProto)
            val = Dict{Symbol,Any}(:auto_commit => true)
            allflds = Pair{Symbol,Union{Type,String}}[:container_id => ContainerIdProto, :container_launch_context => ContainerLaunchContextProto, :auto_commit => Bool]
            meta(target, ReInitializeContainerRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReInitializeContainerRequestProto[]
    end
end
function Base.getproperty(obj::ReInitializeContainerRequestProto, name::Symbol)
    if name === :container_id
        return (obj.__protobuf_jl_internal_values[name])::ContainerIdProto
    elseif name === :container_launch_context
        return (obj.__protobuf_jl_internal_values[name])::ContainerLaunchContextProto
    elseif name === :auto_commit
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct ReInitializeContainerResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReInitializeContainerResponseProto(; kwargs...)
        obj = new(meta(ReInitializeContainerResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ReInitializeContainerResponseProto
const __meta_ReInitializeContainerResponseProto = Ref{ProtoMeta}()
function meta(::Type{ReInitializeContainerResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReInitializeContainerResponseProto)
            __meta_ReInitializeContainerResponseProto[] = target = ProtoMeta(ReInitializeContainerResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, ReInitializeContainerResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReInitializeContainerResponseProto[]
    end
end

mutable struct RestartContainerResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RestartContainerResponseProto(; kwargs...)
        obj = new(meta(RestartContainerResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RestartContainerResponseProto
const __meta_RestartContainerResponseProto = Ref{ProtoMeta}()
function meta(::Type{RestartContainerResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RestartContainerResponseProto)
            __meta_RestartContainerResponseProto[] = target = ProtoMeta(RestartContainerResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, RestartContainerResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RestartContainerResponseProto[]
    end
end

mutable struct RollbackResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RollbackResponseProto(; kwargs...)
        obj = new(meta(RollbackResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RollbackResponseProto
const __meta_RollbackResponseProto = Ref{ProtoMeta}()
function meta(::Type{RollbackResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RollbackResponseProto)
            __meta_RollbackResponseProto[] = target = ProtoMeta(RollbackResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, RollbackResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RollbackResponseProto[]
    end
end

mutable struct CommitResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function CommitResponseProto(; kwargs...)
        obj = new(meta(CommitResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct CommitResponseProto
const __meta_CommitResponseProto = Ref{ProtoMeta}()
function meta(::Type{CommitResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CommitResponseProto)
            __meta_CommitResponseProto[] = target = ProtoMeta(CommitResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, CommitResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CommitResponseProto[]
    end
end

mutable struct StartContainersRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function StartContainersRequestProto(; kwargs...)
        obj = new(meta(StartContainersRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct StartContainersRequestProto
const __meta_StartContainersRequestProto = Ref{ProtoMeta}()
function meta(::Type{StartContainersRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StartContainersRequestProto)
            __meta_StartContainersRequestProto[] = target = ProtoMeta(StartContainersRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:start_container_request => Base.Vector{StartContainerRequestProto}]
            meta(target, StartContainersRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StartContainersRequestProto[]
    end
end
function Base.getproperty(obj::StartContainersRequestProto, name::Symbol)
    if name === :start_container_request
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{StartContainerRequestProto}
    else
        getfield(obj, name)
    end
end

mutable struct ContainerExceptionMapProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ContainerExceptionMapProto(; kwargs...)
        obj = new(meta(ContainerExceptionMapProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ContainerExceptionMapProto
const __meta_ContainerExceptionMapProto = Ref{ProtoMeta}()
function meta(::Type{ContainerExceptionMapProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ContainerExceptionMapProto)
            __meta_ContainerExceptionMapProto[] = target = ProtoMeta(ContainerExceptionMapProto)
            allflds = Pair{Symbol,Union{Type,String}}[:container_id => ContainerIdProto, :exception => SerializedExceptionProto]
            meta(target, ContainerExceptionMapProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ContainerExceptionMapProto[]
    end
end
function Base.getproperty(obj::ContainerExceptionMapProto, name::Symbol)
    if name === :container_id
        return (obj.__protobuf_jl_internal_values[name])::ContainerIdProto
    elseif name === :exception
        return (obj.__protobuf_jl_internal_values[name])::SerializedExceptionProto
    else
        getfield(obj, name)
    end
end

mutable struct StartContainersResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function StartContainersResponseProto(; kwargs...)
        obj = new(meta(StartContainersResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct StartContainersResponseProto
const __meta_StartContainersResponseProto = Ref{ProtoMeta}()
function meta(::Type{StartContainersResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StartContainersResponseProto)
            __meta_StartContainersResponseProto[] = target = ProtoMeta(StartContainersResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:services_meta_data => Base.Vector{StringBytesMapProto}, :succeeded_requests => Base.Vector{ContainerIdProto}, :failed_requests => Base.Vector{ContainerExceptionMapProto}]
            meta(target, StartContainersResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StartContainersResponseProto[]
    end
end
function Base.getproperty(obj::StartContainersResponseProto, name::Symbol)
    if name === :services_meta_data
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{StringBytesMapProto}
    elseif name === :succeeded_requests
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerIdProto}
    elseif name === :failed_requests
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerExceptionMapProto}
    else
        getfield(obj, name)
    end
end

mutable struct StopContainersRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function StopContainersRequestProto(; kwargs...)
        obj = new(meta(StopContainersRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct StopContainersRequestProto
const __meta_StopContainersRequestProto = Ref{ProtoMeta}()
function meta(::Type{StopContainersRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StopContainersRequestProto)
            __meta_StopContainersRequestProto[] = target = ProtoMeta(StopContainersRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:container_id => Base.Vector{ContainerIdProto}]
            meta(target, StopContainersRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StopContainersRequestProto[]
    end
end
function Base.getproperty(obj::StopContainersRequestProto, name::Symbol)
    if name === :container_id
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerIdProto}
    else
        getfield(obj, name)
    end
end

mutable struct StopContainersResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function StopContainersResponseProto(; kwargs...)
        obj = new(meta(StopContainersResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct StopContainersResponseProto
const __meta_StopContainersResponseProto = Ref{ProtoMeta}()
function meta(::Type{StopContainersResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StopContainersResponseProto)
            __meta_StopContainersResponseProto[] = target = ProtoMeta(StopContainersResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:succeeded_requests => Base.Vector{ContainerIdProto}, :failed_requests => Base.Vector{ContainerExceptionMapProto}]
            meta(target, StopContainersResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StopContainersResponseProto[]
    end
end
function Base.getproperty(obj::StopContainersResponseProto, name::Symbol)
    if name === :succeeded_requests
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerIdProto}
    elseif name === :failed_requests
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerExceptionMapProto}
    else
        getfield(obj, name)
    end
end

mutable struct GetContainerStatusesRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetContainerStatusesRequestProto(; kwargs...)
        obj = new(meta(GetContainerStatusesRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetContainerStatusesRequestProto
const __meta_GetContainerStatusesRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetContainerStatusesRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetContainerStatusesRequestProto)
            __meta_GetContainerStatusesRequestProto[] = target = ProtoMeta(GetContainerStatusesRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:container_id => Base.Vector{ContainerIdProto}]
            meta(target, GetContainerStatusesRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetContainerStatusesRequestProto[]
    end
end
function Base.getproperty(obj::GetContainerStatusesRequestProto, name::Symbol)
    if name === :container_id
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerIdProto}
    else
        getfield(obj, name)
    end
end

mutable struct GetContainerStatusesResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetContainerStatusesResponseProto(; kwargs...)
        obj = new(meta(GetContainerStatusesResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetContainerStatusesResponseProto
const __meta_GetContainerStatusesResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetContainerStatusesResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetContainerStatusesResponseProto)
            __meta_GetContainerStatusesResponseProto[] = target = ProtoMeta(GetContainerStatusesResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:status => Base.Vector{ContainerStatusProto}, :failed_requests => Base.Vector{ContainerExceptionMapProto}]
            meta(target, GetContainerStatusesResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetContainerStatusesResponseProto[]
    end
end
function Base.getproperty(obj::GetContainerStatusesResponseProto, name::Symbol)
    if name === :status
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerStatusProto}
    elseif name === :failed_requests
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerExceptionMapProto}
    else
        getfield(obj, name)
    end
end

mutable struct IncreaseContainersResourceRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function IncreaseContainersResourceRequestProto(; kwargs...)
        obj = new(meta(IncreaseContainersResourceRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct IncreaseContainersResourceRequestProto
const __meta_IncreaseContainersResourceRequestProto = Ref{ProtoMeta}()
function meta(::Type{IncreaseContainersResourceRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_IncreaseContainersResourceRequestProto)
            __meta_IncreaseContainersResourceRequestProto[] = target = ProtoMeta(IncreaseContainersResourceRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:increase_containers => Base.Vector{hadoop.common.TokenProto}]
            meta(target, IncreaseContainersResourceRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_IncreaseContainersResourceRequestProto[]
    end
end
function Base.getproperty(obj::IncreaseContainersResourceRequestProto, name::Symbol)
    if name === :increase_containers
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{hadoop.common.TokenProto}
    else
        getfield(obj, name)
    end
end

mutable struct IncreaseContainersResourceResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function IncreaseContainersResourceResponseProto(; kwargs...)
        obj = new(meta(IncreaseContainersResourceResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct IncreaseContainersResourceResponseProto
const __meta_IncreaseContainersResourceResponseProto = Ref{ProtoMeta}()
function meta(::Type{IncreaseContainersResourceResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_IncreaseContainersResourceResponseProto)
            __meta_IncreaseContainersResourceResponseProto[] = target = ProtoMeta(IncreaseContainersResourceResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:succeeded_requests => Base.Vector{ContainerIdProto}, :failed_requests => Base.Vector{ContainerExceptionMapProto}]
            meta(target, IncreaseContainersResourceResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_IncreaseContainersResourceResponseProto[]
    end
end
function Base.getproperty(obj::IncreaseContainersResourceResponseProto, name::Symbol)
    if name === :succeeded_requests
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerIdProto}
    elseif name === :failed_requests
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerExceptionMapProto}
    else
        getfield(obj, name)
    end
end

mutable struct ContainerUpdateRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ContainerUpdateRequestProto(; kwargs...)
        obj = new(meta(ContainerUpdateRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ContainerUpdateRequestProto
const __meta_ContainerUpdateRequestProto = Ref{ProtoMeta}()
function meta(::Type{ContainerUpdateRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ContainerUpdateRequestProto)
            __meta_ContainerUpdateRequestProto[] = target = ProtoMeta(ContainerUpdateRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:update_container_token => Base.Vector{hadoop.common.TokenProto}]
            meta(target, ContainerUpdateRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ContainerUpdateRequestProto[]
    end
end
function Base.getproperty(obj::ContainerUpdateRequestProto, name::Symbol)
    if name === :update_container_token
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{hadoop.common.TokenProto}
    else
        getfield(obj, name)
    end
end

mutable struct ContainerUpdateResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ContainerUpdateResponseProto(; kwargs...)
        obj = new(meta(ContainerUpdateResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ContainerUpdateResponseProto
const __meta_ContainerUpdateResponseProto = Ref{ProtoMeta}()
function meta(::Type{ContainerUpdateResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ContainerUpdateResponseProto)
            __meta_ContainerUpdateResponseProto[] = target = ProtoMeta(ContainerUpdateResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:succeeded_requests => Base.Vector{ContainerIdProto}, :failed_requests => Base.Vector{ContainerExceptionMapProto}]
            meta(target, ContainerUpdateResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ContainerUpdateResponseProto[]
    end
end
function Base.getproperty(obj::ContainerUpdateResponseProto, name::Symbol)
    if name === :succeeded_requests
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerIdProto}
    elseif name === :failed_requests
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerExceptionMapProto}
    else
        getfield(obj, name)
    end
end

mutable struct GetApplicationAttemptReportRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetApplicationAttemptReportRequestProto(; kwargs...)
        obj = new(meta(GetApplicationAttemptReportRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetApplicationAttemptReportRequestProto
const __meta_GetApplicationAttemptReportRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetApplicationAttemptReportRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetApplicationAttemptReportRequestProto)
            __meta_GetApplicationAttemptReportRequestProto[] = target = ProtoMeta(GetApplicationAttemptReportRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:application_attempt_id => ApplicationAttemptIdProto]
            meta(target, GetApplicationAttemptReportRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetApplicationAttemptReportRequestProto[]
    end
end
function Base.getproperty(obj::GetApplicationAttemptReportRequestProto, name::Symbol)
    if name === :application_attempt_id
        return (obj.__protobuf_jl_internal_values[name])::ApplicationAttemptIdProto
    else
        getfield(obj, name)
    end
end

mutable struct GetApplicationAttemptReportResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetApplicationAttemptReportResponseProto(; kwargs...)
        obj = new(meta(GetApplicationAttemptReportResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetApplicationAttemptReportResponseProto
const __meta_GetApplicationAttemptReportResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetApplicationAttemptReportResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetApplicationAttemptReportResponseProto)
            __meta_GetApplicationAttemptReportResponseProto[] = target = ProtoMeta(GetApplicationAttemptReportResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:application_attempt_report => ApplicationAttemptReportProto]
            meta(target, GetApplicationAttemptReportResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetApplicationAttemptReportResponseProto[]
    end
end
function Base.getproperty(obj::GetApplicationAttemptReportResponseProto, name::Symbol)
    if name === :application_attempt_report
        return (obj.__protobuf_jl_internal_values[name])::ApplicationAttemptReportProto
    else
        getfield(obj, name)
    end
end

mutable struct GetApplicationAttemptsRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetApplicationAttemptsRequestProto(; kwargs...)
        obj = new(meta(GetApplicationAttemptsRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetApplicationAttemptsRequestProto
const __meta_GetApplicationAttemptsRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetApplicationAttemptsRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetApplicationAttemptsRequestProto)
            __meta_GetApplicationAttemptsRequestProto[] = target = ProtoMeta(GetApplicationAttemptsRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:application_id => ApplicationIdProto]
            meta(target, GetApplicationAttemptsRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetApplicationAttemptsRequestProto[]
    end
end
function Base.getproperty(obj::GetApplicationAttemptsRequestProto, name::Symbol)
    if name === :application_id
        return (obj.__protobuf_jl_internal_values[name])::ApplicationIdProto
    else
        getfield(obj, name)
    end
end

mutable struct GetApplicationAttemptsResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetApplicationAttemptsResponseProto(; kwargs...)
        obj = new(meta(GetApplicationAttemptsResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetApplicationAttemptsResponseProto
const __meta_GetApplicationAttemptsResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetApplicationAttemptsResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetApplicationAttemptsResponseProto)
            __meta_GetApplicationAttemptsResponseProto[] = target = ProtoMeta(GetApplicationAttemptsResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:application_attempts => Base.Vector{ApplicationAttemptReportProto}]
            meta(target, GetApplicationAttemptsResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetApplicationAttemptsResponseProto[]
    end
end
function Base.getproperty(obj::GetApplicationAttemptsResponseProto, name::Symbol)
    if name === :application_attempts
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ApplicationAttemptReportProto}
    else
        getfield(obj, name)
    end
end

mutable struct GetContainerReportRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetContainerReportRequestProto(; kwargs...)
        obj = new(meta(GetContainerReportRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetContainerReportRequestProto
const __meta_GetContainerReportRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetContainerReportRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetContainerReportRequestProto)
            __meta_GetContainerReportRequestProto[] = target = ProtoMeta(GetContainerReportRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:container_id => ContainerIdProto]
            meta(target, GetContainerReportRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetContainerReportRequestProto[]
    end
end
function Base.getproperty(obj::GetContainerReportRequestProto, name::Symbol)
    if name === :container_id
        return (obj.__protobuf_jl_internal_values[name])::ContainerIdProto
    else
        getfield(obj, name)
    end
end

mutable struct GetContainerReportResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetContainerReportResponseProto(; kwargs...)
        obj = new(meta(GetContainerReportResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetContainerReportResponseProto
const __meta_GetContainerReportResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetContainerReportResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetContainerReportResponseProto)
            __meta_GetContainerReportResponseProto[] = target = ProtoMeta(GetContainerReportResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:container_report => ContainerReportProto]
            meta(target, GetContainerReportResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetContainerReportResponseProto[]
    end
end
function Base.getproperty(obj::GetContainerReportResponseProto, name::Symbol)
    if name === :container_report
        return (obj.__protobuf_jl_internal_values[name])::ContainerReportProto
    else
        getfield(obj, name)
    end
end

mutable struct GetContainersRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetContainersRequestProto(; kwargs...)
        obj = new(meta(GetContainersRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetContainersRequestProto
const __meta_GetContainersRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetContainersRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetContainersRequestProto)
            __meta_GetContainersRequestProto[] = target = ProtoMeta(GetContainersRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:application_attempt_id => ApplicationAttemptIdProto]
            meta(target, GetContainersRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetContainersRequestProto[]
    end
end
function Base.getproperty(obj::GetContainersRequestProto, name::Symbol)
    if name === :application_attempt_id
        return (obj.__protobuf_jl_internal_values[name])::ApplicationAttemptIdProto
    else
        getfield(obj, name)
    end
end

mutable struct GetContainersResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetContainersResponseProto(; kwargs...)
        obj = new(meta(GetContainersResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetContainersResponseProto
const __meta_GetContainersResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetContainersResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetContainersResponseProto)
            __meta_GetContainersResponseProto[] = target = ProtoMeta(GetContainersResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:containers => Base.Vector{ContainerReportProto}]
            meta(target, GetContainersResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetContainersResponseProto[]
    end
end
function Base.getproperty(obj::GetContainersResponseProto, name::Symbol)
    if name === :containers
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ContainerReportProto}
    else
        getfield(obj, name)
    end
end

mutable struct UseSharedCacheResourceRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UseSharedCacheResourceRequestProto(; kwargs...)
        obj = new(meta(UseSharedCacheResourceRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct UseSharedCacheResourceRequestProto
const __meta_UseSharedCacheResourceRequestProto = Ref{ProtoMeta}()
function meta(::Type{UseSharedCacheResourceRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UseSharedCacheResourceRequestProto)
            __meta_UseSharedCacheResourceRequestProto[] = target = ProtoMeta(UseSharedCacheResourceRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:applicationId => ApplicationIdProto, :resourceKey => AbstractString]
            meta(target, UseSharedCacheResourceRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UseSharedCacheResourceRequestProto[]
    end
end
function Base.getproperty(obj::UseSharedCacheResourceRequestProto, name::Symbol)
    if name === :applicationId
        return (obj.__protobuf_jl_internal_values[name])::ApplicationIdProto
    elseif name === :resourceKey
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct UseSharedCacheResourceResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function UseSharedCacheResourceResponseProto(; kwargs...)
        obj = new(meta(UseSharedCacheResourceResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct UseSharedCacheResourceResponseProto
const __meta_UseSharedCacheResourceResponseProto = Ref{ProtoMeta}()
function meta(::Type{UseSharedCacheResourceResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_UseSharedCacheResourceResponseProto)
            __meta_UseSharedCacheResourceResponseProto[] = target = ProtoMeta(UseSharedCacheResourceResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:path => AbstractString]
            meta(target, UseSharedCacheResourceResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_UseSharedCacheResourceResponseProto[]
    end
end
function Base.getproperty(obj::UseSharedCacheResourceResponseProto, name::Symbol)
    if name === :path
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct ReleaseSharedCacheResourceRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReleaseSharedCacheResourceRequestProto(; kwargs...)
        obj = new(meta(ReleaseSharedCacheResourceRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ReleaseSharedCacheResourceRequestProto
const __meta_ReleaseSharedCacheResourceRequestProto = Ref{ProtoMeta}()
function meta(::Type{ReleaseSharedCacheResourceRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReleaseSharedCacheResourceRequestProto)
            __meta_ReleaseSharedCacheResourceRequestProto[] = target = ProtoMeta(ReleaseSharedCacheResourceRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:applicationId => ApplicationIdProto, :resourceKey => AbstractString]
            meta(target, ReleaseSharedCacheResourceRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReleaseSharedCacheResourceRequestProto[]
    end
end
function Base.getproperty(obj::ReleaseSharedCacheResourceRequestProto, name::Symbol)
    if name === :applicationId
        return (obj.__protobuf_jl_internal_values[name])::ApplicationIdProto
    elseif name === :resourceKey
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct ReleaseSharedCacheResourceResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReleaseSharedCacheResourceResponseProto(; kwargs...)
        obj = new(meta(ReleaseSharedCacheResourceResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ReleaseSharedCacheResourceResponseProto
const __meta_ReleaseSharedCacheResourceResponseProto = Ref{ProtoMeta}()
function meta(::Type{ReleaseSharedCacheResourceResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReleaseSharedCacheResourceResponseProto)
            __meta_ReleaseSharedCacheResourceResponseProto[] = target = ProtoMeta(ReleaseSharedCacheResourceResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, ReleaseSharedCacheResourceResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReleaseSharedCacheResourceResponseProto[]
    end
end

mutable struct GetNewReservationRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetNewReservationRequestProto(; kwargs...)
        obj = new(meta(GetNewReservationRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetNewReservationRequestProto
const __meta_GetNewReservationRequestProto = Ref{ProtoMeta}()
function meta(::Type{GetNewReservationRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetNewReservationRequestProto)
            __meta_GetNewReservationRequestProto[] = target = ProtoMeta(GetNewReservationRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, GetNewReservationRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetNewReservationRequestProto[]
    end
end

mutable struct GetNewReservationResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function GetNewReservationResponseProto(; kwargs...)
        obj = new(meta(GetNewReservationResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct GetNewReservationResponseProto
const __meta_GetNewReservationResponseProto = Ref{ProtoMeta}()
function meta(::Type{GetNewReservationResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_GetNewReservationResponseProto)
            __meta_GetNewReservationResponseProto[] = target = ProtoMeta(GetNewReservationResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:reservation_id => ReservationIdProto]
            meta(target, GetNewReservationResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_GetNewReservationResponseProto[]
    end
end
function Base.getproperty(obj::GetNewReservationResponseProto, name::Symbol)
    if name === :reservation_id
        return (obj.__protobuf_jl_internal_values[name])::ReservationIdProto
    else
        getfield(obj, name)
    end
end

mutable struct ReservationSubmissionRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReservationSubmissionRequestProto(; kwargs...)
        obj = new(meta(ReservationSubmissionRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ReservationSubmissionRequestProto
const __meta_ReservationSubmissionRequestProto = Ref{ProtoMeta}()
function meta(::Type{ReservationSubmissionRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReservationSubmissionRequestProto)
            __meta_ReservationSubmissionRequestProto[] = target = ProtoMeta(ReservationSubmissionRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:queue => AbstractString, :reservation_definition => ReservationDefinitionProto, :reservation_id => ReservationIdProto]
            meta(target, ReservationSubmissionRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReservationSubmissionRequestProto[]
    end
end
function Base.getproperty(obj::ReservationSubmissionRequestProto, name::Symbol)
    if name === :queue
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :reservation_definition
        return (obj.__protobuf_jl_internal_values[name])::ReservationDefinitionProto
    elseif name === :reservation_id
        return (obj.__protobuf_jl_internal_values[name])::ReservationIdProto
    else
        getfield(obj, name)
    end
end

mutable struct ReservationSubmissionResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReservationSubmissionResponseProto(; kwargs...)
        obj = new(meta(ReservationSubmissionResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ReservationSubmissionResponseProto
const __meta_ReservationSubmissionResponseProto = Ref{ProtoMeta}()
function meta(::Type{ReservationSubmissionResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReservationSubmissionResponseProto)
            __meta_ReservationSubmissionResponseProto[] = target = ProtoMeta(ReservationSubmissionResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, ReservationSubmissionResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReservationSubmissionResponseProto[]
    end
end

mutable struct ReservationUpdateRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReservationUpdateRequestProto(; kwargs...)
        obj = new(meta(ReservationUpdateRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ReservationUpdateRequestProto
const __meta_ReservationUpdateRequestProto = Ref{ProtoMeta}()
function meta(::Type{ReservationUpdateRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReservationUpdateRequestProto)
            __meta_ReservationUpdateRequestProto[] = target = ProtoMeta(ReservationUpdateRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:reservation_definition => ReservationDefinitionProto, :reservation_id => ReservationIdProto]
            meta(target, ReservationUpdateRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReservationUpdateRequestProto[]
    end
end
function Base.getproperty(obj::ReservationUpdateRequestProto, name::Symbol)
    if name === :reservation_definition
        return (obj.__protobuf_jl_internal_values[name])::ReservationDefinitionProto
    elseif name === :reservation_id
        return (obj.__protobuf_jl_internal_values[name])::ReservationIdProto
    else
        getfield(obj, name)
    end
end

mutable struct ReservationUpdateResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReservationUpdateResponseProto(; kwargs...)
        obj = new(meta(ReservationUpdateResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ReservationUpdateResponseProto
const __meta_ReservationUpdateResponseProto = Ref{ProtoMeta}()
function meta(::Type{ReservationUpdateResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReservationUpdateResponseProto)
            __meta_ReservationUpdateResponseProto[] = target = ProtoMeta(ReservationUpdateResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, ReservationUpdateResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReservationUpdateResponseProto[]
    end
end

mutable struct ReservationDeleteRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReservationDeleteRequestProto(; kwargs...)
        obj = new(meta(ReservationDeleteRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ReservationDeleteRequestProto
const __meta_ReservationDeleteRequestProto = Ref{ProtoMeta}()
function meta(::Type{ReservationDeleteRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReservationDeleteRequestProto)
            __meta_ReservationDeleteRequestProto[] = target = ProtoMeta(ReservationDeleteRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:reservation_id => ReservationIdProto]
            meta(target, ReservationDeleteRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReservationDeleteRequestProto[]
    end
end
function Base.getproperty(obj::ReservationDeleteRequestProto, name::Symbol)
    if name === :reservation_id
        return (obj.__protobuf_jl_internal_values[name])::ReservationIdProto
    else
        getfield(obj, name)
    end
end

mutable struct ReservationDeleteResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReservationDeleteResponseProto(; kwargs...)
        obj = new(meta(ReservationDeleteResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ReservationDeleteResponseProto
const __meta_ReservationDeleteResponseProto = Ref{ProtoMeta}()
function meta(::Type{ReservationDeleteResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReservationDeleteResponseProto)
            __meta_ReservationDeleteResponseProto[] = target = ProtoMeta(ReservationDeleteResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, ReservationDeleteResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReservationDeleteResponseProto[]
    end
end

mutable struct ReservationListRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReservationListRequestProto(; kwargs...)
        obj = new(meta(ReservationListRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ReservationListRequestProto
const __meta_ReservationListRequestProto = Ref{ProtoMeta}()
function meta(::Type{ReservationListRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReservationListRequestProto)
            __meta_ReservationListRequestProto[] = target = ProtoMeta(ReservationListRequestProto)
            fnum = Int[1,3,4,5,6]
            allflds = Pair{Symbol,Union{Type,String}}[:queue => AbstractString, :reservation_id => AbstractString, :start_time => Int64, :end_time => Int64, :include_resource_allocations => Bool]
            meta(target, ReservationListRequestProto, allflds, ProtoBuf.DEF_REQ, fnum, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReservationListRequestProto[]
    end
end
function Base.getproperty(obj::ReservationListRequestProto, name::Symbol)
    if name === :queue
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :reservation_id
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :start_time
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :end_time
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :include_resource_allocations
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct ReservationListResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function ReservationListResponseProto(; kwargs...)
        obj = new(meta(ReservationListResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct ReservationListResponseProto
const __meta_ReservationListResponseProto = Ref{ProtoMeta}()
function meta(::Type{ReservationListResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReservationListResponseProto)
            __meta_ReservationListResponseProto[] = target = ProtoMeta(ReservationListResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:reservations => Base.Vector{ReservationAllocationStateProto}]
            meta(target, ReservationListResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReservationListResponseProto[]
    end
end
function Base.getproperty(obj::ReservationListResponseProto, name::Symbol)
    if name === :reservations
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ReservationAllocationStateProto}
    else
        getfield(obj, name)
    end
end

mutable struct RunSharedCacheCleanerTaskRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RunSharedCacheCleanerTaskRequestProto(; kwargs...)
        obj = new(meta(RunSharedCacheCleanerTaskRequestProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RunSharedCacheCleanerTaskRequestProto
const __meta_RunSharedCacheCleanerTaskRequestProto = Ref{ProtoMeta}()
function meta(::Type{RunSharedCacheCleanerTaskRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RunSharedCacheCleanerTaskRequestProto)
            __meta_RunSharedCacheCleanerTaskRequestProto[] = target = ProtoMeta(RunSharedCacheCleanerTaskRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[]
            meta(target, RunSharedCacheCleanerTaskRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RunSharedCacheCleanerTaskRequestProto[]
    end
end

mutable struct RunSharedCacheCleanerTaskResponseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}

    function RunSharedCacheCleanerTaskResponseProto(; kwargs...)
        obj = new(meta(RunSharedCacheCleanerTaskResponseProto), Dict{Symbol,Any}())
        values = obj.__protobuf_jl_internal_values
        symdict = obj.__protobuf_jl_internal_meta.symdict
        for nv in kwargs
            fldname, fldval = nv
            fldtype = symdict[fldname].jtyp
            (fldname in keys(symdict)) || error(string(typeof(obj), " has no field with name ", fldname))
            values[fldname] = isa(fldval, fldtype) ? fldval : convert(fldtype, fldval)
        end
        obj
    end
end # mutable struct RunSharedCacheCleanerTaskResponseProto
const __meta_RunSharedCacheCleanerTaskResponseProto = Ref{ProtoMeta}()
function meta(::Type{RunSharedCacheCleanerTaskResponseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_RunSharedCacheCleanerTaskResponseProto)
            __meta_RunSharedCacheCleanerTaskResponseProto[] = target = ProtoMeta(RunSharedCacheCleanerTaskResponseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:accepted => Bool]
            meta(target, RunSharedCacheCleanerTaskResponseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_RunSharedCacheCleanerTaskResponseProto[]
    end
end
function Base.getproperty(obj::RunSharedCacheCleanerTaskResponseProto, name::Symbol)
    if name === :accepted
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

export ContainerUpdateTypeProto, SchedulerResourceTypes, ApplicationsRequestScopeProto, RegisterApplicationMasterRequestProto, RegisterApplicationMasterResponseProto, FinishApplicationMasterRequestProto, FinishApplicationMasterResponseProto, UpdateContainerRequestProto, UpdateContainerErrorProto, AllocateRequestProto, NMTokenProto, UpdatedContainerProto, AllocateResponseProto, GetNewApplicationRequestProto, GetNewApplicationResponseProto, GetApplicationReportRequestProto, GetApplicationReportResponseProto, SubmitApplicationRequestProto, SubmitApplicationResponseProto, FailApplicationAttemptRequestProto, FailApplicationAttemptResponseProto, KillApplicationRequestProto, KillApplicationResponseProto, GetClusterMetricsRequestProto, GetClusterMetricsResponseProto, MoveApplicationAcrossQueuesRequestProto, MoveApplicationAcrossQueuesResponseProto, GetApplicationsRequestProto, GetApplicationsResponseProto, GetClusterNodesRequestProto, GetClusterNodesResponseProto, GetQueueInfoRequestProto, GetQueueInfoResponseProto, GetQueueUserAclsInfoRequestProto, GetQueueUserAclsInfoResponseProto, GetNodesToLabelsRequestProto, GetNodesToLabelsResponseProto, GetLabelsToNodesRequestProto, GetLabelsToNodesResponseProto, GetClusterNodeLabelsRequestProto, GetClusterNodeLabelsResponseProto, UpdateApplicationPriorityRequestProto, UpdateApplicationPriorityResponseProto, SignalContainerRequestProto, SignalContainerResponseProto, UpdateApplicationTimeoutsRequestProto, UpdateApplicationTimeoutsResponseProto, GetAllResourceTypeInfoRequestProto, GetAllResourceTypeInfoResponseProto, StartContainerRequestProto, StartContainerResponseProto, StopContainerRequestProto, StopContainerResponseProto, ResourceLocalizationRequestProto, ResourceLocalizationResponseProto, ReInitializeContainerRequestProto, ReInitializeContainerResponseProto, RestartContainerResponseProto, RollbackResponseProto, CommitResponseProto, StartContainersRequestProto, ContainerExceptionMapProto, StartContainersResponseProto, StopContainersRequestProto, StopContainersResponseProto, GetContainerStatusesRequestProto, GetContainerStatusesResponseProto, IncreaseContainersResourceRequestProto, IncreaseContainersResourceResponseProto, ContainerUpdateRequestProto, ContainerUpdateResponseProto, GetApplicationAttemptReportRequestProto, GetApplicationAttemptReportResponseProto, GetApplicationAttemptsRequestProto, GetApplicationAttemptsResponseProto, GetContainerReportRequestProto, GetContainerReportResponseProto, GetContainersRequestProto, GetContainersResponseProto, UseSharedCacheResourceRequestProto, UseSharedCacheResourceResponseProto, ReleaseSharedCacheResourceRequestProto, ReleaseSharedCacheResourceResponseProto, GetNewReservationRequestProto, GetNewReservationResponseProto, ReservationSubmissionRequestProto, ReservationSubmissionResponseProto, ReservationUpdateRequestProto, ReservationUpdateResponseProto, ReservationDeleteRequestProto, ReservationDeleteResponseProto, ReservationListRequestProto, ReservationListResponseProto, RunSharedCacheCleanerTaskRequestProto, RunSharedCacheCleanerTaskResponseProto
