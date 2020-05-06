#!/bin/bash

echo "init-dcrd-conf.sh"

mkdir -p /root/.dcrdex

##while [ ! -f /root/.dcrwallet/rpc.cert ]
#while [ ! -f /data/dextest/dcr/alpha/rpc.cert ]
#do
#  echo "Waiting for /data/dextest/dcr/alpha/rpc.cert to be created..."
#  sleep 2
#done
#
#sleeptime=0
#while [ -z "${dcrdIsListening}" ]
#do
#  echo "Waiting for dcrd to start..."
#  sleep ${sleeptime}
#  dcrdIsListening="$(lsof -i -P -n | grep 19567 | grep IPv4)"
#  echo "dcrdIsListening: ${dcrdIsListening}"
#  sleeptime=2
#done

mv /root/.dcrwallet/dcrwallet.conf /root/.dcrwallet/dcrwallet.conf-bak
cp /data/dextest/dcr/alpha/w-alpha.conf /root/.dcrwallet/dcrwallet.conf

mv /root/.dcrd/dcrd.conf /root/.dcrd/dcrd.conf-bak
cp /data/dextest/dcr/alpha/alpha-ctl.conf /root/.dcrd/dcrd.conf


cp /data/dextest/dcr/alpha/w-alpha.conf /data/dextest/dcr/alpha/dcrdex-w-alpha.conf

echo "rpcuser=user" >> /data/dextest/dcr/alpha/dcrdex-w-alpha.conf
echo "rpcpass=pass" >> /data/dextest/dcr/alpha/dcrdex-w-alpha.conf



