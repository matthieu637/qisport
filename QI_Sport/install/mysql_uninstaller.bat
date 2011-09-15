@echo off

REM ############################################
REM ## You can change here your own DB params ##
REM ############################################


SET mysqlBinPath=C:\Programs\wamp\bin\mysql\mysql5.1.36\bin
SET /P mysqlBinPath="Mysql BinPath [%mysqlBinPath%]: "


REM CONNECTION
SET server=localhost
SET username=root
SET password=

SET /P server="Server [%server%]: "
SET /P username="Username [%username%]: "
SET /P username="Password [%password%]: "

set mysqlPath="%mysqlBinPath%\mysql"

echo Create user and database
%mysqlPath% -h %server% --password=%password% -u %username% < sql/mysql_uninstall.sql

echo.
echo.
echo "Uninstall successful"
echo.
pause

