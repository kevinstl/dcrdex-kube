#!/bin/bash

./install-dcr.sh
./decred/dcrd > /dev/null 2>&1 &
#./decred/dcrwallet &
./start-wallet-expect.sh > /dev/null 2>&1 &
mkdir -p ./.dcrdex
regfeexpub="$(./decred/dcrctl --wallet getmasterpubkey)"

cat ./dcrdex-template.conf | \
sed "s/\X_REGFREEXPUB_X/${regfeexpub}/" \
> ./.dcrdex/dcrdex.conf

./wait.sh

