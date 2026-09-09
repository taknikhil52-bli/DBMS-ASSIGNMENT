SET SERVEROUTPUT ON;
DECLARE 
  v_name VARCHAR2(100):='Bhojak jaysidhh V.'; 
  v_dob DATE:=DATE'2008-06-05'; 
  v_roll NUMBER:=12; 
  v_pnr VARCHAR2(30); 
  v_jdate DATE; 
  v_fare NUMBER; 
  v_age NUMBER; 
  v_final NUMBER;
BEGIN 
  v_pnr:='GJ'||TO_CHAR(SYSDATE,'YYMM')||LPAD(v_roll,4,'0'); 
  v_jdate := DATE '2007-12-15';
  v_fare:=v_roll*50+200; 
  v_age:=TRUNC(MONTHS_BETWEEN(SYSDATE,v_dob)/12); 
  v_final:=CASE WHEN v_age>=60 
  THEN v_fare*.60 
ELSE v_fare END; 
 DBMS_OUTPUT.PUT_LINE('PNR: '||v_pnr); 
 DBMS_OUTPUT.PUT_LINE('Passenger: '||v_name); 
 DBMS_OUTPUT.PUT_LINE('Journey: '||TO_CHAR(v_jdate,'Day, DD-MON-YYYY')); 
 DBMS_OUTPUT.PUT_LINE('Age: '||v_age); 
 DBMS_OUTPUT.PUT_LINE('Base Fare: Rs.'||v_fare); 
 DBMS_OUTPUT.PUT_LINE('Final Fare: Rs.'||ROUND(v_final,2)); 
 IF v_age>=60 
 THEN 
  DBMS_OUTPUT.PUT_LINE('Senior citizen concession: 40%'); 
END IF; 
END;
/