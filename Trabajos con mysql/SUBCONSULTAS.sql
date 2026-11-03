SELECT <listas de campos> FROM <tablas> WHERE <condiciones >
-- SELECT dentro de otros SELECT

SELECT * FROM productos p

SELECT p.Prod_Id,
		 p.Prod_Descripcion,
		 p.Prod_Color,
		 (SELECT SUM(vd.VD_Cantidad) FROM ventas_detalle vd  WHERE vd.VD_ProdId = p.Prod_Id) AS 'Total Unidades',
		 (SELECT SUM(vd.VD_Precio) FROM ventas_detalle vd WHERE vd.VD_ProdId = p.Prod_Id) AS 'Total Ventas Dinero' 
FROM productos p
-- ------------------------------------------------------------------------------------

SELECT * FROM productos p
-- ---------------------------------------------------------------------------------------------------------------------------------

SELECT p.Prod_Id,p.Prod_Descripcion,p.Prod_Color,
	(SELECT COUNT(vd.VD_Cantidad) FROM ventas_detalle vd  WHERE p.Prod_Id = vd.VD_ProdId) AS 'Unidades Vendidas'
	FROM productos p 
		JOIN
			(SELECT VD_ProdId, COUNT(VD_Cantidad) unidades FROM ventas_detalle
				GROUP BY VD_ProdId) AS v ON p.Prod_Id = v.VD_ProdId AND v.unidades > 100
-- ---------------------------------------------------------------------------------------------------------------
SELECT * FROM productos p
	WHERE (SELECT SUM(VD_Cantidad) AS cantidad FROM ventas_detalle WHERE p.Prod_Id = VD_ProdId) >100


