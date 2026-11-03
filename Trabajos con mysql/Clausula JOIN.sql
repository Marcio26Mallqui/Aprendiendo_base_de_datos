-- Unión de tablas con los JOIN
SELECT v.Ventas_NroFactura, cl.Cli_Id, cl.Cli_RazonSocial, prod.Prod_Id, prod.Prod_Descripcion FROM productos prod
	JOIN ventas_detalle vd ON vd.VD_ProdId = prod.Prod_Id AND vd.VD_Costo > 1000
	JOIN proveedores pr ON prod.Prod_ProvId = pr.Prov_Id AND pr.Prov_Status = 1
	JOIN ventas v ON vd.VD_VentasId = v.Ventas_Id AND v.Ventas_Fecha BETWEEN '2018-01-22' AND '2018-01-24'
	JOIN clientes cl ON v.Ventas_CliId = cl.Cli_Id




