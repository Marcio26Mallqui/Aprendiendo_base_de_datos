-- DELETE
-- La sentencia DELETE se usa para eliminar filas existentes en la tabla.

-- DELETE FROM tabla WHERE condición

SELECT * FROM Clientes

BEGIN TRANSACTION
DELETE FROM Clientes WHERE Id IN(201,202,203)
ROLLBACK TRANSACTION -- PARA DEVOLVER LAS FILAS ELIMINADAS

-- Ejercicio 1
-- Eliminar todos los elementos creados en los ejercicios anteriores.

SELECT * FROM Clientes 

BEGIN TRANSACTION
DELETE FROM Clientes WHERE Id IN(201,202,203)
COMMIT TRANSACTION

SELECT * FROM Productos

BEGIN TRANSACTION
DELETE FROM Productos WHERE Nombre = 'Chocolate amargo'
COMMIT TRANSACTION


SELECT Id FROM Productos 
WHERE Nombre = 'Chocolate amargo'

