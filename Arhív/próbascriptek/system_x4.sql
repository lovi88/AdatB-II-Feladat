BMS_SCHEDULER.set_job_argument_value(jobname,2,'C:\LJava\control.bat');
NUMBER_OF_ARGUMENTS => 2
DBMS_SCHEDULER.set_attribute(jobname, 'credential_name', credname);


BEGIN
DBMS_SCHEDULER.create_job (job_name        => 'CTRLJOB3',
                           job_type        => 'EXECUTABLE',
                           job_action      => 'c:\windows\system32\cmd.exe /c C:\LJava\control.bat',
                           enabled         => FALSE,
                           comments        => 'runs controll.bat'
                           );
END;
/

BEGIN
  DBMS_SCHEDULER.run_job ('CTRLJOB3', FALSE);
END;
/

GRANT ALTER ON CTRLJOB3 TO SEMA1

GRANT DBA TO SEMA1


SELECT * FROM all_scheduler_job_run_details where job_name='CTRLJOB3';