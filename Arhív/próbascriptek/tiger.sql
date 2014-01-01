exec dbms_java.grant_permission( 'SCOTT', 'SYS:java.io.FilePermission', 'alma.txt', 'delete' );

call dbms_java.grant_permission('SCOTT', 'SYS:java.io.FilePermission','<<ALL FILES>>', 'read, write, execute, delete');


grant javasyspriv to system;
DECLARE
  ret varchar2(50);
BEGIN
dbms_output.enable;

dbms_java.set_output(2000);

ret := dbms_java.RUNJAVA('-cp C:\LJava ControlByBatch');

END;

select * from USER_JAVA_POLICY 