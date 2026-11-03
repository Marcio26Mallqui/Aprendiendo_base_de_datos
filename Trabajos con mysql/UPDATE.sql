SELECT * FROM productos prod
-- Actualizar datos de las tablas

UPDATE productos prod
SET prod.Prod_Descripcion = 'Descripción modificada 2',
	 prod.Prod_Status = 0,
	 prod.Prod_CompraSuspendida = 1
WHERE prod.Prod_Id > 7004	 