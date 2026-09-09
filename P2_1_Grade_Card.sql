-- P2.1 Complete Grade Card System
-- Roll No: 12

SET SERVEROUTPUT ON;

DECLARE
    v_m1 NUMBER := 43;
    v_m2 NUMBER := 53;
    v_m3 NUMBER := 63;
    v_m4 NUMBER := 73;
    v_m5 NUMBER := 83;
    v_total NUMBER;
    v_percentage NUMBER;
    v_grade VARCHAR2(10);
    v_result VARCHAR2(30);
    v_class VARCHAR2(30);
BEGIN
    v_total := v_m1 + v_m2 + v_m3 + v_m4 + v_m5;
    v_percentage := v_total / 5;

    IF v_m1 < 35 OR v_m2 < 35 OR v_m3 < 35 OR v_m4 < 35 OR v_m5 < 35 THEN
        v_result := 'DETAINED';
        IF v_m1 < 35 THEN DBMS_OUTPUT.PUT_LINE('Failed Subject: Subject 1'); END IF;
        IF v_m2 < 35 THEN DBMS_OUTPUT.PUT_LINE('Failed Subject: Subject 2'); END IF;
        IF v_m3 < 35 THEN DBMS_OUTPUT.PUT_LINE('Failed Subject: Subject 3'); END IF;
        IF v_m4 < 35 THEN DBMS_OUTPUT.PUT_LINE('Failed Subject: Subject 4'); END IF;
        IF v_m5 < 35 THEN DBMS_OUTPUT.PUT_LINE('Failed Subject: Subject 5'); END IF;
    ELSE
        IF v_percentage >= 75 THEN v_class := 'DISTINCTION';
        ELSIF v_percentage >= 60 THEN v_class := 'FIRST CLASS';
        ELSIF v_percentage >= 50 THEN v_class := 'SECOND CLASS';
        ELSE v_class := 'PASS';
        END IF;
        v_result := 'PASS';
    END IF;

    IF v_percentage >= 90 THEN v_grade := 'A+';
    ELSIF v_percentage >= 80 THEN v_grade := 'A';
    ELSIF v_percentage >= 70 THEN v_grade := 'B';
    ELSIF v_percentage >= 60 THEN v_grade := 'C';
    ELSIF v_percentage >= 50 THEN v_grade := 'D';
    ELSE v_grade := 'FAIL';
    END IF;

    DBMS_OUTPUT.PUT_LINE('========== REPORT CARD ==========');
    DBMS_OUTPUT.PUT_LINE('Roll No   : 12');
    DBMS_OUTPUT.PUT_LINE('Subject 1 : ' || v_m1);
    DBMS_OUTPUT.PUT_LINE('Subject 2 : ' || v_m2);
    DBMS_OUTPUT.PUT_LINE('Subject 3 : ' || v_m3);
    DBMS_OUTPUT.PUT_LINE('Subject 4 : ' || v_m4);
    DBMS_OUTPUT.PUT_LINE('Subject 5 : ' || v_m5);
    DBMS_OUTPUT.PUT_LINE('Total     : ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_percentage || '%');
    DBMS_OUTPUT.PUT_LINE('Grade     : ' || v_grade);
    DBMS_OUTPUT.PUT_LINE('Result    : ' || v_result);
    IF v_result = 'PASS' THEN 
    DBMS_OUTPUT.PUT_LINE('Class     : ' || v_class); 
END IF;
END;
/