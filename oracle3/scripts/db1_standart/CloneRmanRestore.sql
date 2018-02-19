SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /home/oracle//CloneRmanRestore.log append
startup nomount pfile="/home/oracle/init.ora";
@/home/oracle//rmanRestoreDatafiles.sql;
spool off
