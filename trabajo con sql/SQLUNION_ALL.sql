-- UNION ALL
-- combinamos filas

SELECT 'Clientes', Apellido FROM Clientes

UNION ALL

SELECT 'Proveedor', Nombre FROM Proveedores

-- Particularidades
-- número de columnas tiene que ser igual

SELECT 'Clientes', Apellido, Nombre FROM Clientes

UNION ALL

SELECT 'Proveedor', Nombre FROM Proveedores

-- Primera consulta da nombre a la columna
SELECT 'Clientes' AS Tipo, Apellido AS Nombre
FROM Clientes

UNION ALL

SELECT 'Proveedor', Nombre AS NombreProveedor
FROM Proveedores

-- Ordenarlos
SELECT 'Clientes' AS Tipo, Apellido AS Nombre
FROM Clientes

UNION ALL

SELECT 'Proveedor', Nombre AS NombreProveedor
FROM Proveedores
ORDER BY Apellido ASC 

-- Excluir las filas duplicadas
SELECT 'Clientes' AS Tipo, Apellido AS Nombre
FROM Clientes

UNION 

SELECT 'Proveedor', Nombre AS NombreProveedor
FROM Proveedores
ORDER BY Apellido ASC

-- UNION en la misma tabla
-- También sirve para concatenar registros de la tabla

SELECT 'Prioritarios' AS Tipo,*
FROM Productos
WHERE Precio - Costo > 50

UNION ALL

SELECT ' No Prioritarios' AS Tipo,*
FROM Productos
WHERE Precio - Costo BETWEEN 20 AND 50


-- Ejercicio 1
-- Id y Nombre de productos cuyo costo sea mayor a 80 pero menor a 100
-- Id y nombre de categorias que no comiencen con la letra c
-- Id y nombre de Proveedores cuya segunda letra no sea "e",
-- ni su ultima letra sea "n".

SELECT Id, 'Costo' AS Tipo  ,Nombre FROM Productos
WHERE Costo BETWEEN 80 AND 100

UNION ALL

SELECT Id, 'Categorias' AS Tipo,Nombre FROM Categorias
WHERE Nombre NOT LIKE 'c%'

UNION ALL

SELECT Id, 'Proveedores' AS Tipo,Nombre FROM Proveedores
WHERE Nombre NOT LIKE '_e%' AND Nombre NOT LIKE '%n'


-- Ejercicio 2
-- Devolver nombre de producto, apellido y nombre como cliente, Fecha de orden
-- y texto "mayorista" para aquellas ordenes con pedidos mayores a 50
-- y texto "minorista" para aquellas ordenes con pedidos menores a 50

SELECT *FROM Productos
SELECT * FROM Clientes
SELECT * FROM Ordenes

SELECT product.Nombre AS Producto, cl.Apellido, cl.Nombre, ordern.Fecha, 'mayorista' AS Tipo  FROM Clientes cl
INNER JOIN Ordenes ordern ON ordern.ClienteId = cl.Id
INNER JOIN Productos product  ON product.Id = ordern.ProductoId
WHERE ordern.Cantidad > 50

UNION ALL

SELECT product.Nombre AS Producto, cl.Apellido, cl.Nombre, ordern.Fecha, 'minorista' AS Tipo FROM Clientes cl
INNER JOIN Ordenes ordern ON ordern.ClienteId = cl.Id
INNER JOIN Productos product  ON product.Id = ordern.ProductoId
WHERE ordern.Cantidad < 50

-- Ejercicio 3
-- Devolver un solo listado de productos, precio, y nombre de categoria
-- con precios actualizados:
-- descuento del 10% para bedidas, aumento del 15% para carnes
-- y agregar un impuesto fijo de 13.5 para lácteos.

SELECT * FROM Productos
SELECT * FROM Categorias

SELECT product.Nombre AS Producto,product.Precio - (product.Precio*10)/100 AS Precio, cate.Nombre AS Categoría FROM Productos product
INNER JOIN Categorias cate ON cate.Id = product.CategoriaId
WHERE cate.Nombre = 'Bebidas'  

UNION ALL

SELECT product.Nombre AS Producto,product.Precio + (product.Precio*15)/100 AS Precio, cate.Nombre AS Categoría FROM Productos product
INNER JOIN Categorias cate ON cate.Id = product.CategoriaId
WHERE cate.Nombre = 'Carnes'   

UNION ALL

SELECT product.Nombre AS Producto,product.Precio + 13.5 AS Precio, cate.Nombre AS Categoría FROM Productos product
INNER JOIN Categorias cate ON cate.Id = product.CategoriaId
WHERE cate.Nombre = 'Lácteos'   

UNION ALL

SELECT product.Nombre AS Producto,product.Precio Precio, cate.Nombre AS Categoría FROM Productos product
INNER JOIN Categorias cate ON cate.Id = product.CategoriaId
WHERE product.CategoriaId NOT IN(1,4,6)


