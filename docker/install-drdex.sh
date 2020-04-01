#!/bin/bash

git clone https://github.com/decred/dcrdex.git /installs/dcrdex

cd /installs/dcrdex/server/cmd/genkey

go build
./genkey

mv /installs/dcrdex/server/cmd/genkey/dexpubkey /root/.dcrdex/
mv /installs/dcrdex/server/cmd/genkey/dexprivkey /root/.dcrdex/


cd /installs/dcrdex/server/cmd/dcrdex

go build

./dcrdex --testnet --marketsconfpath=/root/.dcrdex/markets.json
