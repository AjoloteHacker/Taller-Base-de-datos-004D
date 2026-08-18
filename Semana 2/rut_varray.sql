DECLARE
    TYPE rut_usuario IS VARRAY(3) OF VARCHAR(12);
    v_lista_rut rut_usuario := rut_usuario('21.730.162-9', '26.245.789-6', '10.741.394-5');
BEGIN
    DBMS_OUTPUT.PUT_LINE('El rut es: ' || v_lista_rut(1));
    DBMS_OUTPUT.PUT_LINE('El rut es: ' || v_lista_rut(2));
    DBMS_OUTPUT.PUT_LINE('El rut es: ' || v_lista_rut(3));
    null;
END;
/
DECLARE
    TYPE rut_usuario IS VARRAY(3) OF VARCHAR(12);
    v_rut rut_usuario := rut_usuario();
BEGIN
    v_rut.EXTEND;
    v_rut(1) := '11.111.111-1';

    v_rut.EXTEND;
    v_rut(2) := '22.222.222-2';

    v_rut.EXTEND;
    v_rut(3) := '33.333.333-3';

    DBMS_OUTPUT.PUT_LINE('El rut es: ' || v_rut(1));
    DBMS_OUTPUT.PUT_LINE('El rut es: ' || v_rut(2));
    DBMS_OUTPUT.PUT_LINE('El rut es: ' || v_rut(3));
END;
/