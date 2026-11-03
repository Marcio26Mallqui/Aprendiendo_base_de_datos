-- Traer la cantidad de productos que 
-- han sido vendidos.
SELECT * FROM productos;
SELECT * FROM ventas;
SELECT * FROM ventas_detalle

SELECT prod.Prod_Id,prod.Prod_Descripcion,COUNT(vd.VD_Cantidad) FROM ventas_detalle vd
JOIN productos prod ON prod.Prod_Id = vd.VD_ProdId
GROUP BY prod.Prod_Id,prod.Prod_Descripcion

-- Traer el total vendido de los productos que fueron
-- vendidos entre el 02-01-1018 y  el 10-01-2018 y cuyo 
-- proveedor se encuentre entre 2 y 100

SELECT * FROM ventas;
SELECT * FROM proveedores;
SELECT * FROM ventas_detalle vd;
SELECT * FROM productos

SELECT SUM(vd.VD_Cantidad * vd.VD_Precio) FROM ventas vt 
JOIN ventas_detalle vd ON vt.Ventas_Id = vd.VD_VentasId
JOIN productos prod ON prod.Prod_Id = vd.VD_ProdId
JOIN proveedores prov ON prov.Prov_Id = prod.Prod_ProvId
WHERE (vt.Ventas_Fecha BETWEEN '2018-01-02' AND '2018-01-10') AND (prov.Prov_Id BETWEEN 2 AND 100)


-- Traer la factura de valor máximo, que haya tenido en 
-- sus items vendidos, el producto 656

SELECT * FROM ventas;
SELECT * FROM ventas_detalle;

SELECT MAX(vt.Ventas_Total) FROM ventas_detalle vd
JOIN ventas vt ON vt.Ventas_Id = vd.VD_VentasId
WHERE vd.VD_ProdId = 656
curso