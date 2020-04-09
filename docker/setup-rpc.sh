#!/bin/bash

#/tmp/rpcauth.py ${RPCUSER} ${RPCPASSWORD}
/tmp/rpcauth.py ${RPCUSER:-bitcoinrpc} ${RPCPASSWORD:-`dd if=/dev/urandom bs=33 count=1 2>/dev/null | base64`}



