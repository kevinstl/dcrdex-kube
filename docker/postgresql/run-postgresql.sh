#!/bin/bash

echo "run-postgresql.sh"

docker run -it postgres:12.2 -env POSTGRES_USER=dcrdex  -env POSTGRES_PASSWORD=dexpass POSTGRES_DB=dcrdex_simnet