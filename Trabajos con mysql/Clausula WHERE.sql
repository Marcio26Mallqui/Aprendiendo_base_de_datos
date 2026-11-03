-- SELECT prod.Prod_Id, 
-- 		 prod.Prod_Descripcion, 
--		 prod.Prod_Precio,
--		 prod.Prod_ProvId
-- FROM productos AS prod
-- WHERE prod.Prod_Precio > 0 AND (prod.Prod_ProvId > 10 AND prod.Prod_ProvId < 50)
-- ----------------------------

-- SELECT vent.Ventas_Id,vent.Ventas_Total FROM ventas AS vent
-- WHERE vent.Ventas_Total > 1000 OR	 vent.Ventas_Total <1000 
-- WHERE vent.Ventas_Total BETWEEN 1000 AND 2000  
-- ---------------------------------------------------------------------
-- SELECT * FROM ventas v
-- WHERE v.Ventas_Fecha > '2018-01-02' AND v.Ventas_Fecha<'2018-01-04' 
-- WHERE year(v.Ventas_Fecha) = 2018
-- WHERE month(v.Ventas_Fecha) > 01
-- WHERE YEAR(v.Ventas_Fecha)=2018 AND MONTH(v.Ventas_Fecha) = 02
-- WHERE v.Ventas_Fecha BETWEEN '2018-02-01' AND '2018-02-28'
-- ------------------------------------------------------------------------------
SELECT * 
FROM ventas_detalle vd
WHERE vd.VD_ProdId = 1128
