CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    job_id VARCHAR2(20),
    salary NUMBER(10,2)
);

INSERT INTO employees
VALUES (101, 'Rohit', 'Sharma', 'IT_PROG', 40000);

INSERT INTO employees
VALUES (102, 'Jaysiddh', 'Bhojak', 'SA_REP', 50000);

INSERT INTO employees
VALUES (103, 'Sahil', 'Koshti', 'HR_REP', 45000);

INSERT INTO employees
VALUES (104, 'Harsh', 'Shah', 'IT_PROG', 60000);

INSERT INTO employees
VALUES (105, 'Nisarg', 'Patel', 'FI_ACCOUNT', 55000);

COMMIT;

SET SERVEROUTPUT ON;
DECLARE 
  v_id NUMBER:=102; 
  v_emp employees%ROWTYPE; 
  v_da NUMBER; 
  v_hra NUMBER; 
  v_pf NUMBER; 
  v_net NUMBER;
BEGIN 
  SELECT * 
  INTO v_emp 
  FROM employees 
  WHERE employee_id=v_id; 
  v_da:=v_emp.salary*.40; 
  v_hra:=v_emp.salary*.20; 
  v_pf:=v_emp.salary*.12; 
  v_net:=v_emp.salary+v_da+v_hra-v_pf; 
  DBMS_OUTPUT.PUT_LINE('===== SALARY SLIP ====='); 
  DBMS_OUTPUT.PUT_LINE('Month: '||TO_CHAR(SYSDATE,'Month YYYY')); 
  DBMS_OUTPUT.PUT_LINE('Employee: '||v_emp.first_name||' '||v_emp.last_name); 
  DBMS_OUTPUT.PUT_LINE('ID/Job: '||v_emp.employee_id||' / '||v_emp.job_id); 
  DBMS_OUTPUT.PUT_LINE(RPAD('Basic',20)||LPAD(TO_CHAR(v_emp.salary,'99,99,999.99'),15)); 
  DBMS_OUTPUT.PUT_LINE(RPAD('DA 40%',20)||LPAD(TO_CHAR(v_da,'99,99,999.99'),15)); 
  DBMS_OUTPUT.PUT_LINE(RPAD('HRA 20%',20)||LPAD(TO_CHAR(v_hra,'99,99,999.99'),15)); 
  DBMS_OUTPUT.PUT_LINE(RPAD('PF 12%',20)||LPAD(TO_CHAR(v_pf,'99,99,999.99'),15)); 
  DBMS_OUTPUT.PUT_LINE(RPAD('NET PAY',20)||LPAD(TO_CHAR(v_net,'99,99,999.99'),15)); 
  EXCEPTION 
  WHEN NO_DATA_FOUND 
  THEN 
  DBMS_OUTPUT.PUT_LINE('Employee not found: '||v_id); 
END;
/