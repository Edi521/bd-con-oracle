--FUNCIONES: ES UN CONJUNTO DE SENTENCIAS, RETORNA UN VALOR Y OPCIONAL EL ACEPTAR PARAMETROS. ESTAN DISEÑADAS PARA REALIZAR UNA TAREA EN ESPECIFICO

/*
CREATE OR REPLACE FUNCTION (NOMBRE) PARAMETROS
RETURN TIPO_DATO
BEGIN
    _INSTRUCCIONES
END (NOMBRE);
/

*/

--CREAR UNA FUNCION PARA SABER SI UN NUMERO ES PAR O IMPAR
CREATE OR REPLACE FUNCTION FN_NUMERO_PAR(P_NUMERO IN NUMBER)
RETURN NVARCHAR2
IS
LV_RESULTADO NVARCHAR2(100);
BEGIN
    --INSTRUCCIONES
    --MOD ---------------------------> RETORNA EL RESIDUO DE UNA DIVISION
    IF MOD(P_NUMERO,2) = 0 THEN
        LV_RESULTADO := 'EL NUMERO '||P_NUMERO||' ES PAR';
    ELSE
        LV_RESULTADO :=  'EL NUMERO '||P_NUMERO||' ES IMPAR';
    END IF;
    
    RETURN LV_RESULTADO;
END FN_NUMERO_PAR;
/


--EJECUTAR CON UN BLOQUE ANONNIMO
BEGIN
    DBMS_OUTPUT.PUT_LINE(FN_NUMERO_PAR(119));
END;
/

--EJECUTAR CON LA TAREA AUXILIAR DUAL
SELECT FN_NUMERO_PAR(10) AS PAR FROM DUAL;




