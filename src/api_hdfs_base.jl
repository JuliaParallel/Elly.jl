
@doc doc"""
# HDFSException
Thrown by HDFS APIs.
""" ->
type HDFSException <: Exception
    message::AbstractString
end




@doc doc"""
# HDFSClient
A client to the namenode in a HDFS cluster and holds a connection to it.
It also stores the folder context for using relative paths in APIs that use the client.
""" ->
type HDFSClient
    channel::HadoopRpcChannel
    controller::HadoopRpcController
    stub::ClientNamenodeProtocolBlockingStub
    wd::AbstractString
    server_defaults::Nullable{FsServerDefaultsProto}

    function HDFSClient(host::AbstractString, port::Integer, user::AbstractString)
        channel = HadoopRpcChannel(host, port, user)
        controller = HadoopRpcController(false)
        stub = ClientNamenodeProtocolBlockingStub(channel)

        new(channel, controller, stub, "/", Nullable{FsServerDefaultsProto}())
    end
end

function show(io::IO, client::HDFSClient)
    ch = client.channel
    user_spec = isempty(ch.user) ? ch.user : "$(ch.user)@"
    println(io, "HDFSClient: hdfs://$(user_spec)$(ch.host):$(ch.port)/")
    println("    id: $(ch.clnt_id)")
    println("    blocking: true")
    println("    connected: $(isconnected(ch))")
    println("    pwd: $(client.wd)")
end

function set_debug(client::HDFSClient, debug::Bool)
    client.controller.debug = debug
end

abspath(client::HDFSClient, path::AbstractString) = abspath(client.wd, path)
function cd(client::HDFSClient, path::AbstractString)
    wd = abspath(client, path)
    !isdir(client, wd) && throw(HDFSException("Directory not found: $wd"))
    client.wd = wd
end
pwd(client::HDFSClient) = client.wd



@doc doc"""
# HDFSFile
Holds a HDFSClient and path pointing to a file on HDFS
""" ->
type HDFSFile
    client::HDFSClient
    path::AbstractString
end

function HDFSFile(uristr::AbstractString)
    uri = URI(uristr)
    (uri.schema == "hdfs") || throw(HDFSException("Not a HDFS URI: $uristr"))
    client = HDFSClient(uri.host, uri.port, uri.userinfo)
    HDFSFile(client, u.path)
end


@doc doc"""
# HDFSFileInfo
Stat structure for file/foledr in HDFS
""" ->
type HDFSFileInfo
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

    HDFSFileInfo(fs::HdfsFileStatusProto) = new(fs.fileType, bytestring(fs.path), 
                    fs.length, fs.block_replication, fs.blocksize,
                    fs.owner, fs.group, fs.permission.perm,
                    fs.modification_time, fs.access_time)
end

function _as_dict(obj, d=Dict{Symbol,Any}())
    for name in names(typeof(obj))
        d[name] = getfield(obj, name)
    end
    d
end

function _walkdir(client::HDFSClient, path::AbstractString, process_entry::Function)
    path = abspath(client, path)
    cont = true
    start_after = UInt8[]
    while cont
        inp = GetListingRequestProto()
        set_field(inp, :src, path)
        set_field(inp, :startAfter, start_after)
        set_field(inp, :needLocation, false)
        resp = getListing(client.stub, client.controller, inp)

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
                start_after = result[end].data
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
    inp = GetFileInfoRequestProto()
    set_field(inp, :src, path)
    resp = getFileInfo(client.stub, client.controller, inp)
    isfilled(resp, :fs) ? Nullable{HdfsFileStatusProto}(resp.fs) : Nullable{HdfsFileStatusProto}()
end

function _get_block_locations(client::HDFSClient, path::AbstractString, offset::UInt64=uint64(0), length::UInt64=uint64(0))
    path = abspath(client, path)
    (length == uint64(0)) && (length = uint64(1024))
    inp = GetBlockLocationsRequestProto()
    set_field(inp, :src, path)
    set_field(inp, :offset, offset)
    set_field(inp, :length, length)
    resp = getBlockLocations(client.stub, client.controller, inp)
    isfilled(resp, :locations) ? Nullable{LocatedBlocksProto}(resp.locations) : Nullable{LocatedBlocksProto}()
end

#
# Server defaults
function _get_server_defaults(client::HDFSClient)
    if isnull(client.server_defaults)
        inp = GetServerDefaultsRequestProto()
        resp = getServerDefaults(client.stub, client.controller, inp)
        client.server_defaults = Nullable(resp.serverDefaults)
    end
    get(client.server_defaults)
end

