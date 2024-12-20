--TRIGGER --------------> SE UTILIZAN PARA MANTENER LA INTEGRIDAD DE LOS DATOS E IMPLEMENTAR LA REGLAS DE NEGOCIO, AUDITAR CAMBIOS.
 ------- COMO FUNCIONA -------------> SE LANZA DE MANERA AUTOMATICA CUANDO OCURRE UN EVENTO ESPECIAL
 --- TIPOS DE TRIGGER ------> 2 EL DE FILA Y POR INSTRUCION
 
 
 /*
 SINTAXIS:
    CREATE OR REPLACE TRIGGER NOMBRE_DEL_TRIGGER 
    TIEMPO_DE_EJECUCION EVENTO ON                        INSERT,UPDATE O DELETE
    NOBRE_DE_LA_ENTIDAD
    TIPO DE TRIGGER
    DECLARE
    BEGIN
    ---INSTRCCIONES
    END;
    /
 */


--COMANDO DDLL LA ENTIDAD COMPUTADORA
CREATE TABLE COMPUTADORA(
 ID_COMPU NUMBER,
 MARCA NVARCHAR2(100),
 MODELO NVARCHAR2(100),
 RAM NUMBER,
 PROCESADOR NVARCHAR2(100),
 PRECIO NUMBER,
 CONSTRAINT COMPUTADORA_PK PRIMARY KEY(ID_COMPU)
);
SELECT * FROM COMPUTADORA;

--CREAR UNA TABLA PARA REGISTRAR LO QUE OCURRE EN MI ENTIDAD COMPUTADORA
DROP TABLE BUT_COMPUTADORA;
CREATE TABLE BUT_COMPUTADORA(
    ID_BIT NUMBER,
    --VALORES NUEVOS
    ID_COMPU NUMBER,
    MARCA NVARCHAR2(100),
    MODELO NVARCHAR2(100),
    RAM NUMBER,
    PROCESADOR NVARCHAR2(100),
    PRECIO NUMBER,
    
    --VALORES ANTIGUOS
    MARCA_OLD NVARCHAR2(100),
    MODELO_OLD NVARCHAR2(100),
    RAM_OLD NUMBER,
    PROCESADOR_OLD NVARCHAR2(100),
    PRECIO_OLD NUMBER,
    
    --CAMPOS DE CONTROL
    USUARIO NVARCHAR2(100),
    FECHA_MOV DATE,
    MOVIMIENTO NVARCHAR2(100),
    CONSTRAINT BIT_COMPU_PK PRIMARY KEY(ID_BIT)
);
SELECT * FROM BUT_COMPUTADORA;

--CREAR EL TRIGGER CON DDL
CREATE OR REPLACE TRIGGER TR_I_COMPUTADORA
AFTER INSERT ON COMPUTADORA
FOR EACH ROW
DECLARE
--VARABLES
LV_ID_BIT NUMBER;
LV_USUARIO NVARCHAR2(100);
LV_FECHA DATE;
BEGIN
    --INSTRUCCIONES A EJECUTAR
    SELECT USER INTO LV_USUARIO FROM DUAL; --GUARDANDO EL USUARIO EN LA VARIABLE LV_USUARIO
    SELECT SYSDATE INTO LV_FECHA FROM DUAL; --GUARDO LA FECHA EN LA VARIABLE LV_FECHA
    SELECT NVL(MAX(ID_BIT),0)+1 INTO LV_ID_BIT FROM BUT_COMPUTADORA; --OBTENGO EL ID VALIDO PARA LA BITACORA
    
    --INTRUCCIONES
    INSERT INTO BUT_COMPUTADORA(ID_BIT, ID_COMPU, MARCA, MODELO, RAM, PROCESADOR, PRECIO, MARCA_OLD,MODELO_OLD,RAM_OLD, PROCESADOR_OLD, PRECIO_OLD,
                                USUARIO,FECHA_MOV,MOVIMIENTO)
                                VALUES(LV_ID_BIT, :NEW.ID_COMPU, :NEW.MARCA, :NEW.MODELO,:NEW.RAM, :NEW.PROCESADOR, :NEW.PRECIO,NULL,NULL,0,
                                        NULL,0,LV_USUARIO, LV_FECHA,'INSERT');
    
END TE_I_COMPUTADORA;
/

--SENTENCIA PARA RECUPERAR EL USUARIO DE LA SESSION ACTUAL
SELECT USER FROM DUAL;

--SENTENCIA PARA RECUPERAR LA FECHA ACTUAL
SELECT SYSDATE FROM DUAL;

--MODIFICAR EL FORMATO DE LA FECHA
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';

--EJEMPLOS FUNCIONES DE AGREGACION
SELECT COUNT(ID_BIT)+1 FROM BUT_COMPUTADORA;

SELECT NVL(MAX(ID_BIT),0)+1 FROM BUT_COMPUTADORA;
