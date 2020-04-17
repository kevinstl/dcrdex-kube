#!/bin/bash

echo "start-bitcoind.sh"

#if [ ! -f "/tmp/bitcoin.conf" ];
#then
#    cp /bitcoin/.bitcoin/bitcoin.conf /tmp/
#fi
#
#cp /tmp/bitcoin.conf /bitcoin/.bitcoin/bitcoin.conf

rpcAuthLineNumber=$(grep -n rpcauth /bitcoin/.bitcoin/bitcoin.conf | head -n 1 | cut -d: -f1)
rpcAuth=$(/tmp/setup-rpc.sh | grep rpcauth)
rpcUser=$(/tmp/setup-rpc.sh | grep rpcuser)
rpcPassword=$(/tmp/setup-rpc.sh | grep rpcpassword)
#rpcAuth=$(echo "rpcauth=blah")

if [[ ${rpcAuthLineNumber} != "" ]]
then
    sed -i -e "${rpcAuthLineNumber}s/.*/${rpcAuth}/" /bitcoin/.bitcoin/bitcoin.conf

else
    echo "" >> /bitcoin/.bitcoin/bitcoin.conf
    echo ${rpcAuth} >> /bitcoin/.bitcoin/bitcoin.conf
    echo ${rpcUser} >> /bitcoin/.bitcoin/bitcoin.conf
    echo ${rpcPassword} >> /bitcoin/.bitcoin/bitcoin.conf

fi

#echo "[test]" >> /bitcoin/.bitcoin/bitcoin.conf
#echo "rpcport=19832" >> /bitcoin/.bitcoin/bitcoin.conf

#docker-entrypoint.sh btc_oneshot &

bitcoind &

while [ ! -f /bitcoin/.bitcoin/regtest/wallets/wallet.dat ]
do
  sleep 2
done

lsof -i -P -n | grep LISTEN

/usr/bin/bitcoin-cli --conf=/bitcoin/.bitcoin/bitcoin.conf generate 151

/usr/bin/bitcoin-cli --conf=/bitcoin/.bitcoin/bitcoin.conf getbalance