hdfs_server_defaults(client::HDFSClient) = _as_dict(_get_server_defaults(client))
hdfs_default_block_size(client::HDFSClient) = _get_server_defaults(client).blockSize
hdfs_default_replication(client::HDFSClient) = _get_server_defaults(client).replication

#
# File System Status
_get_fs_status(client::HDFSClient) = getFsStats(client.stub, client.controller, GetFsStatusRequestProto())

hdfs_status(client::HDFSClient) = _as_dict(_get_fs_status(client))

hdfs_capacity(client::HDFSClient) = _get_fs_status(client).capacity
hdfs_capacity_used(client::HDFSClient) = _get_fs_status(client).used
hdfs_capacity_remaining(client::HDFSClient) = _get_fs_status(client).remaining

#
# File Status
stat(file::HDFSFile) = stat(file.client, file.path)
function stat(client::HDFSClient, path::AbstractString)
    fileinfo = _get_file_info(client, path)
    isnull(fileinfo) && throw(HDFSException("Path not found $path"))
    hdfs_file_info = HDFSFileInfo(get(fileinfo))
    hdfs_file_info.name = path
    hdfs_file_info
end

exists(file::HDFSFile) = exists(file.client, file.path)
exists(client::HDFSClient, path::AbstractString) = !isnull(_get_file_info(client, path))

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

hdfs_blocks(file::HDFSFile, offset::UInt64=uint64(0), length::UInt64=uint64(0)) = hdfs_blocks(file.client, file.path, offset, length)
function hdfs_blocks(client::HDFSClient, path::AbstractString, offset::UInt64=uint64(0), length::UInt64=uint64(0))
    blocks = (UInt64,Array)[]
    _locations = _get_block_locations(client, path, offset, length)
    isnull(_locations) && (return blocks)
    locations = get(_locations)
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
    inp = SetReplicationRequestProto()
    set_field(inp, :src, path)
    set_field(inp, :replication, UInt32(replication))

    resp = setReplication(client.stub, client.controller, inp)
    resp.result
end

#
# Disk Usage
function _get_content_summary(client::HDFSClient, path::AbstractString)
    path = abspath(client, path)
    inp = GetContentSummaryRequestProto()
    set_field(inp, :path, path)

    resp = getContentSummary(client.stub, client.controller, inp)
    resp.summary
end

du(file::HDFSFile, details::Nullable{Dict{Symbol,Any}}=Nullable{Dict{Symbol,Any}}()) = du(file.client, file.path, details)
function du(client::HDFSClient, path::AbstractString=".", details::Nullable{Dict{Symbol,Any}}=Nullable{Dict{Symbol,Any}}())
    summary = _get_content_summary(client, path)
    isnull(details) || _as_dict(summary, get(details))
    summary.length
end

#
# File create, delete, list
readdir(file::HDFSFile, limit::Int=typemax(Int)) = readdir(file.client, file.path, limit)
function readdir(client::HDFSClient, path::AbstractString=".", limit::Int=typemax(Int))
    result = AbstractString[]
    _walkdir(client, path, (filestatus)->begin
                push!(result, bytestring(filestatus.path))
                (length(result) < limit)
            end)
    result
end

mkdir(file::HDFSFile, create_parents::Bool=false, mode::UInt32=uint32(0o755)) = mkdir(file.client, file.path, create_parents, mode)
function mkdir(client::HDFSClient, path::AbstractString, create_parents::Bool=false, mode::UInt32=uint32(0o755))
    path = abspath(client, path)
    inp = MkdirsRequestProto()
    set_field(inp, :src, path)
    set_field(inp, :createParent, create_parents)

    perms = FsPermissionProto()
    set_field(perms, :perm, mode)
    set_field(inp, :masked, perms)

    resp = mkdirs(client.stub, client.controller, inp)
    resp.result
end

mv(src::HDFSFile, dst::AbstractString, overwrite::Bool) = mv(src.client, src.path, dst, overwrite)
function mv(client::HDFSClient, src::AbstractString, dst::AbstractString, overwrite::Bool)
    src = abspath(client, src)
    dst = abspath(client, dst)
    inp = Rename2RequestProto()
    set_field(inp, :src, src)
    set_field(inp, :dst, dst)
    set_field(ino, :overwriteDest, overwrite)

    rename2(client.stub, client.controller, inp)
    true
end

mv(src::HDFSFile, dst::AbstractString) = mv(src.client, src.path, dst)
function mv(client::HDFSClient, src::AbstractString, dst::AbstractString)
    src = abspath(client, src)
    dst = abspath(client, dst)
    inp = RenameRequestProto()
    set_field(inp, :src, src)
    set_field(inp, :dst, dst)

    resp = rename(client.stub, client.controller, inp)
    resp.result
