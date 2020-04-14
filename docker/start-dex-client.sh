#!/bin/bash

echo "start-dex-client.sh"

cd /installs/dcrdex/client/cmd/dexc

./dexc --simnet --rpc &
