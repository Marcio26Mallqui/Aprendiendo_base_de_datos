-- GROUP BY

SELECT ProveedorId FROM Productos
INNER JOIN Proveedores p ON ProveedorId = p.Id
GROUP BY ProveedorId -- Agrupo el total de proveedores solome muestra el único Id.

SELECT ProveedorId, p.Nombre FROM Productos
INNER JOIN Proveedores p ON ProveedorId = p.Id
GROUP BY ProveedorId, p.Nombre -- las mismas columnas tienen que estar en SELECT y GROUP BY


-- Agrupa las filas segun las columnas


--Ejercicio 
-- Devolver solo paises de la tabla Ciudades.
SELECT * FROM Paises

SELECT country.Codigo, country.Nombre  FROM Ciudades city
INNER JOIN Paises country ON city.CodigoPais = country.Codigo
GROUP BY country.Codigo, country.Nombre





