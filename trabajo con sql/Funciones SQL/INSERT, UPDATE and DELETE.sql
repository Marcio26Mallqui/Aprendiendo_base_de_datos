-- INSERT

INSERT INTO materia
VALUES ('0177', 'Programación con SQL', 6, 100, 32)

INSERT materia  (materia.Mnomateria, materia.Mnombre, materia.Mnocarrera)
VALUES ('0569', 'Progrmación JAVA',32)

SELECT * FROM materia ma

SELECT * FROM carrera


-- Inserción de valores NULL

INSERT INTO materia
VALUES ('0178', 'SQL dinámico', NULL, NULL, '32')

-- La sentancia INSERT multifila

INSERT INTO cmateria
SELECT * FROM materia
WHERE materia.Mnocarrera =32
-- la consulta no puede tener la cláusula ORDER BY, JOIN


SELECT * FROM cmateria

DELETE FROM cmateria


INSERT INTO cmateria
SELECT * FROM materia
WHERE materia.Mnocarrera =32

-- Supresión de datos. La sentencia DELETE

SELECT * FROM cmateria cma
WHERE cma.Mnomateria LIKE '%00%'

DELETE FROM cmateria
WHERE cmateria.Mnomateria LIKE '%00%'

SELECT * FROM cmateria

DELETE FROM cmateria -- Borra todo los registros de la tabla cmateri


-- Modificaciones de datos, la sentencia UPDATE
INSERT INTO cmateria
SELECT * FROM materia
WHERE materia.Mnomateria = '0138'

SELECT * FROM cmateria

UPDATE cmateria
SET cmateria.Mcostolab = 150.00
WHERE cmateria.Mnomateria = '0177'


UPDATE cmateria
SET cmateria.Mcred = cmateria.Mcred +10


