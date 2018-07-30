
"""
# HDFSException
Thrown by HDFS APIs.
"""
struct HDFSException <: Exception
    message::AbstractString
end


"""
HDFSProtocol: Hadoop RPC client for namenode protocol.
"""
const HDFSProtocol = HadoopRpcProtocol{ClientNamenodeProtocolBlockingStub}

for fn in (:getListing, :getFileInfo, :getBlockLocations, :getServerDefaults, :getFsStats, :setReplication, :getContentSummary, :mkdirs, :rename2, :rename, :delete, :create, :complete, :addBlock, :renewLease, :setTimes)
    @eval begin
        (hadoop.hdfs.$fn)(p::HDFSProtocol, inp) = (hadoop.hdfs.$fn)(p.stub, p.controller, inp)
    end
end

"""
# HDFSClient
A client to the namenode in a HDFS cluster and holds a connection to it.
It also stores the folder context for using relative paths in APIs that use the client.
"""
mutable struct HDFSClient
    nn_conn::HDFSProtocol
    wd::AbstractString
    server_defaults::Union{Nothing,FsServerDefaultsProto}

    function HDFSClient(host::AbstractString, port::Integer, ugi::UserGroupInformation=UserGroupInformation())
        nn_conn = HDFSProtocol(host, port, ugi)
        new(nn_conn, "/", nothing)
    end
end

function show(io::IO, client::HDFSClient)
    show(client.nn_conn)
    println(io, "    pwd: $(client.wd)")
    nothing
end

set_debug(client::HDFSClient, debug::Bool) = set_debug(client.nn_conn, debug)

abspath(client::HDFSClient, path::AbstractString) = abspath(client.wd, path)
function cd(client::HDFSClient, path::AbstractString)
    wd = abspath(client, path)
    !isdir(client, wd) && throw(HDFSException("Directory not found: $wd"))
    client.wd = wd
end
pwd(client::HDFSClient) = client.wd



"""
# HDFSFile
Holds a HDFSClient and path pointing to a file on HDFS
"""
struct HDFSFile
    client::HDFSClient
    path::AbstractString
end

function HDFSFile(uristr::AbstractString)
    uri = URI(uristr)
    (uri.scheme == "hdfs") || throw(HDFSException("Not a HDFS URI: $uristr"))
    client = HDFSClient(uri.host, uri.port, UserGroupInformation(uri.userinfo))
    HDFSFile(client, uri.path)
end

function show(io::IO, file::HDFSFile)
    println(io, "HDFSFile: ", string(convert(URI, file)))
    nothing
end

function convert(::Type{URI}, file::HDFSFile)
    client = file.client
    ch = client.nn_conn.channel
    user = username(ch.ugi)
    user_spec = isempty(user) ? user : "$(user)@"
    URI("hdfs://$(user_spec)$(ch.host):$(ch.port)$(abspath(client, file.path))")
end

"""
# HDFSFileInfo
Stat structure for file/foledr in HDFS
"""
mutable struct HDFSFileInfo
    kind::Int32
    name::AbstractString
    size::UInt64
    replications::UInt32
    block_sz::UInt64
    owner::AbstractString
    grp::AbstractString
    permissions::UInt32
    last_mod::UInt64
    last_access::UInt64

    HDFSFileInfo(fs::HdfsFileStatusProto) = new(fs.fileType, String(copy(fs.path)),
                    fs.length, fs.block_replication, fs.blocksize,
                    fs.owner, fs.group, fs.permission.perm,
                    fs.modification_time, fs.access_time)
end

function show(io::IO, st::HDFSFileInfo)
    println(io, "HDFSFileInfo: $(st.name)")
    if isdir(st)
        println(io, "    type: folder")
    elseif islink(st)
        println(io, "    type: link")
    else
        println(io, "    type: file")
        println(io, "    size: $(st.size)")
        println(io, "    block_sz: $(st.block_sz)")
    end
    println(io, "    owner: $(st.owner)")
    println(io, "    group: $(st.grp)")
    nothing
end

function _as_dict(obj, d=Dict{Symbol,Any}())
    for name in fieldnames(typeof(obj))
        d[name] = getfield(obj, name)
    end
    d
end

