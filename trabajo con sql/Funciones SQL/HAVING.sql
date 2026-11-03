-- Obtener el número de la carrera y el valor
-- promedio del costo de laboratorio, para todas las carreras
-- en los que el costo promedio excede $100.

SELECT ma.Mnocarrera, AVG(ma.Mcostolab) FROM  materia ma
GROUP BY ma.Mnocarrera
HAVING AVG(ma.Mcostolab) > 100

-- Obtener el número de la carrera y el valor
-- promedio del costo de laboratorio, para todas las carreras
-- en los que el costo promedio excede $100.
-- Seleccionar solamente las filas donde el costo del laboratorio 
-- sea mayor a $0.

SELECT ma.Mnocarrera, AVG(ma.Mcostolab) AS 'Promedio del costo de laboratorio' FROM materia ma
WHERE ma.Mcostolab > 0
GROUP BY ma.Mnocarrera
HAVING AVG(ma.Mcostolab) > 100












