-- Mandar infromación al TablaSpace.
ALTER TABLE clientes TABLESPACE `high_performance_tables`


ALTER TABLE ventas_detalle TABLESPACE `high_performance_tables`

-- Crear tabla
CREATE TABLE nombre_tabla(
	columna1 INT,
	columna2 INT,
	...
) TABLESPACE `high_performance_tables`
