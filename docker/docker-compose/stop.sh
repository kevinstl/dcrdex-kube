#!/bin/bash

POSTGRES_PASSWORD=$1
export POSTGRES_PASSWORD

docker-compose down
