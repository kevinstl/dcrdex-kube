FROM lukechilds/bitcoind

RUN apt-get update

RUN apt-get install -y python3-pip wget expect vim sudo git net-tools lsof nodejs npm curl

RUN apt-get update

RUN apt-get install -y tmux procps

RUN ls -al /tmp

COPY bitcoin/rpcauth.py /tmp/
COPY bitcoin/setup-rpc.sh /tmp/

RUN mkdir -p /installs/bitcoin
COPY bitcoin/install-all.sh /installs/bitcoin/
COPY bitcoin/start-all.sh /installs/bitcoin/

RUN ls -al /tmp

RUN mkdir -p /data/.bitcoin/
ADD bitcoin/bitcoin.conf /data/.bitcoin/

ADD clone-dcrdex.sh /installs/decred/
ADD bitcoin/init-btc-assets.sh /installs/decred/

ADD bitcoin/harness-btc-init.sh /installs/decred/
ADD bitcoin/harness-btc-start.sh /installs/decred/

ADD wait.sh /installs/decred/

RUN /installs/bitcoin/install-all.sh

ENTRYPOINT ["/installs/bitcoin/start-all.sh"]
