-- P1.3  Constants, NULL and NVL
-- Roll No - 06
-- Name - Jaysiddh Bhojak 

SET SERVEROUTPUT ON;
DECLARE 
  c_gst CONSTANT NUMBER := 18; 
  v_base_price  NUMBER := 12 * 500 + 1000; 
  v_cgst NUMBER; 
  v_sgst NUMBER; 
  v_total NUMBER;
  v_city VARCHAR2(50) := NULL; 
BEGIN 
  v_cgst := v_base_price * 9/100; 
  v_sgst := v_base_price * 9/100; 
  v_total := v_base_price + v_cgst + v_sgst; 

  DBMS_OUTPUT.PUT_LINE('Base Price:' || v_base_price); 
  DBMS_OUTPUT.PUT_LINE('CGST (9%):' || v_cgst); 
  DBMS_OUTPUT.PUT_LINE('SGST (9%):' || v_sgst); 
  DBMS_OUTPUT.PUT_LINE('Total :' || v_total); 
  DBMS_OUTPUT.PUT_LINE('NVL Result :' || NVL(v_city,'Ahmedabad'));  
  DBMS_OUTPUT.PUT_LINE('NVL2 Result :' || NVL2(v_city, 'City Known :' || v_city, 'City Unknown'));

END;
/