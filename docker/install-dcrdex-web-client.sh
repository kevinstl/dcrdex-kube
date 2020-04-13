#!/bin/bash

echo "install-dcrdex-web-client.sh"

/installs/decred/install-nodejs.sh

#echo "{
#	"https://127.0.0.1:7232": "/root/.dcrd/rpc.cert"
#}" >> /root/.dexc/certs.json


cd /installs/dcrdex/client/webserver/site/

npm install
npm run build &