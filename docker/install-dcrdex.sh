#!/bin/bash

echo "install-dcrdex.sh"


#git clone https://github.com/decred/dcrdex.git /installs/dcrdex
#git clone --branch issue-236-notui https://github.com/kevinstl/dcrdex.git /installs/dcrdex
#git clone --branch localhost-to-all-local https://github.com/kevinstl/dcrdex.git /installs/dcrdex
git clone --branch simnet-auto-mine https://github.com/kevinstl/dcrdex.git /installs/dcrdex

/installs/decred/install-dcrdex-client.sh
/installs/decred/install-dcrdex-web-server.sh

cd /installs/dcrdex/server/cmd/genkey

go build
./genkey

mv /installs/dcrdex/server/cmd/genkey/dexpubkey /root/.dcrdex/
mv /installs/dcrdex/server/cmd/genkey/dexprivkey /root/.dcrdex/


cd /installs/dcrdex/server/cmd/dcrdex

go build

#./dcrdex --testnet --marketsconfpath=/root/.dcrdex/markets.json
#./dcrdex --simnet --marketsconfpath=/root/.dcrdex/markets.json
