DECLARE @costo INT
SET @costo  = 100
PRINT @costo


SELECT * FROM materia ma
WHERE ma.Mcostolab = @costo


DECLARE @varlike CHAR(5)
SET @varlike = '%dro%'

SELECT * FROM estudian est
WHERE est.Enombre LIKE @varlike
