FROM lukechilds/bitcoind
#FROM arilot/docker-bitcoind


#RUN mkdir -p /data/.bitcoin/shared

#WORKDIR /data/.bitcoind/shared

RUN apt-get update

RUN apt-get install -y python3-pip wget expect vim sudo git net-tools lsof nodejs npm curl

RUN apt-get update

RUN apt-get install -y tmux procps

#RUN pwd
RUN ls -al /tmp

#ADD https://github.com/bitcoin/bitcoin/blob/master/share/rpcauth/rpcauth.py /tmp/

#RUN chmod 755 /tmp/rpcauth.py

COPY docker/rpcauth.py /tmp/
COPY docker/setup-rpc.sh /tmp/

RUN ls -al /tmp




#COPY docker-entrypoint.sh /usr/local/bin/
#ENTRYPOINT ["docker-entrypoint.sh"]
#
#CMD ["btc_oneshot"]


#WORKDIR /opt/
#

COPY docker/start-bitcoind.sh /usr/local/bin/
RUN mkdir -p /data/.bitcoin/
ADD docker/bitcoin.conf /data/.bitcoin/
ADD docker/bitcoin-for-dcr.conf /data/.bitcoin/


#dcrdex
RUN mkdir -p /installs/go
ADD docker/install-go.sh /installs/go/
ENV PATH="/usr/local/go/bin:${PATH}"

RUN mkdir -p /installs/postgresql
ADD docker/install-postgresql.sh /installs/postgresql/
ADD docker/init-postgresql-createuser.sh /installs/postgresql/
#ADD docker/init-postgresql-createdb.sh /installs/postgresql/

RUN mkdir -p /installs/nodejs
ADD docker/install-nodejs.sh /installs/nodejs/
ENV PATH="/usr/local/go/bin:${PATH}"



RUN mkdir -p /installs/decred
RUN mkdir -p /decred

ADD docker/markets.json /root/.dcrdex/
ADD docker/dcrdex-template.conf /installs/decred/

ADD docker/create-wallet-expect.sh /installs/decred/
ADD docker/init-for-dcrdex.sh /installs/decred/

ADD docker/install-dcrdex.sh /installs/decred/
ADD docker/install-nodejs.sh /installs/decred/
ADD docker/install-dcrdex-web-client.sh /installs/decred/
ADD docker/install-dcrdex-client.sh /installs/decred/
ADD docker/install-dcr-expect.sh /installs/decred/
ADD docker/install-dcr.sh /installs/decred/

ADD docker/start-wallet-expect.sh /installs/decred/
ADD docker/start-dcr.sh /installs/decred/
ADD docker/start-all.sh /installs/decred/
ADD docker/start-dcrdex.sh /installs/decred/
ADD docker/start-dex-client.sh /installs/decred/

ADD docker/init-btc-assets.sh /installs/decred/
ADD docker/init-dcr-assets.sh /installs/decred/

ADD docker/wait.sh /installs/decred/

#ENTRYPOINT ["wait.sh"]
#ENTRYPOINT ["./install-dcr-expect.sh"]
#ENTRYPOINT ["./install-dcr.sh"]
ENTRYPOINT ["/installs/decred/start-all.sh"]

#
#RUN chmod +x start-bitcoind.sh
#
#RUN pwd
#RUN ls -al
#
#EXPOSE 443
#ENV PATH "/opt/bitcoind/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
#
#CMD ["./start-bitcoind.sh"]
