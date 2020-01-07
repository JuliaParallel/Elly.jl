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

### Yarn Applications (The YarnAppMaster)

An ApplicationMaster, in Yarn terminology, is the part of an application that negotiates resources from the Yarn ResourceManager and works
with the Yarn NodeManager to execute and monitor the granted resources (bundled as containers) for a given application. Application masters
can either be:

- Managed: managed by Yarn and run inside the cluster, resources are allocated inside the Yarn cluster and Yarn instantiates the process
- Unmanaged: not managed by Yarn and run outside the cluster, it is the application writers responsibility to ensure that it has the resources it needs and is kept running throughout the course of the application

Elly supports both managed and unmanaged application masters.

#### Unmanaged YarnAppMaster

An unmanaged `YarnAppMaster` can be constructed by providing the address of the Yarn Scheduler and a
`UserGroupInformation` object. It needs to be then registered with Yarn using the `submit` API to get an application as a `YarnApp` instance.

````
julia> yarnam = YarnAppMaster("localhost", 8030, ugi)
YarnAppMaster: tan@localhost:8030/
    id: 6c215ce3-0070-4b
    connected: false
````

Once registered, the application master can then allocate one or more containers in the cluster.
But before they can do that, applications should register callbacks for container allocation and
finish events, so that they can start a task on the allocated container or read the results after
termination.

````
julia> cids = Set()
Dict{Any,Any} with 0 entries

julia> function on_alloc(cid)
           # start container process
           println("allocated $cid")
           env = Dict(
               "JULIA_LOAD_PATH" => join([Base.LOAD_PATH..., "/home/tan/.julia/dev", "/home/tan/.julia/packages"], ':'),
               "JULIA_DEPOT_PATH" => join(Base.DEPOT_PATH, ':')
           );
           clc = launchcontext(cmd="/bin/julia /tmp/simplecontainer.jl  1>/tmp/stdout 2>/tmp/stderr", env=env);
           container_start(yarnam, cid, clc)
           push!(cids, cid)
           nothing
       end
on_alloc (generic function with 1 method)

julia> function on_finish(cid)
           # release the container (or can start a new process here also)
           println("finished $cid")
           container_release(yarnam, cid)
           pop!(cids, cid)
           nothing
       end
on_finish (generic function with 1 method)

julia> callback(yarnam, on_alloc, on_finish)

julia> yarnapp = submit(yarnclnt, yarnam)
YarnApp YARN (EllyApp/2): accepted-0.0
    location: tan@N/A:0/default
````

With event handlers registered, containers can then be allocated/de-allocated and started/stopped as required.

````
julia> container_allocate(yarnam, 1);
allocated Elly.hadoop.yarn.ContainerIdProto(#undef,Elly.hadoop.yarn.ApplicationAttemptIdProto(Elly.hadoop.yarn.ApplicationIdProto(2,1461548151454),1),1)

julia> cid = collect(cids)[1]
Elly.hadoop.yarn.ContainerIdProto(#undef,Elly.hadoop.yarn.ApplicationAttemptIdProto(Elly.hadoop.yarn.ApplicationIdProto(2,1461548151454),1),1)

julia> container_stop(yarnam, cid);
finished Elly.hadoop.yarn.ContainerIdProto(#undef,Elly.hadoop.yarn.ApplicationAttemptIdProto(Elly.hadoop.yarn.ApplicationIdProto(2,1461548151454),1),1)
````

Finally the application master can be terminated with a call to `unregister`:

````
julia> unregister(yarnam, true)
true
````

#### Managed YarnAppMaster

A managed `YarnAppMaster` can be deployed simply by submitting a command to the YarnClient with the `unmanaged` flag set to `false`.

```julia
ugi = UserGroupInformation()
clnt = YarnClient(host, rmport, ugi)
yarn_host = "yarnhost"
yarn_scheduler_port = 8030

env = Dict(
    "JULIA_LOAD_PATH"=>join([Base.LOAD_PATH..., "/usr/local/julia/packages"], ':'),
    "JULIA_DEPOT_PATH"=>join([Base.DEPOT_PATH..., "/usr/local/julia"], ':')
)

testscript = "/application/masterprocess.jl"
app = submit(clnt, ["/usr/local/julia/bin/julia", testscript], env; schedaddr="$(yarn_host):$(yarn_scheduler_port)", unmanaged=false)
```

Once submitted, the submitting process can exit, leaving the application master running inside the cluster. It can also monitor the application if so desired.

```julia
@info("status", status(app))
```

And wait for application to reach a certain state.

```julia
Elly.wait_for_state(app, Elly.YarnApplicationStateProto.FINISHED)
```

The Yarn master process thus submitted can create an instance of `YarnAppMaster` and use it to manage itself and also allocate and launch more containers into the cluster.


For example, the `/application/masterprocess.jl` script launched above, can instantiate a `YarnAppMaster` and register itself.

```
ugi = UserGroupInformation()
am = YarnAppMaster(ugi)
register(am)
```

And then it can proceed to allocate and execute more containers exactly as how we did with the unmanaged `YarnAppMaster`.
