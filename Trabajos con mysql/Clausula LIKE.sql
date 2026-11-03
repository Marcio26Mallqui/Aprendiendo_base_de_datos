-- LIKE para Textos

-- SELECT prod.Prod_Id, prod.Prod_Descripcion, prod.Prod_Color, prod.Prod_Precio 
-- FROM productos prod
-- WHERE CONCAT(prod.Prod_Descripcion, prod.Prod_Color) LIKE "%NEGRO%"

-- SELECT prod.Prod_Id, prod.Prod_Descripcion, prod.Prod_Color, prod.Prod_Precio 
-- FROM productos prod
-- WHERE CONCAT(prod.Prod_Descripcion, prod.Prod_Color) LIKE "%NEGRO%"

SELECT prod.Prod_Id, prod.Prod_Descripcion, prod.Prod_Color, prod.Prod_Precio 
FROM productos prod
WHERE prod.Prod_Descripcion LIKE "%TORNILLO%"
