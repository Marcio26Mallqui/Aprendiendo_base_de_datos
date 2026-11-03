SELECT prod.Prod_Id, prod.Prod_Descripcion, prod.Prod_ProvId, prov.Prov_Nombre 
FROM productos prod
JOIN proveedores prov ON prod.Prod_ProvId = prov.Prov_Id 


SELECT * FROM productos_copy 

INSERT INTO productos_copy(Prod_Descripcion, Prod_Color) VALUES('HOLA','NEGRO-ROJO')	

SELECT * FROM productos_copy prodc
WHERE prodc.Prod_Descripcion LIKE 'New trabajo'

DELETE FROM productos_copy prodc
WHERE prodc.Prod_Descripcion LIKE 'HOLA'

DELETE FROM productos_copy prodc
WHERE prodc.Prod_Descripcion LIKE 'New trabajo'



SELECT * FROM productos_copy prodc
WHERE prodc.Prod_Descripcion LIKE 'Mi trabajo%'

UPDATE productos_copy prodc 
SET prodc.Prod_Descripcion = 'Mitrabajo 69',
	  prodc.Prod_Color = 'Mi color 69' 
WHERE prodc.Prod_Id = 7011

listadeproductosproductosxprovproductosxprov