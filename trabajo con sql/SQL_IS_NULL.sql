-- Operador IS NULL
SELECT * FROM Clientes
WHERE Telefono IS NULL -- Saber los cliente que tienen no tienen Teléfono.


SELECT * FROM Clientes
WHERE NOT Telefono  IS NULL -- Saber los cliente que tienen Teléfono.

-- Ejercicio 1
-- Devolver todos los productos que tengan proveedor.

SELECT * FROM Productos
WHERE NOT ProveedorId IS NULL

-- Ejercicio 2
-- Devolver todos los clientes que no tengan teléfono

SELECT * FROM Clientes
WHERE Telefono IS NULL




