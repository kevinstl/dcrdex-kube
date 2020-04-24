#!/bin/bash

echo "init-dcrdex-conf.sh"

mkdir -p /root/.dcrdex

#while [ ! -f /root/.dcrwallet/rpc.cert ]
while [ ! -f /data/dextest/dcr/alpha/rpc.cert ]
do
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

mv /root/.dcrwallet/dcrwallet.conf /root/.dcrwallet/dcrwallet.conf-bak
cp /data/dextest/dcr/alpha/w-alpha.conf /root/.dcrwallet/dcrwallet.conf

mv /root/.dcrd/dcrd.conf /root/.dcrd/dcrd.conf-bak
cp /data/dextest/dcr/alpha/alpha-ctl.conf /root/.dcrd/dcrd.conf


cp /data/dextest/dcr/alpha/w-alpha.conf /data/dextest/dcr/alpha/dcrdex-w-alpha.conf

echo "rpcuser=user" >> /data/dextest/dcr/alpha/dcrdex-w-alpha.conf
echo "rpcpass=pass" >> /data/dextest/dcr/alpha/dcrdex-w-alpha.conf

echo "get regfeexpub"
#regfeexpub="$(/decred/dcrctl --simnet --wallet getmasterpubkey)"
regfeexpub="$(/decred/dcrctl --simnet --rpccert /data/dextest/dcr/alpha/rpc.cert --rpcserver 127.0.0.1:19567 --rpcuser user --rpcpass pass --wallet getmasterpubkey)"

echo "regfeexpub: ${regfeexpub}"

cat /installs/decred/dcrdex-template.conf | \
sed "s/\X_REGFREEXPUB_X/${regfeexpub}/" \
> /root/.dcrdex/dcrdex.conf


sleeptime=0
while [ -z "${bitcoindIsListening}" ]
do
  echo "Waiting for bitcoind to start..."
  sleep ${sleeptime}
  bitcoindIsListening="$(lsof -i -P -n | grep 20556)"
  echo "bitcoindIsListening: ${bitcoindIsListening}"
  sleeptime=2
done

cp /data/dextest/btc/harness-ctl/alpha.conf /data/dextest/btc/harness-ctl/alpha.conf-bak

#echo "rpcwallet=" >> /data/dextest/btc/harness-ctl/alpha.conf

cp /data/dextest/btc/harness-ctl/alpha.conf /data/dextest/btc/harness-ctl/alpha-for-dcr.conf


echo "" >> /data/dextest/btc/harness-ctl/alpha.conf

echo "[regtest]" >> /data/dextest/btc/harness-ctl/alpha.conf
echo "rpcport=20556" >> /data/dextest/btc/harness-ctl/alpha.conf

#/usr/local/bin/bitcoin-cli --conf=/data/dextest/btc/harness-ctl/alpha.conf encryptwallet abc