function _walkdir(client::HDFSClient, path::AbstractString, process_entry::Function)
    path = abspath(client, path)
    cont = true
    start_after = UInt8[]
    while cont
        inp = protobuild(GetListingRequestProto, Dict(:src => path,
                    :startAfter => start_after,
                    :needLocation => false))
        resp = getListing(client.nn_conn, inp)

        if isfilled(resp, :dirList)
            dir_list = resp.dirList
            if isfilled(dir_list, :partialListing)
                partial_listing = dir_list.partialListing
                for filestatus in partial_listing
                    cont = process_entry(filestatus)
                    (cont == false) && break
                end
                (cont == false) && break
            end
            if isfilled(dir_list, :remainingEntries) && (dir_list.remainingEntries > 0)
                start_after = dir_list.partialListing[end].path
            else
                cont = false
            end
        else
            cont = false
        end
    end
    nothing
end

function _get_file_info(client::HDFSClient, path::AbstractString)
    path = abspath(client, path)
    inp = protobuild(GetFileInfoRequestProto, Dict(:src => path))
    resp = getFileInfo(client.nn_conn, inp)
    isfilled(resp, :fs) ? resp.fs : nothing
end

function _get_block_locations(client::HDFSClient, path::AbstractString, offset::UInt64=zero(UInt64), length::UInt64=zero(UInt64))
    path = abspath(client, path)
    if length == 0
        length = UInt64(1024)
    end
    inp = protobuild(GetBlockLocationsRequestProto, Dict(:src => path,
                :offset => offset,
                :length => length))
    resp = getBlockLocations(client.nn_conn, inp)
    isfilled(resp, :locations) ? resp.locations : nothing
end

#
# Server defaults
function _get_server_defaults(client::HDFSClient)
    if client.server_defaults === nothing
        inp = GetServerDefaultsRequestProto()
        resp = getServerDefaults(client.nn_conn, inp)
        client.server_defaults = resp.serverDefaults
    end
    client.server_defaults
end

hdfs_server_defaults(client::HDFSClient) = _as_dict(_get_server_defaults(client))
hdfs_default_block_size(client::HDFSClient) = _get_server_defaults(client).blockSize
hdfs_default_replication(client::HDFSClient) = _get_server_defaults(client).replication

#
# File System Status
_get_fs_status(client::HDFSClient) = getFsStats(client.nn_conn, GetFsStatusRequestProto())

hdfs_status(client::HDFSClient) = _as_dict(_get_fs_status(client))

hdfs_capacity(client::HDFSClient) = _get_fs_status(client).capacity
hdfs_capacity_used(client::HDFSClient) = _get_fs_status(client).used
hdfs_capacity_remaining(client::HDFSClient) = _get_fs_status(client).remaining

#
# File Status
stat(file::HDFSFile) = stat(file.client, file.path)
function stat(client::HDFSClient, path::AbstractString)
    fileinfo = _get_file_info(client, path)
    (fileinfo === nothing) && throw(HDFSException("Path not found $path"))
    hdfs_file_info = HDFSFileInfo(fileinfo)
    hdfs_file_info.name = path
    hdfs_file_info
end

exists(file::HDFSFile) = exists(file.client, file.path)
exists(client::HDFSClient, path::AbstractString) = (_get_file_info(client, path) !== nothing)

isdir(file::HDFSFile) = isdir(file.client, file.path)
isdir(client::HDFSClient, path::AbstractString) = isdir(stat(client, path))
isdir(fileinfo::HDFSFileInfo) = (fileinfo.kind == HdfsFileStatusProto_FileType.IS_DIR)

isfile(file::HDFSFile) = isfile(file.client, file.path)
isfile(client::HDFSClient, path::AbstractString) = isfile(stat(client, path))
isfile(fileinfo::HDFSFileInfo) = (fileinfo.kind == HdfsFileStatusProto_FileType.IS_FILE)

islink(file::HDFSFile) = islink(file.client, file.path)
islink(client::HDFSClient, path::AbstractString) = islink(stat(client, path))
islink(fileinfo::HDFSFileInfo) = (fileinfo.kind == HdfsFileStatusProto_FileType.IS_SYMLINK)

filesize(file::HDFSFile) = filesize(file.client, file.path)
filesize(client::HDFSClient, path::AbstractString) = filesize(stat(client, path))
filesize(fileinfo::HDFSFileInfo) = fileinfo.size

filemode(file::HDFSFile) = filemode(file.client, file.path)
filemode(client::HDFSClient, path::AbstractString) = filemode(stat(client, path))
filemode(fileinfo::HDFSFileInfo) = fileinfo.permissions

mtime(file::HDFSFile) = mtime(file.client, file.path)
mtime(client::HDFSClient, path::AbstractString) = mtime(stat(client, path))
mtime(fileinfo::HDFSFileInfo) = fileinfo.last_mod

