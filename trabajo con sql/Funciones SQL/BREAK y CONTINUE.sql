DECLARE @count INT -- declarando una variable
SET @count = 1

WHILE @count <= 10
BEGIN
	IF @count = 5 BREAK 
	PRINT @count
	SET @count = @count + 1
END
-- BREAK

DECLARE @count INT -- declarando una variable
SET @count = 3

WHILE @count <= 10
BEGIN
	IF @count = 5 BREAK 
	PRINT @count
	SET @count = @count + 1
END

-- CONTINUE

DECLARE @count INT -- declarando una variable
SET @count = 3

WHILE @count <= 10
BEGIN
	IF @count = 5 CONTINUE 
	PRINT @count
	SET @count = @count + 1
END
-- Bucle infinito cuando @count = 5 pro siempre..

DECLARE @count INT -- declarando una variable
SET @count = 1

WHILE @count <= 10
BEGIN
	IF @count = 5 
	BEGIN 
	SET @count = @count+1
	CONTINUE
	END
	PRINT @count
	SET @count = @count + 1
END



