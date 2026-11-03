-- Repaso
-- Combianar tablas
SELECT * FROM Clientes c
LEFT JOIN Ordenes o ON o.ClienteId = c.Id -- me da los clientes que tiene y no tienen ordenes
Order BY c.Id

SELECT * FROM Clientes c
RIGHT JOIN Ordenes o ON o.ClienteId = c.Id -- me da los clientes que tiene y no tienen ordenes
Order BY c.Id


SELECT * FROM Ordenes o
RIGHT JOIN Clientes c ON o.ClienteId = c.Id -- me da los clientes que tiene y no tienen ordenes
Order BY c.Id

-- LEFT OUTER JOIN
-- RIGHT OUTER JOIN
-- funcionan como los demás



-- Ejercicio 1
SELECT * FROM Clientes
SELECT * FROM Ordenes

 SELECT DISTINCT cl.Nombre, cl.Apellido FROM Clientes AS cl
 LEFT JOIN Ordenes AS orde ON orde.ClienteId = cl.Id
 AND orde.Fecha NOT BETWEEN '20180101' AND '20181231'

-- Ejercicio 2
SELECT * FROM Productos
SELECT * FROM Clientes
SELECT * FROM Ordenes
SELECT * FROM Proveedores
--procd.Id, procd.Nombre
SELECT * FROM Productos procd
LEFT JOIN Ordenes orden ON orden.ProductoId = procd.Id
wHERE orden.Id IS NULL

-- Ejercicio 3
SELECT * FROM Paises
SELECT * FROM Clientes
SELECT * FROM Ciudades
SELECT * FROM Ordenes

SELECT country.Codigo, country.Nombre FROM Clientes cl
LEFT JOIN Ordenes orden ON orden.ClienteId = cl.Id
LEFT JOIN Ciudades city ON city.Id = cl.CiudadId
LEFT JOIN Paises country ON country.Codigo = city.CodigoPais
WHERE orden.Id IS NULL



