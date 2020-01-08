## Using Yarn Cluster Manager

`YarnManager` provides a Julia [ClusterManager](http://docs.julialang.org/en/latest/manual/parallel-computing/#clustermanagers) interface for 
working with Yarn. It does not have the full functionality of the direct Yarn APIs, but it provides the familiar `addprocs`, `rmprocs` methods 
for starting and stopping containers.

`YarnManager` works in both managed mode (both master and workers launched inside the cluster) and unmanaged mode (only workers launched inside the cluster). See section on ["Yarn Applications using Elly"](YARN.md) for details.

It can be also used to get a distributed Julia shell in the Yarn cluster.

The below example walks through a simple example using a Julia on a Yarn cluster.
You can find the YARN manager parameters in the `$HADOOP_CONFIG_DIR/yarn-site.xml` file 
[Hadoop Docs](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/ClusterSetup.html).

Bring up the Julia processes on the Yarn cluster. Note that Julia should be installed on all nodes of the cluster at the same path for this to work.

````
julia> using Elly

julia> yarncm = YarnManager(
        yarnhost="localhost",
        rmport=8032,
        schedport=8030,
        launch_timeout=60,
        unmanaged=false     # pass true when running in unmanaged mode
    );

julia>env = Dict(
    "JULIA_LOAD_PATH"=>join([Base.LOAD_PATH..., "/usr/local/julia/packages"], ':'),
    "JULIA_DEPOT_PATH"=>join([Base.DEPOT_PATH..., "/usr/local/julia"], ':')
);

julia> addprocs(yarncm; np=8, env=env);

julia> @everywhere println(myid())
1
    From worker 2:  2
    From worker 4:  4
    From worker 5:  5
    From worker 6:  6
    From worker 9:  9
    From worker 7:  7
    From worker 8:  8
    From worker 3:  3
````

Next, we try some trivial computation on all nodes. We use a file `dart.jl` that contains some code to
arrive at an approximate value of pi using a Monte Carlo method. Note that `dart.jl` should be made
available throughout the cluster on all nodes at the same path.

````
# dart.jl
@inline function dart_one()
    xrand = rand()
    yrand = rand()
    r = sqrt(xrand^2 + yrand^2)
    r <= 1
end
 
function dart(m)
    hit = 0
    for i in 1:m
        dart_one() && (hit += 1)
    end
    piapprox = 4 * hit / m
end
 
function dart_par(m)
    hit = @parallel (+) for i in 1:m
        dart_one() ? 1 : 0
    end
    piapprox = 4 * hit / m
end
````

So we should see a speedup when we use `dart_par` to compute on all nodes, compared to using `dart` on a single node.
The amount of speedup we get will depend on the nature of the computation, the cluster resources among other factors.

````
julia> @everywhere include("dart.jl")

julia> @time dart(10^8)
elapsed time: 1.17578138 seconds (216 bytes allocated)
3.14157544

julia> @time dart_par(10^8)
elapsed time: 0.619724439 seconds (811 kB allocated)
3.1414378
````

Finally we can resize or tear down the cluster:

````
julia> rmprocs(2)  # remove a single processor
:ok

julia> rmprocs(workers()) # remove all processors
:ok

julia> @everywhere println(myid())
1

julia> Elly.disconnect(yarncm);
````

`YarnManager` can also be used in the familiar Julia `do` block by passing a function to execute in the context of the manager, e.g.:

```
YarnManager(launch_timeout=60, unmanaged=false) do yarncm
    # use yarncm here...
    ...
end
```
