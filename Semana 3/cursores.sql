--Cursor Simple a la tabla clientes
SELECT * FROM CLIENTE;

DECLARE
    CURSOR c_clientes IS SELECT * FROM CLIENTE;
BEGIN
    FOR cada_cliente IN c_clientes LOOP
        DBMS_OUTPUT.PUT_LINE('Nombre ' || cada_clliente.NOMBRE);
        DBMS_OUTPUT.PUT_LINE('RUT ' || cada_clliente.RUT);
    END LOOP;
    NULL;
END;
/

--Cursor con where

SELECT * FROM CLIENTE
where NOMBRE LIKE '%a%';

DECLARE
    CURSOR c_nombre_a IS SELECT * FROM CLIENTE
        where NOMBRE LIKE '%a%';

    v_contador NUMBER:= 1;
BEGIN

    FOR nombre_a IN c_nombre_a LOOP
        DBMS_OUTPUT.PUT_LINE('Nombre: '|| nombre_a.NOMBRE);
        DBMS_OUTPUT.PUT_LINE('RUT: '|| nombre_a.RUT);
        DBMS_OUTPUT.PUT_LINE('Vuelta Numero: '|| v_contador);
        v_contador:= v_contador + 1;
    END LOOP;
    null;
END;
/

--Cursor con JOIN
SELECT c.NOMBRE , rt.ESTADO AS ESTADO_DE_LA_RESERVA , tp.MONTO_BRUTO, tp.DESCUENTO, tp.MONTO_FINAL, tp.ESTADO AS ESTADO_DE_LA_TRANSACCION  FROM CLIENTE c 
INNER JOIN RESERVA_TEMPORAL rt ON c.CLIENTE_ID = rt.CLIENTE_ID
INNER JOIN TRANSACCION_PAGO tp ON tp.RESERVA_ID = rt.CLIENTE_ID
WHERE c.CLIENTE_ID = 1;

DECLARE
    CURSOR c_transacciones_aprobadas IS
    SELECT c.NOMBRE , C.RUT, rt.ESTADO AS ESTADO_DE_LA_RESERVA , tp.MONTO_BRUTO, tp.DESCUENTO, tp.MONTO_FINAL, tp.ESTADO AS ESTADO_DE_LA_TRANSACCION FROM
BEGIN
    FOR por_cada_transaccion IN c_ransacciones_aprobadas LOOP
        DBMS_OUTPUT.PUT_LINE('*********');
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
END;
/
INSERT INTO CLIENTE(RUT, NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_REGISTRO) VALUES('11.111.111-1', 'Fernandito', 'Vargas', 'fvargas@gmail.com', '+5622488888', SYSTIMESTAMP);
INSERT INTO CLIENTE(RUT, NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_REGISTRO) VALUES('22.222.222-2', 'Luciana', 'Vargas', 'lvargas@gmail.com', '+56685740687' SYSTIMESTAMP);
INSERT INTO CLIENTE(RUT, NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_REGISTRO) VALUES('33.333.333-6', 'Ricardito', 'Vargas', 'rvargas@gmail.com', '+5644445555' SYSTIMESTAMP);
COMMIT;
SELECT * FROM CLIENTE

DECLARE
    CURSOR c_clientes_por_apellido(p_apellido VARCHAR2) IS
            SELECT cliente_id, nombre, apellido, email 
            FROM CLIENTE
            WHERE APELLIDO = p_apellido;

BEGIN
    FOR un_cliente IN c_clientes_por_apellido('Vargas')
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            un_cliente.nombre
        );
    END LOOP;
END;
/