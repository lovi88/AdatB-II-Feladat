
DECLARE
  ret varchar2(50);
BEGIN
dbms_output.enable;

dbms_java.set_output(2000);
--dbms_java.grant_permission( 'SCOTT', 'SYS:java.io.FilePermission', '<<ALL FILES>>', 'execute' );
ret := dbms_java.RUNJAVA('-cp C:\LJava ControlByBatch');

END;



set serveroutput on
declare
l_output dbms_output.chararr;
l_lines number;
ret varchar2(50);
begin
  dbms_output.enable(1000000);
  dbms_java.set_output(1000000);
  
  ret := dbms_java.RUNJAVA('-cp C:\LJava JDelete korte.txt');

l_lines:=3;
  dbms_output.get_lines(l_output, l_lines);
  
  for i in 1 .. l_lines loop
    dbms_output.put_line( i || '. sor: ' ||l_output(i));
  end loop;
  
end;


BEGIN 

DBMS_SCHEDULER.CREATE_PROGRAM (
  program_name => 'mybatch',
  program_type => 'EXECUTABLE',
  program_action => 'C:\LJava myb.bat',
  enabled => TRUE,
  comments => 'meghiv egy java filet'
);

END;

BEGIN
  DBMS_SCHEDULER.DROP_PROGRAM('mybatch');
END;

call dbms_output.put_line('ret = ');

select * from USER_OBJECTS




select * from USER_JAVA_POLICY 

DECLARE
  ret varchar2(50);
BEGIN
dbms_output.enable;

dbms_java.set_output(2000);

ret := dbms_java.RUNJAVA('-cp C:\LJava ControlByBatch');

END;





