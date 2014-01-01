begin

    dbms_output.put_line(sys_context('userenv','instance_name'));

end;





BEGIN
  dbms_scheduler.drop_job('CTRLJOB');
END;

--C:\LJava\control.bat
--c:\windows\system32\cmd.exe /c C:\LJava\control.bat
BEGIN
DBMS_SCHEDULER.create_job (job_name        => 'CTRLJOB',
                           job_type        => 'EXECUTABLE',
                           job_action      => 'c:\windows\system32\cmd.exe /c C:\LJava\control.bat',
                           enabled         => FALSE,
                           comments        => 'runs controll.bat'
                           );
END;

CREATE OR REPLACE PROCEDURE execute_control_bat_file
IS
 BEGIN
   DBMS_SCHEDULER.run_job ('CTRLJOB', TRUE);
END execute_control_bat_file;


BEGIN
  DBMS_SCHEDULER.run_job ('CTRLJOB', TRUE);
END;


select * from all_scheduler_job_run_details where job_name='CTRLJOB';


call dbms_java.grant_permission('SYSTEM', 'java.io.FilePermission', 'C:\LJava\', 'read,write,execute');
DECLARE
  ret varchar2(50);
BEGIN
dbms_output.enable;

dbms_java.set_output(2000);
ret := dbms_java.RUNJAVA('-cp C:\LJava ControlByBatch');

END;



DECLARE
  data_line   VARCHAR2(200); -- Data line read from input file
  data_file   UTL_FILE.FILE_TYPE; -- Data file handle
  my_dir      VARCHAR2(250); -- Directory containing the data file
  my_filename VARCHAR2(50);
BEGIN
  my_dir := 'C:\LJava';
  my_filename := 'OCLInfo.txt';
  data_file := UTL_FILE.FOPEN(my_dir, my_filename, 'r'); 

  LOOP
    UTL_FILE.GET_LINE(data_file, data_line);
    
     DBMS_OUTPUT.PUT_LINE(data_line);
    
  END LOOP;
EXCEPTION
  WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('Finished');
    UTL_FILE.FCLOSE(data_file);
END;


