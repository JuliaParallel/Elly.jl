## Using Yarn with Elly

Application clients can use `YarnClient` to interface with the Yarn Resource Manager and Application Masters can use `YarnAppMaster` to interface with the Yarn Scheduler.
The sections below show a some simple examples of how to use them. A complete API documentation is not available yet, but the APIs can be discovered easily from the source.

### YarnClient

A `YarnClient` can be constructed simply by poviding the address of the Yarn Resource Manager and a `UserGroupInformation` object.
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


julia> function on_alloc(cid)
           # probably start container process here
           println("allocated $cid")
       end
on_alloc (generic function with 1 method)

julia> function on_finish(cid)
           # ...
           println("finished $cid")
       end
on_finish (generic function with 1 method)

julia> callback(yarnam, Nullable(on_alloc), Nullable(on_finish))

julia> yarnapp = submit(yarnclnt, yarnam)
YarnApp YARN (EllyApp/11): accepted-0.0
    location: tan@N/A:-1/default
````

Containers can then be allocated/de-allocated and started/stopped as required.

````
julia> cid = container_allocate(yarnam, 1);

julia> env = Dict("JULIA_PKGDIR" => "/home/tan/.julia");

julia> clc = launchcontext(cmd="/bin/julia /tmp/simplecontainer.jl  1>/tmp/stdout 2>/tmp/stderr", env=env);

julia> container_start(yarnam, cid, clc)
Elly.hadoop.yarn.ContainerIdProto(#undef,Elly.hadoop.yarn.ApplicationAttemptIdProto(Elly.hadoop.yarn.ApplicationIdProto(11,1427704493231),1),1)

julia> container_stop(yarnam, cid);

julia> container_release(yarnam, cid);
````

Finally the application master can be terminated with a call to `unregister`:

````
julia> unregister(yarnam, true)
true
````
