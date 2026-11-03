-- SELECT * FROM ventas v
-- WHERE v.Ventas_Fecha = '2018-01-02'
-- -----------------------------------------------------------------
-- ---------------- COUNT ------------------------------------
-- SELECT COUNT(*) AS registros FROM ventas v
-- WHERE v.Ventas_Fecha = '2018-01-02'
-- ------------------------------------------------------------
-- SELECT COUNT(*) FROM ventas v
-- ---------------------------------------------------------------------

-- -------------------------- SUMA (SUM('campo o columna'))--------
-- SELECT SUM(v.Ventas_Total) AS Suma_total FROM ventas v
-- WHERE YEAR(v.Ventas_Fecha) = 2018 AND MONTH(v.Ventas_Fecha) = 01

-- ---------------------------------------------------------------
-- ------------------------- MIN('columna o campo')-----------------

-- SELECT MIN(v.Ventas_Total) AS Venta_Mínima_2018_01 FROM ventas v
-- WHERE YEAR(v.Ventas_Fecha) = 2018 AND MONTH(v.Ventas_Fecha) = 01

-- --------------------------- MAX(columna o campo)--------
-- SELECT MAX(v.Ventas_Total) AS Venta_máxima_2018_01 FROM ventas v
-- WHERE YEAR(v.Ventas_Fecha) = 2018 AND MONTH(v.Ventas_Fecha)

-- --------------------------- AVG(columna o campo)--------
SELECT AVG(v.Ventas_Total) AS Promedio_2018_01 FROM ventas v
WHERE YEAR(v.Ventas_Fecha) = 2018 AND MONTH(v.Ventas_Fecha) = 01



