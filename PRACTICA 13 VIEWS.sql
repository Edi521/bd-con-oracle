--------------------VISTAS --------------------------> SON UNA MANERA DE MOSTRAR DATOS DE UNA O MAS ENTIDADES EN UNA SOLA CONSULTA
-- SON UNA ESPECIE DE TABLA VIRTUAL QUE NO ALMACENA DATOS POR SI MISMA MAS BIEN MUESTRA LOS DATOS PROVENIENTES DE OTRAS TABLAS
-- SIMPLIFICA EL ACCESO A LOS DATOS, MOJORA LA SEGURIDAD Y ORGANIZA LA INFORMACION PARA UNA MEJOR PRESENTACION.

/*
SINTANXIS:
CREATE OR REPLACE VIEW (NOMBRE)
--SENTENCIA O CONSULTA
*/


SELECT * FROM PADRE;
SELECT * FROM HIJO;

--VISTA
CREATE OR REPLACE VIEW V_PADRE_HIJO_DETALLE
AS
SELECT H.ID_HIJO, H.NOMBRE, H.APELLIDO, H.EDAD, H.HOBBIE,NVL(H.PADRE_ID,0) AS PADRE_ID, NVL(P.NOMBRE,'SIN REGISTRO') AS NOMBRE_PADRE,
NVL(P.TRABAJO,'SIN TRABAJO') AS TRABAJO_PADRE FROM HIJO H LEFT JOIN PADRE P ON H.PADRE_ID = P.ID_PADRE;

--EJECUTAR LA VISTA
SELECT * FROM V_PADRE_HIJO_DETALLE;


