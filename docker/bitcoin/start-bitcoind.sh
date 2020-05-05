#!/bin/bash

echo "start-bitcoind.sh"

#if [ ! -f "/tmp/bitcoin.conf" ];
#then
#    cp /data/.bitcoin/bitcoin.conf /tmp/
#fi
#
#cp /tmp/bitcoin.conf /data/.bitcoin/bitcoin.conf

rpcAuthLineNumber=$(grep -n rpcauth /data/.bitcoin/bitcoin.conf | head -n 1 | cut -d: -f1)
rpcAuth=$(/tmp/setup-rpc.sh | grep rpcauth)
rpcUser=$(/tmp/setup-rpc.sh | grep rpcuser)
rpcPassword=$(/tmp/setup-rpc.sh | grep rpcpassword)
#rpcAuth=$(echo "rpcauth=blah")

if [[ ${rpcAuthLineNumber} != "" ]]
then
    sed -i -e "${rpcAuthLineNumber}s/.*/${rpcAuth}/" /data/.bitcoin/bitcoin.conf

else
    echo "" >> /data/.bitcoin/bitcoin.conf
    echo ${rpcAuth} >> /data/.bitcoin/bitcoin.conf
    echo ${rpcAuth} >> /data/.bitcoin/bitcoin-for-dcr.conf
    echo ${rpcUser} >> /data/.bitcoin/bitcoin.conf
    echo ${rpcUser} >> /data/.bitcoin/bitcoin-for-dcr.conf
    echo ${rpcPassword} >> /data/.bitcoin/bitcoin.conf
    echo ${rpcPassword} >> /data/.bitcoin/bitcoin-for-dcr.conf
fi

#echo "" >> /data/.bitcoin/bitcoin.conf
#echo "[regtest]" >> /data/.bitcoin/bitcoin.conf
#echo "rpcport=18443" >> /data/.bitcoin/bitcoin.conf


#echo "[test]" >> /data/.bitcoin/bitcoin.conf
#echo "rpcport=19832" >> /data/.bitcoin/bitcoin.conf

#docker-entrypoint.sh btc_oneshot &

bitcoind &

while [ ! -f /data/.bitcoin/regtest/wallets/wallet.dat ]
do
  sleep 2
done

lsof -i -P -n | grep LISTEN

newAddress="$(/usr/local/bin/bitcoin-cli --conf=/data/.bitcoin/bitcoin.conf getnewaddress)"

echo "newAddress: " ${newAddress}

#/usr/local/bin/bitcoin-cli --conf=/data/.bitcoin/bitcoin.conf generate 151

/usr/local/bin/bitcoin-cli --conf=/data/.bitcoin/bitcoin.conf generatetoaddress 151 ${newAddress}

/usr/local/bin/bitcoin-cli --conf=/data/.bitcoin/bitcoin.conf getbalance

/usr/local/bin/bitcoin-cli --conf=/data/.bitcoin/bitcoin.conf encryptwallet abc

