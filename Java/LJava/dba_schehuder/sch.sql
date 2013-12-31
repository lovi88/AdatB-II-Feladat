DECLARE
  jnum number(1) := 0;
  jobname varchar2(15) := 'CTRLJOB_DBA';
BEGIN
  
  SELECT count(*)
  INTO jnum
  FROM DBA_SCHEDULER_JOBS
  WHERE JOB_NAME = jobname;
  
  if jnum>0 then
    DBMS_SCHEDULER.drop_job(jobname);
  end if;
  
  DBMS_SCHEDULER.create_job (job_name        => jobname,
                             job_type        => 'EXECUTABLE',
                             job_action      => 'c:\windows\system32\cmd.exe /c C:\LJava\control.bat',
                             enabled         => FALSE,
                             comments        => 'runs controll.bat'
                             );
  
  DBMS_SCHEDULER.run_job (jobname, TRUE);
END;
/


SELECT * FROM all_scheduler_job_run_details where job_name='CTRLJOB_DBA';

execute DBMS_SCHEDULER.drop_job('CTRLJOB_DBA');