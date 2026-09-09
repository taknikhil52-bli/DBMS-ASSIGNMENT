SET SERVEROUTPUT ON;
DECLARE 
  v_p NUMBER:=170000; 
  v_rate NUMBER:=9; 
  v_yrs NUMBER:=5; 
  v_r NUMBER; 
  v_n NUMBER; 
  v_emi NUMBER; 
  v_total NUMBER; 
  v_interest NUMBER;
BEGIN 
  v_r:=v_rate/12/100; 
  v_n:=v_yrs*12; 
  v_emi:=ROUND(v_p*v_r*POWER(1+v_r,v_n)/(POWER(1+v_r,v_n)-1),2); 
  v_total:=v_emi*v_n; 
  v_interest:=v_total-v_p; 
  DBMS_OUTPUT.PUT_LINE('Principal: Rs.'||TO_CHAR(v_p,'999,999.99')); 
  DBMS_OUTPUT.PUT_LINE('EMI: Rs.'||TO_CHAR(v_emi,'999,999.99')); 
  DBMS_OUTPUT.PUT_LINE('Total Payment: Rs.'||TO_CHAR(v_total,'999,999.99')); 
  DBMS_OUTPUT.PUT_LINE('Total Interest: Rs.'||TO_CHAR(v_interest,'999,999.99')); 
  DBMS_OUTPUT.PUT_LINE('Interest %: '||ROUND(v_interest/v_total*100,2)||'%'); 
END;
/