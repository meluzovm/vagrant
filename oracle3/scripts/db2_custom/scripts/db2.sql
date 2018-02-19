set verify off
ACCEPT sysPassword CHAR PROMPT 'Enter new password for SYS: ' HIDE
ACCEPT systemPassword CHAR PROMPT 'Enter new password for SYSTEM: ' HIDE
host /u01/app/oracle/product/11.2.0/dbhome/bin/orapwd file=/u01/app/oracle/product/11.2.0/dbhome/dbs/orapwdb2 force=y
@/home/oracle/db2/scripts/CreateDB.sql
@/home/oracle/db2/scripts/CreateDBFiles.sql
@/home/oracle/db2/scripts/CreateDBCatalog.sql
@/home/oracle/db2/scripts/JServer.sql
@/home/oracle/db2/scripts/context.sql
@/home/oracle/db2/scripts/xdb_protocol.sql
@/home/oracle/db2/scripts/ordinst.sql
@/home/oracle/db2/scripts/interMedia.sql
@/home/oracle/db2/scripts/emRepository.sql
@/home/oracle/db2/scripts/apex.sql
@/home/oracle/db2/scripts/lockAccount.sql
@/home/oracle/db2/scripts/postDBCreation.sql
