-- Creación de variables.
-- SET es para signar el valor a una variable.

DECLARE @calificación INT
SET @calificación=10
PRINT @calificación

-- Que materia tienen un mayor costo de laboratorio.

SELECT * FROM materia ma
WHERE ma.Mcostolab = (SELECT MAX(ma.Mcostolab) FROM materia ma) 
ORDER BY  ma.Mcostolab DESC

DECLARE @v_mascaro DECIMAL -- declaramos variable
SELECT @v_mascaro = MAX(ma.Mcostolab) FROM materia ma
SELECT @v_mascaro

DECLARE @mascaro DECIMAL, @barato DECIMAL -- declaramos variables
SELECT @mascaro = MAX(ma.Mcostolab ), @barato = MIN(ma.Mcostolab ) FROM materia ma
SELECT @mascaro AS 'Costo de laboratorio más alto', @barato AS 'Costo de laboratorio menor'

DECLARE @mascaro1 INT = 10
SELECT @mascaro1D