#!/bin/bash

./cleanup.sh

POSTGRES_PASSWORD=$1
export POSTGRES_PASSWORD

docker-compose up
