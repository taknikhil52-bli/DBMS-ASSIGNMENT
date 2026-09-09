SET SERVEROUTPUT ON;
DECLARE 
v_p NUMBER:=12000; 
v_birth_month NUMBER:=1; 
v_r NUMBER; 
v_t NUMBER:=3; 
v_si NUMBER; 
v_ci NUMBER; 
v_diff NUMBER;
BEGIN 
  v_r:=v_birth_month*.5+4; 
  v_si:=v_p*v_r*v_t/100; 
  v_ci:=v_p*POWER(1+v_r/100,v_t)-v_p; 
  v_diff:=(v_ci-v_si)/v_si*100; 
  DBMS_OUTPUT.PUT_LINE('Principal: Rs.'||v_p); 
  DBMS_OUTPUT.PUT_LINE('Rate: '||v_r||'%'); 
  DBMS_OUTPUT.PUT_LINE('SI: Rs.'||ROUND(v_si)); 
  DBMS_OUTPUT.PUT_LINE('CI: Rs.'||ROUND(v_ci)); 
  DBMS_OUTPUT.PUT_LINE('Difference: '||ROUND(v_diff,2)||'%'); 
  IF v_diff>10 
  THEN 
    DBMS_OUTPUT.PUT_LINE('Tip: FD is better than savings account for this amount.'); 
  END IF; 
END;
/