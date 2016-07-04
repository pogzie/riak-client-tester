#!/bin/bash
# The contianing folder of this file should be at the same level as the dev folder

echo "Starting Riak DevRels"
ulimit -n 10000
for i in {1..8};
	do ../dev/dev$i/bin/riak start;
done

echo "Lets do a riak ping check for all of the nodes"
for i in {1..8};
        do ../dev/dev$i/bin/riak ping;
done