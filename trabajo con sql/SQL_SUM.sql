-- SUM
-- Funciones de agregado
-- cálcula de suma de los valores de la columna indicada.

SELECT SUM(Precio) FROM Productos

-- La suma de costos por proveedor

SELECT prov.Nombre, SUM(prod.Precio - prod.Costo) AS Ganancia FROM Productos prod
INNER JOIN Proveedores prov ON prov.Id = prod.ProveedorId
GROUP BY prov.Nombre
ORDER BY prov.Nombre

-- Ejercicio 1
-- Determinar cual es la categoría más exitosa
-- calculando el total vendido por categoría.

SELECT * FROM Categorias
SELECT * FROM Productos
SELECT * FROM Ordenes

SELECT cat. Id, cat.Nombre, SUM(prod.Precio * ord.Cantidad) AS Cantidad_vendida FROM Productos prod
INNER JOIN Ordenes ord	ON ord.ProductoId = prod.Id
INNER JOIN Categorias cat ON cat.Id = prod.CategoriaId
GROUP BY cat. Id, cat.Nombre
ORDER BY Cantidad_vendida DESC


-- Ejercicio 2
-- Determinar cual es el proveedor más costoso del sistema
-- calculando el total por proveedor.

SELECT * FROM Ordenes

SELECT prov.Id, prov.Nombre, SUM(prod.Costo) AS Costo_Total FROM Proveedores prov
INNER JOIN Productos prod ON prod.ProveedorId = prov.Id
INNER JOIN Ordenes ord ON ord.ProductoId = prod.Id
GROUP BY prov.Id, prov.Nombre
ORDER BY SUM(prod.Costo) DESC

-- SELECT * FROM Productos

-- Ejercicio 3
-- Mostrar el total consumido por
-- idioma de cliente
-- ordenado de mayor a menor

SELECT * FROM PaisesIdioma

SELECT * FROM Paises

SELECT * FROM Ciudades

SELECT * FROM Clientes

-- SELECT * FROM Productos
SELECT * FROM Ordenes

SELECT * FROM Productos

SELECT  psid.PaisIdioma, SUM(prod.Precio * ord.Cantidad) AS Total_Consumido FROM Ordenes ord
INNER JOIN Productos prod ON prod.Id = ord.ProductoId
INNER JOIN Clientes cl ON cl.Id = ord.ClienteId
INNER JOIN Ciudades city ON city.Id = cl.CiudadId
INNER JOIN Paises ps ON ps.Codigo = city.CodigoPais
INNER JOIN PaisesIdioma psid ON psid.PaisCodigo = ps.Codigo
GROUP BY psid.PaisIdioma
ORDER BY SUM(prod.Precio * ord.Cantidad) DESC