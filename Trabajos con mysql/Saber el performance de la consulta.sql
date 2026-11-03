EXPLAIN SELECT prod.Prod_Id AS ID, prod.Prod_Descripcion AS Descripción, vt.Ventas_Fecha AS Fecha, SUM(vd.VD_Cantidad * vd.VD_Precio) AS Vendidos 
FROM productos prod
	JOIN ventas_detalle vd ON vd.VD_ProdId = prod.Prod_Id
	JOIN ventas vt ON vt.Ventas_Id = vd.VD_VentasId
WHERE vt.Ventas_Fecha BETWEEN '2018-01-02' AND '2018-01-07'	
GROUP BY  ID,  Descripción, Fecha
ORDER BY prod.Prod_Id

	
	