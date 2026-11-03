-- Variable

DECLARE @calificacion INT
SET @calificacion = 10
PRINT  @calificacion

SELECT * FROM materia

DECLARE @costolabmax DECIMAL, @costolabmin DECIMAL
SELECT @costolabmax = MAX(ma.Mcostolab), @costolabmin = MIN(ma.Mcostolab)  FROM materia ma
SELECT @costolabmax AS 'Costo max', @costolabmin AS 'Cosoto min'

SELECT * FROM estudian;

DECLARE @telefono CHAR(10)
SELECT @telefono = (SELECT est.Etelefono FROM estudian est WHERE est.Enocarrera='38')
SELECT @telefono;


DECLARE @enombre VARCHAR(40)
SET @enombre = '%Sau%'
print @enombre

SELECT * FROM estudian est
WHERE est.Enombre LIKE @enombre 


SELECT * FROM carrera

DECLARE @nomcarrera VARCHAR(15)
SET @nomcarrera = '%ca'
PRINT @nomcarrera

SELECT * FROM carrera carr
WHERE carr.Cnombre LIKE @nomcarrera


-- IF

SELECT * FROM academic

-- Otorga los profesores de número de curso 38.

SELECT * FROM materia

DECLARE @numeromaterias INT
SELECT @numeromaterias = COUNT(*) FROM materia ma

IF @numeromaterias > 10
BEGIN 
	PRINT 'Hay más de 10 materias'
END
ELSE 
BEGIN
	PRINT 'hay menos de 10 materias'
END

-- While

DECLARE @vcount INT
SET @vcount = 1

WHILE @vcount <=5
BEGIN
	PRINT @vcount
	SET @vcount = @vcount+1
END


DECLARE @vcount2 INT
SET @vcount2 = 1
WHILE @vcount2 <= 10
BEGIN 
	PRINT @vcount2 * 2
	SET @vcount2 = @vcount2 + 1
END

DECLARE @vcount3 INT
SET @vcount3 = 0
WHILE @vcount3 <= 10
BEGIN 
	PRINT @vcount3 * 3
	SET @vcount3 = @vcount3 + 1
END

DECLARE @vcount3 INT
SET @vcount3 = 1
WHILE @vcount3 <= 20
BEGIN 
	PRINT @vcount3 
	SET @vcount3 = @vcount3 + 2
END

-- BREAK

DECLARE @count4 INT
SET @count4 = 3

WHILE @count4 <= 10
BEGIN
	IF @count4 = 8 BREAK
	PRINT @count4
	SET @count4 = @count4 + 1
END


DECLARE @count5 INT
SET @count5 = 1
WHILE @count5 <= 10
BEGIN 
	IF @count5 = 8 BREAK
	PRINT @count5*2
	SET @count5 = @count5 + 1
END

-- Check

SELECT * FROM cmateria cma

ALTER TABLE cmateria
ADD CONSTRAINT primercheck1
CHECK (Mcred < 35)

INSERT INTO cmateria VALUES('0563','SQLlite', 25, 360.00, '79')

INSERT INTO cmateria VALUES('0545','Posgress', 34, 430.00, '39')

INSERT INTO cmateria VALUES('0321','SQLup', 36, 360.00, '89')


-- While

DECLARE @count8 INT
SET @count8 = 1
WHILE @count8 <= 7
BEGIN
	PRINT @count8
	SET @count8 = @count8 + 1 
END



-- CHECK

SELECT * FROM cmateria cma

ALTER TABLE cmateria
ADD CONSTRAINT segundo_propio
CHECK (Mcostolab BETWEEN 45 AND 700) 

INSERT INTO cmateria  VALUES ('0689', 'Física cuántica', 15, 650.00, '80')

INSERT INTO cmateria  VALUES ('0700', 'Física cuántica 2', 15, 780.00, '80')

-- Stored Procecures o procedimientos almacenados

SELECT * FROM carrera


CREATE PROCEDURE getcarreramacanica
AS
SELECT * FROM carrera carr WHERE carr.Cnocarrera = 40

EXECUTE getcarreramacanica

SELECT * FROM estudian

CREATE PROCEDURE studentcarreracomputacion
AS
SELECT * FROM estudian est WHERE est.Enocarrera = 32 

EXECUTE studentcarreracomputacion


SELECT * FROM estudian

-- con una variable
CREATE PROCEDURE studentcarrera @enocarrera CHAR(4)
AS
SELECT * FROM estudian est WHERE est.Enocarrera = @enocarrera

EXECUTE studentcarrera @enocarrera = '38'


-- Parámetros por defecto

SELECT * FROM academic

CREATE PROCEDURE getteachercomputacion @anocarrera CHAR(4) = '32'
AS
SELECT * FROM academic acad WHERE acad.Anocarrera = @anocarrera

EXECUTE getteachercomputacion


-- multiples Parámetros

SELECT * FROM academic 

CREATE PROCEDURE getteacher @anocarrera CHAR(4), @anumayuda INT = 2
AS
SELECT * FROM academic acad WHERE acad.Anocarrera = @anocarrera  AND acad.Anumayuda = @anumayuda 

