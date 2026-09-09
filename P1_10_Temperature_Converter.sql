SET SERVEROUTPUT ON;
DECLARE 
  v_c NUMBER:=37; 
  v_f NUMBER; 
  v_k NUMBER; 
  v_f2 NUMBER:=98.6; 
  v_c2 NUMBER;
BEGIN 
  v_f:=ROUND(v_c*9/5+32,1); 
  v_k:=v_c+273.15; v_c2:=(v_f2-32)*5/9; 
  DBMS_OUTPUT.PUT_LINE('Celsius: '||v_c); 
  DBMS_OUTPUT.PUT_LINE('Fahrenheit: '||v_f); 
  DBMS_OUTPUT.PUT_LINE('Kelvin: '||v_k); 
  DBMS_OUTPUT.PUT_LINE('98.6F -> Celsius: '||v_c2);
END;
/