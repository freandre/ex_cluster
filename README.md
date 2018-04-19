# ExCluster

## Purpose

This project is a simple test project made to test gossip discovery strategy of libcluster. While overloading :connect :disconnect and :list_nodes, I came to this error : 

``` 18:28:16.549 [error] GenServer #PID<0.158.0> terminating
** (RuntimeError) Elixir.ExCluster.Connection.list/1 is undefined!
    (libcluster) lib/strategy/strategy.ex:117: Cluster.Strategy.ensure_exported!/3
    (libcluster) lib/strategy/strategy.ex:39: Cluster.Strategy.connect_nodes/4
    (libcluster) lib/strategy/gossip.ex:116: Cluster.Strategy.Gossip.handle_heartbeat/2
    (libcluster) lib/strategy/gossip.ex:90: Cluster.Strategy.Gossip.handle_info/2
    (stdlib) gen_server.erl:616: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:686: :gen_server.handle_msg/6
    (stdlib) proc_lib.erl:247: :proc_lib.init_p_do_apply/3
Last message: {:udp, #Port<0.4903>, {192, 168, 1, 26}, 45892, <<104, 101, 97, 114, 116, 98, 101, 97, 116, 58, 58, 131, 116, 0, 0, 0, 1, 100, 0, 4, 110, 111, 100, 101, 100, 0, 13, 110, 111, 100, 101, 48, 50, 64, 116, 104, 97, 110, 111, 115>>}
State: %Cluster.Strategy.State{config: [port: 45892, if_addr: "0.0.0.0", multicast_addr: "230.1.1.251", multicast_ttl: 1], connect: {ExCluster.Connection, :connect, []}, disconnect: {ExCluster.Connection, :disconnect, []}, list_nodes: {ExCluster.Connection, :list, [:connected]}, meta: {{230, 1, 1, 251}, 45892, #Port<0.4903>}, topology: :gossip_topo}
```
## Protocol 
Use two term an launch with :

```iex --sname node01 --cookie foo -S mix```
and
```iex --sname node02 --cookie foo -S mix```

The previous error will show.

to test my fix, use my dependency in mix.exs, then you should be able to test a simple broadcast client :

```ExCluster.Hello.start_link
ExCluster.Hello.hello("Jo")```