atime(file::HDFSFile) = atime(file.client, file.path)
atime(client::HDFSClient, path::AbstractString) = atime(stat(client, path))
atime(fileinfo::HDFSFileInfo) = fileinfo.last_access

hdfs_blocks(file::HDFSFile, offset::Integer=0, length::Integer=typemax(Int)) = hdfs_blocks(file.client, file.path, offset, length)
function hdfs_blocks(client::HDFSClient, path::AbstractString, offset::Integer=0, length::Integer=typemax(Int))
    blocks = Tuple{UInt64,Array}[]
    locations = _get_block_locations(client, path, UInt64(offset), UInt64(length))
    (locations === nothing) && (return blocks)
    for block in locations.blocks
        block.corrupt && throw(HDFSException("Corrupt block found at offset $(block.offset)"))
        node_ips = AbstractString[]
        for loc in block.locs
            (loc.adminState == DatanodeInfoProto_AdminState.NORMAL) || continue
            node_id = loc.id
            push!(node_ips, node_id.ipAddr)
        end
        push!(blocks, (block.offset, node_ips))
    end
    blocks
end

hdfs_set_replication(file::HDFSFile, replication::Integer) = hdfs_set_replication(file.client, file.path, replication)
function hdfs_set_replication(client::HDFSClient, path::AbstractString, replication::Integer)
    path = abspath(client, path)
    inp = protobuild(SetReplicationRequestProto, Dict(:src => path, :replication => replication))

    resp = setReplication(client.nn_conn, inp)
    resp.result
end

#
# Disk Usage
function _get_content_summary(client::HDFSClient, path::AbstractString)
    path = abspath(client, path)
    inp = protobuild(GetContentSummaryRequestProto, Dict(:path => path))

    resp = getContentSummary(client.nn_conn, inp)
    resp.summary
end

du(file::HDFSFile, details::Union{Nothing,Dict{Symbol,Any}}=nothing) = du(file.client, file.path, details)
function du(client::HDFSClient, path::AbstractString=".", details::Union{Nothing,Dict{Symbol,Any}}=nothing)
    summary = _get_content_summary(client, path)
    (details === nothing) || _as_dict(summary, details)
    summary.length
end

#
# File create, delete, list
readdir(file::HDFSFile, limit::Int=typemax(Int)) = readdir(file.client, file.path, limit)
function readdir(client::HDFSClient, path::AbstractString=".", limit::Int=typemax(Int))
    result = String[]
    _walkdir(client, path, (filestatus)->begin
                push!(result, String(copy(filestatus.path)))
                (length(result) < limit)
            end)
    result
end

const DEFAULT_FOLDER_MODE = UInt32(0o755)
const DEFAULT_FILE_MODE = UInt32(0o644)
mkdir(file::HDFSFile, mode::UInt32) = mkdir(file, false, mode)
mkdir(file::HDFSFile, create_parents::Bool=false, mode::UInt32=DEFAULT_FOLDER_MODE) = mkdir(file.client, file.path, create_parents, mode)
function mkdir(client::HDFSClient, path::AbstractString, create_parents::Bool=false, mode::UInt32=DEFAULT_FOLDER_MODE)
    path = abspath(client, path)
    perms = protobuild(FsPermissionProto, Dict(:perm => mode))
    inp = protobuild(MkdirsRequestProto, Dict(:src => path,
                :createParent => create_parents,
                :masked => perms))

    resp = mkdirs(client.nn_conn, inp)
    resp.result
end

mkpath(file::HDFSFile, mode::UInt32=DEFAULT_FOLDER_MODE) = mkdir(file, true, mode)
dirname(file::HDFSFile) = HDFSFile(file.client, dirname(file.path))

mv(src::HDFSFile, dst::AbstractString, overwrite::Bool) = mv(src.client, src.path, dst, overwrite)
function mv(client::HDFSClient, src::AbstractString, dst::AbstractString, overwrite::Bool)
    src = abspath(client, src)
    dst = abspath(client, dst)
    inp = protobuild(Rename2RequestProto, Dict(:src => src,
                :dst => dst,
                :overwriteDest => overwrite))

    rename2(client.nn_conn, inp)
    true
end

mv(src::HDFSFile, dst::AbstractString) = mv(src.client, src.path, dst)
function mv(client::HDFSClient, src::AbstractString, dst::AbstractString)
    src = abspath(client, src)
    dst = abspath(client, dst)
    inp = protobuild(RenameRequestProto, Dict(:src => src,
                :dst => dst))

    resp = rename(client.nn_conn, inp)
    resp.result