EXECUTE getteacher  @anocarrera = '38'


-- DROP PROCEDURE getCOUNTMaterias

CREATE PROCEDURE getCountmaterias @carrera CHAR(4), @totalregistros INT OUT
AS
SELECT @totalregistros = COUNT(*) FROM materia ma WHERE ma.Mnocarrera = @carrera

DECLARE @totalmaterias2 INT
EXECUTE getCountmaterias @carrera = '32', @totalregistros = @totalmaterias2 OUT 
SELECT @totalmaterias2

-- Tablas temporales

SELECT ma.Mnomateria, ma.Mnombre INTO #tempocomputacion1 FROM materia ma
WHERE ma.Mnocarrera = '32'

SELECT * FROM #tempocomputacion1

SELECT * FROM estudian

SELECT est.Enombre, est.Etelefono INTO #estudiantecomoutacion FROM estudian est
WHERE est.Enocarrera = '32'

SELECT #estudiantecomoutacion.Etelefono FROM #estudiantecomoutacion


-- Tablas especiales inserted y deleted

SELECT * FROM carrera carr

INSERT INTO carrera
OUTPUT INSERTED.Cnocarrera, INSERTED.Cnombre
VALUES ('62', 'Física', 'A302', '79954521'), ('63', 'matemática', 'A305', '7245678')


DELETE FROM carrera
OUTPUT DELETED.Cnocarrera, DELETED.Cnombre
WHERE Cnocarrera IN ('61', '63')

UPDATE carrera SET Cedificio = 'A1500'
OUTPUT DELETED.Cedificio AS 'vieja', INSERTED.Cedificio as 'Nueva'
WHERE Cnocarrera = '62'


-- ------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------

-- Triggers

CREATE TRIGGER TR_CalculateTaxes
	ON cmateria
	AFTER INSERT, UPDATE
AS
BEGIN
	SELECT * FROM inserted
	PRINT('Actualización exitosa')
END

INSERT INTO cmateria(Mnomateria, Mnombre, Mnocarrera)
VALUES ('1', 'Materia de prueba', '32')

SELECT * FROM cmateria


SELECT UPPER(cma.Mnombre) FROM cmateria cma


CREATE TRIGGER mayusculanombre
	ON cmateria
	AFTER INSERT
AS
BEGIN
	SELECT UPPER(ins.Mnombre)  FROM inserted ins
END


INSERT INTO cmateria(Mnomateria, Mnombre, Mnocarrera)
VALUES ('2','hola mundo2', '62')


-- DELETE FROM cmateria
-- WHERE Mnomateria IN ('1','2','3')

-- Store procedure

SELECT * FROM carrera

SELECT * FROM academic

CREATE PROCEDURE getteacherelectronica @anocarrera CHAR(4) = '38'
AS
SELECT * FROM academic acad WHERE acad.Anocarrera = @anocarrera

EXECUTE getteacherelectronica


-- Funciones escalares

CREATE FUNCTION fn_calculacuota (@noMateria CHAR(4))
RETURNS DECIMAL(5,2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @cuota DECIMAL(5,2)

	-- Add the T-SQL statements to compute the return value here
	SELECT @cuota = ma.Mcostolab*0.15 FROM materia ma
	WHERE ma.Mnomateria = @noMateria

	-- Return the result of the function
	RETURN @cuota

END

SELECT * FROM materia ma

SELECT dbo.fn_calculacuota('0028')

SELECT 100* (0.15)


-- Funciones que regresan una tabla
CREATE FUNCTION fn_nomestuidante(@partenombre NVARCHAR(50))
RETURNS TABLE 
AS
RETURN (-- Add the SELECT statement with parameter references here
	SELECT * FROM estudian est
	WHERE est.Enombre LIKE '%'+ @partenombre +'%')

SELECT * FROM estudian

SELECT * FROM dbo.fn_nomestuidante('biss')
-- -------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------

SELECT * FROM academic

CREATE FUNCTION fn_sumasalarialdocente 
(
	-- Add the parameters for the function here
	@anocarrera CHAR(4)
)
RETURNS DECIMAL(5,2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @salariorsuma DECIMAL(5,2)

	-- Add the T-SQL statements to compute the return value here
	SELECT @salariorsuma = SUM(acad.Asueldo) FROM academic acad
	WHERE acad.Anocarrera = @anocarrera	
	-- Return the result of the function
	RETURN @salariorsuma

END

SELECT dbo.fn_sumasalarialdocente('38')




CREATE FUNCTION fn_reduccionsalarialdocente1(@anocarrera CHAR(4))
RETURNS TABLE 
AS
RETURN (
	-- Add the SELECT statement with parameter references here
	SELECT acad.Anombre, acad.Asueldo*0.15 AS 'reducción salarial', acad.Anocarrera FROM academic acad
	WHERE acad.Anocarrera = @anocarrera)

SELECT * FROM dbo.fn_reduccionsalarialdocente1('38')




























































