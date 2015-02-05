
type NameNode
    
end

type HDFSClient
    channel::HadoopRpcChannel
    controller::HadoopRpcController
    stub::ClientNamenodeProtocolBlockingStub

    function HDFSClient(host::AbstractString, port::Integer, user::AbstractString)
        channel = HadoopRpcChannel(host, port, user)
        controller = HadoopRpcController(false)
        stub = ClientNamenodeProtocolBlockingStub(channel)

        new(channel, controller, stub)
    end
end

function show(io::IO, clnt::HDFSClient)
    println(io, "HDFSClient: hdfs://$(clnt.channel.host):$(clnt.channel.port)/")
    isempty(clnt.channel.user) || println(io, "user: $(clnt.channel.user)")
    println("client id: $(clnt.channel.clnt_id)")
end

function set_debug(clnt::HDFSClient, debug::Bool)
    clnt.controller.debug = debug
end

type HDFSFile
end

type HDFSFileInfo
end

type HdfsFileInfo
    kind::Int8
    name::AbstractString
    last_mod::Int64
    size::Int64
    replications::Int16
    block_sz::Int64
    owner::AbstractString
    grp::AbstractString
    permissions::Int16
    last_access::Int64
end


function readdir(client::HDFSClient, path::AbstractString=".", limit::Int=typemax(Int))
    result = AbstractString[]

    cont = true
    start_after = UInt8[]
    while cont
        inp = GetListingRequestProto()
        set_field(inp, :src, path)
        set_field(inp, :startAfter, start_after)
        set_field(inp, :needLocation, false)
        resp = getListing(client.stub, client.controller, inp)
        #println(resp)

        if isfilled(resp, :dirList)
            dir_list = resp.dirList
            if isfilled(dir_list, :partialListing)
                partial_listing = dir_list.partialListing
                for filestatus in partial_listing
                    push!(result, bytestring(filestatus.path))
                    (length(result) < limit) || (cont = false; break)
                end
                (cont == false) && break
            end
            if isfilled(dir_list, :remainingEntries) && (dir_list.remainingEntries > 0)
                start_after = result[end].data
            else
                cont = false
            end
        end
    end
    result
end

