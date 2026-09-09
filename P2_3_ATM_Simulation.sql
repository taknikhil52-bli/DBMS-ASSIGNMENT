-- P2.3 ATM Machine Simulation
-- Roll No: 12
-- Initial balance = roll_no * 500 + 5000 = Rs.11000

SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 12;
    v_balance NUMBER := v_roll_no * 500 + 5000;
    v_choice NUMBER;
    v_amount NUMBER;
    v_txns NUMBER := 0;
    v_total_withdrawn NUMBER := 0;
    v_iteration NUMBER := 0;
BEGIN
    LOOP
        v_iteration := v_iteration + 1;

        IF v_iteration = 1 THEN v_choice := 1; v_amount := 500;
        ELSIF v_iteration = 2 THEN v_choice := 1; v_amount := 1000;
        ELSIF v_iteration = 3 THEN v_choice := 1; v_amount := 500;
        ELSE v_choice := 3;
        END IF;

        DBMS_OUTPUT.PUT_LINE('--- Transaction ' || v_iteration || ' ---');

        IF v_choice = 1 THEN
            IF v_amount <= 0 THEN
                DBMS_OUTPUT.PUT_LINE('ERROR: Withdrawal must be greater than 0.');
            ELSIF MOD(v_amount,100) <> 0 THEN
                DBMS_OUTPUT.PUT_LINE('ERROR: Amount must be a multiple of 100.');
            ELSIF v_amount > 10000 THEN
                DBMS_OUTPUT.PUT_LINE('ERROR: Maximum withdrawal is Rs.10000 per transaction.');
            ELSIF v_amount > v_balance THEN
                DBMS_OUTPUT.PUT_LINE('ERROR: Insufficient balance.');
            ELSE
                v_balance := v_balance - v_amount;
                v_txns := v_txns + 1;
                v_total_withdrawn := v_total_withdrawn + v_amount;
                DBMS_OUTPUT.PUT_LINE('Withdrawal: Rs.' || v_amount);
                DBMS_OUTPUT.PUT_LINE('Balance   : Rs.' || v_balance);
            END IF;
        ELSIF v_choice = 3 THEN
            DBMS_OUTPUT.PUT_LINE('Exiting ATM...');
        ELSE
            DBMS_OUTPUT.PUT_LINE('ERROR: Invalid choice.');
        END IF;

        EXIT WHEN v_choice = 3 OR v_balance = 0;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('========== ATM SUMMARY ==========');
    DBMS_OUTPUT.PUT_LINE('Roll No           : 12');
    DBMS_OUTPUT.PUT_LINE('Transactions Done : ' || v_txns);
    DBMS_OUTPUT.PUT_LINE('Total Withdrawn   : Rs.' || v_total_withdrawn);
    DBMS_OUTPUT.PUT_LINE('Closing Balance   : Rs.' || v_balance);
END;
/