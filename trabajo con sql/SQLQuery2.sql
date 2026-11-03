--SELECT *FROM Paises    --consultas que queremos que sean devultas
-- SELECT Nombre, Codigo FROM Paises

--para nuestro caso
SELECT Codigo
       ,Nombre
	   ,Region AS Region2
	   ,Iso  AS Codigo2                -- AS para renombrar, para cuando 
	   ,Iso3  AS Codigo3
	   ,Continente                              -- el nombre columna es grande
FROM Paises

-- Operadores artiméticos
SELECT TOP 10  --Si queremos solo las 10 filas usamos TOP 10
	   Nombre, 
       Costo, 
	   Precio AS PrecioMayorista,
	   Precio - Costo AS Ganancia, --- Para hallar la ganancia
	   --Precio + 10
	   --Precio * 10
	   --Precio /10
	   --(Precio*10) + 20
	   Precio + (Precio*20)/100 AS PrecioMinorista -- Precio minoritario con un aumento del 20%
FROM Productos

-- DISTINCT
SELECT CodigoPais FROM Ciudades -- ENcontramos que hay valores redundantes
SELECT DISTINCT CodigoPais FROM Ciudades -- DISTINCT solo aparesca un unico valor sin redundancia.

-- EJERCICIO 1
SELECT Id AS Numero,
       Nombre AS Categoria 
FROM Categorias

-- EJERCICIO 2
SELECT Apellido + ', ' + Nombre AS NombreCompleto,
	   FechaNacimiento
FROM Clientes

-- EJERCICIO 3
-- Costo con descuento del 30%
-- Gancia si el costo tiene un descuento del 30%
-- Gancia con costo regular
-- Gancia con costo regular y un 10% de descuento.
SELECT Nombre, 
       Costo, 
	   Precio,
	   (Costo*30)/100 AS Cost30porciento,
	   Precio - ((Costo*30)/100) AS GananciaCost30porciento,
	   Precio - Costo AS GanconCostoRegular
	   --Precio - Costo  AS GanconCostoRegular
FROM Productos