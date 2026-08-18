--Forma de rellenar un VARRAY de forma NO PROCEDURAL
DECLARE
    TYPE numero_asiento IS VARRAY(6) OF VARCHAR2(3);
    
    v_asiento numero_asiento := numero_asiento('A01', 'A02', 'A03', 'A04', 'A05', 'A06');
BEGIN
    DBMS_OUTPUT.PUT_LINE('Se a asignado el asiento N°' || v_asiento(6));
    null;
END;
/