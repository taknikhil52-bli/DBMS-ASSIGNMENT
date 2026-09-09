SET SERVEROUTPUT ON;
DECLARE 
  v_qty NUMBER:=4; 
  v_price NUMBER:=1600; 
  v_coupon NUMBER:=NULL; 
  v_gross NUMBER; 
  v_disc NUMBER; 
  v_taxable NUMBER; 
  v_total NUMBER;
BEGIN 
  v_gross:=v_qty*v_price; 
  v_disc:=v_gross*NVL(v_coupon,0)/100; 
  v_taxable:=v_gross-v_disc; 
  v_total:=ROUND(v_taxable*1.18); 
  DBMS_OUTPUT.PUT_LINE('Gross: Rs.'||v_gross); 
  DBMS_OUTPUT.PUT_LINE('Discount: Rs.'||v_disc); 
  DBMS_OUTPUT.PUT_LINE('Taxable: Rs.'||v_taxable); 
  DBMS_OUTPUT.PUT_LINE(NVL2(v_coupon,'Coupon applied: '||v_coupon||'%','No coupon')); 
  DBMS_OUTPUT.PUT_LINE('Final Total: Rs.'||v_total);
END;
/