-- Agregar más datos

select *
from tb_unidades_medidas tum; 


insert into tb_unidades_medidas (codigo_um, descripcion_um)
values (1, 'UNIDADES'),
	    (2, 'KILOGRAMOS'),
	    (3, 'METROS'),
	    (4, 'LITROS'),
	    (5, 'CAJAS');


select * from public.tb_categorias tc; 

select * from public.tb_articulos ta; 

insert into tb_articulos(codigo_ar,
						descripcion_ar,
						marcar_ar,
						codigo_um,
						codigo_ca)
			values (4,
					'Refrigeradora',
					'No definida',
					1,
					2);				
						


