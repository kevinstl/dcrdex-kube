#!/bin/bash

#start-bitcoind.sh &

cd /

/installs/decred/start-dcr.sh
/installs/go/install-go.sh
/installs/postgresql/install-postgresql.sh

/installs/decred/wait.sh


