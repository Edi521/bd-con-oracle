--PROCEDIMIENTOS ALMACENADOS
--CREAR UNA ENTIDAD PARA REALIZAR UN RESPALDO

CREATE TABLE COMPUTADORA_PRD(
    ID_COMPU NUMBER,
    MARCA NVARCHAR2(100),
    MODELO NVARCHAR2(100),
    RAM NUMBER,
    PROCESADOR NVARCHAR2(100),
    PRECIO NUMBER,
    CONSTRAINT COMPU_PRD_PK PRIMARY KEY(ID_COMPU)
);
DELETE FROM COMPUTADORA;

INSERT INTO COMPUTADORA VALUES(1, 'HP', 'PAVILION', 16, 'Intel Core i9', 15000);
INSERT INTO COMPUTADORA VALUES(2, 'DELL', 'INSPIRON', 8, 'Intel Core i5', 4500);
INSERT INTO COMPUTADORA VALUES(3, 'ASUS', 'ZENBOOK', 32, 'AMD Ryzen 7', 20500);
INSERT INTO COMPUTADORA VALUES(4, 'LENOVO', 'THINKPAD', 8, 'Intel I3', 10000);
INSERT INTO COMPUTADORA VALUES(5,'LENOVO','LEGION',16,'Core i712450H',22500);
INSERT INTO COMPUTADORA VALUES(6,'ASUS','VIVOBOOK',24,'RYZEN 7 7700',17500);
INSERT INTO COMPUTADORA VALUES(7,'HP','VICTUS',16,'INTEL CORE i7',20000);
INSERT INTO COMPUTADORA VALUES(8,'MSI','KATANA',8,'INTEL CORE i7',20000);
INSERT INTO COMPUTADORA VALUES(9,'DELL','INSPIRON 15',8,'Inter core I7',14000);
INSERT INTO COMPUTADORA VALUES(10,'LENOVO','THINKPAD',16,'ROG ZEPHY',10000);
INSERT INTO COMPUTADORA VALUES(11, 'ROG','A-610',16,'INTEL I7',32450);
INSERT INTO COMPUTADORA VALUES(12, 'ALIENWARE',' M15',32,'RYZEN 9',89779);

COMMIT;

SELECT * FROM COMPUTADORA;



--CREAR EL PROCEDIMIENTO ALACENADO PARA RESPALDAR LA INFORMCACION
--SENTENCIA LLAMADA "INSERT INTO SELECT"
CREATE OR REPLACE PROCEDURE PR_RESPALDO_COMPUTADORA
IS
--DECLARACION DE VARIABLES, CONSTANTES O CURSORES

BEGIN
    --SENTENCIAS A EJECUTAR
    --ELIMINAR EL CONTENIDO DE LA TABLA DE RESPALDO
    DELETE FROM COMPUTADORA_PRD;
    --REALIZAR EL RESPALDO DE LA ENTIDAD COMPUTADORA EN COMPUTADORA_PRD
    INSERT INTO COMPUTADORA_PRD(ID_COMPU,MARCA,MODELO,RAM,PROCESADOR,PRECIO)
    SELECT ID_COMPU,MARCA,MODELO,RAM,PROCESADOR,PRECIO FROM COMPUTADORA;
END PR_RESPALDO_COMPUTADORA;
/

SELECT * FROM COMPUTADORA;
SELECT * FROM COMPUTADORA_PRD;


---EJECUTAR EL PROCEDIMIENTO ALMACENADO
EXECUTE PR_RESPALDO_COMPUTADORA;
