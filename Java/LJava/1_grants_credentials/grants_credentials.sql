--Grants

--SCHEDULER Jobs
GRANT MANAGE SCHEDULER TO SEMA1;
GRANT SELECT ON DBA_SCHEDULER_JOBS TO SEMA1;
GRANT SCHEDULER_ADMIN TO SEMA1;

GRANT CREATE EXTERNAL JOB TO SEMA1;
GRANT CREATE ANY JOB TO SEMA1;

--Java
GRANT EXECUTE ANY PROGRAM TO SEMA1;
GRANT EXECUTE ANY PROCEDURE TO SEMA1;
execute dbms_java.grant_permission( 'SEMA1', 'SYS:java.io.FilePermission', 'C:\LJava\*', 'read,write,execute');

--Directory
CREATE ANY LIBRARY TO SEMA1;
DROP ANY LIBRARY TO SEMA1;
GRANT EXECUTE ANY LIBRARY TO SEMA1;

grant all privileges to SEMA1;


--Credentials
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
/

--execute dbms_scheduler.drop_credential('SDBA_CRED');
--SELECT * FROM all_scheduler_credentials;