CREATE TABLE employees (
    employee_id   NUMBER PRIMARY KEY,
    employee_name VARCHAR2(50),
    department_id NUMBER,
    salary        NUMBER(10,2)
);


INSERT INTO employees VALUES (101, 'Rohit', 70, 30000);
INSERT INTO employees VALUES (102, 'Kirtan', 70, 40000);
INSERT INTO employees VALUES (103, 'Sahil', 70, 35000);
INSERT INTO employees VALUES (104, 'Harsh', 70, 45000);
INSERT INTO employees VALUES (105, 'Kaushal', 60, 50000);
INSERT INTO employees VALUES (106, 'Hardik', 80, 55000);
INSERT INTO employees VALUES (107, 'Prem', 60, 42000);

COMMIT;

SET SERVEROUTPUT ON;
DECLARE 
  v_dept NUMBER:=70; 
  v_cnt NUMBER; 
  v_avg NUMBER; 
  v_max NUMBER;
BEGIN 
  SELECT COUNT(*),ROUND(AVG(salary),2),MAX(salary) 
  INTO v_cnt,v_avg,v_max 
  FROM employees 
  WHERE department_id=v_dept; 
  DBMS_OUTPUT.PUT_LINE('Department: '||v_dept); 
  DBMS_OUTPUT.PUT_LINE('Count: '||v_cnt); 
  DBMS_OUTPUT.PUT_LINE('Average: '||NVL(v_avg,0)); 
  DBMS_OUTPUT.PUT_LINE('Maximum: '||NVL(v_max,0));
END;
/