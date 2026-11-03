--  SUM()
-- calcula la suma de los valores de una columna.


SELECT SUM(ma.Mcostolab ) FROM materia ma

-- AVG()
-- calcula el promedio de los valores de una columna.

SELECT AVG(ma.Mcostolab ) FROM materia ma

-- MAX()

SELECT MAX(ma.Mcostolab ) FROM materia ma

-- MIN()
SELECT MIN(ma.Mcostolab) FROM materia ma

-- COUNT(*)
-- Cuenta el número de registros.

-- ¿Cuántas materias de computación existen?

SELECT COUNT(*) FROM materia ma
WHERE ma.Mnocarrera = 32

-- DISTINCT

-- ¿Cuántas carreras diferentes hay en la tabla de materia?

SELECT COUNT(DISTINCT ma.Mnocarrera) FROM materia ma

-- GROUP BY

-- Para cada una de las carreras obtener el promedio del costo 
-- de todos sus laboratorios.

SELECT ma.Mnocarrera, AVG(ma.Mcostolab) AS 'Promedio del costo de laboratorio' 
FROM materia ma
GROUP BY ma.Mnocarrera

-- Para cada materia determinar la suma de costo de laboratorio 
-- que tengan 8 créditos.
-- Visualizar las salida en forma descendente por el número de 
-- carrera

SELECT ma.Mnocarrera, SUM(ma.Mcostolab ) FROM materia ma
WHERE ma.Mcred = 8
GROUP BY ma.Mnocarrera
ORDER BY ma.Mnocarrera DESC

SELECT ma.Mcred, ma.Mnocarrera, MAX(ma.Mcostolab )  AS'Máximo costo de laboratorio' 
FROM materia ma
GROUP BY ma.Mcred, ma.Mnocarrera












