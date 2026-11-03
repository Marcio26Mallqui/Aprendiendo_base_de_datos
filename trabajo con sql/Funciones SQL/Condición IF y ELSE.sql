SELECT * FROM materia ma

SELECT COUNT(*) AS 'Número de registros de la tabla Materia' FROM materia ma

-- qUEREMOS VER SI HAY MÁS DE 8 MATERIAS

DECLARE @nummaterias INT
SELECT @nummaterias = COUNT(*) FROM materia ma
IF @nummaterias > 8
BEGIN
	PRINT('Si hay más de 8 materias')
	PRINT('Total de materias:')
	PRINT(@nummaterias)
END

-- qUEREMOS VER SI HAY MÁS DE 20 MATERIAS

DECLARE @numateriass INT
SELECT @numateriass = COUNT(*) FROM materia ma

IF @numateriass > 20
BEGIN 
	PRINT 'Hay más de 20 materias.'
END

ELSE
BEGIN
	PRINT 'No hay más de 20 materias.'
END



