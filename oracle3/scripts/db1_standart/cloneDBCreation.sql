SET VERIFY OFF
connect "SYS"/"&&sysPassword" as SYSDBA
set echo on
spool /home/oracle//cloneDBCreation.log append
Create controlfile reuse set database "db1"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
Datafile 
'/u01/app/oracle/oradata/db1/system01.dbf',
'/u01/app/oracle/oradata/db1/sysaux01.dbf',
'/u01/app/oracle/oradata/db1/undotbs01.dbf',
'/u01/app/oracle/oradata/db1/users01.dbf'
LOGFILE GROUP 1 ('/u01/app/oracle/oradata/db1/redo01.log') SIZE 51200K,
GROUP 2 ('/u01/app/oracle/oradata/db1/redo02.log') SIZE 51200K,
GROUP 3 ('/u01/app/oracle/oradata/db1/redo03.log') SIZE 51200K RESETLOGS;
exec dbms_backup_restore.zerodbid(0);
shutdown immediate;
startup nomount pfile="/home/oracle//initdb1Temp.ora";
Create controlfile reuse set database "db1"
MAXINSTANCES 8
MAXLOGHISTORY 1
MAXLOGFILES 16
MAXLOGMEMBERS 3
MAXDATAFILES 100
Datafile 
'/u01/app/oracle/oradata/db1/system01.dbf',
'/u01/app/oracle/oradata/db1/sysaux01.dbf',
'/u01/app/oracle/oradata/db1/undotbs01.dbf',
'/u01/app/oracle/oradata/db1/users01.dbf'
LOGFILE GROUP 1 ('/u01/app/oracle/oradata/db1/redo01.log') SIZE 51200K,
GROUP 2 ('/u01/app/oracle/oradata/db1/redo02.log') SIZE 51200K,
GROUP 3 ('/u01/app/oracle/oradata/db1/redo03.log') SIZE 51200K RESETLOGS;
alter system enable restricted session;
alter database "db1" open resetlogs;
exec dbms_service.delete_service('seeddata');
exec dbms_service.delete_service('seeddataXDB');
alter database rename global_name to "db1";
ALTER TABLESPACE TEMP ADD TEMPFILE '/u01/app/oracle/oradata/db1/temp01.dbf' SIZE 20480K REUSE AUTOEXTEND ON NEXT 640K MAXSIZE UNLIMITED;
select tablespace_name from dba_tablespaces where tablespace_name='USERS';
select sid, program, serial#, username from v$session;
alter database character set INTERNAL_CONVERT AL32UTF8;
alter database national character set INTERNAL_CONVERT AL16UTF16;
alter user sys account unlock identified by "&&sysPassword";
alter user system account unlock identified by "&&systemPassword";
alter system disable restricted session;
