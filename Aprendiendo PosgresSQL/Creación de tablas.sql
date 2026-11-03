create table tb_categorias(
	codigo_ca INT primary key,
	descripcion_ca CHAR(30)	
);

create table tb_articulos(
	codigo_ar INTEGER primary KEY,
	descripcion_ar CHAR(100),
	marcar_ar CHAR(30),
	codigo_um INTEGER,
	codigo_ca INTEGER
);

create table tb_unidades_medidas(
	codigo_um INTEGER primary key,
	descripcion_um CHAR(20)
)

-- select * from public.tb_categorias tc 


-- Insertar datos

insert into tb_categorias (codigo_ca, descripcion_ca)
values (1, 'OFICINAS'),
	   (2, 'HOGAR'),
	   (3, 'MANTENIMIENTO'),
	   (4, 'SAXAX'),
	   (5, 'NUEVO DATO');

-- Actualizar registros

update tb_categorias set descripcion_ca = 'FERRETARIA'
where codigo_ca  = 4;

update tb_categorias set descripcion_ca = 'VEHÍCULOS'
where codigo_ca  = 5; 

-- Eliminar algunos registros

delete from public.tb_categorias tc
where codigo_ca  = 5;


-- Eliminar todos los registros

delete from public.tb_categorias; 

-- Eliminar tablas
-- drop table public.tb_categorias; 



