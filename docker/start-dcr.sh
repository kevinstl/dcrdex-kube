#!/bin/bash

echo "start-dcr.sh"

/decred/dcrd --simnet &

sed -i "s/\[Ticket Buyer Options\]/;\[Ticket Buyer Options\]/" /root/.dcrwallet/dcrwallet.conf

echo "create-wallet-expect.sh"
#/installs/decred/create-wallet-expect.sh > /dev/null 2>&1 &
/installs/decred/create-wallet-expect.sh

echo "start-wallet-expect.sh"
#/installs/decred/start-wallet-expect.sh > /dev/null 2>&1 &
/installs/decred/start-wallet-expect.sh &


sleeptime=0
while [ -z "${dcrWalletIsListening}" ]
do
  sleep ${sleeptime}
  dcrWalletIsListening="$(lsof -i -P -n | grep 19558)"
  echo "dcrWalletIsListening: ${dcrWalletIsListening}"
  sleeptime=2
done


#/installs/decred/init-for-dcrdex.sh


mkdir -p /root/.dcrdex

while [ ! -f /root/.dcrwallet/rpc.cert ]
do
  sleep 2
done

#cp /root/.dcrwallet/rpc.cert /root/.dcrdex/rpc.cert

echo "get regfeexpub"
regfeexpub="$(/decred/dcrctl --wallet getmasterpubkey)"

echo "regfeexpub: ${regfeexpub}"

cat /installs/decred/dcrdex-template.conf | \
sed "s/\X_REGFREEXPUB_X/${regfeexpub}/" \
> /root/.dcrdex/dcrdex.conf



