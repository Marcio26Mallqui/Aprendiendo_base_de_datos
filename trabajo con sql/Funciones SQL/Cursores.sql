-- Cursores

-- Necesitas declarar variables que van a contener los valores de 
-- las columnas leidas.

-- Para simplificar solamente leer el número, nombre y el costo 
-- de la materia. 

DECLARE @numero CHAR(4), @nombre Varchar(50), @costo decimal(5,2)

-- Para crear un cursor, 
-- En una de sus formas mas sencillas, simplemente usas
-- DECLARE <nombre>  CURSOR
-- FOR <sentencia select>

DECLARE materiasconputacion CURSOR
FOR SELECT ma.Mnomateria, ma.Mnombre, ma.Mcostolab FROM materia ma 
WHERE ma.Mnocarrera =32

-- Abrir el cursor 
-- OPEN <nombre del cursor>

OPEN materiasconputacion

-- La primera acción es obtener el primer registro...
-- usa FETCH NEXT FROM <cursor>
-- al leer le dices que variables usaras para guardar
-- los valores de cada.

FETCH NEXT FROM materiasconputacion
INTO @numero, @nombre, @costo

-- y ahora necesitmamos crear un bucle para leer cada registro
-- hasta que ya no haya mas registros
-- la forma de saber si FETCH fue exitoso al leer el registro es preguntar
-- es preguntar por @@FETCH_STATUS = 0
-- cualquier otro valor de FETCH_STATUS indica que ya no hay registros
-- o existe un problema al leerlos.

WHILE @@FETCH_STATUS = 0
BEGIN
	-- Logica
	SELECT 'La materia' + @numero + ' - ' + @nombre + ' cuesta: ' + CONVERT(varchar(10), @costo)
	-- antes de continuar con el bucle,
	-- tratar de leer otro registro
	-- para continuar el bucle con el nuevo registro.
	FETCH NEXT FROM materiasconputacion
	INTO @numero, @nombre, @costo
END
-- Cerrar el cursor
CLOSE materiasconputacion
-- Como buena practica borrar de la memoria
DEALLOCATE materiasconputacion



-- DECLARE @tempo INT
-- SELECT @tempo = COUNT(*) FROM materia

-- SELECT @tempo


