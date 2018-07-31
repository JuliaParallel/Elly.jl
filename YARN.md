## Using Yarn with Elly

Application clients can use `YarnClient` to interface with the Yarn Resource Manager and Application Masters can use `YarnAppMaster` to interface with the Yarn Scheduler.
The sections below show a some simple examples of how to use them. A complete API documentation is not available yet, but the APIs can be discovered easily from the source.

### YarnClient

A `YarnClient` can be constructed simply by providing the address of the Yarn Resource Manager and a `UserGroupInformation` object.
It is generally useful to have a common `UserGroupInformation` object in the application as it holds security tokens provided by Yarn and 
we often need to pass them while calling methods that need them.

````
julia> using Elly

julia> ugi = UserGroupInformation()
User: tan

julia> yarnclnt = YarnClient("localhost", 8032, ugi)
YarnClient: tan@localhost:8032/
    id: 543476fe-69a1-49
    connected: false
````

Clients are connected only on first use. The yarnclnt instance can then be used submit applications and query their status from the cluster.

````
julia> nnodes = nodecount(yarnclnt)
1

julia> nlist = nodes(yarnclnt)
YarnNodes: 1 (connected to 0)
YarnNode: /default-rack/tanlt:36080 running, Used mem: 0/8192, cores: 0/8
````

### YarnAppMaster

Elly supports only unmanaged application masters. A `YarnAppMaster` can be constructed by providing the address of the Yarn Scheduler and a
`UserGroupInformation` object. It is then registered with Yarn using the `submit` API to get an application as a `YarnApp` instance.

````
julia> yarnam = YarnAppMaster("localhost", 8030, ugi)
YarnAppMaster: tan@localhost:8030/
    id: 6c215ce3-0070-4b
    connected: false
    Memory: available:0, max:0, can schecule:false
    Cores: available:0, max:0, can schedule:false
    Queue: 
YarnNodes: 0 (connected to 0)
Containers: 0/0 active, 0 in use
````

Applications may register callbacks for container allocation and finish events to be able to start a task on the allocated container or
read the results.

````
julia> cids = Dict()
Dict{Any,Any} with 0 entries

julia> function on_alloc(cid)
           # start container process
           println("allocated $cid")
           env = Dict("JULIA_PKGDIR" => "/home/tan/.julia");
           clc = launchcontext(cmd="/bin/julia /tmp/simplecontainer.jl  1>/tmp/stdout 2>/tmp/stderr", env=env);
           container_start(yarnam, cid, clc)
           cids[cid] = "some identifier"
           nothing
       end
on_alloc (generic function with 1 method)

julia> function on_finish(cid)
           # release the container (or can start a new process here also)
           println("finished $cid")
           container_release(yarnam, cid)
           delete!(cids, cid)
           nothing
       end
on_finish (generic function with 1 method)

julia> callback(yarnam, on_alloc, on_finish)

julia> yarnapp = submit(yarnclnt, yarnam)
YarnApp YARN (EllyApp/2): accepted-0.0
    location: tan@N/A:0/default
````

Containers can then be allocated/de-allocated and started/stopped as required.

````
julia> container_allocate(yarnam, 1);
allocated Elly.hadoop.yarn.ContainerIdProto(#undef,Elly.hadoop.yarn.ApplicationAttemptIdProto(Elly.hadoop.yarn.ApplicationIdProto(2,1461548151454),1),1)

julia> cid = collect(keys(cids))[1]
Elly.hadoop.yarn.ContainerIdProto(#undef,Elly.hadoop.yarn.ApplicationAttemptIdProto(Elly.hadoop.yarn.ApplicationIdProto(2,1461548151454),1),1)

julia> container_stop(yarnam, cid);

julia> container_release(yarnam, cid);
finished Elly.hadoop.yarn.ContainerIdProto(#undef,Elly.hadoop.yarn.ApplicationAttemptIdProto(Elly.hadoop.yarn.ApplicationIdProto(2,1461548151454),1),1)
````

Finally the application master can be terminated with a call to `unregister`:

````
julia> unregister(yarnam, true)
true
````
