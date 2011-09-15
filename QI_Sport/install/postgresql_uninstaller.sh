#!/bin/csh
set server=127.0.0.1
set port=5432
set username=postgres

psql -h $server -U $username -p $port < sql/postgresql_uninstall.sql

echo "Uninstall successful"

