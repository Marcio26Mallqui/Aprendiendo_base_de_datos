-- Clausula ORDEN BY (establecer el orden de los datos)

SELECT * FROM Clientes
ORDER BY Apellido -- Por defaut lo ordeno ascendente

SELECT * FROM Clientes
ORDER BY Apellido DESC-- Por defaut lo ordeno descendente


SELECT * FROM Clientes
ORDER BY Apellido ASC -- for explicita -- lo ordeno ascendente

SELECT FechaNacimiento, Apellido FROM Clientes
ORDER BY FechaNacimiento, Apellido DESC

SELECT * FROM Clientes
ORDER BY FechaNacimiento DESC, Apellido DESC, Nombre ASC

-- Ejercicio 1
-- Devolver Nombre, Apellido y Dirección de todos los clientes
-- ordenados por Fecha de Nacimiento desde el mas reciente al mas antiguo.

SELECT Nombre, Apellido, Direccion FROM Clientes
ORDER BY FechaNacimiento DESC

-- Ejercicio 2
-- Devolver Nombre, ProveedorId y Ganancia de todos los productos,
-- ordenados de mayor a menor, con el producto de mayor ganancia
-- primero en la lista.

SELECT Nombre, 
	   ProveedorId, 
	   Precio-Costo AS Ganancia  
FROM Productos
ORDER BY Ganancia DESC


-- Ejercicio 3
-- Devolver todos los clientes
-- y ordenarlos por nombre A-Z
-- Si el nombre coincide, ordenar por apellido de Z-A
-- Si ambos coinciden, elegir primero al cliente de mayor edad.

SELECT * FROM Clientes
ORDER BY  Nombre ASC, Apellido DESC, FechaNacimiento ASC 

--SELECT * FROM Clientes
--WHERE NOT Telefono  IS NULL







