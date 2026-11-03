-- Campos JSON en MySQL

INSERT INTO productos (Prod_Descripcion,Prod_Propiedades) VALUES 
('Producto con JSON', '{"propiedades": {"electrico": true, "garantia": true, "nuevo":false, "presentaFallas": true}}')
-- --------------------------------------------------------------------------------------------------------------------------

SELECT prod.Prod_Id, prod.Prod_Descripcion, prod.Prod_Propiedades -> '$.propiedades.electrico' AS Electrico  FROM productos prod

-- ----------------------------------------------------------------------------------------------------------------------------
-- Para que reemplacemos algún valor

UPDATE productos prod SET prod.Prod_Propiedades = JSON_REPLACE(prod.Prod_Propiedades, '$.propiedades.electrico','false')
WHERE Prod_Id = 7012 

-- -----------------------------------------------------------------------------------------------------------------------

INSERT INTO productos (Prod_Descripcion,Prod_Propiedades) VALUES 
('Producto con JSON1', '{"propiedades": {"nuevo": true, "garantia": true, "electrico": true}}')

-- Extraer propiedades

SELECT prod.Prod_Id, prod.Prod_Descripcion FROM productos prod
WHERE JSON_EXTRACT(prod.Prod_Propiedades, '$.propiedades.electrico') = true

-- Quitar del campo JSON uno de los valores

UPDATE productos prod SET prod.Prod_Propiedades = JSON_REMOVE(prod.Prod_Propiedades, '$.propiedades.presentaFallas')
WHERE prod.Prod_Id = 7012 












