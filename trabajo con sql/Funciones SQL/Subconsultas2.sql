-- Ejemplo:
-- Seleccionar el número, nombre y tarifa de cualquier curso que 
-- tenga tarifa mayor o igual al cinco por ciento del sueldo de 
-- cualquier maestro.

SELECT * FROM inscrip

SELECT * FROM materia

SELECT * FROM academic

SELECT ROUND(MAX(aca.Asueldo*0.05),1) FROM academic aca 



SELECT ma.Mnocarrera, ma.Mnombre, ma.Mcostolab FROM materia ma
WHERE ma.Mcostolab >= (SELECT MAX(aca.Asueldo*0.05) FROM academic aca )

-- IN
-- Reportar el nombre y el sueldo de cada maestro que trabaja 
-- en la carrera que su coordinación esta en el edificio A501.

SELECT * FROM academic

SELECT * FROM carrera

SELECT carr.Cnocarrera FROM carrera carr
WHERE carr.Cedificio = 'A501'

SELECT aca.Anombre, aca.Asueldo FROM academic aca
JOIN carrera car ON car.Cnocarrera = aca.Anocarrera
WHERE car.Cedificio = 'A501'
-- Solución
SELECT aca.Anombre, aca.Asueldo FROM academic aca
WHERE aca.Anocarrera IN (SELECT carr.Cnocarrera FROM carrera carr 
                         WHERE carr.Cedificio = 'A501')
-- ---------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- ---------------------------------------------------------------------
-- EXISTS

-- Ejemplo: Lista los grupos que tenga profesores dado de alta en 
-- la tabla ACADEMIC.

SELECT grup.Gnogrupo, grup.Gnomaestro  FROM grupo grup
WHERE   EXISTS (SELECT aca.Anoemplead FROM academic aca
                            WHERE Anoemplead = grup.Gnomaestro)

SELECT aca.Anoemplead, aca.Anombre FROM academic aca
JOIN grupo grup ON grup.Gnomaestro = aca.Anoemplead

-- Subconsultas anidadas

-- Ejemplo:
-- Visializar el número y nombre de académico que sea 
-- coordinador de la carrera que tenga materias con 8 créditos. 

SELECT ma.Mnocarrera FROM materia ma
WHERE ma.Mcred = 8

SELECT * FROM academic acad

SELECT * FROM carrera

SELECT car.Ccoord FROM carrera car
WHERE car.Cnocarrera IN  (SELECT ma.Mnocarrera FROM materia ma
                       WHERE ma.Mcred = 8)


SELECT acad.Anoemplead, acad.Anombre FROM academic acad
WHERE acad.Anoemplead IN (SELECT car.Ccoord FROM carrera car
                          WHERE car.Cnocarrera IN  (SELECT ma.Mnocarrera FROM materia ma
                           WHERE ma.Mcred = 8))

-- ----------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------

-- Subconsultas en la cláusula HAVING.

-- Ejemplo:
-- Reportar el número de carrera y el costo promedio de 
-- laboratorios de la carrera, para las carreras con un 
-- promedio de costo de laboratorio por abajo del promedio de
-- todos los laboratorios.

SELECT ma.Mnocarrera, AVG(ma.Mcostolab) AS 'Promedio del costo de laboratorio' FROM materia ma
GROUP BY ma.Mnocarrera 
HAVING AVG(ma.Mcostolab) < (SELECT AVG(ma.Mcostolab) FROM materia ma)




