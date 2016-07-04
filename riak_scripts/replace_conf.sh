#!/bin/bash
# The contianing folder of this file should be at the same level as the dev folder

NEWRIAKIP="127.0.0.1"
RIAKCOOKIE="riak"
NEWRIAKCOOKIE="riaka"

# Replaces the node name
for i in {1..8};
	do sed -i -e "s/@127.0.0.1/@$NEWRIAKIP/g" ../dev/dev$i/etc/riak.conf;
done

# Replaces the listen ports
for i in {1..8};
        do sed -i -e "s/127.0.0.1:/$NEWRIAKIP:/g" ../dev/dev$i/etc/riak.conf;
done

# Replaces the cookie
for i in {1..8};
	do sed -i -e "s/distributed_cookie = $RIAKCOOKIE/distributed_cookie = $NEWRIAKCOOKIE/g" ../dev/dev$i/etc/riak.conf;
done
