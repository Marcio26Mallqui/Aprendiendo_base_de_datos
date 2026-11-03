-- ejercicio 2

-- Taer las fechas, números de facturas 
-- y monto total de mis ventas

SELECT vn.Ventas_Fecha, vn.Ventas_NroFactura, vn.Ventas_Total FROM ventas vn

-- Taer los ID de  productos, cantidad y precio de mi detalle de 
-- ventas de los registros donde el precio sea mayor a 0

SELECT * FROM ventas_detalle vdt

SELECT vd.VD_ProdId, vd.VD_Cantidad, vd.VD_Precio FROM ventas_detalle vd
WHERE vd.VD_Precio > 0 


-- Traer el total vendido por fecha de facturas
SELECT * FROM ventas_detalle vd
SELECT * FROM ventas vt

SELECT SUM(vt.Ventas_Total) AS 'Total vendido' , vt.Ventas_Fecha FROM ventas vt
GROUP BY vt.Ventas_Fecha

-- Traer el total cendido por año y mes de fatura

SELECT * FROM ventas vt

SELECT DATE_FORMAT( vt.Ventas_Fecha,'%M') AS 'Mes', DATE_FORMAT( vt.Ventas_Fecha,'%Y') AS 'Año', SUM(vt.Ventas_Total) AS'Venta Total' FROM ventas vt
GROUP BY DATE_FORMAT( vt.Ventas_Fecha,'%M'),DATE_FORMAT( vt.Ventas_Fecha,'%Y')

-- Traer los productos de la tabla productos que pertenezcan al proveedor 62

SELECT prod.Prod_Id, prod.Prod_Descripcion, prod.Prod_ProvId FROM productos prod
WHERE prod.Prod_ProvId =62

-- Traer la lista de productos vendidos  (solo su ID) sin 
-- repeticiones y con el total vendido para cada uno


SELECT vd.VD_ProdId, SUM((vd.VD_Cantidad * vd.VD_Precio)) AS 'Total Vendido' FROM ventas_detalle vd 
GROUP BY vd.VD_ProdId

