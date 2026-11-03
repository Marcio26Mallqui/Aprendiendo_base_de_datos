-- Funciones Mysql IF
SELECT prod.Prod_Id, prod.Prod_Descripcion, IF(prod.Prod_Status =1, 'Habilitado','desabilitado') FROM productos prod

-- IF(condición, TRUE, FALSE)

-- prod.Prod_Status =1, 'Habilitado',
-- prod.Prod_Status !=1,'desabilitado'