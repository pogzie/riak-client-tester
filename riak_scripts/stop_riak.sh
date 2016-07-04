#!/bin/bash
# The contianing folder of this file should be at the same level as the dev folder

echo "Stopping Riak DevRels"

for i in {1..8};
	do ../dev/dev$i/bin/riak stop;
done
