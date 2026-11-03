-- Funciones fecha y hora

select CURRENT_DATE;

select CURRENT_TIME;

select CURRENT_TIMESTAMP;

-- extract(valor from timestamp)

select EXTRACT( year from CURRENT_DATE);

select EXTRACT( MONTH from CURRENT_DATE);

select EXTRACT(DAY from CURRENT_DATE);

select EXTRACT(HOUR from CURRENT_TIME);

select EXTRACT(MINUTE from CURRENT_TIME);

select EXTRACT(second from CURRENT_TIME);

--
-- En que día de la semana me encuentro

select EXTRACT(DOW from CURRENT_DATE);

-- En que número de la semana me encuentro

select EXTRACT(WEEK from CURRENT_DATE);


select *
from tb_articulos ta; 




