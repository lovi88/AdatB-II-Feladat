CREATE OR replace directory LJAVA as 'c:\LJava';

DECLARE
  data_line   VARCHAR2(1000); -- Data line read from input file
  data_file   UTL_FILE.FILE_TYPE; -- Data file handle
  my_filename VARCHAR2(50);
BEGIN
  my_filename := 'OCLInfo.txt';
  data_file := UTL_FILE.FOPEN('LJAVA', my_filename, 'r'); 

  LOOP
    UTL_FILE.GET_LINE(data_file, data_line);
    
    DBMS_OUTPUT.PUT_LINE(data_line);
    
  END LOOP;
EXCEPTION
  WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('Finished');
    UTL_FILE.FCLOSE(data_file);
END;

SELECT * FROM all_scheduler_job_run_details where job_name='CTRLJOB_SYS';

DECLARE
  jnum number(1) := 0;
  jobname varchar2(15) := 'CTRLJOB_SYS';
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

GRANT MANAGE SCHEDULER TO SEMA1;
GRANT CREATE EXTERNAL JOB TO SEMA1;
GRANT CREATE ANY JOB TO SEMA1;
GRANT SELECT ON DBA_SCHEDULER_JOBS TO SEMA1;
GRANT EXECUTE ANY PROGRAM TO SEMA1;
GRANT EXECUTE ANY PROCEDURE TO SEMA1;
execute dbms_java.grant_permission( 'SEMA1', 'SYS:java.io.FilePermission', 'C:\LJava\*', 'read,write,execute');


SELECT * FROM
DBA_SCHEDULER_JOBS
WHERE JOB_NAME = 'CTRLJOB';

BEGIN
DBMS_SCHEDULER.drop_job('CTRLJOB_SYS');
END;
/

DECLARE
 us VARCHAR(20) := 'SYS as SYSDBA';
 pass VARCHAR(20) := 'OraclE-123';
 cred  VARCHAR(20) := 'SDBA_CRED';
BEGIN
 DBMS_SCHEDULER.create_credential(
    credential_name => cred,
    username        => us,
    password        => pass
    ,windows_domain  => 'localdomain'
    );
 
 execute immediate 'GRANT EXECUTE ON SDBA_CRED TO SEMA1';
END;

execute dbms_scheduler.drop_credential('SDBA_CRED');


GRANT MANAGE SCHEDULER TO SCOTT;
GRANT SELECT ON DBA_SCHEDULER_JOBS TO SCOTT;
GRANT CREATE EXTERNAL JOB TO SCOTT;

SELECT * FROM dba_sys_privs where privilege like '%LIB%';

GRANT EXECUTE ANY LIBRARY TO SEMA1;

SELECT grantor, grantee, table_schema, table_name, privilege
FROM all_tab_privs;

grant all privileges to SEMA1;

GRANT SCHEDULER_ADMIN TO SEMA1;

GRANT CREATE ANY JOB TO SEMA1;

SELECT * FROM DBA_SCHEDULER_EXTERNAL_DESTS;


execute DBMS_SCHEDULER.CREATE_CREDENTIAL('HR_CREDENTIAL', 'hr', 'hr');

GRANT EXECUTE ON HR_CREDENTIAL TO SEMA1;

SELECT * FROM all_scheduler_credentials;

GRANT DBA TO SEMA1;

CREATE OR replace directory LJAVA as 'c:\LJava';
DECLARE
  data_line   VARCHAR2(1000); -- Data line read from input file
  data_file   UTL_FILE.FILE_TYPE; -- Data file handle
  my_filename VARCHAR2(50) := 'OCLInfo.txt';
  veg_str VARCHAR2(10000) := '';
BEGIN
  data_file := UTL_FILE.FOPEN('LJAVA', my_filename, 'r'); 

  LOOP
    UTL_FILE.GET_LINE(data_file, data_line);
    
    veg_str := veg_str||' '||data_line;
    
  END LOOP;

EXCEPTION
  WHEN no_data_found THEN
    UTL_FILE.FCLOSE(data_file);
    htp.p(veg_str);
END;