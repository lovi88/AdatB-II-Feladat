select * from all_objects where object_type='JAVA CLASS' and owner='SCOTT';


CREATE or replace FUNCTION fjnum RETURN NUMBER
AS LANGUAGE JAVA NAME 'otest/OTest.tRetInt () return int';


BEGIN
 DBMS_OUTPUT.PUT_LINE('szia: '||fjnum());
 
END;
show error;

connect scott / tiger

connect sema1/sema1



CREATE OR REPLACE FUNCTION fDelete (
  file IN VARCHAR2)
  RETURN NUMBER
AS LANGUAGE JAVA
NAME 'JDelete.delete (java.lang.String)return int';

CREATE OR REPLACE PROCEDURE fDelete2 (
file IN VARCHAR2)
AS LANGUAGE JAVA
NAME 'JDelete.main(java.lang.String[])';


BEGIN
 DBMS_OUTPUT.PUT_LINE (fdelete('alma.txt'));
 
END;


