-- función para adicionar dias
SELECT ADDDATE(CURRENT_DATE(),5)
 
SELECT CURRENT_TIMESTAMP(), ADDTIME(CURRENT_TIMESTAMP(),'00:08:00')
 
-- Convertir valores a otros
SELECT CAST('2023-06-25'AS DATE)
SELECT CAST(12345 AS CHAR)-- 
 
 
SELECT ADDDATE(CAST('2023-06-25' AS DATE), 10) 
 
SELECT prod.Prod_Id, prod.Prod_Descripcion, 	CHAR_LENGTH(prod.Prod_Descripcion) AS Largo FROM productos prod
 
 
 
 