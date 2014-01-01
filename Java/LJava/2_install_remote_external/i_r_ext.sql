REM 2

DESC RESOURCE_VIEW;

REM ha nem lat informaciokat telepitse az XML DB-t oracle adatbazisaba


REM 3

BEGIN
  DBMS_XDB.SETHTTPPORT(61850);
END;
/

REM a 61850 szamu portot hasznalom, ha a gazdagepen ez nem lenne szabad at kell irni


REM 4

@?/rdbms/admin/prvtrsch.plb


REM 5

BEGIN
  DBMS_SCHEDULER.SET_AGENT_REGISTRATION_PASS('OraclE-123tavoli');
END;
/
