-- Ejercicio 2

-- Traer fecha de factura, número de factura, ID del cliente,
-- Nombre del cliente y monto total vendido.
SELECT * FROM ventas vtas
SELECT * FROM clientes cl
SELECT vtas.Ventas_Fecha, vtas.Ventas_NroFactura, cl.Cli_Id,cl.Cli_RazonSocial, vtas.Ventas_Total FROM ventas vtas
JOIN clientes cl  ON cl.Cli_Id = vtas.Ventas_CliId

-- Traer fecha de facturas,  Nro. de factura, ID. de producto, 
-- descripción de producto, ID de proveedor, Nombre de Proveedor, 
-- Cantidad, precio unitario y Parcial (cantidad * precio).
 
SELECT * FROM productos prod;
SELECT * FROM ventas vent;
SELECT * FROM proveedores prov;
SELECT * FROM ventas_detalle ventd

SELECT vt.Ventas_Fecha, 
		vt.Ventas_NroFactura, 
		prod.Prod_Id,
		prod.Prod_Descripcion,
		prov.Prov_Id,
		prov.Prov_Nombre,
		ventd.VD_Cantidad,
		ventd.VD_Precio AS 'Precio Unitario',
		(ventd.VD_Cantidad * ventd.VD_Precio) AS 'Precio parcial' 
FROM ventas_detalle ventd
JOIN productos prod ON prod.Prod_Id = ventd.VD_ProdId
JOIN proveedores prov ON prov.Prov_Id = prod.Prod_ProvId
JOIN ventas vt ON vt.Ventas_Id = ventd.VD_VentasId
-- -------------------------------------------------------------------------

-- Traer todos los productos que hayan sido vendidos entre el
-- 14/ 01/ 2018 y el '16-01-2018' (sin repetir) y calculando 
-- la cantidad de unidades vendidas

SELECT* FROM productos prod;
SELECT * FROM ventas vent;
SELECT * FROM ventas_detalle ventd

SELECT DISTINCT(prod.Prod_Id), 
		prod.Prod_Descripcion, 
 		SUM(ventd.VD_Cantidad) AS 'Cantidad de undades vendidas' 
FROM ventas_detalle ventd
JOIN ventas vent ON vent.Ventas_Id = ventd.VD_VentasId
JOIN productos prod ON prod.Prod_Id = ventd.VD_ProdId
WHERE vent.Ventas_Fecha BETWEEN '2018-01-14' AND '2018-01-16'
GROUP BY prod.Prod_Id

SELECT DISTINCT(prod.Prod_Id), 
		prod.Prod_Descripcion, 
 		SUM(ventd.VD_Cantidad) AS 'Cantidad de undades vendidas' 
FROM productos prod 
JOIN ventas_detalle ventd ON prod.Prod_Id = ventd.VD_ProdId
JOIN ventas vent ON vent.Ventas_Id = ventd.VD_VentasId
WHERE vent.Ventas_Fecha BETWEEN '2018-01-14' AND '2018-01-16'
GROUP BY prod.Prod_Id



