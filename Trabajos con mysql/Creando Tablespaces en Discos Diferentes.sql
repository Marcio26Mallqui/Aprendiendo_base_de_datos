-- Creando Tablespaces en Discos Diferentes

CREATE TABLESPACE `high_performance_tables`
ADD DATAFILE 'd:\\mysql\\Data\\HighPerformanceTablespace\\high.ibd'
ENGINE = INNODB; 