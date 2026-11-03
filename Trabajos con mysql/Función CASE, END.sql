-- Función CASE (MYSQL Y SQLServer)
-- ---------------------------------------------------
-- SELECT prod.Prod_Id, prod.Prod_Descripcion,
--		 CASE WHEN prod.Prod_Status=1 THEN 'Habilitado' ELSE 'Desabilitado' END AS Estado	
-- FROM productos prod

-- COmo esl status =1 solo es habilitado, para status=2 apararece 'Desabilitado'.
-- -------------------------------------------------------

-- SELECT prod.Prod_Id, prod.Prod_Descripcion,
--		CASE prod.Prod_Status
--		WHEN 0 THEN 'Desabilitado'
--		WHEN 1 THEN 'Habilitado'
--		WHEN 2 THEN 'otros estados'
--		END AS Estado 
-- FROM productos prod
-- ----------------------------------------------------------------
SELECT prod.Prod_Id, prod.Prod_Descripcion,
		CASE prod.Prod_Status
		WHEN 0 THEN 'Desabilitado'
		WHEN 1 THEN IFNULL((SELECT SUM(vd.VD_Cantidad) FROM ventas_detalle vd WHERE vd.VD_ProdId = prod.Prod_Id), 0)           
		WHEN 2 THEN 'otros estados'
		END AS Estado 
FROM productos prod



