CREATE TABLE employees (
    employee_id   NUMBER PRIMARY KEY,
    first_name    VARCHAR2(50),
    last_name     VARCHAR2(50),
    job_id        VARCHAR2(20),
    department_id NUMBER,
    salary        NUMBER(8, 2),
    hire_date     DATE
);

INSERT INTO employees VALUES (101, 'Rohit', 'Sharma', 'IT_PROG', 10, 4000, TO_DATE('15-01-2015', 'DD-MM-YYYY'));
INSERT INTO employees VALUES (102, 'Kirtan', 'Patel', 'HR_REP', 20, 5000, TO_DATE('10-06-2018', 'DD-MM-YYYY'));
INSERT INTO employees VALUES (103, 'Preet', 'Shah', 'FIN_MGR', 30, 6000, TO_DATE('01-03-2010', 'DD-MM-YYYY'));
INSERT INTO employees VALUES (104, 'Nisarg', 'Joshi', 'SA_MAN', 40, 4500, TO_DATE('12-05-2012', 'DD-MM-YYYY'));
INSERT INTO employees VALUES (105, 'Sahil', 'Mehta', 'DEV_ENG', 50, 5500, TO_DATE('20-08-2021', 'DD-MM-YYYY'));

COMMIT;

SET SERVEROUTPUT ON;
DECLARE 
  v_id NUMBER:=104; 
  v_emp employees%ROWTYPE; 
  v_yrs NUMBER;
BEGIN 
  SELECT * 
  INTO v_emp 
  FROM employees 
  WHERE employee_id=v_id; 
  v_yrs:=TRUNC(MONTHS_BETWEEN(SYSDATE,v_emp.hire_date)/12); 
  DBMS_OUTPUT.PUT_LINE('Name: '||v_emp.first_name||' '||v_emp.last_name); 
  DBMS_OUTPUT.PUT_LINE('Job ID: '||v_emp.job_id); 
  DBMS_OUTPUT.PUT_LINE('Department: '||v_emp.department_id); 
  DBMS_OUTPUT.PUT_LINE('Salary: '||TO_CHAR(v_emp.salary,'99,999')); 
  DBMS_OUTPUT.PUT_LINE('Hire Date: '||TO_CHAR(v_emp.hire_date,'DD-MM-YYYY')); 
  DBMS_OUTPUT.PUT_LINE('Experience: '||v_yrs||' years'); 
  IF v_yrs>10 
  THEN 
    DBMS_OUTPUT.PUT_LINE('Senior Employee'); 
  END IF; 
  EXCEPTION 
  WHEN NO_DATA_FOUND 
  THEN 
    DBMS_OUTPUT.PUT_LINE('Employee not found.'); 
  END;
/