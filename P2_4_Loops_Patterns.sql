-- P2.4 Loops and Patterns
-- Roll No: 12
-- Table = MOD(12,9)+2 = 5
-- Height = 5+MOD(12,5) = 7

SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 12;
    v_table NUMBER := MOD(v_roll_no,9)+2;
    v_height NUMBER := 5+MOD(v_roll_no,5);
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== PART A: TABLE OF ' || v_table || ' =====');
    FOR i IN 1..20 LOOP
        DBMS_OUTPUT.PUT_LINE(v_table || ' x ' || i || ' = ' || v_table*i);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('===== PART B: TABLES 2 TO 5 =====');
    FOR n IN 2..5 LOOP
        FOR i IN 1..10 LOOP
            DBMS_OUTPUT.PUT_LINE(LPAD(n || ' x ' || i || ' = ' || n*i,18));
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('------------------');
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('===== PART C: STAR TRIANGLE =====');
    FOR i IN 1..v_height LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD('*',i,'*'));
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('===== PART D: NUMBER PYRAMID =====');
    FOR i IN 1..6 LOOP
        DECLARE
            line_text VARCHAR2(100) := '';
        BEGIN
            FOR j IN 1..i LOOP
                line_text := line_text || j;
            END LOOP;
            DBMS_OUTPUT.PUT_LINE(line_text);
        END;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('===== PART E: REVERSE TRIANGLE =====');
    FOR i IN REVERSE 1..v_height LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD('*',i,'*'));
    END LOOP;
END;
/