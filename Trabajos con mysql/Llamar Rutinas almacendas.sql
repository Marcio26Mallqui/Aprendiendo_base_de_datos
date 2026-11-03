-- Procedimiento

CALL BorroAlumno(2);

CALL InsertoAlumnos(3,'Marcos');

CALL MaximaVenta();

-- Funciones

SELECT GananciaVentas(2018,1) AS Gananacia

SELECT UtilidadTotal('2018-01-01','2018-01-31')

CALL CodigosABC('2018-01-01','2018-01-31')

SELECT prod.Prod_Id, prod.Prod_ABC FROM productos prod
WHERE prod.Prod_ABC = 'A'

