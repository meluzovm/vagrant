SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /home/oracle/db2/scripts/JServer.log append
@/u01/app/oracle/product/11.2.0/dbhome/javavm/install/initjvm.sql;
@/u01/app/oracle/product/11.2.0/dbhome/xdk/admin/initxml.sql;
@/u01/app/oracle/product/11.2.0/dbhome/xdk/admin/xmlja.sql;
@/u01/app/oracle/product/11.2.0/dbhome/rdbms/admin/catjava.sql;
@/u01/app/oracle/product/11.2.0/dbhome/rdbms/admin/catexf.sql;
spool off
