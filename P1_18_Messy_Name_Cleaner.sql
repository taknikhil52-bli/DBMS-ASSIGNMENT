SET SERVEROUTPUT ON;
DECLARE 
  v_raw VARCHAR2(100):=' Bhojak jaysiddh '; 
  v_clean VARCHAR2(100); 
  v_first VARCHAR2(50); 
  v_last VARCHAR2(50);
BEGIN 
  v_clean:=TRIM(v_raw); 
  v_clean:=REPLACE(v_clean,'  ',' '); 
  v_clean:=REPLACE(v_clean,'  ',' '); 
  v_clean:=INITCAP(v_clean); 
  v_first:=SUBSTR(v_clean,1,INSTR(v_clean,' ')-1); 
  v_last:=SUBSTR(v_clean,INSTR(v_clean,' ')+1); 
  DBMS_OUTPUT.PUT_LINE('Cleaned: '||v_clean); 
  DBMS_OUTPUT.PUT_LINE('First: '||v_first); 
  DBMS_OUTPUT.PUT_LINE('Last: '||v_last); 
  DBMS_OUTPUT.PUT_LINE('Email: '||LOWER(v_first||'.'||v_last||'@ljku.edu.in')); 
  DBMS_OUTPUT.PUT_LINE('Length after: '||LENGTH(v_clean)); 
END;
/