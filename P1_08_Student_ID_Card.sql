SET SERVEROUTPUT ON;
DECLARE 
  v_name VARCHAR2(100):='Bhojak jaysiddh v.'; 
  v_roll NUMBER:=12; 
  v_dob DATE:=DATE '2007-12-15'; 
  v_upper VARCHAR2(100); 
  v_first VARCHAR2(50); 
  v_id VARCHAR2(30) := '25004500210054';
  v_age NUMBER;
BEGIN 
  v_upper:=UPPER(TRIM(v_name)); 
  v_first:=SUBSTR(v_upper,1,INSTR(v_upper,' ')-1); 
  v_id:='LJICA'||TO_CHAR(v_dob,'YYYY')||LPAD(v_roll,3,'0'); 
  v_age:=TRUNC(MONTHS_BETWEEN(SYSDATE,v_dob)/12); 
  DBMS_OUTPUT.PUT_LINE('===== LJICA STUDENT ID ====='); 
  DBMS_OUTPUT.PUT_LINE('Name: '||v_upper); 
  DBMS_OUTPUT.PUT_LINE('First Name: '||v_first); 
  DBMS_OUTPUT.PUT_LINE('Student ID: '||v_id); 
  DBMS_OUTPUT.PUT_LINE('DOB: '||TO_CHAR(v_dob,'DD-MON-YYYY')); 
  DBMS_OUTPUT.PUT_LINE('Age: '||v_age); 
END;
/