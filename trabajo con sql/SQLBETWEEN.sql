-- BETWEEN
-- La clausula BETWEEN incluye a los extremos

-- Numerico
SELECT * FROM Ciudades
WHERE Id BETWEEN 100 AND 200
--WHERE Id >=100 AND Id<= 200

-- String

SELECT * FROM Clientes
WHERE FechaNacimiento BETWEEN '19900101' AND '19901231'


--Ejercicio 1
--Devolver clientes nacidos entre 1950 y 1980
-- y clientes nacidos entre 1990 y 2010

SELECT * FROM Clientes
WHERE FechaNacimiento BETWEEN '19500101' AND '19800101'		OR FechaNacimiento BETWEEN '19900101' AND '20100101'

-- Ejercicio 2
-- Devolver Ordenes realizadas:
-- antes de enero del 2016
-- entre marzo y noviembre del 2017 o marzo y noviembre del 2018
-- Después de enero del 2019

SELECT * FROM Ordenes
WHERE Fecha < '20160101' OR Fecha BETWEEN '20170301' AND '20171130'  OR Fecha BETWEEN '20180301' AND '20181130' OR Fecha > '20190131'
	  --OR Fecha BETWEEN '20180301' AND '20181130' 

-- Ejercicio 3
-- Devolver Id, Nombre, apellido y Dirección de
-- los clientes con Id mayores a 80 pero menores a 125
-- excepto por los clientes 99 y 100
-- Y además devolver los clientes con Id 13,17,19,28 y 56

SELECT Id, Nombre, Apellido, Direccion FROM Clientes
WHERE (Id BETWEEN 81 AND 124 AND Id NOT IN(99,100)) OR  Id IN(13,17,19,28,56) 







