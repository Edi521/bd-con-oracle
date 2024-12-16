--AGRUPAR DATOS DE LOS EMPLEADOS DE LA MISMA EDAD
-- GROUP BY COUNT
SELECT DEPARTAMENTO FROM EMPLEADO GROUP BY DEPARTAMENTO;

SELECT DEPARTAMENTO, COUNT(ID_EMPLEADO) AS NUM_EMPLEADO FROM EMPLEADO WHERE DEPARTAMENTO IS NOT NULL GROUP BY DEPARTAMENTO;

--CONTAR CUANTOS EMPLEADOS MAYORES DE 26 AÑOS EXISTEN
SELECT COUNT(ID_EMPLEADO) AS MAYORES_26 FROM EMPLEADO WHERE EDAD > 26;

--SUMA
SELECT SUM(EDAD) AS SUMA_EDADES FROM EMPLEADO WHERE APELLIDO LIKE '%Z';

--FUNSION MAX
SELECT MAX(EDAD) AS EDAD_MAXIMA FROM EMPLEADO WHERE DEPARTAMENTO LIKE 'DEP. IT';

--MIN
SELECT MIN(EDAD) AS EDAD_MINIMA FROM EMPLEADO WHERE DEPARTAMENTO LIKE 'DEP. IT';


--AVG
SELECT AVG(EDAD) AS EDAD_FROMEDIO FROM EMPLEADO;

--USO DE ROUND (REDONDEAR)
SELECT ROUD(AVG(EDAD)) AS PROMEDIO FROM EMPLEADO;

--USO TO_CHAR
SELECT TO_CHAR(AVG(EDAD),'FM99.9') AS PROMEDIO_EDAD FROM EMPLEADO;

--CONCAT
SELECT CONCAT('EL EMPLEADO',NOMBRE) AS DETALLE FROM EMPLEADO;

--PIPE || O BARRA VERTICAL IGUAL AL (CONCAT)
SELECT 'EL EMPLEADO(A) '||NOMBRE ||'' ||APELLIDO||' CON LA EDAD DE '||EDAD||' AÑOS, TRABAJA EN EL '||DEPARTAMENTO
|| 'COMO '|| PUESTO AS DETALLE FROM EMPLEADO WHERE PUESTO IS NOT NULL; 

--SUBCONSULTA
SELECT * FROM EMPLEADO WHERE
EDAD =(
    SELECT MAX(EDAD) FROM EMPLEADO
    WHERE DEPARTAMENTO LIKE 'DEP. IT'
);

SELECT * FROM EMPLEADO WHERE
EDAD = (
    SELECT MIN(EDAD) FROM EMPLEADO
    WHERE DEPARTAMENTO LIKE 'DEP. IT'
);

--CONVERTIR A MINUSCULAS
SELECT LOWER(NOMBRE) FROM EMPLEADO;

--MAYUSCULAS
SELECT UPPER(NOMBRE) FROM EMPLEADO;