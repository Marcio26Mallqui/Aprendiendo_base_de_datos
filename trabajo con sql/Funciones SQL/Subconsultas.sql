--  El curso con la tarifa más elevada.

SELECT MAX(ma.Mcostolab) FROM materia ma

SELECT ma.Mnomateria, ma.Mnombre FROM materia ma
WHERE ma.Mcostolab = (SELECT MAX(ma.Mcostolab) FROM materia ma)


