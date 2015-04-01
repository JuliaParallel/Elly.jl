## Using Yarn Cluster Manager

`YarnManager` provides a Julia [ClusterManager](http://docs.julialang.org/en/latest/manual/parallel-computing/#clustermanagers) interface for 
working with Yarn. It does not have the full functionality of the direct Yarn APIs, but it provides the familiar `addprocs`, `rmprocs` methods 
for starting and stopping containers. 

It can be also used to get a distributed Julia shell in the Yarn cluster.

Below is an example of a distributed Julia shell running in a Yarn cluster.

````
julia> using Elly

julia> yarncm = YarnManager(yarnhost="localhost", rmport=8032, schedport=8030, launch_timeout=60)
YarnManager for YarnClient: tan@localhost:8032/
    id: 1d07a999-76ed-41
    connected: true

julia> appenv = Dict("JULIA_PKGDIR" => "/home/tan/.julia");

julia> addprocs(yarncm; np=1, env=appenv, exename="/home/tan/Work/julia/sources/julia/julia");

julia> @everywhere println(myid())
1
    From worker 2:  2

julia> addprocs(yarncm; np=1, env=appenv, exename="/home/tan/Work/julia/sources/julia/julia");

julia> @everywhere println(myid())
1
    From worker 2:  2
    From worker 3:  3

julia> rmprocs(2)
:ok

julia> @everywhere println(myid())
1
    From worker 3:  3

julia> rmprocs(3)
:ok

julia> @everywhere println(myid())
1
````
