REM install manual alapjan: http://docs.oracle.com/cd/B28359_01/server.111/b28310/schedadmin003.htm#ADMIN12050

REM 1
sqlplus SYS/OraclE-1 AS SYSDBA

REM 2

DESC RESOURCE_VIEW

echo ha nem lat informaciokat telepitse az XML DB-t oracle adatbazisaba


REM 3

BEGIN
  DBMS_XDB.SETHTTPPORT(61850);
END;

echo a 61850 szamu portot hasznalom, ha a gazdagepen ez nem lenne szabad at kell irni


REM 4 - nalam mukodott igy kerdojelesen, de a teljes eleres, ha nem menne: $ORACLE_HOME/rdbms/admin

@?/rdbms/admin/prvtrsch.plb


REM 5

BEGIN
  DBMS_SCHEDULER.SET_AGENT_REGISTRATION_PASS('OraclE-123tavoli');
END;

