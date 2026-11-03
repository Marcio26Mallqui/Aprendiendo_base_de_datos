-- =============================================
-- Author:		Marcio
-- Create date: 23/07/2024
-- Description:	Primer Trigger
-- =============================================
CREATE TRIGGER TR_CalculateTaxes
   ON  cmateria 
   AFTER INSERT, UPDATE
AS 
BEGIN
	SELECT * FROM inserted
	PRINT('Actualización Existosa')

END

-- Inserta valores

INSERT INTO cmateria(Mnomateria, Mnombre, Mnocarrera)
VALUES ('1','Materia de Prueba', '32')

DELETE FROM cmateria

INSERT INTO cmateria(Mnomateria, Mnombre, Mnocarrera)
SELECT ma.Mnomateria, ma.Mnombre, ma.Mnocarrera FROM materia ma
