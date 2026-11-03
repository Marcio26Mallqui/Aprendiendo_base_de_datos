
SELECT vt.Ventas_Fecha AS Fecha, ADDDATE(vt.Ventas_Fecha, 30) AS Fecha_vencimiento 
FROM ventas vt

SELECT DAY(vt.Ventas_Fecha) FROM ventas vt


-- Incriptar datos
SELECT * FROM productos prodtc

SELECT Prod_Descripcion, AES_ENCRYPT(Prod_Descripcion,'Encriptación') AS Encriptado FROM productos prodt

SELECT Prod_Descripcion, AES_DECRYPT(AES_ENCRYPT(Prod_Descripcion,'Encriptación'),'Encriptación') AS Desencriptado FROM productos prodt


SELECT Prod_Descripcion, AES_ENCRYPT(Prod_Descripcion,'Encriptación') AS Encriptado, AES_DECRYPT(AES_ENCRYPT(Prod_Descripcion,'Encriptación'),'Encriptación') 
FROM productos prodt

-- Longitud de las palabras
SELECT Prod_Descripcion, LENGTH(Prod_Descripcion) AS Largo FROM productos prodt

-- Comprensor para Enciptar
SELECT * FROM productos prod

SELECT COMPRESS(prod.Prod_Descripcion) AS Encryptación, AES_ENCRYPT(Prod_Descripcion,'Encrip1') AS Segunda_forma FROM productos prod

SELECT UNCOMPRESS(COMPRESS(prod.Prod_Descripcion)) AS Desencryptación, AES_DECRYPT(AES_ENCRYPT(Prod_Descripcion,'Encrip1'),'Encrip1') AS Segunda_forma FROM productos prod

-- Concatenar

SELECT CONCAT(prodt.Prod_Descripcion, prodt.Prod_Color, prodt.Prod_Precio) FROM productos prodt

SELECT CONCAT_WS(" ",prodt.Prod_Descripcion,prodt.Prod_Color, prodt.Prod_Precio) FROM productos prodt

-- Convertir

SELECT CONVERT('2017-03-15', DATE) AS Hora FROM productos

SELECT CONVERT('01:35:03', TIME) AS Hora1, prodt.Prod_Id FROM productos prodt
-- ----------------------------------------------

SELECT * FROM productos prodt
WHERE LENGTH(prodt.Prod_Descripcion) > 50

-- -------------------------------------------------------
SELECT NOW()

SELECT DATEDIFF(vt.Ventas_Fecha, NOW()) AS Intervalo FROM ventas vt

-- ------------------------------------------------------------

SELECT DATE_FORMAT(vt.Ventas_Fecha, "%Y > mes %m (%d)") FROM ventas vt


SELECT AES_DECRYPT(AES_ENCRYPT(Prod_Descripcion,'clave'),'clave'),AES_ENCRYPT(Prod_Descripcion,'clave') FROM productos prod

SELECT vt.Ventas_Fecha,ADDDATE(vt.Ventas_Fecha, 25) FROM ventas vt

SELECT DATE_FORMAT(vt.Ventas_Fecha, "%Y- %M -%d") FROM ventas vt

