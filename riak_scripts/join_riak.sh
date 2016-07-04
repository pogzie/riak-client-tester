#!/bin/bash
# The contianing folder of this file should be at the same level as the dev folder

RIAKIP="127.0.0.1"

echo "Joining dev2 to dev8 to dev1."

for i in {2..8};
  do ../dev/dev$i/bin/riak-admin cluster join dev1@$RIAKIP;
done

echo "Running a cluster plan."
../dev/dev1/bin/riak-admin cluster plan

echo "Running a cluster commit."
../dev/dev1/bin/riak-admin cluster commit
