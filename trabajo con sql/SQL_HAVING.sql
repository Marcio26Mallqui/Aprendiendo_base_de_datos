-- HAVING
-- Clausula HAVING, se usa para filtrar grupos en condiciones 
-- específicas.
-- "Cumple la función de la clausula WHERE pero para grupos."

-- WHERE solo es para registros individuales.
-- HAVING aplicá para registros sumarizados.
-- Solo los grupos que cumplen la condición son devueltos. 
-- GOUP BY sumariza filas en grupo, HAVING aplicá para estos grupos.


SELECT prov.Nombre, SUM(prod.precio) AS Precio_Total
FROM Productos prod
INNER JOIN Proveedores prov ON prod.ProveedorId = prov.Id
GROUP BY prov.Nombre
HAVING SUM(prod.Precio) > 100
ORDER BY prov. Nombre


SELECT prov.Nombre, SUM(prod.precio) AS Precio_Total
FROM Productos prod
INNER JOIN Proveedores prov ON prod.ProveedorId = prov.Id
GROUP BY prov.Nombre
HAVING SUM(prod.Precio) BETWEEN 100 AND 200 -- Solo es para filtrar grupos
ORDER BY prov. Nombre

-- Ejercicio 1
-- Devolver solo aquellos proveedores
-- en donde el precio promedio de sus productos
-- supere el valor de su producto más caro dividido por dos.
-- El proveedor debe tener un producto que se haya vendido al menos una vez.

SELECT * FROM Proveedores

SELECT * FROM Productos

SELECT * FROM Ordenes

SELECT prov.Id, prov.Nombre, AVG(prod.Precio) AS Precio_Promedio FROM Productos prod
INNER JOIN Proveedores prov ON prod.ProveedorId = prov.Id
INNER JOIN Ordenes ord ON  ord.ProductoId = prod.Id
GROUP BY prov.Id, prov.Nombre
HAVING AVG(prod.Precio) > MAX(prod.Precio)/2
--ORDER BY prov.Id ASC


SELECT * FROM Productos prod
INNER JOIN Proveedores prov ON prod.ProveedorId = prov.Id
INNER JOIN Ordenes ord ON  ord.ProductoId = prod.Id
--GROUP BY prov.Id, prov.Nombre

-- Ejercicio 2
-- Mostrar el total y el promedio consumido por idioma del cliente
-- ordenado de mayor a menor
-- sólo para los idiomas en donde la mitad de lo consumido
-- es mayor al promedio total consumido.

SELECT * FROM PaisesIdioma

SELECT * FROM Clientes

SELECT * FROM Ordenes

SELECT * FROM Productos

SELECT * FROM Proveedores

SELECT * FROM Ciudades
SELECT * FROM Paises

SELECT * FROM Clientes cl
INNER JOIN Ordenes ord ON ord.ClienteId = cl.Id
INNER JOIN Productos prod ON prod.Id = ord.ProductoId
INNER JOIN Ciudades cdd ON cl.CiudadId = cdd.Id
INNER JOIN PaisesIdioma psi ON psi.PaisCodigo = cdd.CodigoPais


SELECT  psi.PaisIdioma, SUM(prod.Precio * ord.Cantidad) AS Total_consumido, AVG(prod.Precio * ord.Cantidad) AS Promedio_total_consumido FROM Clientes cl
INNER JOIN Ordenes ord ON ord.ClienteId = cl.Id
INNER JOIN Productos prod ON prod.Id = ord.ProductoId
INNER JOIN Ciudades cdd ON cl.CiudadId = cdd.Id
INNER JOIN PaisesIdioma psi ON psi.PaisCodigo = cdd.CodigoPais
GROUP BY  psi.PaisIdioma
HAVING SUM(prod.Precio * ord.Cantidad)/2 > AVG(prod.Precio * ord.Cantidad)
ORDER BY SUM(prod.Precio * ord.Cantidad)  DESC


























