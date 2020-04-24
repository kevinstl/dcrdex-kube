#!/bin/bash

echo "install-postgresql.sh"

#echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' >> /etc/apt/sources.list.d/pgdg.list
echo 'deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main' >> /etc/apt/sources.list.d/pgdg.list

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
apt-get update

apt-get install -y postgresql-11

#psql -U username -d myDataBase -a -f init-db.sql
#psql -U postgres -d myDataBase -a -f init-db.sql
pg_ctlcluster 11 main start

#sudo -u postgres createuser -P dcrdex
#sudo -u postgres createdb -O dcrdex dcrdex_testnet

echo "init-postgresql-createuser.sh"
/installs/postgresql/init-postgresql-createuser.sh

#echo "init-postgresql-createdb.sh"
#/installs/postgresql/init-postgresql-createdb.sh

#sudo -u postgres createdb -O dcrdex dcrdex_testnet

sudo -u postgres createdb -O dcrdex dcrdex_simnet

#sudo -u postgres -H psql -d dcrdex_simnet -c 'update accounts set broken_rule = 0;'

