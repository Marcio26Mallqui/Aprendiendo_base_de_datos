-- La consulta WHERE nos permite filtar los datos de una 
-- tabla.
SELECT * FROM Clientes
WHERE Id != 50 --<> o != distinto --Id >= 5--= ,>,<,<>,>=,=<

---------------------------------------------
-- Operaciones lógicas en Fechas
SELECT *
FROM Clientes
WHERE FechaNacimiento >= '20010917' -- formato de texto 'año mes día'

--- FILTRAR POR VALORES DE TEXTO
SELECT * FROM Clientes
--WHERE Apellido = 'Simon'
WHERE Nombre = 'Carla'
--COMENTARIOS	

-------------------------------------
--Ejercicio 1
-- Devolver ClienteId y Fecha de 
-- todas las Ordenes realizadas hasta Octubre del año 2017.
SELECT ClienteId, Fecha FROM Ordenes
WHERE Fecha < '20171101'
--WHERE Fecha <= '20171031'
---------------------------------------
----------------------------------------
-- Ejercicio 2
-- devolver Nombre, Codigo y NombreLocal
-- renombrados como "Pais" , "Abreviatura" y "Nomenclatura Local"
--- de todos los paises de la region "Polynesia"
SELECT Nombre AS Pais, 
	   Codigo  AS Abreviatura,	
	   NombreLocal AS NomenclaturaLocal 
FROM Paises
WHERE Region = 'Polynesia'
-------------------------------------

--Ejercicio 3
-- Devolver en una sola columna Nombre, Apellido y Dirección
-- de todos los clientes de la ciudad Bari
-- el formato debe ser:
-- "Nombre: nombre, Apellido: apellido, Direccion: direccion".
SELECT * FROM Ciudades
Where  Nombre = 'Bari' -- Id = 1473

SELECT Nombre, 
	   Apellido,
	   Direccion,
	   'Nombre: ' +  Nombre + ', Apellido: ' + apellido + ', Direccion: ' + Direccion AS Datos
FROM Clientes
Where CiudadId = '1473'

SELECT 'Nombre: ' +  Nombre + ', Apellido: ' + apellido + ', Direccion: ' + Direccion AS Datos
FROM Clientes
Where CiudadId = 1473