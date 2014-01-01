SELECT * FROM
DBA_SCHEDULER_JOBS
WHERE JOB_NAME = 'CTRLJOB';


SELECT * FROM all_scheduler_job_run_details where job_name='CTRLJOB_S1'

SELECT * FROM dba_sys_privs

SELECT * FROM all_scheduler_credentials;
EXEC DBMS_SCHEDULER.drop_credential('TIM_HALL_CREDENTIAL');
  DBMS_SCHEDULER.create_credential(
    credential_name => 'TIM_HALL_WIN_CREDENTIAL',
    username        => 'tim_hall',
    password        => 'password',
    windows_domain  => 'localdomain')
 --"Log on as batch job" security policy

select * from all_scheduler_job_run_details where owner like 'SEMA1' order by log_id desc;

DECLARE
  jnum number(1) := 0;
  rnum number(1) := 0;
  jobname varchar2(15) := 'CTRLJOB_S1';
  credname varchar2(15) := 'SYS.SDBA_CRED';
BEGIN
  SELECT count(*)
  INTO rnum
  FROM ALL_SCHEDULER_RUNNING_JOBS
  WHERE job_name=credname AND upper(state) = upper('running');
  
  if rnum>0 then
    DBMS_SCHEDULER.stop_job(credname,true);
  end if;
  
  SELECT count(*)
  INTO jnum
  FROM DBA_SCHEDULER_JOBS
  WHERE JOB_NAME = jobname;
  
  if jnum>0 then
    DBMS_SCHEDULER.drop_job(jobname);
  end if;
  
  --,credential_name => 'SYS.SDBA_CRED'
  --'c:\windows\system32\cmd.exe /c C:\LJava\control.bat'
  DBMS_SCHEDULER.create_job (job_name        => jobname,
                            job_type        => 'EXECUTABLE',
                            job_action      => 'c:\windows\system32\cmd.exe /c C:\LJava\control.bat',
                            enabled         => FALSE,
                            comments        => 'runs controll.bat'
                            --,NUMBER_OF_ARGUMENTS => 2
                            );
  
  --DBMS_SCHEDULER.set_job_argument_value(jobname,1,'/c');
  --DBMS_SCHEDULER.set_job_argument_value(jobname,2,'C:\LJava\control.bat');

  DBMS_SCHEDULER.set_attribute(jobname, 'credential_name', credname);
  DBMS_SCHEDULER.set_attribute(jobname, 'destination', 'marge.localdomain:61850');

  DBMS_SCHEDULER.run_job (jobname, FALSE);
END;
/


select * from all_scheduler_job_run_details where job_name='CTRLJOB_S1';

show error;

execute DBMS_SCHEDULER.drop_job('CTRLJOB_S1');

show error;

select * from ALL_SCHEDULER_RUNNING_JOBS;

SELECT JOB_NAME, STATE FROM DBA_SCHEDULER_JOBS
WHERE JOB_NAME = 'CTRLJOB_S1';