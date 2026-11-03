-- TABLAS TEMPORALES

-- SELECT INTO
-- Utilizado para crear tablas.
-- Solo existen en una sesión.

SELECT ma.Mnomateria, ma.Mnombre, ma.Mnocarrera FROM materia ma

SELECT [Mnomateria]
		, [Mnombre] 
	INTO #tempComputacion2 
	FROM [materia]
    WHERE Mnocarrera =32

SELECT * FROM #tempComputacion2