end

rm(file::HDFSFile, recursive::Bool=false) = rm(file.client, file.path, recursive)
function rm(client::HDFSClient, path::AbstractString, recursive::Bool=false)
    path = abspath(client, path)
    inp = DeleteRequestProto()
    set_field(inp, :src, path)
    set_field(inp, :recursive, recursive)

    resp = delete(client.stub, client.controller, inp)
    resp.result
end

function _create_file(client::HDFSClient, path::AbstractString, overwrite::Bool=false, replication::UInt32=uint32(0), blocksz::UInt64=uint64(0), mode::UInt32=uint32(0o644), docomplete::Bool=true)
    path = abspath(client, path)

    if (blocksz == 0) || (replication == 0)
        defaults = _get_server_defaults(client)
        (blocksz == 0) && (blocksz = defaults.blockSize)
        (replication == 0) && (replication = defaults.replication)
    end

    perms = FsPermissionProto()
    set_field(perms, :perm, mode)

    createFlag = uint32(overwrite ? CreateFlagProto.OVERWRITE : CreateFlagProto.CREATE)

    inp = CreateRequestProto()
    set_field(inp, :src, path)
    set_field(inp, :masked, perms)
    set_field(inp, :clientName, ELLY_CLIENTNAME)
    set_field(inp, :createFlag, createFlag)
    set_field(inp, :createParent, false)
    set_field(inp, :replication, replication)
    set_field(inp, :blockSize, blocksz)

    resp = create(client.stub, client.controller, inp)
    isfilled(resp, :fs) || (return Nullable{HdfsFileStatusProto}())
   
    if docomplete 
        _complete_file(client, path) || (return Nullable{HdfsFileStatusProto}())
    end

    return Nullable(resp.fs)
end

function _complete_file(client::HDFSClient, path::AbstractString, last::Nullable{ExtendedBlockProto}=Nullable{ExtendedBlockProto}())
    path = abspath(client, path)

    endinp = CompleteRequestProto()
    set_field(endinp, :src, path)
    set_field(endinp, :clientName, ELLY_CLIENTNAME)
    if !isnull(last)
        set_field(endinp, :last, get(last))
        logmsg("setting last block as $(get(last))")
    end

    endresp = complete(client.stub, client.controller, endinp)
    endresp.result
end

function _add_block(client::HDFSClient, path::AbstractString, previous::Nullable{LocatedBlockProto}=Nullable{LocatedBlockProto}())
    isnull(previous) && (return _add_block(client, path))
    logmsg("adding next block to $(get(previous).b)")
    _add_block(client, path, Nullable(get(previous).b))
end
function _add_block(client::HDFSClient, path::AbstractString, previous::Nullable{ExtendedBlockProto}=Nullable{ExtendedBlockProto}())
    path = abspath(client, path)

    inp = AddBlockRequestProto()
    set_field(inp, :src, path)
    set_field(inp, :clientName, ELLY_CLIENTNAME)
    isnull(previous) || set_field(inp, :previous, get(previous))

    resp = addBlock(client.stub, client.controller, inp)
    return resp.block
end

@doc doc"""
Applications that write infrequently/slowly must call renewlease periodically to prevent
the namenode from assuming the client from having abandoned the file or some other client
from recovering the lease.
""" ->
function renewlease(client::HDFSClient)
    inp = RenewLeaseRequestProto()
    set_field(inp, :clientName, ELLY_CLIENTNAME)
    renewLease(client.stub, client.controller, inp)
    nothing
end

touch(file::HDFSFile, replication::UInt32=uint32(0), blocksz::UInt64=uint64(0), mode::UInt32=uint32(0o644)) = touch(file.client, file.path, replication, blocksz, mode)
function touch(client::HDFSClient, path::AbstractString, replication::UInt32=uint32(0), blocksz::UInt64=uint64(0), mode::UInt32=uint32(0o644))
    if exists(client, path)
        inp = SetTimesRequestProto()
        path = abspath(client, path)
        t = uint64(Base.Dates.datetime2unix(now(Base.Dates.UTC))*1000)
        set_field(inp, :src, path)
        set_field(inp, :mtime, t)
        set_field(inp, :atime, t)

        setTimes(client.stub, client.controller, inp)
    else
        fs = _create_file(client, path, false, replication, blocksz, mode)
        isnull(fs) && throw(HDFSException("Could not create file $path"))
    end
    nothing
end
