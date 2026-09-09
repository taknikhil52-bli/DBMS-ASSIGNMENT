-- P2.2 Indian Income Tax Calculator 2024-25
-- Roll No: 12
-- PDF says Seed=5 and Seed=20 examples; no formula for gross salary from roll number is specified.
-- Therefore a sample gross salary is used.

SET SERVEROUTPUT ON;

DECLARE
    v_gross_salary NUMBER := 1000000;
    v_standard_deduction CONSTANT NUMBER := 75000;
    v_taxable_income NUMBER;
    v_tax NUMBER := 0;
    v_monthly_tds NUMBER;
BEGIN
    v_taxable_income := GREATEST(v_gross_salary - v_standard_deduction, 0);

    v_tax := CASE
        WHEN v_taxable_income <= 300000 THEN 0
        WHEN v_taxable_income <= 700000 THEN (v_taxable_income - 300000) * 0.05
        WHEN v_taxable_income <= 1000000 THEN 400000 * 0.05 + (v_taxable_income - 700000) * 0.10
        WHEN v_taxable_income <= 1200000 THEN 400000 * 0.05 + 300000 * 0.10 + (v_taxable_income - 1000000) * 0.15
        WHEN v_taxable_income <= 1500000 THEN 400000 * 0.05 + 300000 * 0.10 + 200000 * 0.15 + (v_taxable_income - 1200000) * 0.20
        ELSE 400000 * 0.05 + 300000 * 0.10 + 200000 * 0.15 + 300000 * 0.20 + (v_taxable_income - 1500000) * 0.30
    END;

    v_monthly_tds := v_tax / 12;

    DBMS_OUTPUT.PUT_LINE('========== INCOME TAX ==========');
    DBMS_OUTPUT.PUT_LINE('Roll No          : 12');
    DBMS_OUTPUT.PUT_LINE('Gross Salary     : Rs.' || v_gross_salary);
    DBMS_OUTPUT.PUT_LINE('Taxable Income   : Rs.' || v_taxable_income);
    DBMS_OUTPUT.PUT_LINE('Total Tax        : Rs.' || ROUND(v_tax));
    DBMS_OUTPUT.PUT_LINE('Monthly TDS      : Rs.' || ROUND(v_monthly_tds));
    DBMS_OUTPUT.PUT_LINE('Take-home Monthly: Rs.' || ROUND((v_gross_salary - v_tax) / 12));

    IF v_tax = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No tax this year - save more with PPF/ELSS!');
    END IF;
END;
/