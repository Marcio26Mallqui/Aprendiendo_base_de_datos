-- SELECT YEAR(v.Ventas_Fecha) AS año, MONTH(v.Ventas_Fecha) AS mes,SUM(v.Ventas_Total) AS venta_total 
-- FROM ventas v
-- GROUP BY año, mes
-- HAVING venta_total > 1000000 -- este funciona con los resultados
-- ---------------------------------------------------------
-- HAVING es conocido como el WHERE de GROUP BY 
-- --------------------------------------------------------

-- SELECT * FROM ventas_detalle vd

-- SELECT * FROM productos prod
 SELECT vd.VD_ProdId, prod.Prod_Descripcion, COUNT(*) AS ventas FROM ventas_detalle vd, productos prod
 WHERE vd.VD_ProdId = prod.Prod_Id
 GROUP BY vd.VD_ProdId
 HAVING ventas >100
 ORDER BY ventas DESC