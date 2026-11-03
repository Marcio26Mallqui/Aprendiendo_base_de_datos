-- Tipos de funciones

-- Funciones String

select 'Hola Mundo';
select 'Hola Mundo,' || ' bienvenido a mi casa.';
select LENGTH('Bienvenido a mi casa.');
select UPPER('Hola Mundo');
select LOWER('Hola Mundo');
select CHAR_LENGTH('Hola Mundo');
select LEFT('Hola Mundo',2);
select RIGHT('Hola Mundo',4);
--

select substring('Hola Mundo Bienvenido al curso' from 3 for 2);

-- H1 o2 l3 a4  M5 u6 n7 d8 o9

select substr('Hola Mundo Bienvenido al curso',6,5);

select LPAD('Hola Mundo', 12, '*');

select LPAD('Hola Mundo', 11, '*');

select RPAD('Hola Mundo', 12, '*');

select 'E-' || LPAD('1',5,'0'); -- Personalizar código

-- 

select OVERLAY('Hola Mundo' placing ' Víctor ' from 5 for 1);

select OVERLAY('Hola Mundo' placing 'Víctor' from 6 for 5);

select POSITION('do' in 'Hola Mundo'); -- Para buscar la posición

select POSITION('la' in 'Hola Mundo'); -- Para buscar la posición


