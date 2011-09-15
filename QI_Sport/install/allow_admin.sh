#!/bin/csh

if( $#argv != 1 ) then
	echo "ERROR : usage : $0 <exist_account> "
	exit(1)
endif

set server=127.0.0.1
set port=5432
set username=qisport

echo "UPDATE accounts SET accesslevel = 100 WHERE login = '$1';" | psql --quiet -h $server -U $username -d qisport_db


