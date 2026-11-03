BEGIN TRY
	{Instrucciones de SQL}
END TRY
BEGIN CATCH
	[{Instrucciones de SQL}]
END CATCH

-----------------------------------------------------------
BEGIN TRY
	SELECT 1/0
	SELECT 1
END TRY
BEGIN CATCH
	SELECT 'Eso no se puede hacer.'
END CATCH

-----------------------------------------------------------
BEGIN TRY
	SELECT 1
END TRY
BEGIN CATCH
	SELECT 'Eso no se puede hacer.'
END CATCH



