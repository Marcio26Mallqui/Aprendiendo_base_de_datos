-- INSERT
-- Definir estos datos en su manera más sencilla
-- Se utiliza para insertar nuevos registros en la tabla.

-- INSERT INTO tabla (columna1, columna2, columna3, ...)
-- VALUES (valor1, valor2, valor3);

-- Si estamos agragando valores para todas las columnas de la tabla
-- INSERT INTO tabla
-- VALUES (valor1, valor2, valor3);


INSERT INTO Clientes
-- No insertaremos la columna Id, ya que tiene Identity specification (no
-- puede tener valores repetidos, es una columna que da identidad a la fila).

INSERT INTO
Clientes(Nombre, Apellido, FechaNacimiento, CiudadId, Telefono, Direccion)
VALUES('Quentin', 'Tarantino', '19630327', 3794, NULL, '9601 Wilshire Blvd, 3rd floor, Beverly Hills, CA 90210-5213')

INSERT INTO Clientes(Nombre, Apellido, FechaNacimiento, CiudadId, Telefono, Direccion)
VALUES('Marco', 'Cordero', '19900327', 2890, NULL, NULL)


SELECT * FROM Ciudades
WHERE CodigoPais = 'PER'

SELECT * FROM Clientes

-- Ejercicio 1
-- Insertar al cliente James Bond, de Amsterdam
-- que haya nacido el 26 de mayo del 83.

INSERT INTO Clientes(Nombre,Apellido,FechaNacimiento, CiudadId, Telefono,Direccion)
VALUES('James','Bond','19830526',5,  NULL,NULL)

SELECT * FROM Clientes 

SELECT * FROM Ciudades 
WHERE Nombre = 'Amsterdam'

SELECT * FROM Paises
WHERE Nombre = 'Amsterdam'

-- INSERT INTO Clientes(Nombre,Apellido,FechaNacimiento, CiudadId, Telefono,Direccion)
-- VALUES('James','Bond','19830526',(SELECT Id FROM Ciudades WHERE Nombre = 'Amsterdam'),  NULL,NULL)

-- Ejercicio 2
-- Insertar un nuevo producto de la categoría Repostería
-- llamado Chocolate amargo.
-- El producto pertenece a un nuevo proveedor "Fabrica de Chocolate".
-- Su costo es 6 y su precio de venta 15.


INSERT INTO Proveedores(Nombre)
VALUES('Fabrica de Chocolate')

INSERT INTO Productos(Nombre, ProveedorId, Costo, Precio, CategoriaId)
VALUES('Chocolate amargo', (SELECT Id FROM Proveedores WHERE Nombre = 'Fabrica de Chocolate'), 5,15, (SELECT Id FROM Categorias  WHERE Nombre = 'Repostería'))

SELECT Id FROM Proveedores WHERE Nombre = 'Fabrica de Chocolate'

SELECT Id FROM Categorias  WHERE Nombre = 'Repostería'

SELECT * FROM Productos

--

