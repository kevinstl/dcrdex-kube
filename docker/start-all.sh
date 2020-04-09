#!/bin/bash

echo "start-all.sh"

start-bitcoind.sh &

cd /

/installs/go/install-go.sh

/installs/postgresql/install-postgresql.sh

/installs/decred/install-dcr.sh && \
/installs/decred/install-dcrdex.sh && \
/installs/decred/start-dcr.sh && \
/installs/decred/start-dcrdex.sh && \
/installs/decred/start-dex-client.sh


#/installs/decred/wait.sh

