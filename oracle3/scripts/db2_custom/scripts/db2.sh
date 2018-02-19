#!/bin/sh

OLD_UMASK=`umask`
umask 0027
mkdir -p /u01/app/oracle/admin/db2/adump
mkdir -p /u01/app/oracle/admin/db2/dpdump
mkdir -p /u01/app/oracle/admin/db2/pfile
mkdir -p /u01/app/oracle/cfgtoollogs/dbca/db2
mkdir -p /u01/app/oracle/flash_recovery_area
mkdir -p /u01/app/oracle/flash_recovery_area/db2
mkdir -p /u01/app/oracle/oradata/db2
mkdir -p /u01/app/oracle/product/11.2.0/dbhome/dbs
umask ${OLD_UMASK}
ORACLE_SID=db2; export ORACLE_SID
PATH=$ORACLE_HOME/bin:$PATH; export PATH
echo You should Add this entry in the /etc/oratab: db2:/u01/app/oracle/product/11.2.0/dbhome:Y
/u01/app/oracle/product/11.2.0/dbhome/bin/sqlplus /nolog @/home/oracle/db2/scripts/db2.sql
