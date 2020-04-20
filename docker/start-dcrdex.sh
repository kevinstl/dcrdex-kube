#!/bin/bash

echo "start-dcrdex.sh"

cd /installs/dcrdex/server/cmd/dcrdex

#cp /root/.dcrwallet/rpc.cert /root/.dcrdex/


#-d trace --testnet --pguser dex --pgpass dex \
# --regfeexpub tpubVojFBXVHLyAcFG4sLmACaS8bmqKMb3HAgUqrkw7EZkis7oXJpBFJgamtmxAjgTxVuuS483BEKhaJBeiJKh6iMUagxChqCUT32wnJeVngEav \
# --rpclisten=0.0.0.0:7232 --altdnsnames dex-test.ssgen.io --regfeeconfirms 3 --anarchy

#./dcrdex --simnet --marketsconfpath=/root/.dcrdex/markets.json &

#./dcrdex -d trace --simnet --marketsconfpath=/root/.dcrdex/markets.json --regfeeconfirms 3 &

#./dcrdex -d trace --configfile=/root/.dcrdex/dcrdex.conf --simnet --marketsconfpath=/root/.dcrdex/markets.json --regfeeconfirms 3 &
#./dcrdex -d trace --configfile=/root/.dcrdex/dcrdex.conf --simnet --marketsconfpath=/root/.dcrdex/markets.json --regfeeconfirms 3 --anarchy &

/installs/decred/start-dcrdex-expect.sh &
