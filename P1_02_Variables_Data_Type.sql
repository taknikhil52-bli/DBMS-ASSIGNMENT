-- P1.2  Variables and Data Types
-- Roll No - 06
-- Name - Jaysiddh bhojak

SET SERVEROUTPUT ON;
DECLARE 
  v_name VARCHAR2(50) := 'JAYSIDDH BHOJAK'; 
  v_marks NUMBER(5,2) := 445; 
  v_percentage NUMBER(5,2); 
  v_dob DATE := TO_DATE('15-Dec-2007','DD-MON-YYYY'); 
  v_passed BOOLEAN;
BEGIN 
  v_percentage := ROUND((v_marks/500)*100,2); 
  v_passed := (v_percentage >= 40);

  DBMS_OUTPUT.PUT_LINE('Name :' || v_name); 
  DBMS_OUTPUT.PUT_LINE('Marks :' || v_marks); 
  DBMS_OUTPUT.PUT_LINE('Percentage :' || v_percentage || '%'); 
  DBMS_OUTPUT.PUT_LINE('Today''s Date:' || TO_CHAR(SYSDATE,'DD-MON-YYYY')); 

  IF v_passed THEN 
    DBMS_OUTPUT.PUT_LINE('Result : PASS'); 
ELSE 
    DBMS_OUTPUT.PUT_LINE('Result : FAIL'); 
END IF; 
END;
/