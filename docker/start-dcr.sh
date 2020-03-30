#!/bin/bash

/installs/decred/install-dcr.sh
/decred/dcrd > /dev/null 2>&1 &
#./decred/dcrwallet &
/installs/decred/start-wallet-expect.sh > /dev/null 2>&1 &
mkdir -p /root/.dcrdex

while [ ! -f /root/.dcrwallet/rpc.cert ]
do
  sleep 2 # or less like 0.2
done

regfeexpub="$(/decred/dcrctl --wallet getmasterpubkey)"

cat /installs/decred/dcrdex-template.conf | \
sed "s/\X_REGFREEXPUB_X/${regfeexpub}/" \
> /root/.dcrdex/dcrdex.conf



