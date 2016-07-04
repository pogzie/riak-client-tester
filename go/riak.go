/*
1.) Make sure Go is installed correctly. Test using `go version`.
2.) Make sure that the Riak Go client is installed correctly. (assuming its at ~/riak-go-client)
3.) Change the address and port to your corresponding Riak address and port.
4.) Run `go run riak.go`.

TODO:
- Better exception handling.

*/

package main

import (
        "fmt"
        riak "github.com/basho/riak-go-client"
)

func main() {

        var node *riak.Node
        var err error

        fmt.Println("Testing Riak connectivity.")

        nodeOpts := &riak.NodeOptions{
                RemoteAddress: "127.0.0.1:8087",
        }

        if node, err = riak.NewNode(nodeOpts); err != nil {
                fmt.Println(err.Error())
        }

        nodes := []*riak.Node{node}
        opts := &riak.ClusterOptions{
                Nodes: nodes,

        }

        cluster, err := riak.NewCluster(opts)
        if err != nil {
                fmt.Println(err.Error())
        }

        if err := cluster.Start(); err != nil {
                fmt.Println(err.Error())
        }


        cmd := &riak.PingCommand{}
        errCmd := cluster.Execute(cmd)
        if errCmd != nil {
		        fmt.Println(err.Error())
        } else {
		fmt.Println("Ok.")
	}

}
