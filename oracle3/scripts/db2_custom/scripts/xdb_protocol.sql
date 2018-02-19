SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /home/oracle/db2/scripts/xdb_protocol.log append
@/u01/app/oracle/product/11.2.0/dbhome/rdbms/admin/catqm.sql change_on_install SYSAUX TEMP;
connect "SYS"/"&&sysPassword" as SYSDBA
@/u01/app/oracle/product/11.2.0/dbhome/rdbms/admin/catxdbj.sql;
@/u01/app/oracle/product/11.2.0/dbhome/rdbms/admin/catrul.sql;
spool off
