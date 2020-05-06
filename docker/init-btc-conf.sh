#!/bin/bash

echo "init-btc-conf.sh"

while [ ! -f /data/dextest/btc/harness-ctl/alpha.conf ]
do
  echo "Waiting for /data/dextest/btc/harness-ctl/alpha.conf to be created..."
  sleep 2
done

cp /data/dextest/btc/harness-ctl/alpha.conf /data/dextest/btc/harness-ctl/alpha-for-dcr.conf


