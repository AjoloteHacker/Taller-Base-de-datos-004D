SELECT * FROM CLIENTE;

INSERT INTO CLIENTE(RUT, NOMBRE, APELLIDO, EMAIL) VALUES ('18.125.456-K','  m  aR tIn  ', '   p  APIc  ', 'M Pa piC @gmail. cOM');

COMMIT;

CREATE OR REPLACE TRIGGER tgr_validacion_datos_cliente
BEFORE INSERT OR UPDATE ON CLIENTE

FOR EACH ROW
BEGIN
    :NEW.NOMBRE := INITCAP(   TRIM(REPLACE(:NEW.nombre , ' ', '') ));
    :NEW.APELLIDO := INITCAP( TRIM(REPLACE(:NEW.apellido , ' ', ''))  );
    :NEW.EMAIL := LOWER( TRIM(REPLACE(:NEW.email , ' ', '')) );
END tgr_validacion_datos_cliente;
/
