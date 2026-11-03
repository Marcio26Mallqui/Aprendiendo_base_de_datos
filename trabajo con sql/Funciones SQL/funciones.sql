-- Funciones 

SELECT GETDATE()

-- Funciones calares

-- Crear una función simple para calcular las cuotas, 
-- como un 15 por ciento del costo de la materia.

-- Programmability -- Function -- Sacalar Valued Function


-- =============================================
-- Author:		Marcio
-- Create date: 23/07/2024
-- Description:	Cuotas 15 por ciento
-- =============================================
CREATE FUNCTION fn_calCuota
(
	-- Add the parameters for the function here
	@noMateria CHAR(4) 
)
RETURNS DECIMAL(5,2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @cuota DECIMAL(5,2)

	-- Add the T-SQL statements to compute the return value here
	SELECT @cuota = Mcostolab* 0.15 FROM materia
	WHERE materia.Mnomateria = @noMateria

	-- Return the result of the function
	RETURN @cuota

END
GO
-- cuando creas funciones Microsoft te dice que tienes que poner el 
-- nombre del creador entonces aquí utilizas deve o 

SELECT * FROM materia

SELECT dbo.fn_calCuota('0024')


SELECT 150* 0.15

-- Funciones que regresan tablas

CREATE FUNCTION fn_tablaMaterias()
RETURNS TABLE
AS
RETURN (SELECT * FROM materia)
--
SELECT * FROM fn_tablaMaterias()

SELECT fnmateria.Mnombre FROM fn_tablaMaterias() fnmateria
WHERE fnmateria.Mnomateria = '0024'
-- ---------------------
-- Crear una función de búsqueda en el que pasaras parte del nombre 
-- y regresara los estudiantes que contengan esa cadena en 
-- su nombre.

CREATE FUNCTION fn_nomestudiante(@partenombre NVARCHAR(50))
RETURNS TABLE
AS
RETURN (SELECT * FROM estudian est 
        WHERE est.Enombre LIKE '%'+ @partenombre +'%')

SELECT * FROM fn_nomestudiante('s')

