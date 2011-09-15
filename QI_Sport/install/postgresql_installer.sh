#!/bin/csh

echo "WARNING : If you just finished a postgresl install u need to set a password for postgres user"

#sudo -s -u postgres
#psql -d postgres -c "ALTER USER postgres WITH PASSWORD 'password'"
#sudo /etc/init.d/postgresql-8.4 restart

set server=127.0.0.1
set port=5432
set username=postgres

echo "Create user and database"
psql --quiet -h $server -U $username -p $port < sql/postgresql_create_user_and_db.sql

#set database=qisport_db
set username=qisport

echo "Create tables :"
psql -W -h $server -U $username -d qisport_db -p $port -e -E < sql/postgresql_qisport_db.sql > install.log


echo "Install successful!"
