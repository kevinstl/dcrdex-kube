#!/bin/bash

echo "start-all.sh"

#/installs/decred/init-btc-assets.sh

#if [ ! -f /data/dextest/btc/harness-ctl/alpha.conf ]; then
##  /installs/decred/harness-btc-init.sh
#  echo "hello"
#fi

#/installs/decred/harness-btc-start.sh
/installs/decred/harness.sh

#cd /data/dextest/btc/harness-ctl
#
#while :
#do
#  ./mine-alpha 1
#  sleep 5
#done

#watch -n 5 ./mine-alpha 1

/installs/decred/wait.sh
