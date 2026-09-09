SET SERVEROUTPUT ON;

<<outer>>
DECLARE
    v_city VARCHAR2(30) := 'Gujarat';
    v_num  NUMBER := 100;

BEGIN
    
    DBMS_OUTPUT.PUT_LINE('Outer Block:');
    DBMS_OUTPUT.PUT_LINE('City = ' || v_city);
    DBMS_OUTPUT.PUT_LINE('Number = ' || v_num);

    <<middle>>
    DECLARE
        v_city VARCHAR2(30) := 'Ahmedabad';
        v_num  NUMBER := 200;

    BEGIN
      
        DBMS_OUTPUT.PUT_LINE('Middle Block:');
        DBMS_OUTPUT.PUT_LINE('City = ' || v_city);
        DBMS_OUTPUT.PUT_LINE('Number = ' || v_num);

        
        DBMS_OUTPUT.PUT_LINE('Outer City = ' || outer.v_city);

        <<inner>>
        DECLARE
            v_num NUMBER := 300;

        BEGIN
            
            DBMS_OUTPUT.PUT_LINE('Inner Block:');
            DBMS_OUTPUT.PUT_LINE('City = ' || v_city);
            DBMS_OUTPUT.PUT_LINE('Number = ' || v_num);

            
            DBMS_OUTPUT.PUT_LINE('Outer City = ' || outer.v_city);

        END inner;


        DBMS_OUTPUT.PUT_LINE('After Inner - Middle Number = ' || v_num);

    END middle;

    
    DBMS_OUTPUT.PUT_LINE('After Middle Block:');
    DBMS_OUTPUT.PUT_LINE('City = ' || v_city);
    DBMS_OUTPUT.PUT_LINE('Number = ' || v_num);

END outer;
/