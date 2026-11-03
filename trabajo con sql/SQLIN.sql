-- Instrucción IN
-- Usamos IN para comparar los valores de una columna 
-- con una lista de valores.

SELECT * FROM Paises
WHERE Codigo IN ('ARG','AGO','AND')

SELECT * FROM Paises
WHERE Codigo NOT IN ('ARG','AGO','AND')

SELECT * FROM Ciudades
WHERE Id  IN (1, 2, 10, 15)


SELECT * FROM Ciudades
WHERE Id  NOT IN (1, 2, 10, 15)


-- Ejercicio 1
-- Devolver Clientes cuyos apellidos sean:
-- Myers, Lewis, Kent, Case o Berge

SELECT * FROM Clientes
WHERE Apellido IN ('Myers', 'Lewis', 'Kent', 'Case', 'Berger')


-- Ejercicio 2
-- Devolver Codigo, Nombre, Continente y  Region
-- de todos los países de America

SELECT Codigo, Nombre, Continente, Region FROM Paises
WHERE  Continente IN ('North America','South America','Central America')

--  Ejercicio 3
-- Devolver todas las ciudades
-- de los países hispanoparlantes
SELECT * FROM PaisesIdioma
WHERE PaisIdioma = 'Spanish'

SELECT * FROM Ciudades
WHERE CodigoPais IN ('ABW','AND','ARG','BLZ','BOL','CAN','CHL','COL','CRI','CUB','DOM','ECU','ESP','FRA','GTM',
'HND','MEX','NIC','PAN','PER','PRI','PRY','SLV','SWE','URY','USA','VEN','VIR')
