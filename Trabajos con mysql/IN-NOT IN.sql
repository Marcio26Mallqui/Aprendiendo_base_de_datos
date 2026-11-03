-- IN / NOT IN
-- -------------------------------------------------------
-- --SELECT * FROM productos prod
-- --WHERE prod.Prod_Id IN (4,8,10,16)
-- ----------------------------------------------------------
-- SELECT * FROM productos prod
-- WHERE prod.Prod_Id NOT IN (4,8,10,16)
-- -------------------------------------------------------

-- SELECT * FROM ventas_detalle vd
-- -------------------------------------------------------------
-- Productos que no fueron vendidos

-- SELECT DISTINCTROW(vd.VD_ProdId) FROM ventas_detalle vd

-- SELECT * FROM productos prod
-- WHERE prod.Prod_Id NOT IN (SELECT DISTINCTROW(vd.VD_ProdId) FROM ventas_detalle vd)
-- -----------------------------------------------------------------
SELECT * FROM productos prod
WHERE prod.Prod_Id IN (SELECT DISTINCTROW(vd.VD_ProdId) AS producto FROM ventas_detalle vd)

