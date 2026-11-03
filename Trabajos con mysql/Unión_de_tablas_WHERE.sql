-- Unióm de tablas con la clausula WHERE
SELECT v.Ventas_NroFactura,v.Ventas_CliId, cli.Cli_RazonSocial, v.Ventas_Fecha,vd.VD_ProdId, prod.Prod_Descripcion, prov.Prov_Id, prov.Prov_Nombre
FROM ventas AS v, clientes AS cli, ventas_detalle AS vd, productos AS prod, proveedores AS prov
WHERE v.Ventas_CliId = cli.Cli_Id AND v.Ventas_CliId >1 AND 
      vd.VD_VentasId = v.Ventas_Id AND vd.VD_ProdId = prod.Prod_Id AND prod.Prod_ProvId = prov.Prov_Id


