-- P2.5 Fibonacci, Primes and GCD - WHILE Loop
-- Roll No: 12
-- N = 5 + MOD(12,8) = 9

SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 12;
    v_n NUMBER := 5 + MOD(v_roll_no,8);
    a NUMBER := 0;
    b NUMBER := 1;
    c NUMBER;
    i NUMBER := 1;
    nth_fib NUMBER := 0;
    p NUMBER;
    divisor NUMBER;
    is_prime BOOLEAN;
    prime_count NUMBER := 0;
    x NUMBER := 48;
    y NUMBER := 18;
    r NUMBER;
    perfect_num NUMBER := 28;
    divisor_sum NUMBER := 0;
    d NUMBER := 1;
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== PART A: FIRST ' || v_n || ' FIBONACCI NUMBERS =====');
    WHILE i <= v_n LOOP
        DBMS_OUTPUT.PUT_LINE('F' || i || ' = ' || a);
        nth_fib := a;
        c := a+b; a := b; b := c; i := i+1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('===== PART B: Nth FIBONACCI PRIME CHECK =====');
    IF nth_fib < 2 THEN
        is_prime := FALSE;
    ELSE
        is_prime := TRUE;
        divisor := 2;
        WHILE divisor*divisor <= nth_fib LOOP
            IF MOD(nth_fib,divisor)=0 THEN is_prime := FALSE; EXIT; END IF;
            divisor := divisor+1;
        END LOOP;
    END IF;

    IF is_prime THEN DBMS_OUTPUT.PUT_LINE(nth_fib || ' is PRIME');
    ELSE DBMS_OUTPUT.PUT_LINE(nth_fib || ' is NOT PRIME'); END IF;

    DBMS_OUTPUT.PUT_LINE('===== PART C: PRIMES 1 TO 100 =====');
    p := 2;
    WHILE p <= 100 LOOP
        is_prime := TRUE;
        divisor := 2;
        WHILE divisor*divisor <= p LOOP
            IF MOD(p,divisor)=0 THEN is_prime := FALSE; EXIT; END IF;
            divisor := divisor+1;
        END LOOP;
        IF is_prime THEN
            DBMS_OUTPUT.PUT_LINE(p);
            prime_count := prime_count+1;
        END IF;
        p := p+1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Prime Count = ' || prime_count);

    DBMS_OUTPUT.PUT_LINE('===== PART D: GCD =====');
    WHILE y <> 0 LOOP
        r := MOD(x,y); x := y; y := r;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('GCD = ' || x);

    DBMS_OUTPUT.PUT_LINE('===== PART E: PERFECT NUMBER =====');
    WHILE d <= perfect_num/2 LOOP
        IF MOD(perfect_num,d)=0 THEN divisor_sum := divisor_sum+d; END IF;
        d := d+1;
    END LOOP;
    IF divisor_sum=perfect_num THEN
        DBMS_OUTPUT.PUT_LINE(perfect_num || ' is a PERFECT NUMBER');
    ELSE
        DBMS_OUTPUT.PUT_LINE(perfect_num || ' is NOT a PERFECT NUMBER');
    END IF;
END;
/