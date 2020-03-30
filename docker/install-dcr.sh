#!/bin/bash

wget -P / https://github.com/decred/decred-release/releases/download/v1.5.1/dcrinstall-linux-amd64-v1.5.1
chmod u+x /dcrinstall-linux-amd64-v1.5.1
/installs/decred/install-dcr-expect.sh
#./wait.sh


