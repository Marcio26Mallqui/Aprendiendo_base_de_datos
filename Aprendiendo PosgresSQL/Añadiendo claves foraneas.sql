-- 	Añadir claves foraneas

select *
from public.tb_articulos ta;

select *
from public.tb_categorias tc;

select *
from public.tb_unidades_medidas tum 

alter table public.tb_articulos
add constraint fk_categorias_articulos
foreign key (codigo_ca)
references tb_categorias(codigo_ca),
add constraint fk_categorias__unidades_medidas
foreign key (codigo_um)
references tb_unidades_medidas(codigo_um);

-- Probar

insert into tb_articulos(codigo_ar,
						 descripcion_ar,
						 marcar_ar,
						 codigo_um,
						 codigo_ca)
			values(5,
					'Refrigeradora',
					'No definida',
					1,
					7);

