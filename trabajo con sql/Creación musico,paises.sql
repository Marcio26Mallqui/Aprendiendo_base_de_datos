DROP TABLE músicos1

CREATE TABLE músicos12 (
	id INT PRIMARY KEY IDENTITY(1,1),
	pais VARCHAR(50),
	musico VARCHAR(50),
	edad_musico INT
);

INSERT INTO músicos12
VALUES
('Estados Unidos', 'Beyoncé', '42'),
('Brasil', 'Gilberto Gil', '81'),
('Francia', 'David Guetta', '56'),
('India', 'A. R. Rahman', '57'),
('Corea del Sur', 'RM', '29');

SELECT * FROM músicos12; 

CREATE TABLE paises12 (
	id INT PRIMARY KEY IDENTITY(1,1),
	pais VARCHAR(50)
);

DROP TABLE paises12;

DROP TABLE musicos12;

INSERT INTO paises12(pais)
SELECT DISTINCT ms1.pais FROM músicos12 ms1;

SELECT * FROM paises12;

CREATE TABLE musicos12 (
	id INT PRIMARY KEY IDENTITY(1,1),
	pais_id INT REFERENCES paises12(id),
	musico VARCHAR(100),
	edad_musico INT
);

INSERT INTO musicos12 
SELECT paises12.id, 
		músicos12.musico, 
		músicos12.edad_musico 
FROM músicos12
JOIN paises12 ON  paises12.pais = músicos12.pais;


SELECT * FROM musicos12;

