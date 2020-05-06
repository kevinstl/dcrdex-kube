#!/bin/bash

echo "init-dcrdex-conf.sh"

#while [ ! -f /root/.dcrwallet/rpc.cert ]
while [ ! -f /data/dextest/dcr/alpha/rpc.cert ]
do
  echo "Waiting for /data/dextest/dcr/alpha/rpc.cert to be created..."
  sleep 2
done

sleeptime=0
while [ -z "${dcrdIsListening}" ]
do
  echo "Waiting for dcrd to start..."
  sleep ${sleeptime}
  dcrdIsListening="$(lsof -i -P -n | grep 19567 | grep IPv4)"
  echo "dcrdIsListening: ${dcrdIsListening}"
  sleeptime=2
done

mkdir -p /root/.dcrdex

echo "get regfeexpub"
#regfeexpub="$(/decred/dcrctl --simnet --wallet getmasterpubkey)"
regfeexpub="$(/decred/dcrctl --simnet --rpccert /data/dextest/dcr/alpha/rpc.cert --rpcserver 127.0.0.1:19567 --rpcuser user --rpcpass pass --wallet getmasterpubkey)"

echo "regfeexpub: ${regfeexpub}"

cat /installs/decred/dcrdex-template.conf | \
sed "s/\X_REGFREEXPUB_X/${regfeexpub}/" \
> /root/.dcrdex/dcrdex.conf

