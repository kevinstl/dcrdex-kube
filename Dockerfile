FROM arilot/docker-bitcoind


#RUN mkdir -p /bitcoin/.bitcoin/shared

#WORKDIR /bitcoin/.bitcoind/shared

RUN apt-get update

RUN apt-get install -y python3-pip wget expect vim sudo git

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


#dcrdex

#ADD docker/install-dcr-expect.sh .
#RUN chmod u+x ./install-dcr.sh

#RUN wget https://github.com/decred/decred-release/releases/download/v1.5.1/dcrinstall-linux-amd64-v1.5.1 && \
#    chmod u+x ./dcrinstall-linux-amd64-v1.5.1 && \
#./dcrinstall-linux-amd64-v1.5.1 \n\
#expect "Enter the private passphrase for your new wallet:" { send "dexpass" }

#RUN wait 50000

#ENTRYPOINT ["start-bitcoind.sh"]
#ADD docker/wait.sh /usr/local/bin/
#ADD docker/install-dcr-expect.sh /usr/local/bin/

RUN mkdir -p /installs/decred
RUN mkdir -p /decred

ADD docker/wait.sh /installs/decred/
ADD docker/install-dcr-expect.sh /installs/decred/
ADD docker/dcrdex-template.conf /installs/decred/
ADD docker/install-dcr.sh /installs/decred/
ADD docker/start-wallet-expect.sh /installs/decred/
ADD docker/start-dcr.sh /installs/decred/
ADD docker/start-all.sh /installs/decred/

RUN mkdir -p /installs/go
ADD docker/install-go.sh /installs/go/
ENV PATH="/usr/local/go/bin:${PATH}"

RUN mkdir -p /installs/postgresql
ADD docker/install-postgresql.sh /installs/postgresql/
ADD docker/init-postgresql-createuser.sh /installs/postgresql/
#ADD docker/init-postgresql-createdb.sh /installs/postgresql/

ADD docker/markets.json /root/.dcrdex/

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
