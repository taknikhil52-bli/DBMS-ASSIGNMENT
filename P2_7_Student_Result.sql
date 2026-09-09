-- P2.7 Student Result + Attendance System
-- Roll No: 12

SET SERVEROUTPUT ON;

DECLARE
    v_attendance NUMBER := 51;
    v_theory NUMBER := 31;
    v_practical NUMBER := 13;
    v_assignment NUMBER := 8;
    v_counted_assignment NUMBER;
    v_total NUMBER := 0;
    v_percentage NUMBER := 0;
    v_grade VARCHAR2(10);
    v_result VARCHAR2(30);
    v_remark VARCHAR2(100);
BEGIN
    v_counted_assignment := LEAST(v_assignment,10);

    DBMS_OUTPUT.PUT_LINE('========== LJICA SEMESTER RESULT ==========');
    DBMS_OUTPUT.PUT_LINE('Roll No          : 12');
    DBMS_OUTPUT.PUT_LINE('Attendance       : ' || v_attendance || '%');
    DBMS_OUTPUT.PUT_LINE('Theory Marks     : ' || v_theory || '/70');
    DBMS_OUTPUT.PUT_LINE('Practical Marks  : ' || v_practical || '/30');
    DBMS_OUTPUT.PUT_LINE('Assignment Marks : ' || v_counted_assignment || '/10');

    IF v_attendance < 40 THEN
        v_result := 'DETAINED';
        v_remark := 'Insufficient attendance';
    ELSIF v_theory < 28 THEN
        v_result := 'FAIL IN THEORY';
        v_remark := 'Theory marks below passing requirement';
    ELSIF v_practical < 12 THEN
        v_result := 'FAIL IN PRACTICAL';
        v_remark := 'Practical marks below passing requirement';
    ELSE
        v_total := v_theory+v_practical+v_counted_assignment;
        v_percentage := (v_total/110)*100;
        v_grade := CASE
            WHEN v_percentage >= 90 THEN 'A+'
            WHEN v_percentage >= 80 THEN 'A'
            WHEN v_percentage >= 70 THEN 'B'
            WHEN v_percentage >= 60 THEN 'C'
            WHEN v_percentage >= 50 THEN 'D'
            ELSE 'FAIL'
        END;

        IF v_percentage >= 75 THEN
            v_result := 'DISTINCTION';
            v_remark := 'Excellent performance';
        ELSE
            v_result := 'PASS';
            v_remark := 'Successfully passed';
        END IF;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Total            : ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage       : ' || ROUND(v_percentage,2) || '%');
    DBMS_OUTPUT.PUT_LINE('Grade            : ' || NVL(v_grade,'N/A'));
    DBMS_OUTPUT.PUT_LINE('Result           : ' || v_result);
    DBMS_OUTPUT.PUT_LINE('Remark           : ' || v_remark);
END;
/