-- Funciones numéricas y matemáticas

select 10/2;

select mod(11,2);

select 10.54;

select ROUND(10.54);

select SQRT(12);

select PI();

select RANDOM();

select ABS(-15);

select ROUND(10.5467,2);

select COUNT(*)
from tb_categorias tc;


select SUM(tc.codigo_ca )
from tb_categorias tc;

select MAX(tc.codigo_ca )
from tb_categorias tc;

select MIN(tc.codigo_ca )
from tb_categorias tc;




