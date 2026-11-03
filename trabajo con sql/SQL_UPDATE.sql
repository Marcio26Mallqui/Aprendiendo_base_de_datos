-- UPDATE
-- Modificar valores existentes en una tabla.

-- UPDATE tabla
-- SET columna1 = valor1, columna2 = valor2...
-- WHERE condición
 
SELECT * FROM Clientes

UPDATE Clientes
SET Nombre = 'José', Apellido = 'Peréz'
WHERE Id = 201

-- Modificar más de un registro
UPDATE Clientes
SET Direccion = 'Algún lugar de California'
WHERE Id IN(202,203)


-- Cosas desagradables suceden cuando nos olvidamos de consulta WHERE

BEGIN TRANSACTION -- siempre primero
UPDATE Clientes
SET Direccion = 'Algún lugar en California'
ROLLBACK TRANSACTION -- volver al inicio
-- COMMIT TRANSACTION, se aplique los cambios


SELECT * FROM Clientes

-- Ejercicio 1
-- Actualizar la dirección de James Bond a:
-- "Una base secreta"

SELECT * FROM Clientes

BEGIN TRANSACTION
UPDATE Clientes
SET Direccion = 'Una base secreta'
WHERE Id = 203
COMMIT TRANSACTION


-- Ejercicio 2
-- Cambiar la categoría  del producto Chocolate Amargo,
-- de Reposteria a Lacteos

SELECT * FROM Productos
WHERE Nombre = 'Chocolate Amargo'

SELECT * FROM Categorias
WHERE Nombre = 'Lácteos'

BEGIN TRANSACTION
UPDATE Productos 
SET CategoriaId =  (SELECT Id FROM Categorias WHERE Nombre = 'Lácteos')
WHERE Nombre = 'Chocolate Amargo'
COMMIT TRANSACTION



SELECT Id FROM Categorias
WHERE Nombre = 'Lácteos'

