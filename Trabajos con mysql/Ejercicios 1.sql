-- Ejerccios de Insert

-- Insertar un registro en la tabla productos
SELECT * FROM productos p

INSERT INTO productos(Prod_Descripcion,Prod_Color) VALUES('Mi trabajo 22', 'color 23'), ('Mi trabajo 23', 'color 24')

INSERT INTO productos(Prod_Id,Prod_Descripcion,Prod_Color) VALUES(6993,'Mi trabajo 6993','Mi color 6993')

INSERT INTO productos(Prod_Id,Prod_Descripcion,Prod_Color,Prod_ProvId) VALUES(6994,'Mi trabajo 6994','Mi color 6994',9)

DELETE FROM productos WHERE Prod_Id = '6994'

-- Hacer un Bulk insert en la tabla productos

INSERT INTO productos(Prod_Descripcion,Prod_Color) VALUES('Mi trabajo 45', 'Mi color 45'),
('Mi trabajo 46', 'Mi color 46'),
('Mi trabajo 47', 'Mi color 47')

-- Ejercicio con UPDATE
SELECT * FROM clientes cl

INSERT INTO clientes(Cli_RazonSocial) VALUE('Mi trabajo 12')

UPDATE clientes cl
SET cl.Cli_Estado =0
WHERE cl.Cli_Id >0

UPDATE clientes cl
SET cl.Cli_Estado = 1
WHERE cl.Cli_Id= 10

-- SELECT cl.Cli_Id, cl.Cli_RazonSocial FROM clientes cl
-- WHERE cl.Cli_Estado =1

-- Asignarle 1 al estado de la tabla clientes de los clientes
-- 6, 20, 54 y 56

UPDATE clientes cl
SET cl.Cli_Estado = 1
WHERE cl.Cli_Id IN (6,20,54,56)

-- Sumarle al producto 6989, 100 en el campo Prod_Precio

UPDATE productos prod
SET prod.Prod_Precio = prod.Prod_Precio + 100
WHERE prod.Prod_Id = 6989 

--  Ejercicos DELETE

-- Borrar de la tabla clientes, el ID nro 10

DELETE FROM clientes cl WHERE cl.Cli_Id =10

-- -----------------------------------

SELECT * FROM productos_copy prodc
SELECT * FROM proveedores

-- Borrar todos los registros de la tabla 
-- productos cuyo proveedor comiencen con la letra A

SELECT * FROM productos_copy prodc
JOIN proveedores pv  ON pv.Prov_Id = prodc.Prod_ProvId 
WHERE pv.Prov_Nombre LIKE 'A%'



DELETE prodc FROM productos_copy prodc
	JOIN proveedores pv  ON pv.Prov_Id = prodc.Prod_ProvId 
	WHERE pv.Prov_Nombre LIKE 'A%'
  
     
