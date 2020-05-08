#!/bin/bash

echo "start-all.sh"

#/installs/go/install-go.sh
#
#/installs/decred/install-dcr.sh && \
#/installs/decred/install-dcrdex.sh
#
#/installs/decred/init-dcr-assets.sh
#/installs/decred/init-btc-assets.sh
#
#/installs/decred/init-dcrdex-conf.sh


#if [ ! -f /data/dextest/btc/harness-ctl/alpha-for-dcr.conf ]; then
#  /installs/decred/harness-dcr-init.sh
#  /installs/decred/harness-btc-for-dcr-init.sh
#  /installs/decred/init-dcrdex-conf.sh
#fi


#/installs/decred/harness-dcr-start.sh

/installs/decred/install-dcr.sh && \
/installs/decred/install-dcrdex.sh

#/installs/decred/init-dcr-assets.sh
#/installs/decred/init-btc-assets.sh
/installs/decred/harness-btc-for-dcr-init.sh
/installs/decred/harness.sh

/installs/decred/init-dcrdex-conf.sh

/installs/decred/start-dcrdex.sh && \
/installs/decred/start-dex-client.sh

#cp -r /root/ /Users/kevin/dcrdex
#cp -r /data/dextest/ /Users/kevin/dcrdex

mkdir -p /Users/kevin/dcrdex

cp /data/dextest/dcr/alpha/rpc.cert /Users/kevin/dcrdex/dextest/dcr/alpha/rpc.cert

#cd /data/dextest/dcr/harness-ctl
#
#while :
#do
#  ./mine-alpha 1
#  sleep 5
#done

#watch -n 5 ./mine-alpha 1

/installs/decred/wait.sh
