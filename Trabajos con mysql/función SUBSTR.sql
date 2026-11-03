-- SUBSTRING, es para extraer de un texto una cantidad de carácteres determicados.
-- -----------------------------------
-- SUBSTR(Lo que quiero, posición, carácteres)

SELECT prod.Prod_Id, prod.Prod_Descripcion, 
		CASE SUBSTR(prod.Prod_Descripcion,1,1)
		WHEN 'V' THEN 'Letra V'
		WHEN 'E' THEN 'Letra E'
		END AS ejercicios
FROM productos prod


