-- COUNT 
-- Son funciones de agregado.
-- Nos permieten sumarizar datos.
-- Nos permiete contar cuantas veces aparece un 
-- valor determinado dentro de cada grupo.

SELECT prov.Nombre, COUNT(prod.Id) AS Cantidad_Productos 
FROM Productos prod
INNER JOIN Proveedores prov ON prov.Id = prod.ProveedorId
GROUP BY prov.Nombre
ORDER BY prov.Nombre


SELECT COUNT(*) FROM Clientes -- Número de filas
WHERE Nombre = 'Carla'

SELECT COUNT(DISTINCT Nombre) FROM Clientes -- Solo cuente nombre únicos
WHERE Nombre = 'Carla'
--SELECT *FROM Proveedores

-- Ejercicio 1
-- Devolver la cantidad de productos vendidos por categoría
-- ordenado de mayor a menor

SELECT * FROM Productos prod
SELECT * FROM Ordenes ord
SELECT * FROM Categorias categ

SELECT categ.Id, categ.Nombre, COUNT(ord.Cantidad) AS Cantidad_Productos FROM Productos prod
INNER JOIN Ordenes ord ON prod.ProveedorId = ord.ProductoId
INNER JOIN Categorias categ ON categ.Id = prod.CategoriaId
GROUP BY categ.Id, categ.Nombre
ORDER BY COUNT(ord.Cantidad) DESC 


-- Ejercicio 2
-- Devolver la cantidad de clientes que alguna vez ordenaron algo
-- por País.

SELECT * FROM Clientes
SELECT * FROM Ciudades
SELECT * FROM Paises
SELECT * FROM Ordenes ord

SELECT country.Codigo, country.Nombre, COUNT(CL.Id) AS Cantidad_de_clientes FROM Clientes cl
INNER JOIN Ordenes ord ON ord.ClienteId = cl.Id
INNER JOIN Ciudades city ON city.Id = cl.CiudadId
INNER JOIN Paises country ON country.Codigo = city.CodigoPais
GROUP BY country.Codigo ,country.Nombre
ORDER BY country.Nombre ASC

-- Ejercicio 3
-- Devolver la cantidad de productos cuya ganancia
-- está entre 5 y 20, y su proveedor no está vacío.

SELECT * FROM Proveedores
SELECT * FROM Productos

SELECT COUNT(*) FROM Productos prod
INNER JOIN Proveedores prov ON prov.Id = prod.ProveedorId
WHERE prod.Precio - prod.Costo BETWEEN 5 AND 20 
--GROUP BY prod.Id, prod.Nombre