end

rm(file::HDFSFile, recursive::Bool=false) = rm(file.client, file.path, recursive)
function rm(client::HDFSClient, path::AbstractString, recursive::Bool=false)
    path = abspath(client, path)
    inp = protobuild(DeleteRequestProto, Dict(:src => path,
                :recursive => recursive))

    resp = delete(client.nn_conn, inp)
    resp.result
end

joinpath(hdfsfile::HDFSFile, parts...) = HDFSFile(hdfsfile.client, joinpath(hdfsfile.path, parts...))

function _create_file(client::HDFSClient, path::AbstractString, overwrite::Bool=false, replication::UInt32=zero(UInt32), blocksz::UInt64=zero(UInt64), mode::UInt32=DEFAULT_FILE_MODE, docomplete::Bool=true)
    path = abspath(client, path)

    if (blocksz == 0) || (replication == 0)
        defaults = _get_server_defaults(client)
        (blocksz == 0) && (blocksz = defaults.blockSize)
        (replication == 0) && (replication = defaults.replication)
    end

    perms = protobuild(FsPermissionProto, Dict(:perm => mode))
    createFlag = UInt32(overwrite ? CreateFlagProto.OVERWRITE : CreateFlagProto.CREATE)

    inp = protobuild(CreateRequestProto, Dict(:src => path,
                :masked => perms,
                :clientName => ELLY_CLIENTNAME,
                :createFlag => createFlag,
                :createParent => false,
                :replication => replication,
                :blockSize => blocksz))

    resp = create(client.nn_conn, inp)
    isfilled(resp, :fs) || (return nothing)

    if docomplete
        _complete_file(client, path) || (return nothing)
    end

    return resp.fs
end

function _complete_file(client::HDFSClient, path::AbstractString, last::Union{Nothing,ExtendedBlockProto}=nothing)
    path = abspath(client, path)

    endinp = protobuild(CompleteRequestProto, Dict(:src => path,
                :clientName => ELLY_CLIENTNAME))
    if last !== nothing
        set_field!(endinp, :last, last)
        @debug("setting last block as $(last)")
    end

    endresp = complete(client.nn_conn, endinp)
    endresp.result
end

function _add_block(::Type{T}, client::HDFSClient, path::AbstractString, previous::Union{Nothing,T}=nothing) where T<:LocatedBlockProto
    (previous === nothing) && (return _add_block(ExtendedBlockProto, client, path))
    @debug("adding next block to $(previous.b)")
    _add_block(ExtendedBlockProto, client, path, previous.b)
end
function _add_block(::Type{T}, client::HDFSClient, path::AbstractString, previous::Union{Nothing,T}=nothing) where T<:ExtendedBlockProto
    path = abspath(client, path)

    inp = protobuild(AddBlockRequestProto, Dict(:src => path,
                :clientName => ELLY_CLIENTNAME))
    (previous === nothing) || set_field!(inp, :previous, previous)

    resp = addBlock(client.nn_conn, inp)
    return resp.block
end

"""
Applications that write infrequently/slowly must call renewlease periodically to prevent
the namenode from assuming the client from having abandoned the file or some other client
from recovering the lease.
"""
function hdfs_renewlease(client::HDFSClient)
    inp = protobuild(RenewLeaseRequestProto, Dict(:clientName => ELLY_CLIENTNAME))
    renewLease(client.nn_conn, inp)
    nothing
end

touch(file::HDFSFile, replication::UInt32=zero(UInt32), blocksz::UInt64=zero(UInt64), mode::UInt32=DEFAULT_FILE_MODE) = touch(file.client, file.path, replication, blocksz, mode)
function touch(client::HDFSClient, path::AbstractString, replication::UInt32=zero(UInt32), blocksz::UInt64=zero(UInt64), mode::UInt32=DEFAULT_FILE_MODE)
    if exists(client, path)
        path = abspath(client, path)
        t = UInt64(datetime2unix(now(UTC))*1000)
        inp = protobuild(SetTimesRequestProto, Dict(:src => path,
                    :mtime => t,
                    :atime => t))

        setTimes(client.nn_conn, inp)
    else
        fs = _create_file(client, path, false, replication, blocksz, mode)
        (fs === nothing) && throw(HDFSException("Could not create file $path"))
    end
    nothing
end
