-- AND y OR
SELECT * FROM Clientes
WHERE Nombre = 'Carla' AND Apellido = 'Snider' -- Ambas deben cumplirse

SELECT * FROM Clientes
WHERE Nombre = 'Carla' OR Nombre = 'Abel' --  una deben cumplirse


-- Combinar Operadores
-- Exíste un orden entre los operadores
-- Primero es AND después  OR

SELECT * FROM Clientes
WHERE Nombre = 'Carla' OR Nombre = 'Abel' AND Apellido = 'Snider'
--- la máquina se fijo que Nombre = 'Abel' AND Apellido = 'Snider' es Falsa,
--- Entonces solo devolvio Nombre = 'Carla'.


---Para imponer que OR priemro luego AND
SELECT * FROM Clientes
WHERE (Nombre = 'Carla' OR Nombre = 'Abel') AND Apellido = 'Snider'


-- Agrupar operadores
SELECT * FROM Clientes
WHERE Nombre = 'Carla' OR (Nombre = 'Abel' AND Apellido = 'Snider')

-- OPearador NOT

-- niega la condición que le sigue
SELECT * FROM Clientes
WHERE NOT Nombre = 'Carla'

-- ó

SELECT * FROM Clientes
WHERE Nombre != 'Carla'

SELECT * FROM Clientes
WHERE Nombre= 'Carla' OR NOT(Nombre= 'Abel' AND Apellido = 'Snider')

SELECT * FROM Clientes
WHERE Nombre= 'Carla' OR (Nombre != 'Abel' OR Apellido != 'Snider') 
-- negamos individualmente las condiciones


--Ejercicios 1

-- Devolver todos los productos
-- cuyo precio sea mayor que el costo incrementado en un 40%
-- o la ganancia sea de al menos 25( > 25)
SELECT * ,Costo *1.4, Costo + (Costo*40)/100 AS Costoincrementado, Precio - Costo AS Ganancia FROM Productos
WHERE Precio > (Costo + ((Costo*40)/100)) OR Precio - Costo >25

-- Ejercicios 2
-- Devolver todas las ciudades argentinas
-- y todas las ciudades brasileras
-- excepto aquellas que pertenezcan a los distritos de Buenos Aires y Recife

SELECT * FROM Paises
WHERE Nombre = 'Argentina'  OR Nombre = 'Brazil'


SELECT * FROM Ciudades
WHERE (CodigoPais = 'ARG' AND Distrito != 'Buenos Aires')  
       OR (CodigoPais = 'BRA' AND Distrito != 'Recife')

-- Ejercicios 3
-- Devolver solo Ordenes realizadas antes de febrero del 2018
-- que hayan vendido mas de 100 productos
-- o ordenes realizadas después de julio del 2018
-- que no hayan vendido más de 50 productos

SELECT * FROM Ordenes
WHERE (Fecha < '20180201' AND Cantidad > 100) OR (Fecha >= '20180801' AND Cantidad <= 50)



