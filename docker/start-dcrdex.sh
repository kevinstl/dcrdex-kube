#!/bin/bash

echo "start-dcrdex.sh"

cd /installs/dcrdex/server/cmd/dcrdex

./dcrdex --simnet --marketsconfpath=/root/.dcrdex/markets.json &
