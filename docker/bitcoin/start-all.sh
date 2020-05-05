#!/bin/bash

echo "start-all.sh"

#/installs/decred/clone-dcrdex.sh
/installs/decred/init-btc-assets.sh

#if [ ! -f /data/dextest/btc/harness-ctl/alpha.conf ]; then
#  /installs/decred/harness-btc-init.sh
#fi
#
#/installs/decred/harness-btc-start.sh

/installs/decred/wait.sh
