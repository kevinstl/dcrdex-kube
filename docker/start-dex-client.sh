#!/bin/bash

echo "start-dex-client.sh"

sleeptime=0
while [ -z "${dcrdexIsListening}" ]
do
  echo "Waiting for dcrdex to start..."
  sleep ${sleeptime}
  dcrdexIsListening="$(lsof -i -P -n | grep 7232 | grep IPv4)"
  echo "dcrdexIsListening: ${dcrdexIsListening}"
  sleeptime=2
done

cd /installs/dcrdex/client/cmd/dexc

./dexc --simnet --rpc &
