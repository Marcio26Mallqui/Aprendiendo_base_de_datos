-- SELECT * FROM ventas_detalle vd
-- SELECT * FROM productos prod
-- -------------------------------------------------------
-- SELECT vd.VD_ProdId, prod.Prod_Descripcion, COUNT(*) AS ventas FROM ventas_detalle vd, productos prod
-- WHERE prod.Prod_Id = vd.VD_ProdId
-- GROUP BY  vd.VD_ProdId, prod.Prod_Descripcion
-- --------------------------------------------------------
SELECT YEAR(v.Ventas_Fecha) AS  Año,MONTH(v.Ventas_Fecha) AS Mes, SUM(v.Ventas_Total) AS Venta_Total FROM ventas v
GROUP BY Año, Mes 

--  WHERE trabajo con la base de datos no con los rsultados.