SELECT EMAIL FROM CLIENTE WHERE RUT = '11.111.111-1';
SELECT EMAIL from CLIENTE;

--Demasiadas filas
DECLARE
    v_email CLIENTE.EMAIL%TYPE;
BEGIN
    SELECT EMAIL INTO v_email FROM CLIENTE WHERE RUT = '11.111.111-1';
    DBMS_OUTPUT.PUT_LINE('El email es: ' || v_email);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No existe datos para el cliente que intenta comsultar');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Este bloque esta preparado para guardar una sola fila. Si desea guardar mas de una por favor use un cursos');
END;
/

--Division por cero
DECLARE
    v_resultado NUMBER;
    v_des NUMBER := 0;
BEGIN

    v_resultado := 100/ 0;
    DBMS_OUTPUT.PUT_LINE('Error: no se puede dividir por cero');
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: no se puede dividir por cero');
END;
/


SELECT * FROM CLIENTE WHERE RUT = ' 19.456.789-1';
--Cuando un valor rompe criterio de unicidad
BEGIN
    INSERT INTO CLIENTE



DECLARE
    v_texto VARCHAR2(5);
BEGIN
    v_texto := 'Este Texto'
EXCEPTION
END;