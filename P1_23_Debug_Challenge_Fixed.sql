CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50)
);

INSERT INTO employees VALUES (100, 'Jaysiddh');

COMMIT;

SET SERVEROUTPUT ON;
DECLARE
    v_name VARCHAR2(50) := 'Jaysiddh Bhojak';
    c_bonus_rate CONSTANT NUMBER := 0.1;
    v_sal NUMBER := 32000;
    v_bonus NUMBER;
    v_fname VARCHAR2(50);

BEGIN
    v_bonus := v_sal * c_bonus_rate;

    BEGIN
        SELECT first_name
        INTO v_fname
        FROM employees
        WHERE employee_id = 100;

        DBMS_OUTPUT.PUT_LINE('Employee: ' || v_fname);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Employee 100 not found.');
    END;

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Salary: Rs.' || v_sal);
    DBMS_OUTPUT.PUT_LINE('Bonus: Rs.' || v_bonus);

END;
/