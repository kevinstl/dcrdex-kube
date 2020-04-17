#!/bin/bash

echo "init-for-dcrdex.sh"

cd /decred

sleeptime=0
while [ -z "${miningaddr}" ]
do
  echo "Waiting until new address is retrieved...."
  sleep ${sleeptime}
  miningaddr="$(./dcrctl --simnet --wallet getnewaddress)"
  echo "miningaddr: ${miningaddr}"
  sleeptime=2
done

echo "debug1"

ps -elf

echo "debug2"

pkill -f "/decred/dcrd --simnet"

echo "debug3"

sleeptime=0
dcrdIsListening="not empty"
while [ ! -z "${dcrdIsListening}" ]
do
  echo "Waiting for dcrd to stop..."
  sleep ${sleeptime}
  dcrdIsListening="$(lsof -i -P -n | grep 18555 | grep IPv4)"
  echo "dcrdIsListening: ${dcrdIsListening}"
  sleeptime=2
done

echo "debug4"

/decred/dcrd --simnet --miningaddr=${miningaddr} &

echo "debug5"

sleeptime=0
while [ -z "${dcrdIsListening}" ]
do
  echo "Waiting for dcrd to start..."
  sleep ${sleeptime}
  dcrdIsListening="$(lsof -i -P -n | grep 18555 | grep IPv4)"
  echo "dcrdIsListening: ${dcrdIsListening}"
  sleeptime=2
done

echo "debug6"

./dcrctl --simnet generate 18

echo "debug7"

./dcrctl --simnet --wallet getbalance

