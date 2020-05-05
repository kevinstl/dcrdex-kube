FROM lukechilds/bitcoind

RUN apt-get update

RUN apt-get install -y python3-pip wget expect vim sudo git net-tools lsof nodejs npm curl

RUN apt-get update

RUN apt-get install -y tmux procps

RUN ls -al /tmp

ADD docker/bitcoin-for-dcr.conf /data/.bitcoin/

#dcrdex
RUN mkdir -p /installs/go
ADD docker/install-go.sh /installs/go/
ENV PATH="/usr/local/go/bin:${PATH}"

RUN mkdir -p /installs/postgresql
ADD docker/install-postgresql.sh /installs/postgresql/
ADD docker/init-postgresql-createuser.sh /installs/postgresql/

RUN mkdir -p /installs/nodejs
ADD docker/install-nodejs.sh /installs/nodejs/
ENV PATH="/usr/local/go/bin:${PATH}"



RUN mkdir -p /installs/decred
RUN mkdir -p /decred

ADD docker/markets.json /root/.dcrdex/
ADD docker/dcrdex-template.conf /installs/decred/

ADD docker/create-wallet-expect.sh /installs/decred/
ADD docker/init-for-dcrdex.sh /installs/decred/
ADD docker/init-dcrdex-conf.sh /installs/decred/

ADD docker/clone-dcrdex.sh /installs/decred/
ADD docker/install-dcrdex.sh /installs/decred/
ADD docker/install-nodejs.sh /installs/decred/
ADD docker/install-dcrdex-web-server.sh /installs/decred/
ADD docker/install-dcrdex-client.sh /installs/decred/
ADD docker/install-dcr-expect.sh /installs/decred/
ADD docker/install-dcr.sh /installs/decred/

ADD docker/start-wallet-expect.sh /installs/decred/
ADD docker/start-dcr.sh /installs/decred/
ADD docker/start-all.sh /installs/decred/
ADD docker/start-dcrdex.sh /installs/decred/
ADD docker/start-dcrdex-expect.sh /installs/decred/
ADD docker/start-dex-client.sh /installs/decred/

ADD docker/init-btc-assets.sh /installs/decred/
ADD docker/init-dcr-assets.sh /installs/decred/

ADD docker/harness-btc-for-dcr-init.sh /installs/decred/
ADD docker/harness-dcr-init.sh /installs/decred/
ADD docker/harness-dcr-start.sh /installs/decred/

ADD docker/wait.sh /installs/decred/

ADD docker/install-all.sh /installs/decred/

RUN /installs/decred/install-all.sh

ENTRYPOINT ["/installs/decred/start-all.sh"]
