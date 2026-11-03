-- SELECT

select * from public.tb_categorias tc;

-- Los operadores aritméticos permiten 
-- realizar cálculos con valores numéricos.

select 10 + 4;
select 30 * 3;
select 40 - 2;
select 10 / 5;
select 10 / 3;
select 11 % 2; -- residuo
select 12 % 2;

-- Operadores de comparación

select 2 > 5;
select 1 < 5;
select 2>=3;
select 7<=6;
select 2 = 2;
select 2 != 5;
select 1<>2;

-- Operadores Lógicos

select 2 = 2 and 3 = 5; 
select 4 = 4 and 5 = 5;
select 3 > 5 and 2 < 3;
select 3 > 5 or 2 < 3;
select 4 != 4 or 5 != 5;
select 4 = 4 or 5 != 5;
select not 3 = 2;
select not 3 > 2;

-- Operador de Concatenación (||)

select 'Marcio ' || 'Mallqui';

select CONCAT('Mi lenguaje de programación es:', ' Python');



 