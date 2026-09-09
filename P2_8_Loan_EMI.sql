-- P2.8 Loan EMI Affordability Checker
-- Roll No: 12
-- Sample inputs; the PDF does not specify a roll-based seed formula for this practical.

SET SERVEROUTPUT ON;

DECLARE
    v_monthly_salary NUMBER := 50000;
    v_existing_emi NUMBER := 5000;
    v_loan_amount NUMBER := 1500000;
    v_annual_rate NUMBER := 10;
    v_tenure_months NUMBER := 180;
    v_foir_limit NUMBER;
    v_monthly_rate NUMBER;
    v_emi NUMBER;
    v_approved_amount NUMBER;
    v_decision VARCHAR2(20);
    v_test_loan NUMBER;
    v_test_emi NUMBER;
    v_iterations NUMBER := 0;
BEGIN
    v_foir_limit := v_monthly_salary*0.40;
    v_monthly_rate := v_annual_rate/12/100;

    v_emi := v_loan_amount*v_monthly_rate*POWER(1+v_monthly_rate,v_tenure_months) /
             (POWER(1+v_monthly_rate,v_tenure_months)-1);

    v_approved_amount := v_loan_amount;

    IF v_monthly_salary < 25000 OR v_loan_amount > 60*v_monthly_salary THEN
        v_decision := 'REJECTED';
        v_approved_amount := 0;
    ELSIF v_existing_emi+v_emi <= v_foir_limit THEN
        v_decision := 'APPROVED';
    ELSE
        v_test_loan := LEAST(v_loan_amount,60*v_monthly_salary);

        WHILE v_test_loan > 0 LOOP
            v_test_emi := v_test_loan*v_monthly_rate*POWER(1+v_monthly_rate,v_tenure_months) /
                          (POWER(1+v_monthly_rate,v_tenure_months)-1);

            EXIT WHEN v_existing_emi+v_test_emi <= v_foir_limit;
            v_test_loan := v_test_loan-10000;
            v_iterations := v_iterations+1;
        END LOOP;

        IF v_test_loan > 0 THEN
            v_approved_amount := v_test_loan;
            v_decision := 'CONDITIONAL';
        ELSE
            v_approved_amount := 0;
            v_decision := 'REJECTED';
        END IF;
    END IF;

    DBMS_OUTPUT.PUT_LINE('========== LOAN EMI REPORT ==========');
    DBMS_OUTPUT.PUT_LINE('Roll No         : 12');
    DBMS_OUTPUT.PUT_LINE('Monthly Salary  : Rs.' || v_monthly_salary);
    DBMS_OUTPUT.PUT_LINE('Existing EMI    : Rs.' || v_existing_emi);
    DBMS_OUTPUT.PUT_LINE('Loan Amount     : Rs.' || v_loan_amount);
    DBMS_OUTPUT.PUT_LINE('Annual Rate     : ' || v_annual_rate || '%');
    DBMS_OUTPUT.PUT_LINE('Tenure          : ' || v_tenure_months || ' months');
    DBMS_OUTPUT.PUT_LINE('FOIR Limit      : Rs.' || ROUND(v_foir_limit));
    DBMS_OUTPUT.PUT_LINE('Calculated EMI  : Rs.' || ROUND(v_emi));
    DBMS_OUTPUT.PUT_LINE('Approved Amount : Rs.' || ROUND(v_approved_amount));
    DBMS_OUTPUT.PUT_LINE('Decision        : ' || v_decision);
    DBMS_OUTPUT.PUT_LINE('WHILE Iterations: ' || v_iterations);
END;
/