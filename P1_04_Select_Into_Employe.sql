CREATE TABLE employees(
  emp_id NUMBER PRIMARY KEY,
  v_fname VARCHAR2(30),
  v_salary NUMBER,
  deptno NUMBER
);

INSERT INTO employees VALUES (101,'Rohit',4000,10);
INSERT INTO employees VALUES (102,'Kirtan',5000,20);
INSERT INTO employees VALUES (103,'Preet',6000,30);
INSERT INTO employees VALUES (104,'Nisarg',4500,40);
INSERT INTO employees VALUES (105,'Sahil',5500,50);
INSERT INTO employees VALUES (106,'Hardik',7000,10);
INSERT INTO employees VALUES (107,'Harsh',6500,20);

COMMIT;

SET SERVEROUTPUT ON;
DECLARE 
  v_id NUMBER := 102; 
  v_fname employees.v_fname%TYPE; 
  v_sal employees.v_salary%TYPE; 
BEGIN 
  SELECT v_fname, v_salary       
  INTO v_fname, v_sal 
  FROM employees 
  WHERE emp_id = v_id; 

  DBMS_OUTPUT.PUT_LINE('Employee: ' || v_fname || ' earns Rs. ' || v_sal || ' per month.'); 
EXCEPTION 
  WHEN NO_DATA_FOUND THEN 
    DBMS_OUTPUT.PUT_LINE('Employee not found - check the ID.'); 
END;
/