ALTER TABLE <tabla>
ADD CONSTRAINT <nombre>
CHECK <valiacion>


-- Escribe lo siguiente para crear una restricción en la tabla de materia
-- en donde necesitas que el costo sea menor a 600.
-- asegurate que no tengas registros donde el costo sea menor a 600 o no podras
-- crear esta restricción

SELECT * FROM cmateria

DELETE FROM cmateria -- eliminar los registros de la tabla.

ALTER TABLE cmateria
ADD CONSTRAINT CN_COSTO
CHECK (MCOSTOLAB < 600)

INSERT INTO [cmateria] VALUES('1', '1', '1', 630, 0, '32')

INSERT INTO [cmateria]  VALUES('2','2','2',500,0,'31')



