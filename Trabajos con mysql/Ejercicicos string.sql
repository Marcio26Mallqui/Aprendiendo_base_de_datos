-- Traer todos los artículos cuya descripción comience con la palabra subterraneo

SELECT prod.Prod_Id AS código, prod.Prod_Descripcion AS descripción FROM productos prod
WHERE prod.Prod_Descripcion LIKE 'SUBTERRANEO%'

-- Traer todos los artículos que en su descripción o color o nombre de proveedor
-- tenga el string 'FERRO' 
SELECT * FROM productos prod;
SELECT * FROM proveedores prov

SELECT prod.Prod_Descripcion, prod.Prod_Color, prov.Prov_Nombre FROM productos prod
JOIN proveedores prov ON prov.Prov_Id = prod.Prod_ProvId
WHERE CONCAT(prod.Prod_Descripcion ,prod.Prod_Color,prov.Prov_Nombre) LIKE '%FERRO%'  

-- Traer todos los artículos cuya descripción tenga el string
-- 'CINTA' y que tenga ventas realizadas

SELECT * FROM productos prod;
SELECT * FROM ventas vent;
SELECT * FROM ventas_detalle ventd;

SELECT prod.Prod_Id,prod.Prod_Descripcion, SUM(vendt.VD_Cantidad) FROM productos prod
JOIN ventas_detalle vendt ON vendt.VD_ProdId = prod.Prod_Id
WHERE prod.Prod_Descripcion LIKE '%CINTA%'  AND vendt.VD_Cantidad > 0
GROUP BY prod.Prod_Id
