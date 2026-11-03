-- LIKE 
-- Trabajo exclusivamente con columnas tipo texto.
-- Nos permite utilizar comodines (caracteres especiales que no permite 
-- reemplazar otro caracteres)
SELECT * FROM Clientes
WHERE Apellido LIKE 'Guerra' --Apellido = 'Guerra'

--% reemplaza Cualquier cantidad de caracteres
SELECT * FROM Clientes
WHERE Apellido LIKE 'Gu%' -- Clientes cuyo apellido empieza con Gu.

SELECT * FROM Clientes
WHERE Apellido LIKE '%e'  -- Clientes cuyo apellido termina con la letra e.


SELECT * FROM Clientes
WHERE Apellido LIKE '%ue%' -- Clientes cuyo apellido contiene UE.

-- comodin guión bajo "_" reemplaza un carácter

SELECT * FROM Clientes
WHERE Apellido LIKE '_uerra'


SELECT * FROM Clientes
WHERE Apellido LIKE 'G_erra'

SELECT * FROM Clientes
WHERE Apellido LIKE '_____a' --Clientes cuyo apellido termine en a tenga solo 
                             --seis carácteres.

-- Ejercicio 1
-- Devolver Id, Nombre, Costo y Precio
-- de todos los productos relacionados con Queso
-- siempre y cuando su costo no sea menor a 10 ni mayor a 30.
SELECT Id, Nombre,Costo, Precio FROM Productos
WHERE Nombre LIKE '%Queso%' AND Costo BETWEEN 10 AND 30 -- Nombre del producto contenga la palabra Queso.

-- Ejercicio 2
-- Devolver todos los clientes
-- cuyo nombre tenga como segunda letra, la letra "a"
-- y termine con la letra e.
SELECT * FROM Clientes
WHERE Nombre LIKE '_a%e'

-- Ejercicio 3
-- Devolver todos los clientes
-- cuyo apellido no tenga la letra 'r' en la tercera posición
-- y su penúltima posición sea la letra 'e'.
SELECT * FROM Clientes
WHERE Apellido NOT LIKE '__r%' 
      AND Apellido LIKE '%e_' 








