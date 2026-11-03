-- INNER JOIN
-- Combinar más de una tabla

SELECT * FROM Productos
INNER JOIN Categorias ON CategoriaId = Id --- Aparece columna ambigua

-----------------
-- Utilizamos los alías
SELECT * FROM Productos AS p
INNER JOIN Categorias AS c ON p.CategoriaId = c.Id 

---- ó

SELECT * FROM Productos p
INNER JOIN Categorias c ON p.CategoriaId = c.Id 


--- Múltiples Join

SELECT * FROM Productos p
INNER JOIN Categorias c ON p.CategoriaId = c.Id
INNER JOIN Proveedores pr ON  p.ProveedorId = pr.Id --SE elimino las filas que tienen NULL en la 
                                                    --tabla Productos Provedor ID
-- Palabras Opcionales
-- Quitando INNER funciona igual que el anterior

SELECT * FROM Productos p
JOIN Categorias c ON p.CategoriaId = c.Id
JOIN Proveedores pr ON  p.ProveedorId = pr.Id 


-- Ejercicio 1
-- Devolver nombre de Proveedores, Precio, Costo
-- de productos cuya ganancia sea mayor a 20.
SELECT * FROM Productos

SELECT pr.Nombre, procduc.Costo, procduc.Precio, procduc.Precio -  procduc.Costo AS Ganancia FROM Proveedores pr
INNER JOIN Productos procduc ON pr.Id = procduc.ProveedorId 
WHERE procduc.Precio -  procduc.Costo > 20


-- Ejercicio 2
-- Devolver Fecha, Apellido y Nombre de Clientes y nombre de productos
-- de todos los clientes que hayan comprado productos
-- entre 2016 y 2019
-- ordenando primero por más reciente y segundo pro apellido A-Z

SELECT * FROM Clientes

SELECT * FROM Productos

SELECT * FROM  Ordenes

SELECT ord.Fecha, cl.Apellido, cl.Nombre, product.Nombre AS Nombre_del_Producto FROM  Clientes cl 
INNER JOIN Ordenes ord ON cl.Id  = ord.ClienteId
INNER JOIN Productos product ON ord.ProductoId  = product.Id 
WHERE ord.Fecha BETWEEN '20160101' AND '20191231'
ORDER BY ord.Fecha DESC, cl.Apellido ASC


-- Ejercicio 3
-- A la consulta anterior, agregar además el país
-- al cual pertenece cada cliente.

SELECT * FROM Paises

SELECT * FROM Ciudades

SELECT * FROM Clientes

SELECT ord.Fecha, cl.Apellido, cl.Nombre, product.Nombre AS Nombre_del_Producto, country.Nombre AS Nombre_del_País   FROM  Clientes cl 
INNER JOIN Ordenes ord ON cl.Id  = ord.ClienteId
INNER JOIN Productos product ON ord.ProductoId  = product.Id
INNER JOIN Ciudades city ON city.Id = cl.CiudadId
INNER JOIN Paises country ON country.Codigo = city.CodigoPais
WHERE ord.Fecha BETWEEN '20160101' AND '20191231'
ORDER BY ord.Fecha DESC, cl.Apellido ASC






