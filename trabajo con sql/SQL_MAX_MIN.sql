-- Max and Min
-- funciones de agregado
-- MAX nos da el maxímo valor de una columna, MIN el mínimo valor de una
-- columna
-- Ignoran los valored NULL

SELECT MAX(Precio) FROM Productos

SELECT MIN(Precio) FROM Productos


-- Tipo Texto

SELECT * FROM Productos prod
ORDER BY prod.Nombre ASC

SELECT MAX(Nombre) FROM Productos -- último valor de la fila

SELECT MIN(Nombre) FROM Productos -- primer valor de la fila


-- Tipo date

SELECT * FROM Clientes cl
ORDER BY cl.FechaNacimiento ASC

SELECT MIN(FechaNacimiento) FROM Clientes

SELECT MAX(FechaNacimiento) FROM Clientes
-------------------------------------------------------------------

SELECT MAX(Precio) 
FROM Productos prod
INNER JOIN Categorias c ON prod.CategoriaId = c.Id
GROUP BY c.Nombre


SELECT *
FROM Productos prod
INNER JOIN Categorias c ON prod.CategoriaId = c.Id
WHERE prod.CategoriaId = 1
ORDER BY prod.Precio DESC

-- Ejercicio 1
-- Encontrar al cliente más joven que alguna vez haya realizado una compra.

SELECT * FROM Clientes
SELECT * FROM Ordenes

SELECT cl.Nombre, cl.Apellido, MAX(cl.FechaNacimiento) FROM Ordenes ord
INNER JOIN Clientes cl ON cl.Id = ord.ClienteId
GROUP BY cl.Nombre, cl.Apellido
ORDER BY MAX(cl.FechaNacimiento) DESC

-- Ejercicio 2
-- Determinar el producto de menor costo en cada categoría que se haya vendido
-- alguna vez.

SELECT * FROM Productos

SELECT * FROM Categorias

SELECT * FROM Ordenes

SELECT ct.Id, ct.Nombre, MIN(prod.Costo) AS COSTO_MIN
FROM Productos prod
INNER JOIN Ordenes ord ON ord.ProductoId = prod.Id
INNER JOIN Categorias ct ON ct.Id = prod.CategoriaId 
GROUP BY ct.Id, ct.Nombre
ORDER BY MIN(prod.Costo)  ASC	


-- Ejercicio 3
-- Determinar cual es el pais al cual se realizaron la mayor y la menor 
-- venta, ordenando los resultados

SELECT * FROM Productos

SELECT * FROM Ordenes

SELECT *FROM Clientes

SELECT *FROM Ciudades

SELECT *FROM Paises


SELECT ps.Codigo, ps.Nombre, MAX(prod.Precio*ord.Cantidad) AS Total_Vendido FROM Ordenes ord
INNER JOIN Productos prod ON prod.Id = ord.ProductoId
INNER JOIN Clientes cl ON cl.Id = ord.ClienteId
INNER JOIN Ciudades city ON city.Id = cl.CiudadId
INNER JOIN Paises ps ON ps.Codigo = city.CodigoPais
GROUP BY ps.Codigo, ps.Nombre
ORDER BY MAX(prod.Precio*ord.Cantidad) DESC







































