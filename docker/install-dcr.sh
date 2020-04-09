#!/bin/bash

echo "install-dcr.sh"

wget -P / https://github.com/decred/decred-release/releases/download/v1.5.1/dcrinstall-linux-amd64-v1.5.1
chmod u+x /dcrinstall-linux-amd64-v1.5.1

echo "install-dcr-expect.sh"
/installs/decred/install-dcr-expect.sh

#PS> git clone https://github.com/decred/dcrd $env:USERPROFILE\src\dcrd
#PS> cd $env:USERPROFILE\src\dcrd
#PS> go install . .\cmd\...
#PS> & "$(go env GOPATH)\bin\dcrd" -V

#mkdir -p /decred
#
##export GO111MODULE=on
#
#git clone https://github.com/decred/dcrd /installs/dcrd/src && \
#cd /installs/dcrd/src && \
##go install . ./cmd/...
#go build -o /decred . ./cmd/...
##go build -o /decred .
#
#git clone https://github.com/decred/dcrwallet /installs/dcrwallet/src && \
#cd /installs/dcrwallet/src && \
##go install . ./cmd/...
#go build -o /decred . ./cmd/...
##go build -o /decred .


#./wait.sh


