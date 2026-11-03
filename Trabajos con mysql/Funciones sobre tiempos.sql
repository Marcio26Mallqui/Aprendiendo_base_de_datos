SELECT CURRENT_DATE;
SELECT CURRENT_TIME;
SELECT CURRENT_TIMESTAMP;
SELECT DATABASE(); -- en que base datos se esta trabajando
SELECT CURRENT_USER -- Usuario que está conecado a la base de datos.

SELECT DATEDIFF('2023-06-25', '2023-01-01') AS 'Días desde el comienzo del año'

SELECT DATEDIFF('2023-06-25',v.Ventas_Fecha) AS 'ANtiguedad en días', v.Ventas_NroFactura  FROM ventas v


SELECT DAYOFWEEK(CURRENT_DATE) AS 'Día de la semana'

SUNDAY 1
Monday 2
Thuesday 3
Wednesday 4
Thursday 5
Friday 6
Saturday 7 
