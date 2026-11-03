SELECT ClienteId, Fecha FROM Ordenes --REPASO DE EJERCCIOS	
WHERE Fecha <= '20171031' 

--SELECT * FROM Paises
SELECT Nombre AS Pais
       , Codigo AS Abreviatura
	   , NombreLocal AS Nomenclaturalocal 
FROM Paises
WHERE Region = 'Polynesia'


SELECT Id FROM Ciudades
WHERE Nombre = 'Bari' -- Id: 1473

--SELECT *  FROM Clientes
--SELECT Nombre, Apellido, Direccion  FROM Clientes
SELECT 'Nombre :'+ ' ' + Nombre +', '+'Apellido :'+ ' ' +  Apellido +', '+'Dirección :' + ' ' +  Direccion AS datos_completos FROM Clientes
WHERE CiudadId = '1473'


SELECT *FROM Productos

SELECT Costo,
       Precio,
	   (Costo * 30)/100 AS Costdescuendode30porciento,
	   Precio - (Costo * 30)/100 AS Gananciaconcostde30porciento,
	   Precio - Costo AS Ganciaconcostoregular,
	   (Precio - Costo) - ((Precio - Costo)*10)/100
FROM Productos
