SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /home/oracle/db2/scripts/ordinst.log append
@/u01/app/oracle/product/11.2.0/dbhome/ord/admin/ordinst.sql SYSAUX SYSAUX;
spool off
