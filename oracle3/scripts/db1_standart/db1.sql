set verify off
ACCEPT sysPassword CHAR PROMPT 'Enter new password for SYS: ' HIDE
ACCEPT systemPassword CHAR PROMPT 'Enter new password for SYSTEM: ' HIDE
host /u01/app/oracle/product/11.2.0/dbhome/bin/orapwd file=/u01/app/oracle/product/11.2.0/dbhome/dbs/orapwdb1 force=y
@/home/oracle//CloneRmanRestore.sql
@/home/oracle//cloneDBCreation.sql
@/home/oracle//postScripts.sql
@/home/oracle//lockAccount.sql
@/home/oracle//postDBCreation.sql
