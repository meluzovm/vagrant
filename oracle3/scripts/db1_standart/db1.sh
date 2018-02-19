#!/bin/sh

OLD_UMASK=`umask`
umask 0027
mkdir -p /u01/app/oracle/admin/db1/adump
mkdir -p /u01/app/oracle/admin/db1/dpdump
mkdir -p /u01/app/oracle/admin/db1/pfile
mkdir -p /u01/app/oracle/cfgtoollogs/dbca/db1
mkdir -p /u01/app/oracle/oradata/db1
mkdir -p /u01/app/oracle/product/11.2.0/dbhome/dbs
mkdir -p /u02/flashrecovery
mkdir -p /u02/flashrecovery/db1
umask ${OLD_UMASK}
ORACLE_SID=db1; export ORACLE_SID
PATH=$ORACLE_HOME/bin:$PATH; export PATH
echo You should Add this entry in the /etc/oratab: db1:/u01/app/oracle/product/11.2.0/dbhome:Y
/u01/app/oracle/product/11.2.0/dbhome/bin/sqlplus /nolog @/home/oracle//db1.sql
