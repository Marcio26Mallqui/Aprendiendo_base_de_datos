-- StORED PROCEDURES	

CREATE PROCEDURE <nombre de procedimiento>
AS
<Código>

SELECT * FROM carrera

SELECT ma.Mnomateria, ma.Mnombre, ca.Cnocarrera, ca.Cnombre FROM materia ma
INNER JOIN carrera ca ON ma.Mnocarrera = ca.Cnocarrera
WHERE ca.Cnocarrera = 32

CREATE PROCEDURE getMateriasComputacion
AS
SELECT * FROM materia ma WHERE ma.Mnocarrera = '32' 

execute getMateriasComputacion --ejecutar el store procedure

-- Eliminar STORE PROCEDURE
DROP PROCEDURE getMateriasComputacion

-- Pasando parametros al STORED PROCEDURE

CREATE PROCEDURE getMaterias @carrera CHAR(4) -- PARÁMETRO @carrera CHAR(4)
AS
SELECT * FROM materia ma Where ma.Mnocarrera = @carrera

EXECUTE getMaterias @carrera = '40'

-- STORED PROCEDURE cuando tienes un nombre parcial, digamos 
-- solo recuerdas un alumno con apellido 'Biset' o 'Bisset'

SELECT * FROM estudian est
WHERE est.Enombre LIKE '%Bis%'

CREATE PROCEDURE getNombre @apellido VARCHAR(40)
AS
SELECT * FROM estudian est WHERE est.Enombre LIKE '%'+ @apellido + '%'

EXECUTE getNombre  @apellido = 'dro'

-- Parametros por defecto al STORED PROCEDURE

CREATE PROCEDURE getMaterias_New @materias_new  CHAR(4) ='32'
AS
SELECT * FROM materia ma WHERE ma.Mnocarrera = @materias_new  

EXECUTE getMaterias_New


-- Parámetros multiples

SELECT * FROM materia

CREATE PROCEDURE getMariascredit @carrera CHAR(4), @credit INT
AS
SELECT * FROM materia ma WHERE ma.Mnocarrera = @carrera AND ma.Mcred = @credit 

EXEC getMariascredit @carrera = '32', @credit = 10

-- Parámetros de salida
 
 CREATE PROCEDURE getCOUNTMaterias @carrera CHAR(4), @Totalregistros INT OUT
 AS
 SELECT @Totalregistros = COUNT(*) FROM materia ma WHERE ma.Mnocarrera = @carrera

 DECLARE @totalmaterias2 INT
 EXECUTE getCOUNTMaterias @carrera = '32', @Totalregistros = @totalmaterias2 OUT
 SELECT @totalmaterias2

 DECLARE @totalmaterias2 INT
 EXECUTE getCOUNTMaterias  '32', @totalmaterias2 OUT
 SELECT @totalmaterias2


 
 DECLARE @totalmaterias2 INT
 EXECUTE getCOUNTMaterias  '32'
 SELECT @totalmaterias2







