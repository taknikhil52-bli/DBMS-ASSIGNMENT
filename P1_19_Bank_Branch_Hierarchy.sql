SET SERVEROUTPUT ON;
<<bank>> 
DECLARE 
  v_bank VARCHAR2(30):='LJ Bank'; 
  v_total_deposit NUMBER:=0;
BEGIN 
  <<branch>> 
DECLARE 
  v_branch VARCHAR2(30):='Ahemdabad'; 
  v_dep NUMBER:=12000;
BEGIN 
  bank.v_total_deposit:=bank.v_total_deposit+v_dep; 
  <<counter>> 
DECLARE 
  v_token NUMBER:=1; 
BEGIN 
  DBMS_OUTPUT.PUT_LINE(bank.v_bank||' | '||v_branch||' | Token '||v_token); 
  END counter;
END branch; 
DBMS_OUTPUT.PUT_LINE('Bank total deposit: Rs.'||bank.v_total_deposit); 
END bank;
/