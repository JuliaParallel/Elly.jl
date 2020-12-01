# syntax: proto2
# COV_EXCL_START
using ProtoBuf
import ProtoBuf.meta
import ..hadoop

const ResourceTypesProto = (;[
    Symbol("COUNTABLE") => Int32(0),
]...)

const ContainerStateProto = (;[
    Symbol("C_NEW") => Int32(1),
    Symbol("C_RUNNING") => Int32(2),
    Symbol("C_COMPLETE") => Int32(3),
]...)

const ContainerSubStateProto = (;[
    Symbol("CSS_SCHEDULED") => Int32(1),
    Symbol("CSS_RUNNING") => Int32(2),
    Symbol("CSS_PAUSED") => Int32(3),
    Symbol("CSS_COMPLETING") => Int32(4),
    Symbol("CSS_DONE") => Int32(5),
]...)

const YarnApplicationStateProto = (;[
    Symbol("NEW") => Int32(1),
    Symbol("NEW_SAVING") => Int32(2),
    Symbol("SUBMITTED") => Int32(3),
    Symbol("ACCEPTED") => Int32(4),
    Symbol("RUNNING") => Int32(5),
    Symbol("FINISHED") => Int32(6),
    Symbol("FAILED") => Int32(7),
    Symbol("KILLED") => Int32(8),
]...)

const YarnApplicationAttemptStateProto = (;[
    Symbol("APP_ATTEMPT_NEW") => Int32(1),
    Symbol("APP_ATTEMPT_SUBMITTED") => Int32(2),
    Symbol("APP_ATTEMPT_SCHEDULED") => Int32(3),
    Symbol("APP_ATTEMPT_ALLOCATED_SAVING") => Int32(4),
    Symbol("APP_ATTEMPT_ALLOCATED") => Int32(5),
    Symbol("APP_ATTEMPT_LAUNCHED") => Int32(6),
    Symbol("APP_ATTEMPT_FAILED") => Int32(7),
    Symbol("APP_ATTEMPT_RUNNING") => Int32(8),
    Symbol("APP_ATTEMPT_FINISHING") => Int32(9),
    Symbol("APP_ATTEMPT_FINISHED") => Int32(10),
    Symbol("APP_ATTEMPT_KILLED") => Int32(11),
]...)

const FinalApplicationStatusProto = (;[
    Symbol("APP_UNDEFINED") => Int32(0),
    Symbol("APP_SUCCEEDED") => Int32(1),
    Symbol("APP_FAILED") => Int32(2),
    Symbol("APP_KILLED") => Int32(3),
    Symbol("APP_ENDED") => Int32(4),
]...)

const LocalResourceVisibilityProto = (;[
    Symbol("PUBLIC") => Int32(1),
    Symbol("PRIVATE") => Int32(2),
    Symbol("APPLICATION") => Int32(3),
]...)

const LocalResourceTypeProto = (;[
    Symbol("ARCHIVE") => Int32(1),
    Symbol("FILE") => Int32(2),
    Symbol("PATTERN") => Int32(3),
]...)

const LogAggregationStatusProto = (;[
    Symbol("LOG_DISABLED") => Int32(1),
    Symbol("LOG_NOT_START") => Int32(2),
    Symbol("LOG_RUNNING") => Int32(3),
    Symbol("LOG_SUCCEEDED") => Int32(4),
    Symbol("LOG_FAILED") => Int32(5),
    Symbol("LOG_TIME_OUT") => Int32(6),
    Symbol("LOG_RUNNING_WITH_FAILURE") => Int32(7),
]...)

const NodeStateProto = (;[
    Symbol("NS_NEW") => Int32(1),
    Symbol("NS_RUNNING") => Int32(2),
    Symbol("NS_UNHEALTHY") => Int32(3),
    Symbol("NS_DECOMMISSIONED") => Int32(4),
    Symbol("NS_LOST") => Int32(5),
    Symbol("NS_REBOOTED") => Int32(6),
    Symbol("NS_DECOMMISSIONING") => Int32(7),
    Symbol("NS_SHUTDOWN") => Int32(8),
]...)

const ContainerTypeProto = (;[
    Symbol("APPLICATION_MASTER") => Int32(1),
    Symbol("TASK") => Int32(2),
]...)

const ExecutionTypeProto = (;[
    Symbol("GUARANTEED") => Int32(1),
    Symbol("OPPORTUNISTIC") => Int32(2),
]...)

const AMCommandProto = (;[
    Symbol("AM_RESYNC") => Int32(1),
    Symbol("AM_SHUTDOWN") => Int32(2),
]...)

const ApplicationTimeoutTypeProto = (;[
    Symbol("APP_TIMEOUT_LIFETIME") => Int32(1),
]...)

const ApplicationAccessTypeProto = (;[
    Symbol("APPACCESS_VIEW_APP") => Int32(1),
    Symbol("APPACCESS_MODIFY_APP") => Int32(2),
]...)

const QueueStateProto = (;[
    Symbol("Q_STOPPED") => Int32(1),
    Symbol("Q_RUNNING") => Int32(2),
    Symbol("Q_DRAINING") => Int32(3),
]...)

const QueueACLProto = (;[
    Symbol("QACL_SUBMIT_APPLICATIONS") => Int32(1),
    Symbol("QACL_ADMINISTER_QUEUE") => Int32(2),
]...)

const SignalContainerCommandProto = (;[
    Symbol("OUTPUT_THREAD_DUMP") => Int32(1),
    Symbol("GRACEFUL_SHUTDOWN") => Int32(2),
    Symbol("FORCEFUL_SHUTDOWN") => Int32(3),
]...)

const ReservationRequestInterpreterProto = (;[
    Symbol("R_ANY") => Int32(0),
    Symbol("R_ALL") => Int32(1),
    Symbol("R_ORDER") => Int32(2),
    Symbol("R_ORDER_NO_GAP") => Int32(3),
]...)

const ContainerExitStatusProto = (;[
    Symbol("SUCCESS") => Int32(0),
    Symbol("INVALID") => Int32(-1000),
    Symbol("ABORTED") => Int32(-100),
    Symbol("DISKS_FAILED") => Int32(-101),
]...)

const ContainerRetryPolicyProto = (;[
    Symbol("NEVER_RETRY") => Int32(0),
    Symbol("RETRY_ON_ALL_ERRORS") => Int32(1),
    Symbol("RETRY_ON_SPECIFIC_ERROR_CODES") => Int32(2),
]...)

