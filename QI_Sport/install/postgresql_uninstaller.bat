@echo off

REM ############################################
REM ## You can change here your own DB params ##
REM ############################################
REM PMYSQL BIN PATH
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

%psqlPath% -h %server% -U %username% -d %database% -p %port% < sql/postgresql_uninstall.sql

echo.
echo.
echo "Uninstall successful"
echo.
pause
