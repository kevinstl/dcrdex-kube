#!/bin/bash

echo "setup-node.sh"

miningAddress=`echo $1 | base64`

export MINING_ADDRESS=${miningAddress}



