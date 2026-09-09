-- P2.6 Zomato Delivery Price Engine
-- Roll No: 12
-- Sample inputs; change them if your teacher assigned specific values.

SET SERVEROUTPUT ON;

DECLARE
    v_food_total NUMBER := 350;
    v_distance NUMBER := 5;
    v_rain CHAR(1) := 'Y';
    v_late_night CHAR(1) := 'N';
    v_festival CHAR(1) := 'N';
    v_peak_hour CHAR(1) := 'N';
    v_first_order CHAR(1) := 'N';
    v_base NUMBER;
    v_rain_charge NUMBER := 0;
    v_night_charge NUMBER := 0;
    v_festival_charge NUMBER := 0;
    v_peak_charge NUMBER := 0;
    v_delivery NUMBER;
BEGIN
    IF v_food_total > 499 THEN
        v_base := 0;
        v_delivery := 0;
    ELSE
        v_base := CASE
            WHEN v_distance < 3 THEN 0
            WHEN v_distance <= 8 THEN 29
            WHEN v_distance <= 15 THEN 49
            ELSE 79
        END;

        IF v_rain='Y' THEN v_rain_charge := ROUND(v_base*0.20); END IF;
        IF v_late_night='Y' THEN v_night_charge := ROUND(v_base*0.15); END IF;
        IF v_festival='Y' THEN v_festival_charge := ROUND(v_base*0.10); END IF;
        IF v_peak_hour='Y' THEN v_peak_charge := ROUND(v_base*0.10); END IF;

        v_delivery := v_base+v_rain_charge+v_night_charge+v_festival_charge+v_peak_charge;

        IF v_first_order='Y' THEN v_delivery := ROUND(v_delivery*0.50); END IF;
    END IF;

    DBMS_OUTPUT.PUT_LINE('========== DELIVERY RECEIPT ==========');
    DBMS_OUTPUT.PUT_LINE('Roll No          : 12');
    DBMS_OUTPUT.PUT_LINE('Food Total       : Rs.' || ROUND(v_food_total));
    DBMS_OUTPUT.PUT_LINE('Distance         : ' || v_distance || ' km');
    DBMS_OUTPUT.PUT_LINE('Base Charge      : Rs.' || ROUND(v_base));
    DBMS_OUTPUT.PUT_LINE('Rain Surcharge   : Rs.' || v_rain_charge);
    DBMS_OUTPUT.PUT_LINE('Night Surcharge  : Rs.' || v_night_charge);
    DBMS_OUTPUT.PUT_LINE('Festival Charge  : Rs.' || v_festival_charge);
    DBMS_OUTPUT.PUT_LINE('Peak Hour Charge : Rs.' || v_peak_charge);
    DBMS_OUTPUT.PUT_LINE('Final Delivery   : Rs.' || ROUND(v_delivery));
    DBMS_OUTPUT.PUT_LINE('Grand Total      : Rs.' || ROUND(v_food_total+v_delivery));
END;
/