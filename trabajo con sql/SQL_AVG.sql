-- AVG
-- Calcular el promedio de un grupo de valores.

SELECT AVG(Precio) FROM Productos
WHERE ProveedorId =2

----
SELECT prov.Nombre, AVG(prod.Precio) AS Precio_Promedio FROM Productos prod
INNER JOIN Proveedores prov ON prod.ProveedorId = prov.Id
GROUP BY prov.Nombre
ORDER BY prov.Nombre

-- Para calular promedio de valores unico, sin contar valores repetidos

SELECT prov.Nombre, AVG(DISTINCT prod.Precio) AS Precio_Promedio FROM Productos prod
INNER JOIN Proveedores prov ON prod.ProveedorId = prov.Id
GROUP BY prov.Nombre
ORDER BY prov.Nombre


-- Ejercicio 1
-- Determinar el promedio vendido por ciudad
-- ordenados de mayor a menor

SELECT * FROM Ciudades

SELECT * FROM Productos

SELECT * FROM Ordenes

SELECT * FROM Clientes

-- cantidad de venta = precio * cantidad
SELECT city.Nombre, AVG(prod.Precio * ord.Cantidad) AS Cantidad_vendida FROM Ordenes ord
INNER JOIN Productos prod ON prod.Id = ord.ProductoId
INNER JOIN Clientes cl ON cl.Id = ord.ClienteId
INNER JOIN Ciudades city ON  city.Id = cl.CiudadId
GROUP BY city.Nombre
ORDER BY AVG(prod.Precio * ord.Cantidad)  DESC

-- Ejercicio 2
-- Determinar el promedio vendido a clientes
-- nacidos entre 1930 y 1970

SELECT * FROM Ordenes ord

SELECT cl.Apellido, cl.Nombre, AVG(prod.Precio * ord.Cantidad)  AS Promedio_vendido FROM Clientes cl
INNER JOIN Ordenes ord ON ord.ClienteId = cl.Id
INNER JOIN Productos prod ON prod.Id = ord.ProductoId
WHERE cl.FechaNacimiento BETWEEN '19300101' AND '19701231'
GROUP BY cl.Apellido, cl.Nombre
ORDER BY AVG(prod.Precio * ord.Cantidad) DESC

-- Ejercicio 3
-- Determinar el promedio invertido por proveedor
-- para productos con al menos una venta.

SELECT prov.Nombre, AVG(prod.Costo) AS Promedio_Invertido FROM Proveedores prov
INNER JOIN Productos prod ON prod.ProveedorId = prov.Id
INNER JOIN Ordenes ord ON ord.ProductoId = prod.Id
--WHERE ord.Cantidad >= 1
GROUP BY prov.Nombre





