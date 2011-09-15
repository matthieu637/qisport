@echo off

REM ############################################
REM ## You can change here your own DB params ##
REM ############################################
SET psqlBinPath=C:\Program Files (x86)\PostgreSQL\8.4\bin
SET /P psqlBinPath="PostGreSQL BinPath [%psqlBinPath%]: "


REM CONNECTION
SET server=127.0.0.1
SET database=postgres
SET port=5432
SET username=postgres

SET /P server="Server [%server%]: "
SET /P database="Database [%database%]: "
SET /P port="Port [%port%]: "
SET /P username="Username [%username%]: "


set psqlPath="%psqlBinPath%\psql"

echo Create user and database
%psqlPath% -W --quiet -h %server% -U %username% -d %database% -p %port% < sql/postgresql_create_user_and_db.sql

set database=qisport_db
set username=qisport

echo Create tables :
%psqlPath% -h %server% -U %username% -d %database% -p %port% -e -E < sql/postgresql_qisport_db.sql > install.log


echo.
echo.
echo Install successful!
echo.
pause

