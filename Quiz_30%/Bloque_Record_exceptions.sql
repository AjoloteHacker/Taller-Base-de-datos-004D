SET SERVEROUTPUT ON;

DECLARE
    TYPE r_recinto_info IS RECORD (
        nombre          RECINTO.NOMBRE%TYPE,
        direccion       RECINTO.DIRECCION%TYPE,
        ciudad          RECINTO.CIUDAD%TYPE,
        capacidad_total RECINTO.CAPACIDAD_TOTAL%TYPE
    );

    v_recinto r_recinto_info;

    p_recinto_id RECINTO.ID%TYPE := 1;

BEGIN
    SELECT nombre,
           direccion,
           ciudad,
           capacidad_total
    INTO   v_recinto.nombre,
           v_recinto.direccion,
           v_recinto.ciudad,
           v_recinto.capacidad_total
    FROM recinto
    WHERE id = p_recinto_id;

    DBMS_OUTPUT.PUT_LINE('INFORMACION DEL RECINTO');
    DBMS_OUTPUT.PUT_LINE('ID: ' || p_recinto_id);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_recinto.nombre);
    DBMS_OUTPUT.PUT_LINE('Dirección: ' || v_recinto.direccion);
    DBMS_OUTPUT.PUT_LINE('Ciudad: ' || v_recinto.ciudad);
    DBMS_OUTPUT.PUT_LINE('Capacidad total: ' || v_recinto.capacidad_total);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: no existe un recinto con ID ' || p_recinto_id);

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: la consulta devolvió más de un recinto.');
        DBMS_OUTPUT.PUT_LINE(
            'SQLCODE: ' || SQLCODE
        );
        DBMS_OUTPUT.PUT_LINE(
            'SQLERRM: ' || SQLERRM
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Se produjo un error inesperado.');
        DBMS_OUTPUT.PUT_LINE('SQLCODE: ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('SQLERRM: ' || SQLERRM);
END;
/
