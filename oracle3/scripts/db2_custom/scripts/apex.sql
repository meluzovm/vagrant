SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /home/oracle/db2/scripts/apex.log append
@/u01/app/oracle/product/11.2.0/dbhome/apex/catapx.sql change_on_install SYSAUX SYSAUX TEMP /i/ NONE;
spool off
