#!/bin/bash

echo "start-all.sh"

#start-bitcoind.sh &
#
#/installs/go/install-go.sh
#
#/installs/postgresql/install-postgresql.sh
#
#/installs/decred/install-dcr.sh && \
#/installs/decred/install-dcrdex.sh && \
#/installs/decred/start-dcr.sh && \
#/installs/decred/init-for-dcrdex.sh && \
#/installs/decred/start-dcrdex.sh && \
#/installs/decred/start-dex-client.sh




#using test harness
/installs/go/install-go.sh

/installs/postgresql/install-postgresql.sh

/installs/decred/install-dcr.sh && \
/installs/decred/install-dcrdex.sh

/installs/decred/init-dcr-assets.sh
/installs/decred/init-btc-assets.sh

/installs/decred/init-dcrdex-conf.sh

/installs/decred/start-dcrdex.sh && \
/installs/decred/start-dex-client.sh

/installs/decred/wait.sh



#/installs/go/install-go.sh
#/installs/decred/install-dcrdex.sh
#/installs/decred/init-btc-assets.sh
#/installs/decred/wait.sh