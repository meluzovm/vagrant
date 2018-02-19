SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo off
spool /home/oracle/db2/scripts/emRepository.log append
@/u01/app/oracle/product/11.2.0/dbhome/sysman/admin/emdrep/sql/emreposcre /u01/app/oracle/product/11.2.0/dbhome SYSMAN SYSMAN TEMP ON;
WHENEVER SQLERROR CONTINUE;
spool off
