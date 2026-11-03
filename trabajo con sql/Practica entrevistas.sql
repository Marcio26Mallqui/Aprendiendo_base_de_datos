CREATE TABLE numeros(
	IDnumeros INT PRIMARY KEY IDENTITY(1,1),
	valor INT 
)

INSERT INTO dbo.numeros (valor)
VALUES (17),
(3),
(25),
(9),
(41),
(6),
(13),
(28),
(2),
(33),
(19),
(11),
(7),
(22),
(39),
(5),
(31),
(14),
(8),
(26);

SELECT * FROM dbo.numeros;

UPDATE dbo.numeros 
SET valor = 2
WHERE IDnumeros = 1; 

SELECT valor, COUNT(*) AS conteo 
FROM dbo.numeros
GROUP BY valor
HAVING COUNT(*) > 1;

DELETE FROM dbo.numeros
WHERE IDnumeros = 20;


DECLARE @a INT
SET @a = 1
SELECT  @a;




