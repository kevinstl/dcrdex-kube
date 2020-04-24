#!/bin/bash

echo "install-dcrdex-client.sh"

cd /installs/dcrdex/client/cmd/dexc

go build

mkdir -p /root/.dexc
#echo "{
#	\"http://127.0.0.1:7232\": \"/root/.dcrdex/rpc.cert\",
#	\"https://127.0.0.1:7232\": \"/root/.dcrdex/rpc.cert\"
#}" >> /root/.dexc/certs.json

#lsof -i -P -n | grep LISTEN
#./dexc --simnet
#./dexc --simnet --noweb
#./dexc --simnet --noweb --tui
#./dexc --simnet --noweb --rpc
#./dexc --simnet --tui

#/installs/dcrdex/client/cmd/dexc/dexc --simnet
