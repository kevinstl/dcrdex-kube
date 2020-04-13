#!/bin/bash

echo "start-dcrdex.sh"

cd /installs/dcrdex/server/cmd/dcrdex

#cp /root/.dcrwallet/rpc.cert /root/.dcrdex/

./dcrdex --simnet --marketsconfpath=/root/.dcrdex/markets.json &
