CREATE TABLE departments (
    department_id   NUMBER PRIMARY KEY,
    department_name VARCHAR2(50),
    location_id     NUMBER
);

INSERT INTO departments VALUES (10, 'Administration', 1700);
INSERT INTO departments VALUES (20, 'Marketing', 1800);
INSERT INTO departments VALUES (30, 'Purchasing', 1700);
INSERT INTO departments VALUES (40, 'Human Resources', 2400);
INSERT INTO departments VALUES (50, 'Shipping', 1500);

COMMIT;

SET SERVEROUTPUT ON;
DECLARE 
  v_id NUMBER:=20; 
  v_dname departments.department_name%TYPE; 
  v_loc departments.location_id%TYPE;
BEGIN 
  SELECT department_name,location_id 
  INTO v_dname,v_loc 
  FROM departments 
  WHERE department_id=v_id; 
  DBMS_OUTPUT.PUT_LINE('Dept '||v_id||': '||v_dname||' at location '||v_loc); 
  EXCEPTION 
  WHEN NO_DATA_FOUND 
  THEN 
  DBMS_OUTPUT.PUT_LINE('Department not found.'); 
END;
/