mutable struct SerializedExceptionProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function SerializedExceptionProto(; kwargs...)
        obj = new(meta(SerializedExceptionProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct SerializedExceptionProto
const __meta_SerializedExceptionProto = Ref{ProtoMeta}()
function meta(::Type{SerializedExceptionProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_SerializedExceptionProto)
            __meta_SerializedExceptionProto[] = target = ProtoMeta(SerializedExceptionProto)
            allflds = Pair{Symbol,Union{Type,String}}[:message => AbstractString, :trace => AbstractString, :class_name => AbstractString, :cause => SerializedExceptionProto]
            meta(target, SerializedExceptionProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_SerializedExceptionProto[]
    end
end
function Base.getproperty(obj::SerializedExceptionProto, name::Symbol)
    if name === :message
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :trace
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :class_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :cause
        return (obj.__protobuf_jl_internal_values[name])::SerializedExceptionProto
    else
        getfield(obj, name)
    end
end

mutable struct ApplicationIdProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ApplicationIdProto(; kwargs...)
        obj = new(meta(ApplicationIdProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ApplicationIdProto
const __meta_ApplicationIdProto = Ref{ProtoMeta}()
function meta(::Type{ApplicationIdProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ApplicationIdProto)
            __meta_ApplicationIdProto[] = target = ProtoMeta(ApplicationIdProto)
            allflds = Pair{Symbol,Union{Type,String}}[:id => Int32, :cluster_timestamp => Int64]
            meta(target, ApplicationIdProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ApplicationIdProto[]
    end
end
function Base.getproperty(obj::ApplicationIdProto, name::Symbol)
    if name === :id
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :cluster_timestamp
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct ApplicationAttemptIdProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ApplicationAttemptIdProto(; kwargs...)
        obj = new(meta(ApplicationAttemptIdProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ApplicationAttemptIdProto
const __meta_ApplicationAttemptIdProto = Ref{ProtoMeta}()
function meta(::Type{ApplicationAttemptIdProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ApplicationAttemptIdProto)
            __meta_ApplicationAttemptIdProto[] = target = ProtoMeta(ApplicationAttemptIdProto)
            allflds = Pair{Symbol,Union{Type,String}}[:application_id => ApplicationIdProto, :attemptId => Int32]
            meta(target, ApplicationAttemptIdProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ApplicationAttemptIdProto[]
    end
end
function Base.getproperty(obj::ApplicationAttemptIdProto, name::Symbol)
    if name === :application_id
        return (obj.__protobuf_jl_internal_values[name])::ApplicationIdProto
    elseif name === :attemptId
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct ContainerIdProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ContainerIdProto(; kwargs...)
        obj = new(meta(ContainerIdProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ContainerIdProto
const __meta_ContainerIdProto = Ref{ProtoMeta}()
function meta(::Type{ContainerIdProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ContainerIdProto)
            __meta_ContainerIdProto[] = target = ProtoMeta(ContainerIdProto)
            allflds = Pair{Symbol,Union{Type,String}}[:app_id => ApplicationIdProto, :app_attempt_id => ApplicationAttemptIdProto, :id => Int64]
            meta(target, ContainerIdProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ContainerIdProto[]
    end
end
function Base.getproperty(obj::ContainerIdProto, name::Symbol)
    if name === :app_id
        return (obj.__protobuf_jl_internal_values[name])::ApplicationIdProto
    elseif name === :app_attempt_id
        return (obj.__protobuf_jl_internal_values[name])::ApplicationAttemptIdProto
    elseif name === :id
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct ResourceInformationProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ResourceInformationProto(; kwargs...)
        obj = new(meta(ResourceInformationProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ResourceInformationProto
const __meta_ResourceInformationProto = Ref{ProtoMeta}()
function meta(::Type{ResourceInformationProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ResourceInformationProto)
            __meta_ResourceInformationProto[] = target = ProtoMeta(ResourceInformationProto)
            req = Symbol[:key]
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => Int64, :units => AbstractString, :_type => Int32]
            meta(target, ResourceInformationProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ResourceInformationProto[]
    end
end
function Base.getproperty(obj::ResourceInformationProto, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :units
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct ResourceTypeInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ResourceTypeInfoProto(; kwargs...)
        obj = new(meta(ResourceTypeInfoProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ResourceTypeInfoProto
const __meta_ResourceTypeInfoProto = Ref{ProtoMeta}()
function meta(::Type{ResourceTypeInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ResourceTypeInfoProto)
            __meta_ResourceTypeInfoProto[] = target = ProtoMeta(ResourceTypeInfoProto)
            req = Symbol[:name]
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :units => AbstractString, :_type => Int32]
            meta(target, ResourceTypeInfoProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ResourceTypeInfoProto[]
    end
end
function Base.getproperty(obj::ResourceTypeInfoProto, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :units
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct ResourceProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ResourceProto(; kwargs...)
        obj = new(meta(ResourceProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ResourceProto
const __meta_ResourceProto = Ref{ProtoMeta}()
function meta(::Type{ResourceProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ResourceProto)
            __meta_ResourceProto[] = target = ProtoMeta(ResourceProto)
            allflds = Pair{Symbol,Union{Type,String}}[:memory => Int64, :virtual_cores => Int32, :resource_value_map => Base.Vector{ResourceInformationProto}]
            meta(target, ResourceProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ResourceProto[]
    end
end
function Base.getproperty(obj::ResourceProto, name::Symbol)
    if name === :memory
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :virtual_cores
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :resource_value_map
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ResourceInformationProto}
    else
        getfield(obj, name)
    end
end

mutable struct ResourceUtilizationProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ResourceUtilizationProto(; kwargs...)
        obj = new(meta(ResourceUtilizationProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ResourceUtilizationProto
const __meta_ResourceUtilizationProto = Ref{ProtoMeta}()
function meta(::Type{ResourceUtilizationProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ResourceUtilizationProto)
            __meta_ResourceUtilizationProto[] = target = ProtoMeta(ResourceUtilizationProto)
            allflds = Pair{Symbol,Union{Type,String}}[:pmem => Int32, :vmem => Int32, :cpu => Float32]
            meta(target, ResourceUtilizationProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ResourceUtilizationProto[]
    end
end
function Base.getproperty(obj::ResourceUtilizationProto, name::Symbol)
    if name === :pmem
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :vmem
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :cpu
        return (obj.__protobuf_jl_internal_values[name])::Float32
    else
        getfield(obj, name)
    end
end

mutable struct ResourceOptionProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ResourceOptionProto(; kwargs...)
        obj = new(meta(ResourceOptionProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ResourceOptionProto
const __meta_ResourceOptionProto = Ref{ProtoMeta}()
function meta(::Type{ResourceOptionProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ResourceOptionProto)
            __meta_ResourceOptionProto[] = target = ProtoMeta(ResourceOptionProto)
            allflds = Pair{Symbol,Union{Type,String}}[:resource => ResourceProto, :over_commit_timeout => Int32]
            meta(target, ResourceOptionProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ResourceOptionProto[]
    end
end
function Base.getproperty(obj::ResourceOptionProto, name::Symbol)
    if name === :resource
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    elseif name === :over_commit_timeout
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct PriorityProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function PriorityProto(; kwargs...)
        obj = new(meta(PriorityProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct PriorityProto
const __meta_PriorityProto = Ref{ProtoMeta}()
function meta(::Type{PriorityProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_PriorityProto)
            __meta_PriorityProto[] = target = ProtoMeta(PriorityProto)
            allflds = Pair{Symbol,Union{Type,String}}[:priority => Int32]
            meta(target, PriorityProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_PriorityProto[]
    end
end
function Base.getproperty(obj::PriorityProto, name::Symbol)
    if name === :priority
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct URLProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function URLProto(; kwargs...)
        obj = new(meta(URLProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct URLProto
const __meta_URLProto = Ref{ProtoMeta}()
function meta(::Type{URLProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_URLProto)
            __meta_URLProto[] = target = ProtoMeta(URLProto)
            allflds = Pair{Symbol,Union{Type,String}}[:scheme => AbstractString, :host => AbstractString, :port => Int32, :file => AbstractString, :userInfo => AbstractString]
            meta(target, URLProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_URLProto[]
    end
end
function Base.getproperty(obj::URLProto, name::Symbol)
    if name === :scheme
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :host
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :port
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :file
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :userInfo
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct LocalResourceProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function LocalResourceProto(; kwargs...)
        obj = new(meta(LocalResourceProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct LocalResourceProto
const __meta_LocalResourceProto = Ref{ProtoMeta}()
function meta(::Type{LocalResourceProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_LocalResourceProto)
            __meta_LocalResourceProto[] = target = ProtoMeta(LocalResourceProto)
            allflds = Pair{Symbol,Union{Type,String}}[:resource => URLProto, :size => Int64, :timestamp => Int64, :_type => Int32, :visibility => Int32, :pattern => AbstractString, :should_be_uploaded_to_shared_cache => Bool]
            meta(target, LocalResourceProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_LocalResourceProto[]
    end
end
function Base.getproperty(obj::LocalResourceProto, name::Symbol)
    if name === :resource
        return (obj.__protobuf_jl_internal_values[name])::URLProto
    elseif name === :size
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :timestamp
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :visibility
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :pattern
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :should_be_uploaded_to_shared_cache
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct StringLongMapProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function StringLongMapProto(; kwargs...)
        obj = new(meta(StringLongMapProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct StringLongMapProto
const __meta_StringLongMapProto = Ref{ProtoMeta}()
function meta(::Type{StringLongMapProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StringLongMapProto)
            __meta_StringLongMapProto[] = target = ProtoMeta(StringLongMapProto)
            req = Symbol[:key,:value]
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => Int64]
            meta(target, StringLongMapProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StringLongMapProto[]
    end
end
function Base.getproperty(obj::StringLongMapProto, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct ApplicationResourceUsageReportProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ApplicationResourceUsageReportProto(; kwargs...)
        obj = new(meta(ApplicationResourceUsageReportProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ApplicationResourceUsageReportProto
const __meta_ApplicationResourceUsageReportProto = Ref{ProtoMeta}()
function meta(::Type{ApplicationResourceUsageReportProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ApplicationResourceUsageReportProto)
            __meta_ApplicationResourceUsageReportProto[] = target = ProtoMeta(ApplicationResourceUsageReportProto)
            allflds = Pair{Symbol,Union{Type,String}}[:num_used_containers => Int32, :num_reserved_containers => Int32, :used_resources => ResourceProto, :reserved_resources => ResourceProto, :needed_resources => ResourceProto, :memory_seconds => Int64, :vcore_seconds => Int64, :queue_usage_percentage => Float32, :cluster_usage_percentage => Float32, :preempted_memory_seconds => Int64, :preempted_vcore_seconds => Int64, :application_resource_usage_map => Base.Vector{StringLongMapProto}, :application_preempted_resource_usage_map => Base.Vector{StringLongMapProto}]
            meta(target, ApplicationResourceUsageReportProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ApplicationResourceUsageReportProto[]
    end
end
function Base.getproperty(obj::ApplicationResourceUsageReportProto, name::Symbol)
    if name === :num_used_containers
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :num_reserved_containers
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :used_resources
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    elseif name === :reserved_resources
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    elseif name === :needed_resources
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    elseif name === :memory_seconds
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :vcore_seconds
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :queue_usage_percentage
        return (obj.__protobuf_jl_internal_values[name])::Float32
    elseif name === :cluster_usage_percentage
        return (obj.__protobuf_jl_internal_values[name])::Float32
    elseif name === :preempted_memory_seconds
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :preempted_vcore_seconds
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :application_resource_usage_map
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{StringLongMapProto}
    elseif name === :application_preempted_resource_usage_map
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{StringLongMapProto}
    else
        getfield(obj, name)
    end
end

mutable struct ApplicationTimeoutProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ApplicationTimeoutProto(; kwargs...)
        obj = new(meta(ApplicationTimeoutProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ApplicationTimeoutProto
const __meta_ApplicationTimeoutProto = Ref{ProtoMeta}()
function meta(::Type{ApplicationTimeoutProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ApplicationTimeoutProto)
            __meta_ApplicationTimeoutProto[] = target = ProtoMeta(ApplicationTimeoutProto)
            req = Symbol[:application_timeout_type]
            allflds = Pair{Symbol,Union{Type,String}}[:application_timeout_type => Int32, :expire_time => AbstractString, :remaining_time => Int64]
            meta(target, ApplicationTimeoutProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ApplicationTimeoutProto[]
    end
end
function Base.getproperty(obj::ApplicationTimeoutProto, name::Symbol)
    if name === :application_timeout_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :expire_time
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :remaining_time
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct AppTimeoutsMapProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function AppTimeoutsMapProto(; kwargs...)
        obj = new(meta(AppTimeoutsMapProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct AppTimeoutsMapProto
const __meta_AppTimeoutsMapProto = Ref{ProtoMeta}()
function meta(::Type{AppTimeoutsMapProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AppTimeoutsMapProto)
            __meta_AppTimeoutsMapProto[] = target = ProtoMeta(AppTimeoutsMapProto)
            allflds = Pair{Symbol,Union{Type,String}}[:application_timeout_type => Int32, :application_timeout => ApplicationTimeoutProto]
            meta(target, AppTimeoutsMapProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AppTimeoutsMapProto[]
    end
end
function Base.getproperty(obj::AppTimeoutsMapProto, name::Symbol)
    if name === :application_timeout_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :application_timeout
        return (obj.__protobuf_jl_internal_values[name])::ApplicationTimeoutProto
    else
        getfield(obj, name)
    end
end

mutable struct ApplicationReportProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ApplicationReportProto(; kwargs...)
        obj = new(meta(ApplicationReportProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ApplicationReportProto
const __meta_ApplicationReportProto = Ref{ProtoMeta}()
function meta(::Type{ApplicationReportProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ApplicationReportProto)
            __meta_ApplicationReportProto[] = target = ProtoMeta(ApplicationReportProto)
            val = Dict{Symbol,Any}(:diagnostics => "N/A", :unmanaged_application => false)
            allflds = Pair{Symbol,Union{Type,String}}[:applicationId => ApplicationIdProto, :user => AbstractString, :queue => AbstractString, :name => AbstractString, :host => AbstractString, :rpc_port => Int32, :client_to_am_token => hadoop.common.TokenProto, :yarn_application_state => Int32, :trackingUrl => AbstractString, :diagnostics => AbstractString, :startTime => Int64, :finishTime => Int64, :final_application_status => Int32, :app_resource_Usage => ApplicationResourceUsageReportProto, :originalTrackingUrl => AbstractString, :currentApplicationAttemptId => ApplicationAttemptIdProto, :progress => Float32, :applicationType => AbstractString, :am_rm_token => hadoop.common.TokenProto, :applicationTags => Base.Vector{AbstractString}, :log_aggregation_status => Int32, :unmanaged_application => Bool, :priority => PriorityProto, :appNodeLabelExpression => AbstractString, :amNodeLabelExpression => AbstractString, :appTimeouts => Base.Vector{AppTimeoutsMapProto}, :launchTime => Int64, :submitTime => Int64]
            meta(target, ApplicationReportProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ApplicationReportProto[]
    end
end
function Base.getproperty(obj::ApplicationReportProto, name::Symbol)
    if name === :applicationId
        return (obj.__protobuf_jl_internal_values[name])::ApplicationIdProto
    elseif name === :user
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :queue
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :host
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :rpc_port
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :client_to_am_token
        return (obj.__protobuf_jl_internal_values[name])::hadoop.common.TokenProto
    elseif name === :yarn_application_state
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :trackingUrl
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :diagnostics
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :startTime
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :finishTime
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :final_application_status
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :app_resource_Usage
        return (obj.__protobuf_jl_internal_values[name])::ApplicationResourceUsageReportProto
    elseif name === :originalTrackingUrl
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :currentApplicationAttemptId
        return (obj.__protobuf_jl_internal_values[name])::ApplicationAttemptIdProto
    elseif name === :progress
        return (obj.__protobuf_jl_internal_values[name])::Float32
    elseif name === :applicationType
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :am_rm_token
        return (obj.__protobuf_jl_internal_values[name])::hadoop.common.TokenProto
    elseif name === :applicationTags
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :log_aggregation_status
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :unmanaged_application
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :priority
        return (obj.__protobuf_jl_internal_values[name])::PriorityProto
    elseif name === :appNodeLabelExpression
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :amNodeLabelExpression
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :appTimeouts
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AppTimeoutsMapProto}
    elseif name === :launchTime
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :submitTime
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct ApplicationAttemptReportProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ApplicationAttemptReportProto(; kwargs...)
        obj = new(meta(ApplicationAttemptReportProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ApplicationAttemptReportProto
const __meta_ApplicationAttemptReportProto = Ref{ProtoMeta}()
function meta(::Type{ApplicationAttemptReportProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ApplicationAttemptReportProto)
            __meta_ApplicationAttemptReportProto[] = target = ProtoMeta(ApplicationAttemptReportProto)
            val = Dict{Symbol,Any}(:diagnostics => "N/A")
            allflds = Pair{Symbol,Union{Type,String}}[:application_attempt_id => ApplicationAttemptIdProto, :host => AbstractString, :rpc_port => Int32, :tracking_url => AbstractString, :diagnostics => AbstractString, :yarn_application_attempt_state => Int32, :am_container_id => ContainerIdProto, :original_tracking_url => AbstractString, :startTime => Int64, :finishTime => Int64]
            meta(target, ApplicationAttemptReportProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ApplicationAttemptReportProto[]
    end
end
function Base.getproperty(obj::ApplicationAttemptReportProto, name::Symbol)
    if name === :application_attempt_id
        return (obj.__protobuf_jl_internal_values[name])::ApplicationAttemptIdProto
    elseif name === :host
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :rpc_port
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :tracking_url
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :diagnostics
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :yarn_application_attempt_state
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :am_container_id
        return (obj.__protobuf_jl_internal_values[name])::ContainerIdProto
    elseif name === :original_tracking_url
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :startTime
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :finishTime
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct NodeIdProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function NodeIdProto(; kwargs...)
        obj = new(meta(NodeIdProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct NodeIdProto
const __meta_NodeIdProto = Ref{ProtoMeta}()
function meta(::Type{NodeIdProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_NodeIdProto)
            __meta_NodeIdProto[] = target = ProtoMeta(NodeIdProto)
            allflds = Pair{Symbol,Union{Type,String}}[:host => AbstractString, :port => Int32]
            meta(target, NodeIdProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_NodeIdProto[]
    end
end
function Base.getproperty(obj::NodeIdProto, name::Symbol)
    if name === :host
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :port
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct NodeResourceMapProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function NodeResourceMapProto(; kwargs...)
        obj = new(meta(NodeResourceMapProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct NodeResourceMapProto
const __meta_NodeResourceMapProto = Ref{ProtoMeta}()
function meta(::Type{NodeResourceMapProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_NodeResourceMapProto)
            __meta_NodeResourceMapProto[] = target = ProtoMeta(NodeResourceMapProto)
            allflds = Pair{Symbol,Union{Type,String}}[:node_id => NodeIdProto, :resource_option => ResourceOptionProto]
            meta(target, NodeResourceMapProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_NodeResourceMapProto[]
    end
end
function Base.getproperty(obj::NodeResourceMapProto, name::Symbol)
    if name === :node_id
        return (obj.__protobuf_jl_internal_values[name])::NodeIdProto
    elseif name === :resource_option
        return (obj.__protobuf_jl_internal_values[name])::ResourceOptionProto
    else
        getfield(obj, name)
    end
end

mutable struct ContainerReportProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ContainerReportProto(; kwargs...)
        obj = new(meta(ContainerReportProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ContainerReportProto
const __meta_ContainerReportProto = Ref{ProtoMeta}()
function meta(::Type{ContainerReportProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ContainerReportProto)
            __meta_ContainerReportProto[] = target = ProtoMeta(ContainerReportProto)
            val = Dict{Symbol,Any}(:diagnostics_info => "N/A", :executionType => ExecutionTypeProto.GUARANTEED)
            allflds = Pair{Symbol,Union{Type,String}}[:container_id => ContainerIdProto, :resource => ResourceProto, :node_id => NodeIdProto, :priority => PriorityProto, :creation_time => Int64, :finish_time => Int64, :diagnostics_info => AbstractString, :log_url => AbstractString, :container_exit_status => Int32, :container_state => Int32, :node_http_address => AbstractString, :executionType => Int32]
            meta(target, ContainerReportProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ContainerReportProto[]
    end
end
function Base.getproperty(obj::ContainerReportProto, name::Symbol)
    if name === :container_id
        return (obj.__protobuf_jl_internal_values[name])::ContainerIdProto
    elseif name === :resource
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    elseif name === :node_id
        return (obj.__protobuf_jl_internal_values[name])::NodeIdProto
    elseif name === :priority
        return (obj.__protobuf_jl_internal_values[name])::PriorityProto
    elseif name === :creation_time
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :finish_time
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :diagnostics_info
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :log_url
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :container_exit_status
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :container_state
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :node_http_address
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :executionType
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct ContainerProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ContainerProto(; kwargs...)
        obj = new(meta(ContainerProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ContainerProto
const __meta_ContainerProto = Ref{ProtoMeta}()
function meta(::Type{ContainerProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ContainerProto)
            __meta_ContainerProto[] = target = ProtoMeta(ContainerProto)
            val = Dict{Symbol,Any}(:execution_type => ExecutionTypeProto.GUARANTEED, :allocation_request_id => -1, :version => 0)
            allflds = Pair{Symbol,Union{Type,String}}[:id => ContainerIdProto, :nodeId => NodeIdProto, :node_http_address => AbstractString, :resource => ResourceProto, :priority => PriorityProto, :container_token => hadoop.common.TokenProto, :execution_type => Int32, :allocation_request_id => Int64, :version => Int32]
            meta(target, ContainerProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ContainerProto[]
    end
end
function Base.getproperty(obj::ContainerProto, name::Symbol)
    if name === :id
        return (obj.__protobuf_jl_internal_values[name])::ContainerIdProto
    elseif name === :nodeId
        return (obj.__protobuf_jl_internal_values[name])::NodeIdProto
    elseif name === :node_http_address
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :resource
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    elseif name === :priority
        return (obj.__protobuf_jl_internal_values[name])::PriorityProto
    elseif name === :container_token
        return (obj.__protobuf_jl_internal_values[name])::hadoop.common.TokenProto
    elseif name === :execution_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :allocation_request_id
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :version
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct NodeReportProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function NodeReportProto(; kwargs...)
        obj = new(meta(NodeReportProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct NodeReportProto
const __meta_NodeReportProto = Ref{ProtoMeta}()
function meta(::Type{NodeReportProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_NodeReportProto)
            __meta_NodeReportProto[] = target = ProtoMeta(NodeReportProto)
            allflds = Pair{Symbol,Union{Type,String}}[:nodeId => NodeIdProto, :httpAddress => AbstractString, :rackName => AbstractString, :used => ResourceProto, :capability => ResourceProto, :numContainers => Int32, :node_state => Int32, :health_report => AbstractString, :last_health_report_time => Int64, :node_labels => Base.Vector{AbstractString}, :containers_utilization => ResourceUtilizationProto, :node_utilization => ResourceUtilizationProto]
            meta(target, NodeReportProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_NodeReportProto[]
    end
end
function Base.getproperty(obj::NodeReportProto, name::Symbol)
    if name === :nodeId
        return (obj.__protobuf_jl_internal_values[name])::NodeIdProto
    elseif name === :httpAddress
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :rackName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :used
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    elseif name === :capability
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    elseif name === :numContainers
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :node_state
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :health_report
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :last_health_report_time
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :node_labels
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :containers_utilization
        return (obj.__protobuf_jl_internal_values[name])::ResourceUtilizationProto
    elseif name === :node_utilization
        return (obj.__protobuf_jl_internal_values[name])::ResourceUtilizationProto
    else
        getfield(obj, name)
    end
end

mutable struct NodeIdToLabelsProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function NodeIdToLabelsProto(; kwargs...)
        obj = new(meta(NodeIdToLabelsProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct NodeIdToLabelsProto
const __meta_NodeIdToLabelsProto = Ref{ProtoMeta}()
function meta(::Type{NodeIdToLabelsProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_NodeIdToLabelsProto)
            __meta_NodeIdToLabelsProto[] = target = ProtoMeta(NodeIdToLabelsProto)
            allflds = Pair{Symbol,Union{Type,String}}[:nodeId => NodeIdProto, :nodeLabels => Base.Vector{AbstractString}]
            meta(target, NodeIdToLabelsProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_NodeIdToLabelsProto[]
    end
end
function Base.getproperty(obj::NodeIdToLabelsProto, name::Symbol)
    if name === :nodeId
        return (obj.__protobuf_jl_internal_values[name])::NodeIdProto
    elseif name === :nodeLabels
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    else
        getfield(obj, name)
    end
end

mutable struct LabelsToNodeIdsProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function LabelsToNodeIdsProto(; kwargs...)
        obj = new(meta(LabelsToNodeIdsProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct LabelsToNodeIdsProto
const __meta_LabelsToNodeIdsProto = Ref{ProtoMeta}()
function meta(::Type{LabelsToNodeIdsProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_LabelsToNodeIdsProto)
            __meta_LabelsToNodeIdsProto[] = target = ProtoMeta(LabelsToNodeIdsProto)
            allflds = Pair{Symbol,Union{Type,String}}[:nodeLabels => AbstractString, :nodeId => Base.Vector{NodeIdProto}]
            meta(target, LabelsToNodeIdsProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_LabelsToNodeIdsProto[]
    end
end
function Base.getproperty(obj::LabelsToNodeIdsProto, name::Symbol)
    if name === :nodeLabels
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :nodeId
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{NodeIdProto}
    else
        getfield(obj, name)
    end
end

mutable struct NodeLabelProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function NodeLabelProto(; kwargs...)
        obj = new(meta(NodeLabelProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct NodeLabelProto
const __meta_NodeLabelProto = Ref{ProtoMeta}()
function meta(::Type{NodeLabelProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_NodeLabelProto)
            __meta_NodeLabelProto[] = target = ProtoMeta(NodeLabelProto)
            val = Dict{Symbol,Any}(:isExclusive => true)
            allflds = Pair{Symbol,Union{Type,String}}[:name => AbstractString, :isExclusive => Bool]
            meta(target, NodeLabelProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_NodeLabelProto[]
    end
end
function Base.getproperty(obj::NodeLabelProto, name::Symbol)
    if name === :name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :isExclusive
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct AMBlackListingRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function AMBlackListingRequestProto(; kwargs...)
        obj = new(meta(AMBlackListingRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct AMBlackListingRequestProto
const __meta_AMBlackListingRequestProto = Ref{ProtoMeta}()
function meta(::Type{AMBlackListingRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_AMBlackListingRequestProto)
            __meta_AMBlackListingRequestProto[] = target = ProtoMeta(AMBlackListingRequestProto)
            val = Dict{Symbol,Any}(:blacklisting_enabled => false)
            allflds = Pair{Symbol,Union{Type,String}}[:blacklisting_enabled => Bool, :blacklisting_failure_threshold => Float32]
            meta(target, AMBlackListingRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_AMBlackListingRequestProto[]
    end
end
function Base.getproperty(obj::AMBlackListingRequestProto, name::Symbol)
    if name === :blacklisting_enabled
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :blacklisting_failure_threshold
        return (obj.__protobuf_jl_internal_values[name])::Float32
    else
        getfield(obj, name)
    end
end

mutable struct ExecutionTypeRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ExecutionTypeRequestProto(; kwargs...)
        obj = new(meta(ExecutionTypeRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ExecutionTypeRequestProto
const __meta_ExecutionTypeRequestProto = Ref{ProtoMeta}()
function meta(::Type{ExecutionTypeRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ExecutionTypeRequestProto)
            __meta_ExecutionTypeRequestProto[] = target = ProtoMeta(ExecutionTypeRequestProto)
            val = Dict{Symbol,Any}(:execution_type => ExecutionTypeProto.GUARANTEED, :enforce_execution_type => false)
            allflds = Pair{Symbol,Union{Type,String}}[:execution_type => Int32, :enforce_execution_type => Bool]
            meta(target, ExecutionTypeRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ExecutionTypeRequestProto[]
    end
end
function Base.getproperty(obj::ExecutionTypeRequestProto, name::Symbol)
    if name === :execution_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :enforce_execution_type
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct ResourceRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ResourceRequestProto(; kwargs...)
        obj = new(meta(ResourceRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ResourceRequestProto
const __meta_ResourceRequestProto = Ref{ProtoMeta}()
function meta(::Type{ResourceRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ResourceRequestProto)
            __meta_ResourceRequestProto[] = target = ProtoMeta(ResourceRequestProto)
            val = Dict{Symbol,Any}(:relax_locality => true, :allocation_request_id => 0)
            allflds = Pair{Symbol,Union{Type,String}}[:priority => PriorityProto, :resource_name => AbstractString, :capability => ResourceProto, :num_containers => Int32, :relax_locality => Bool, :node_label_expression => AbstractString, :execution_type_request => ExecutionTypeRequestProto, :allocation_request_id => Int64]
            meta(target, ResourceRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ResourceRequestProto[]
    end
end
function Base.getproperty(obj::ResourceRequestProto, name::Symbol)
    if name === :priority
        return (obj.__protobuf_jl_internal_values[name])::PriorityProto
    elseif name === :resource_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :capability
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    elseif name === :num_containers
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :relax_locality
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :node_label_expression
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :execution_type_request
        return (obj.__protobuf_jl_internal_values[name])::ExecutionTypeRequestProto
    elseif name === :allocation_request_id
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct PreemptionContainerProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function PreemptionContainerProto(; kwargs...)
        obj = new(meta(PreemptionContainerProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct PreemptionContainerProto
const __meta_PreemptionContainerProto = Ref{ProtoMeta}()
function meta(::Type{PreemptionContainerProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_PreemptionContainerProto)
            __meta_PreemptionContainerProto[] = target = ProtoMeta(PreemptionContainerProto)
            allflds = Pair{Symbol,Union{Type,String}}[:id => ContainerIdProto]
            meta(target, PreemptionContainerProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_PreemptionContainerProto[]
    end
end
function Base.getproperty(obj::PreemptionContainerProto, name::Symbol)
    if name === :id
        return (obj.__protobuf_jl_internal_values[name])::ContainerIdProto
    else
        getfield(obj, name)
    end
end

mutable struct StrictPreemptionContractProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function StrictPreemptionContractProto(; kwargs...)
        obj = new(meta(StrictPreemptionContractProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct StrictPreemptionContractProto
const __meta_StrictPreemptionContractProto = Ref{ProtoMeta}()
function meta(::Type{StrictPreemptionContractProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StrictPreemptionContractProto)
            __meta_StrictPreemptionContractProto[] = target = ProtoMeta(StrictPreemptionContractProto)
            allflds = Pair{Symbol,Union{Type,String}}[:container => Base.Vector{PreemptionContainerProto}]
            meta(target, StrictPreemptionContractProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StrictPreemptionContractProto[]
    end
end
function Base.getproperty(obj::StrictPreemptionContractProto, name::Symbol)
    if name === :container
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{PreemptionContainerProto}
    else
        getfield(obj, name)
    end
end

mutable struct PreemptionResourceRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function PreemptionResourceRequestProto(; kwargs...)
        obj = new(meta(PreemptionResourceRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct PreemptionResourceRequestProto
const __meta_PreemptionResourceRequestProto = Ref{ProtoMeta}()
function meta(::Type{PreemptionResourceRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_PreemptionResourceRequestProto)
            __meta_PreemptionResourceRequestProto[] = target = ProtoMeta(PreemptionResourceRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:resource => ResourceRequestProto]
            meta(target, PreemptionResourceRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_PreemptionResourceRequestProto[]
    end
end
function Base.getproperty(obj::PreemptionResourceRequestProto, name::Symbol)
    if name === :resource
        return (obj.__protobuf_jl_internal_values[name])::ResourceRequestProto
    else
        getfield(obj, name)
    end
end

mutable struct PreemptionContractProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function PreemptionContractProto(; kwargs...)
        obj = new(meta(PreemptionContractProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct PreemptionContractProto
const __meta_PreemptionContractProto = Ref{ProtoMeta}()
function meta(::Type{PreemptionContractProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_PreemptionContractProto)
            __meta_PreemptionContractProto[] = target = ProtoMeta(PreemptionContractProto)
            allflds = Pair{Symbol,Union{Type,String}}[:resource => Base.Vector{PreemptionResourceRequestProto}, :container => Base.Vector{PreemptionContainerProto}]
            meta(target, PreemptionContractProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_PreemptionContractProto[]
    end
end
function Base.getproperty(obj::PreemptionContractProto, name::Symbol)
    if name === :resource
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{PreemptionResourceRequestProto}
    elseif name === :container
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{PreemptionContainerProto}
    else
        getfield(obj, name)
    end
end

mutable struct PreemptionMessageProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function PreemptionMessageProto(; kwargs...)
        obj = new(meta(PreemptionMessageProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct PreemptionMessageProto
const __meta_PreemptionMessageProto = Ref{ProtoMeta}()
function meta(::Type{PreemptionMessageProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_PreemptionMessageProto)
            __meta_PreemptionMessageProto[] = target = ProtoMeta(PreemptionMessageProto)
            allflds = Pair{Symbol,Union{Type,String}}[:strictContract => StrictPreemptionContractProto, :contract => PreemptionContractProto]
            meta(target, PreemptionMessageProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_PreemptionMessageProto[]
    end
end
function Base.getproperty(obj::PreemptionMessageProto, name::Symbol)
    if name === :strictContract
        return (obj.__protobuf_jl_internal_values[name])::StrictPreemptionContractProto
    elseif name === :contract
        return (obj.__protobuf_jl_internal_values[name])::PreemptionContractProto
    else
        getfield(obj, name)
    end
end

mutable struct ResourceBlacklistRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ResourceBlacklistRequestProto(; kwargs...)
        obj = new(meta(ResourceBlacklistRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ResourceBlacklistRequestProto
const __meta_ResourceBlacklistRequestProto = Ref{ProtoMeta}()
function meta(::Type{ResourceBlacklistRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ResourceBlacklistRequestProto)
            __meta_ResourceBlacklistRequestProto[] = target = ProtoMeta(ResourceBlacklistRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:blacklist_additions => Base.Vector{AbstractString}, :blacklist_removals => Base.Vector{AbstractString}]
            meta(target, ResourceBlacklistRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ResourceBlacklistRequestProto[]
    end
end
function Base.getproperty(obj::ResourceBlacklistRequestProto, name::Symbol)
    if name === :blacklist_additions
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :blacklist_removals
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    else
        getfield(obj, name)
    end
end

mutable struct ApplicationTimeoutMapProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ApplicationTimeoutMapProto(; kwargs...)
        obj = new(meta(ApplicationTimeoutMapProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ApplicationTimeoutMapProto
const __meta_ApplicationTimeoutMapProto = Ref{ProtoMeta}()
function meta(::Type{ApplicationTimeoutMapProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ApplicationTimeoutMapProto)
            __meta_ApplicationTimeoutMapProto[] = target = ProtoMeta(ApplicationTimeoutMapProto)
            allflds = Pair{Symbol,Union{Type,String}}[:application_timeout_type => Int32, :timeout => Int64]
            meta(target, ApplicationTimeoutMapProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ApplicationTimeoutMapProto[]
    end
end
function Base.getproperty(obj::ApplicationTimeoutMapProto, name::Symbol)
    if name === :application_timeout_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :timeout
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct ApplicationUpdateTimeoutMapProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ApplicationUpdateTimeoutMapProto(; kwargs...)
        obj = new(meta(ApplicationUpdateTimeoutMapProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ApplicationUpdateTimeoutMapProto
const __meta_ApplicationUpdateTimeoutMapProto = Ref{ProtoMeta}()
function meta(::Type{ApplicationUpdateTimeoutMapProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ApplicationUpdateTimeoutMapProto)
            __meta_ApplicationUpdateTimeoutMapProto[] = target = ProtoMeta(ApplicationUpdateTimeoutMapProto)
            allflds = Pair{Symbol,Union{Type,String}}[:application_timeout_type => Int32, :expire_time => AbstractString]
            meta(target, ApplicationUpdateTimeoutMapProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ApplicationUpdateTimeoutMapProto[]
    end
end
function Base.getproperty(obj::ApplicationUpdateTimeoutMapProto, name::Symbol)
    if name === :application_timeout_type
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :expire_time
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct LogAggregationContextProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function LogAggregationContextProto(; kwargs...)
        obj = new(meta(LogAggregationContextProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct LogAggregationContextProto
const __meta_LogAggregationContextProto = Ref{ProtoMeta}()
function meta(::Type{LogAggregationContextProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_LogAggregationContextProto)
            __meta_LogAggregationContextProto[] = target = ProtoMeta(LogAggregationContextProto)
            val = Dict{Symbol,Any}(:include_pattern => ".*", :rolled_logs_exclude_pattern => ".*")
            allflds = Pair{Symbol,Union{Type,String}}[:include_pattern => AbstractString, :exclude_pattern => AbstractString, :rolled_logs_include_pattern => AbstractString, :rolled_logs_exclude_pattern => AbstractString, :log_aggregation_policy_class_name => AbstractString, :log_aggregation_policy_parameters => AbstractString]
            meta(target, LogAggregationContextProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_LogAggregationContextProto[]
    end
end
function Base.getproperty(obj::LogAggregationContextProto, name::Symbol)
    if name === :include_pattern
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :exclude_pattern
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :rolled_logs_include_pattern
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :rolled_logs_exclude_pattern
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :log_aggregation_policy_class_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :log_aggregation_policy_parameters
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct ApplicationACLMapProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ApplicationACLMapProto(; kwargs...)
        obj = new(meta(ApplicationACLMapProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ApplicationACLMapProto
const __meta_ApplicationACLMapProto = Ref{ProtoMeta}()
function meta(::Type{ApplicationACLMapProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ApplicationACLMapProto)
            __meta_ApplicationACLMapProto[] = target = ProtoMeta(ApplicationACLMapProto)
            val = Dict{Symbol,Any}(:acl => " ")
            allflds = Pair{Symbol,Union{Type,String}}[:accessType => Int32, :acl => AbstractString]
            meta(target, ApplicationACLMapProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ApplicationACLMapProto[]
    end
end
function Base.getproperty(obj::ApplicationACLMapProto, name::Symbol)
    if name === :accessType
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :acl
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct YarnClusterMetricsProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function YarnClusterMetricsProto(; kwargs...)
        obj = new(meta(YarnClusterMetricsProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct YarnClusterMetricsProto
const __meta_YarnClusterMetricsProto = Ref{ProtoMeta}()
function meta(::Type{YarnClusterMetricsProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_YarnClusterMetricsProto)
            __meta_YarnClusterMetricsProto[] = target = ProtoMeta(YarnClusterMetricsProto)
            allflds = Pair{Symbol,Union{Type,String}}[:num_node_managers => Int32, :num_decommissioned_nms => Int32, :num_active_nms => Int32, :num_lost_nms => Int32, :num_unhealthy_nms => Int32, :num_rebooted_nms => Int32]
            meta(target, YarnClusterMetricsProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_YarnClusterMetricsProto[]
    end
end
function Base.getproperty(obj::YarnClusterMetricsProto, name::Symbol)
    if name === :num_node_managers
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :num_decommissioned_nms
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :num_active_nms
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :num_lost_nms
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :num_unhealthy_nms
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :num_rebooted_nms
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct QueueStatisticsProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function QueueStatisticsProto(; kwargs...)
        obj = new(meta(QueueStatisticsProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct QueueStatisticsProto
const __meta_QueueStatisticsProto = Ref{ProtoMeta}()
function meta(::Type{QueueStatisticsProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_QueueStatisticsProto)
            __meta_QueueStatisticsProto[] = target = ProtoMeta(QueueStatisticsProto)
            allflds = Pair{Symbol,Union{Type,String}}[:numAppsSubmitted => Int64, :numAppsRunning => Int64, :numAppsPending => Int64, :numAppsCompleted => Int64, :numAppsKilled => Int64, :numAppsFailed => Int64, :numActiveUsers => Int64, :availableMemoryMB => Int64, :allocatedMemoryMB => Int64, :pendingMemoryMB => Int64, :reservedMemoryMB => Int64, :availableVCores => Int64, :allocatedVCores => Int64, :pendingVCores => Int64, :reservedVCores => Int64, :allocatedContainers => Int64, :pendingContainers => Int64, :reservedContainers => Int64]
            meta(target, QueueStatisticsProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_QueueStatisticsProto[]
    end
end
function Base.getproperty(obj::QueueStatisticsProto, name::Symbol)
    if name === :numAppsSubmitted
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :numAppsRunning
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :numAppsPending
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :numAppsCompleted
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :numAppsKilled
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :numAppsFailed
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :numActiveUsers
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :availableMemoryMB
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :allocatedMemoryMB
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :pendingMemoryMB
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :reservedMemoryMB
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :availableVCores
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :allocatedVCores
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :pendingVCores
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :reservedVCores
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :allocatedContainers
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :pendingContainers
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :reservedContainers
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct QueueConfigurationsProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function QueueConfigurationsProto(; kwargs...)
        obj = new(meta(QueueConfigurationsProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct QueueConfigurationsProto
const __meta_QueueConfigurationsProto = Ref{ProtoMeta}()
function meta(::Type{QueueConfigurationsProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_QueueConfigurationsProto)
            __meta_QueueConfigurationsProto[] = target = ProtoMeta(QueueConfigurationsProto)
            allflds = Pair{Symbol,Union{Type,String}}[:capacity => Float32, :absoluteCapacity => Float32, :maxCapacity => Float32, :absoluteMaxCapacity => Float32, :maxAMPercentage => Float32]
            meta(target, QueueConfigurationsProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_QueueConfigurationsProto[]
    end
end
function Base.getproperty(obj::QueueConfigurationsProto, name::Symbol)
    if name === :capacity
        return (obj.__protobuf_jl_internal_values[name])::Float32
    elseif name === :absoluteCapacity
        return (obj.__protobuf_jl_internal_values[name])::Float32
    elseif name === :maxCapacity
        return (obj.__protobuf_jl_internal_values[name])::Float32
    elseif name === :absoluteMaxCapacity
        return (obj.__protobuf_jl_internal_values[name])::Float32
    elseif name === :maxAMPercentage
        return (obj.__protobuf_jl_internal_values[name])::Float32
    else
        getfield(obj, name)
    end
end

mutable struct QueueConfigurationsMapProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function QueueConfigurationsMapProto(; kwargs...)
        obj = new(meta(QueueConfigurationsMapProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct QueueConfigurationsMapProto
const __meta_QueueConfigurationsMapProto = Ref{ProtoMeta}()
function meta(::Type{QueueConfigurationsMapProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_QueueConfigurationsMapProto)
            __meta_QueueConfigurationsMapProto[] = target = ProtoMeta(QueueConfigurationsMapProto)
            req = Symbol[:partitionName]
            allflds = Pair{Symbol,Union{Type,String}}[:partitionName => AbstractString, :queueConfigurations => QueueConfigurationsProto]
            meta(target, QueueConfigurationsMapProto, allflds, req, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_QueueConfigurationsMapProto[]
    end
end
function Base.getproperty(obj::QueueConfigurationsMapProto, name::Symbol)
    if name === :partitionName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :queueConfigurations
        return (obj.__protobuf_jl_internal_values[name])::QueueConfigurationsProto
    else
        getfield(obj, name)
    end
end

mutable struct QueueInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function QueueInfoProto(; kwargs...)
        obj = new(meta(QueueInfoProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct QueueInfoProto
const __meta_QueueInfoProto = Ref{ProtoMeta}()
function meta(::Type{QueueInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_QueueInfoProto)
            __meta_QueueInfoProto[] = target = ProtoMeta(QueueInfoProto)
            allflds = Pair{Symbol,Union{Type,String}}[:queueName => AbstractString, :capacity => Float32, :maximumCapacity => Float32, :currentCapacity => Float32, :state => Int32, :childQueues => Base.Vector{QueueInfoProto}, :applications => Base.Vector{ApplicationReportProto}, :accessibleNodeLabels => Base.Vector{AbstractString}, :defaultNodeLabelExpression => AbstractString, :queueStatistics => QueueStatisticsProto, :preemptionDisabled => Bool, :queueConfigurationsMap => Base.Vector{QueueConfigurationsMapProto}, :intraQueuePreemptionDisabled => Bool]
            meta(target, QueueInfoProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_QueueInfoProto[]
    end
end
function Base.getproperty(obj::QueueInfoProto, name::Symbol)
    if name === :queueName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :capacity
        return (obj.__protobuf_jl_internal_values[name])::Float32
    elseif name === :maximumCapacity
        return (obj.__protobuf_jl_internal_values[name])::Float32
    elseif name === :currentCapacity
        return (obj.__protobuf_jl_internal_values[name])::Float32
    elseif name === :state
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :childQueues
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{QueueInfoProto}
    elseif name === :applications
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ApplicationReportProto}
    elseif name === :accessibleNodeLabels
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :defaultNodeLabelExpression
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :queueStatistics
        return (obj.__protobuf_jl_internal_values[name])::QueueStatisticsProto
    elseif name === :preemptionDisabled
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :queueConfigurationsMap
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{QueueConfigurationsMapProto}
    elseif name === :intraQueuePreemptionDisabled
        return (obj.__protobuf_jl_internal_values[name])::Bool
    else
        getfield(obj, name)
    end
end

mutable struct QueueUserACLInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function QueueUserACLInfoProto(; kwargs...)
        obj = new(meta(QueueUserACLInfoProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct QueueUserACLInfoProto
const __meta_QueueUserACLInfoProto = Ref{ProtoMeta}()
function meta(::Type{QueueUserACLInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_QueueUserACLInfoProto)
            __meta_QueueUserACLInfoProto[] = target = ProtoMeta(QueueUserACLInfoProto)
            allflds = Pair{Symbol,Union{Type,String}}[:queueName => AbstractString, :userAcls => Base.Vector{Int32}]
            meta(target, QueueUserACLInfoProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_QueueUserACLInfoProto[]
    end
end
function Base.getproperty(obj::QueueUserACLInfoProto, name::Symbol)
    if name === :queueName
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :userAcls
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    else
        getfield(obj, name)
    end
end

mutable struct ReservationIdProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ReservationIdProto(; kwargs...)
        obj = new(meta(ReservationIdProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ReservationIdProto
const __meta_ReservationIdProto = Ref{ProtoMeta}()
function meta(::Type{ReservationIdProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReservationIdProto)
            __meta_ReservationIdProto[] = target = ProtoMeta(ReservationIdProto)
            allflds = Pair{Symbol,Union{Type,String}}[:id => Int64, :cluster_timestamp => Int64]
            meta(target, ReservationIdProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReservationIdProto[]
    end
end
function Base.getproperty(obj::ReservationIdProto, name::Symbol)
    if name === :id
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :cluster_timestamp
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct ReservationRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ReservationRequestProto(; kwargs...)
        obj = new(meta(ReservationRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ReservationRequestProto
const __meta_ReservationRequestProto = Ref{ProtoMeta}()
function meta(::Type{ReservationRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReservationRequestProto)
            __meta_ReservationRequestProto[] = target = ProtoMeta(ReservationRequestProto)
            val = Dict{Symbol,Any}(:num_containers => 1, :concurrency => 1, :duration => -1)
            allflds = Pair{Symbol,Union{Type,String}}[:capability => ResourceProto, :num_containers => Int32, :concurrency => Int32, :duration => Int64]
            meta(target, ReservationRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReservationRequestProto[]
    end
end
function Base.getproperty(obj::ReservationRequestProto, name::Symbol)
    if name === :capability
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    elseif name === :num_containers
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :concurrency
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :duration
        return (obj.__protobuf_jl_internal_values[name])::Int64
    else
        getfield(obj, name)
    end
end

mutable struct ReservationRequestsProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ReservationRequestsProto(; kwargs...)
        obj = new(meta(ReservationRequestsProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ReservationRequestsProto
const __meta_ReservationRequestsProto = Ref{ProtoMeta}()
function meta(::Type{ReservationRequestsProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReservationRequestsProto)
            __meta_ReservationRequestsProto[] = target = ProtoMeta(ReservationRequestsProto)
            val = Dict{Symbol,Any}(:interpreter => ReservationRequestInterpreterProto.R_ALL)
            allflds = Pair{Symbol,Union{Type,String}}[:reservation_resources => Base.Vector{ReservationRequestProto}, :interpreter => Int32]
            meta(target, ReservationRequestsProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReservationRequestsProto[]
    end
end
function Base.getproperty(obj::ReservationRequestsProto, name::Symbol)
    if name === :reservation_resources
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ReservationRequestProto}
    elseif name === :interpreter
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct ReservationDefinitionProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ReservationDefinitionProto(; kwargs...)
        obj = new(meta(ReservationDefinitionProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ReservationDefinitionProto
const __meta_ReservationDefinitionProto = Ref{ProtoMeta}()
function meta(::Type{ReservationDefinitionProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReservationDefinitionProto)
            __meta_ReservationDefinitionProto[] = target = ProtoMeta(ReservationDefinitionProto)
            val = Dict{Symbol,Any}(:recurrence_expression => "0")
            allflds = Pair{Symbol,Union{Type,String}}[:reservation_requests => ReservationRequestsProto, :arrival => Int64, :deadline => Int64, :reservation_name => AbstractString, :recurrence_expression => AbstractString, :priority => PriorityProto]
            meta(target, ReservationDefinitionProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReservationDefinitionProto[]
    end
end
function Base.getproperty(obj::ReservationDefinitionProto, name::Symbol)
    if name === :reservation_requests
        return (obj.__protobuf_jl_internal_values[name])::ReservationRequestsProto
    elseif name === :arrival
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :deadline
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :reservation_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :recurrence_expression
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :priority
        return (obj.__protobuf_jl_internal_values[name])::PriorityProto
    else
        getfield(obj, name)
    end
end

mutable struct ResourceAllocationRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ResourceAllocationRequestProto(; kwargs...)
        obj = new(meta(ResourceAllocationRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ResourceAllocationRequestProto
const __meta_ResourceAllocationRequestProto = Ref{ProtoMeta}()
function meta(::Type{ResourceAllocationRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ResourceAllocationRequestProto)
            __meta_ResourceAllocationRequestProto[] = target = ProtoMeta(ResourceAllocationRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:start_time => Int64, :end_time => Int64, :resource => ResourceProto]
            meta(target, ResourceAllocationRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ResourceAllocationRequestProto[]
    end
end
function Base.getproperty(obj::ResourceAllocationRequestProto, name::Symbol)
    if name === :start_time
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :end_time
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :resource
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    else
        getfield(obj, name)
    end
end

mutable struct ReservationAllocationStateProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ReservationAllocationStateProto(; kwargs...)
        obj = new(meta(ReservationAllocationStateProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ReservationAllocationStateProto
const __meta_ReservationAllocationStateProto = Ref{ProtoMeta}()
function meta(::Type{ReservationAllocationStateProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ReservationAllocationStateProto)
            __meta_ReservationAllocationStateProto[] = target = ProtoMeta(ReservationAllocationStateProto)
            allflds = Pair{Symbol,Union{Type,String}}[:reservation_definition => ReservationDefinitionProto, :allocation_requests => Base.Vector{ResourceAllocationRequestProto}, :start_time => Int64, :end_time => Int64, :user => AbstractString, :contains_gangs => Bool, :acceptance_time => Int64, :reservation_id => ReservationIdProto]
            meta(target, ReservationAllocationStateProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ReservationAllocationStateProto[]
    end
end
function Base.getproperty(obj::ReservationAllocationStateProto, name::Symbol)
    if name === :reservation_definition
        return (obj.__protobuf_jl_internal_values[name])::ReservationDefinitionProto
    elseif name === :allocation_requests
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ResourceAllocationRequestProto}
    elseif name === :start_time
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :end_time
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :user
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :contains_gangs
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :acceptance_time
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :reservation_id
        return (obj.__protobuf_jl_internal_values[name])::ReservationIdProto
    else
        getfield(obj, name)
    end
end

mutable struct ContainerRetryContextProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ContainerRetryContextProto(; kwargs...)
        obj = new(meta(ContainerRetryContextProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ContainerRetryContextProto
const __meta_ContainerRetryContextProto = Ref{ProtoMeta}()
function meta(::Type{ContainerRetryContextProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ContainerRetryContextProto)
            __meta_ContainerRetryContextProto[] = target = ProtoMeta(ContainerRetryContextProto)
            val = Dict{Symbol,Any}(:retry_policy => ContainerRetryPolicyProto.NEVER_RETRY, :max_retries => 0, :retry_interval => 0)
            allflds = Pair{Symbol,Union{Type,String}}[:retry_policy => Int32, :error_codes => Base.Vector{Int32}, :max_retries => Int32, :retry_interval => Int32]
            meta(target, ContainerRetryContextProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ContainerRetryContextProto[]
    end
end
function Base.getproperty(obj::ContainerRetryContextProto, name::Symbol)
    if name === :retry_policy
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :error_codes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{Int32}
    elseif name === :max_retries
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :retry_interval
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct StringLocalResourceMapProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function StringLocalResourceMapProto(; kwargs...)
        obj = new(meta(StringLocalResourceMapProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct StringLocalResourceMapProto
const __meta_StringLocalResourceMapProto = Ref{ProtoMeta}()
function meta(::Type{StringLocalResourceMapProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StringLocalResourceMapProto)
            __meta_StringLocalResourceMapProto[] = target = ProtoMeta(StringLocalResourceMapProto)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => LocalResourceProto]
            meta(target, StringLocalResourceMapProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StringLocalResourceMapProto[]
    end
end
function Base.getproperty(obj::StringLocalResourceMapProto, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::LocalResourceProto
    else
        getfield(obj, name)
    end
end

mutable struct StringStringMapProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function StringStringMapProto(; kwargs...)
        obj = new(meta(StringStringMapProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct StringStringMapProto
const __meta_StringStringMapProto = Ref{ProtoMeta}()
function meta(::Type{StringStringMapProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StringStringMapProto)
            __meta_StringStringMapProto[] = target = ProtoMeta(StringStringMapProto)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => AbstractString]
            meta(target, StringStringMapProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StringStringMapProto[]
    end
end
function Base.getproperty(obj::StringStringMapProto, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    else
        getfield(obj, name)
    end
end

mutable struct ContainerStatusProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ContainerStatusProto(; kwargs...)
        obj = new(meta(ContainerStatusProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ContainerStatusProto
const __meta_ContainerStatusProto = Ref{ProtoMeta}()
function meta(::Type{ContainerStatusProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ContainerStatusProto)
            __meta_ContainerStatusProto[] = target = ProtoMeta(ContainerStatusProto)
            val = Dict{Symbol,Any}(:diagnostics => "N/A", :exit_status => -1000, :executionType => ExecutionTypeProto.GUARANTEED)
            allflds = Pair{Symbol,Union{Type,String}}[:container_id => ContainerIdProto, :state => Int32, :diagnostics => AbstractString, :exit_status => Int32, :capability => ResourceProto, :executionType => Int32, :container_attributes => Base.Vector{StringStringMapProto}, :container_sub_state => Int32]
            meta(target, ContainerStatusProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ContainerStatusProto[]
    end
end
function Base.getproperty(obj::ContainerStatusProto, name::Symbol)
    if name === :container_id
        return (obj.__protobuf_jl_internal_values[name])::ContainerIdProto
    elseif name === :state
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :diagnostics
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :exit_status
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :capability
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    elseif name === :executionType
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :container_attributes
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{StringStringMapProto}
    elseif name === :container_sub_state
        return (obj.__protobuf_jl_internal_values[name])::Int32
    else
        getfield(obj, name)
    end
end

mutable struct StringBytesMapProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function StringBytesMapProto(; kwargs...)
        obj = new(meta(StringBytesMapProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct StringBytesMapProto
const __meta_StringBytesMapProto = Ref{ProtoMeta}()
function meta(::Type{StringBytesMapProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_StringBytesMapProto)
            __meta_StringBytesMapProto[] = target = ProtoMeta(StringBytesMapProto)
            allflds = Pair{Symbol,Union{Type,String}}[:key => AbstractString, :value => Array{UInt8,1}]
            meta(target, StringBytesMapProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_StringBytesMapProto[]
    end
end
function Base.getproperty(obj::StringBytesMapProto, name::Symbol)
    if name === :key
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :value
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    else
        getfield(obj, name)
    end
end

mutable struct ContainerLaunchContextProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ContainerLaunchContextProto(; kwargs...)
        obj = new(meta(ContainerLaunchContextProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ContainerLaunchContextProto
const __meta_ContainerLaunchContextProto = Ref{ProtoMeta}()
function meta(::Type{ContainerLaunchContextProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ContainerLaunchContextProto)
            __meta_ContainerLaunchContextProto[] = target = ProtoMeta(ContainerLaunchContextProto)
            allflds = Pair{Symbol,Union{Type,String}}[:localResources => Base.Vector{StringLocalResourceMapProto}, :tokens => Array{UInt8,1}, :service_data => Base.Vector{StringBytesMapProto}, :environment => Base.Vector{StringStringMapProto}, :command => Base.Vector{AbstractString}, :application_ACLs => Base.Vector{ApplicationACLMapProto}, :container_retry_context => ContainerRetryContextProto, :tokens_conf => Array{UInt8,1}]
            meta(target, ContainerLaunchContextProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ContainerLaunchContextProto[]
    end
end
function Base.getproperty(obj::ContainerLaunchContextProto, name::Symbol)
    if name === :localResources
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{StringLocalResourceMapProto}
    elseif name === :tokens
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    elseif name === :service_data
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{StringBytesMapProto}
    elseif name === :environment
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{StringStringMapProto}
    elseif name === :command
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :application_ACLs
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ApplicationACLMapProto}
    elseif name === :container_retry_context
        return (obj.__protobuf_jl_internal_values[name])::ContainerRetryContextProto
    elseif name === :tokens_conf
        return (obj.__protobuf_jl_internal_values[name])::Array{UInt8,1}
    else
        getfield(obj, name)
    end
end

mutable struct ApplicationSubmissionContextProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ApplicationSubmissionContextProto(; kwargs...)
        obj = new(meta(ApplicationSubmissionContextProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ApplicationSubmissionContextProto
const __meta_ApplicationSubmissionContextProto = Ref{ProtoMeta}()
function meta(::Type{ApplicationSubmissionContextProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ApplicationSubmissionContextProto)
            __meta_ApplicationSubmissionContextProto[] = target = ProtoMeta(ApplicationSubmissionContextProto)
            val = Dict{Symbol,Any}(:application_name => "N/A", :queue => "default", :cancel_tokens_when_complete => true, :unmanaged_am => false, :maxAppAttempts => 0, :applicationType => "YARN", :keep_containers_across_application_attempts => false, :attempt_failures_validity_interval => -1)
            allflds = Pair{Symbol,Union{Type,String}}[:application_id => ApplicationIdProto, :application_name => AbstractString, :queue => AbstractString, :priority => PriorityProto, :am_container_spec => ContainerLaunchContextProto, :cancel_tokens_when_complete => Bool, :unmanaged_am => Bool, :maxAppAttempts => Int32, :resource => ResourceProto, :applicationType => AbstractString, :keep_containers_across_application_attempts => Bool, :applicationTags => Base.Vector{AbstractString}, :attempt_failures_validity_interval => Int64, :log_aggregation_context => LogAggregationContextProto, :reservation_id => ReservationIdProto, :node_label_expression => AbstractString, :am_container_resource_request => Base.Vector{ResourceRequestProto}, :application_timeouts => Base.Vector{ApplicationTimeoutMapProto}]
            meta(target, ApplicationSubmissionContextProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, val, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ApplicationSubmissionContextProto[]
    end
end
function Base.getproperty(obj::ApplicationSubmissionContextProto, name::Symbol)
    if name === :application_id
        return (obj.__protobuf_jl_internal_values[name])::ApplicationIdProto
    elseif name === :application_name
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :queue
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :priority
        return (obj.__protobuf_jl_internal_values[name])::PriorityProto
    elseif name === :am_container_spec
        return (obj.__protobuf_jl_internal_values[name])::ContainerLaunchContextProto
    elseif name === :cancel_tokens_when_complete
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :unmanaged_am
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :maxAppAttempts
        return (obj.__protobuf_jl_internal_values[name])::Int32
    elseif name === :resource
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    elseif name === :applicationType
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :keep_containers_across_application_attempts
        return (obj.__protobuf_jl_internal_values[name])::Bool
    elseif name === :applicationTags
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{AbstractString}
    elseif name === :attempt_failures_validity_interval
        return (obj.__protobuf_jl_internal_values[name])::Int64
    elseif name === :log_aggregation_context
        return (obj.__protobuf_jl_internal_values[name])::LogAggregationContextProto
    elseif name === :reservation_id
        return (obj.__protobuf_jl_internal_values[name])::ReservationIdProto
    elseif name === :node_label_expression
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :am_container_resource_request
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ResourceRequestProto}
    elseif name === :application_timeouts
        return (obj.__protobuf_jl_internal_values[name])::Base.Vector{ApplicationTimeoutMapProto}
    else
        getfield(obj, name)
    end
end

mutable struct ContainerResourceIncreaseRequestProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ContainerResourceIncreaseRequestProto(; kwargs...)
        obj = new(meta(ContainerResourceIncreaseRequestProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ContainerResourceIncreaseRequestProto
const __meta_ContainerResourceIncreaseRequestProto = Ref{ProtoMeta}()
function meta(::Type{ContainerResourceIncreaseRequestProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ContainerResourceIncreaseRequestProto)
            __meta_ContainerResourceIncreaseRequestProto[] = target = ProtoMeta(ContainerResourceIncreaseRequestProto)
            allflds = Pair{Symbol,Union{Type,String}}[:container_id => ContainerIdProto, :capability => ResourceProto]
            meta(target, ContainerResourceIncreaseRequestProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ContainerResourceIncreaseRequestProto[]
    end
end
function Base.getproperty(obj::ContainerResourceIncreaseRequestProto, name::Symbol)
    if name === :container_id
        return (obj.__protobuf_jl_internal_values[name])::ContainerIdProto
    elseif name === :capability
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    else
        getfield(obj, name)
    end
end

mutable struct ContainerResourceIncreaseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ContainerResourceIncreaseProto(; kwargs...)
        obj = new(meta(ContainerResourceIncreaseProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ContainerResourceIncreaseProto
const __meta_ContainerResourceIncreaseProto = Ref{ProtoMeta}()
function meta(::Type{ContainerResourceIncreaseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ContainerResourceIncreaseProto)
            __meta_ContainerResourceIncreaseProto[] = target = ProtoMeta(ContainerResourceIncreaseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:container_id => ContainerIdProto, :capability => ResourceProto, :container_token => hadoop.common.TokenProto]
            meta(target, ContainerResourceIncreaseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ContainerResourceIncreaseProto[]
    end
end
function Base.getproperty(obj::ContainerResourceIncreaseProto, name::Symbol)
    if name === :container_id
        return (obj.__protobuf_jl_internal_values[name])::ContainerIdProto
    elseif name === :capability
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    elseif name === :container_token
        return (obj.__protobuf_jl_internal_values[name])::hadoop.common.TokenProto
    else
        getfield(obj, name)
    end
end

mutable struct ContainerResourceDecreaseProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function ContainerResourceDecreaseProto(; kwargs...)
        obj = new(meta(ContainerResourceDecreaseProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct ContainerResourceDecreaseProto
const __meta_ContainerResourceDecreaseProto = Ref{ProtoMeta}()
function meta(::Type{ContainerResourceDecreaseProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_ContainerResourceDecreaseProto)
            __meta_ContainerResourceDecreaseProto[] = target = ProtoMeta(ContainerResourceDecreaseProto)
            allflds = Pair{Symbol,Union{Type,String}}[:container_id => ContainerIdProto, :capability => ResourceProto]
            meta(target, ContainerResourceDecreaseProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_ContainerResourceDecreaseProto[]
    end
end
function Base.getproperty(obj::ContainerResourceDecreaseProto, name::Symbol)
    if name === :container_id
        return (obj.__protobuf_jl_internal_values[name])::ContainerIdProto
    elseif name === :capability
        return (obj.__protobuf_jl_internal_values[name])::ResourceProto
    else
        getfield(obj, name)
    end
end

mutable struct CollectorInfoProto <: ProtoType
    __protobuf_jl_internal_meta::ProtoMeta
    __protobuf_jl_internal_values::Dict{Symbol,Any}
    __protobuf_jl_internal_defaultset::Set{Symbol}

    function CollectorInfoProto(; kwargs...)
        obj = new(meta(CollectorInfoProto), Dict{Symbol,Any}(), Set{Symbol}())
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
end # mutable struct CollectorInfoProto
const __meta_CollectorInfoProto = Ref{ProtoMeta}()
function meta(::Type{CollectorInfoProto})
    ProtoBuf.metalock() do
        if !isassigned(__meta_CollectorInfoProto)
            __meta_CollectorInfoProto[] = target = ProtoMeta(CollectorInfoProto)
            allflds = Pair{Symbol,Union{Type,String}}[:collector_addr => AbstractString, :collector_token => hadoop.common.TokenProto]
            meta(target, CollectorInfoProto, allflds, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES)
        end
        __meta_CollectorInfoProto[]
    end
end
function Base.getproperty(obj::CollectorInfoProto, name::Symbol)
    if name === :collector_addr
        return (obj.__protobuf_jl_internal_values[name])::AbstractString
    elseif name === :collector_token
        return (obj.__protobuf_jl_internal_values[name])::hadoop.common.TokenProto
    else
        getfield(obj, name)
    end
end

export ResourceTypesProto, ContainerStateProto, ContainerSubStateProto, YarnApplicationStateProto, YarnApplicationAttemptStateProto, FinalApplicationStatusProto, LocalResourceVisibilityProto, LocalResourceTypeProto, LogAggregationStatusProto, NodeStateProto, ContainerTypeProto, ExecutionTypeProto, AMCommandProto, ApplicationTimeoutTypeProto, ApplicationAccessTypeProto, QueueStateProto, QueueACLProto, SignalContainerCommandProto, ReservationRequestInterpreterProto, ContainerExitStatusProto, ContainerRetryPolicyProto, SerializedExceptionProto, ApplicationIdProto, ApplicationAttemptIdProto, ContainerIdProto, ResourceInformationProto, ResourceTypeInfoProto, ResourceProto, ResourceUtilizationProto, ResourceOptionProto, NodeResourceMapProto, PriorityProto, ContainerProto, ContainerReportProto, URLProto, LocalResourceProto, StringLongMapProto, ApplicationResourceUsageReportProto, ApplicationReportProto, AppTimeoutsMapProto, ApplicationTimeoutProto, ApplicationAttemptReportProto, NodeIdProto, NodeReportProto, NodeIdToLabelsProto, LabelsToNodeIdsProto, NodeLabelProto, AMBlackListingRequestProto, ResourceRequestProto, ExecutionTypeRequestProto, PreemptionMessageProto, StrictPreemptionContractProto, PreemptionContractProto, PreemptionContainerProto, PreemptionResourceRequestProto, ResourceBlacklistRequestProto, ApplicationSubmissionContextProto, ApplicationTimeoutMapProto, ApplicationUpdateTimeoutMapProto, LogAggregationContextProto, ApplicationACLMapProto, YarnClusterMetricsProto, QueueStatisticsProto, QueueInfoProto, QueueConfigurationsProto, QueueConfigurationsMapProto, QueueUserACLInfoProto, ReservationIdProto, ReservationRequestProto, ReservationRequestsProto, ReservationDefinitionProto, ResourceAllocationRequestProto, ReservationAllocationStateProto, ContainerLaunchContextProto, ContainerStatusProto, ContainerRetryContextProto, StringLocalResourceMapProto, StringStringMapProto, StringBytesMapProto, ContainerResourceIncreaseRequestProto, ContainerResourceIncreaseProto, ContainerResourceDecreaseProto, CollectorInfoProto
# COV_EXCL_STOP