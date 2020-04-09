#!/bin/bash

echo "start-dcr.sh"

#rpcuser="rpcuser1"
#rpcpass="rpcpass1"

#/installs/decred/install-dcr.sh
#/decred/dcrd -u ${rpcuser} -P ${rpcpass} > /dev/null 2>&1 &
#/decred/dcrd --simnet > /dev/null 2>&1 &
/decred/dcrd --simnet &
#./decred/dcrwallet &
#/installs/decred/start-wallet-expect.sh ${rpcuser} ${rpcpass} > /dev/null 2>&1 &

echo "create-wallet-expect.sh"
#/installs/decred/create-wallet-expect.sh > /dev/null 2>&1 &
/installs/decred/create-wallet-expect.sh

echo "start-wallet-expect.sh"
#/installs/decred/start-wallet-expect.sh > /dev/null 2>&1 &
/installs/decred/start-wallet-expect.sh &

mkdir -p /root/.dcrdex

while [ ! -f /root/.dcrwallet/rpc.cert ]
do
  sleep 2 # or less like 0.2
done

echo "get regfeexpub"
regfeexpub="$(/decred/dcrctl --wallet getmasterpubkey)"

echo "regfeexpub: ${regfeexpub}"

cat /installs/decred/dcrdex-template.conf | \
sed "s/\X_REGFREEXPUB_X/${regfeexpub}/" \
> /root/.dcrdex/dcrdex.conf



