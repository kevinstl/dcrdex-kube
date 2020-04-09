#!/bin/bash

echo "install-dcrdex-client.sh"

cd /installs/dcrdex/client/cmd/dexc

go build

#lsof -i -P -n | grep LISTEN
#./dexc --simnet
#./dexc --simnet --noweb
#./dexc --simnet --noweb --tui
#./dexc --simnet --noweb --rpc
#./dexc --simnet --tui

#/installs/dcrdex/client/cmd/dexc/dexc --simnet
