SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /home/oracle/db2/scripts/CreateDBCatalog.log append
@/u01/app/oracle/product/11.2.0/dbhome/rdbms/admin/catalog.sql;
@/u01/app/oracle/product/11.2.0/dbhome/rdbms/admin/catblock.sql;
@/u01/app/oracle/product/11.2.0/dbhome/rdbms/admin/catproc.sql;
@/u01/app/oracle/product/11.2.0/dbhome/rdbms/admin/catoctk.sql;
@/u01/app/oracle/product/11.2.0/dbhome/rdbms/admin/owminst.plb;
connect "SYSTEM"/"&&systemPassword"
@/u01/app/oracle/product/11.2.0/dbhome/sqlplus/admin/pupbld.sql;
connect "SYSTEM"/"&&systemPassword"
set echo on
spool /home/oracle/db2/scripts/sqlPlusHelp.log append
@/u01/app/oracle/product/11.2.0/dbhome/sqlplus/admin/help/hlpbld.sql helpus.sql;
spool off
spool off
