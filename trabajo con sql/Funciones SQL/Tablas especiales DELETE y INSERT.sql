-- INSERTED y DELETED
-- OUTPUT

-- veamos primero la tabla INSERTES que es usada cuando insertamos
-- sus sintaxis es la siguiente,
-- la forma en que puedo recordarlo facilmente
-- es un INSERT regular, con la cláusula OUTPUT en medio de INSERT 

INSERT [INTO] <table1> (<col1>,<col2>)
OUTPUT INSERTED.<col1>, INSERTED.<col2>
VALUES (<value1>,<value2>);

-- Ejemplo, agrega una nueva y despliega los valores insertados:

SELECT * FROM carrera

INSERT INTO carrera 
OUTPUT INSERTED.Cnocarrera, INSERTED.Cnombre
VALUES ('50', 'Derecho','A302', '79953452');

-- La tabla DELETED, su sintaxis con DELETE es igual a la sentencia DELETED regular
-- y agrgas OUTPUT.

DELETE [FROM] <tabla1>
OUTPUT DELETED.<col1>, DELETED.<col2>
WHERE <criteria>

-- Ejemplo: Borra la metria gregada.
-- Despliega algunas columnas de la tabla DELETED.

SELECT * FROM carrera

DELETE FROM carrera
OUTPUT DELETED.Cnocarrera, DELETED.Cnombre
WHERE Cnocarrera = '50'

-- Por ultimo veamos como DELETED e INSERTED trabajan con UPDATE
-- Como mencione  antes, no existe una tabla UPDATE, INSERT tenemos 
-- y DELETED tendra los volores originales.


UPDATE <table1>  SET <col1> = <value>
OUTPUT DELETED.<col1>, INSERTED.<col1>
WHERE <criteria>

UPDATE carrera  SET Cedificio = 'A1000'
OUTPUT DELETED.Cedificio AS 'vieja', INSERTED.Cedificio AS 'nueva'
WHERE Cnocarrera = '50'






















