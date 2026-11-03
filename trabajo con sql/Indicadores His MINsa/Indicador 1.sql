

-- Establecimiento San Juan Bautista

CREATE VIEW tabla_San_Juan_Bautista AS (
SELECT * FROM dbo.Hoja1$ AS dbtotal
WHERE dbtotal.Nombre_Establecimiento = 'SAN JUAN BAUTISTA'
);

SELECT * FROM tabla_San_Juan_Bautista



--

SELECT sjb.Valor_Lab FROM tabla_San_Juan_Bautista AS sjb
WHERE sjb.Valor_Lab = '1'


SELECT sjb.Valor_Lab, COUNT(*) FROM tabla_San_Juan_Bautista AS sjb
WHERE sjb.Valor_Lab = '1'
GROUP BY sjb.Valor_Lab


SELECT sjb.Codigo_Item, COUNT(*) FROM tabla_San_Juan_Bautista AS sjb
WHERE sjb.Codigo_Item IN ('Z3491', 'Z3591') AND sjb.Valor_Lab = '1'
GROUP BY sjb.Codigo_Item


SELECT sjb.Codigo_Item, COUNT(*) FROM tabla_San_Juan_Bautista AS sjb
WHERE sjb.Codigo_Item ='Z3491'
GROUP BY sjb.Codigo_Item


-- Denominador 
-- Total de Gestantes Captadas en el Primer Trimestre (menor a 14 semanas)
-- identificada con Z3491, Z3591 y Lab 1

SELECT  * FROM tabla_San_Juan_Bautista AS sjb
WHERE sjb.Codigo_Item IN ('Z3491', 'Z3591') AND sjb.Valor_Lab = '1'

SELECT sjb.Abrev_Tipo_Doc_Paciente, sjb.Numero_Documento_Paciente FROM tabla_San_Juan_Bautista AS sjb
WHERE sjb.Codigo_Item IN ('Z3491', 'Z3591') AND sjb.Valor_Lab = '1'

-- Numerador

-- 1.
SELECT * FROM tabla_San_Juan_Bautista AS sjb
WHERE sjb.Codigo_Item  = '99199.18' AND sjb.Valor_Lab = '1'
-- 2.

SELECT  sjb.Abrev_Tipo_Doc_Paciente, sjb.Numero_Documento_Paciente FROM tabla_San_Juan_Bautista AS sjb
WHERE sjb.Tipo_Diagnostico = 'D' AND 
	  ((sjb.Codigo_Item IN ('85018.01', '85018') AND 
	  sjb.Valor_Lab = '1') OR
	  sjb.Codigo_Item IN ('81000.02', '81002', '81007', '82044') OR 
	  sjb.Codigo_Item IN ('86593', '86780.01', '86592', '86318.01') OR
	  sjb.Codigo_Item = '87342')


SELECT sjb.Abrev_Tipo_Doc_Paciente, sjb.Numero_Documento_Paciente, sjb.Codigo_Item FROM tabla_San_Juan_Bautista AS sjb
WHERE (sjb.Codigo_Item  = '99199.18' AND sjb.Valor_Lab = '1') OR (sjb.Tipo_Diagnostico = 'D' AND 
	  ((sjb.Codigo_Item IN ('85018.01', '85018') AND sjb.Valor_Lab = '1') OR
	  sjb.Codigo_Item IN ('81000.02', '81002', '81007', '82044') OR 
	  sjb.Codigo_Item IN ('86593', '86780.01', '86592', '86318.01') OR
	  sjb.Codigo_Item = '87342')) OR 
	  (sjb.Codigo_Item IN ('Z3491', 'Z3591') AND sjb.Valor_Lab = '1') OR 
	  (sjb.Codigo_Item = '96150.01') OR
	  (sjb.Codigo_Item = '59401.06' AND sjb.Valor_Lab = '1')






SELECT sjb.Abrev_Tipo_Doc_Paciente, sjb.Numero_Documento_Paciente, sjb.Codigo_Item INTO #numerador1 FROM tabla_San_Juan_Bautista AS sjb
WHERE (sjb.Codigo_Item  = '99199.18' AND sjb.Valor_Lab = '1') OR (sjb.Tipo_Diagnostico = 'D' AND 
	  ((sjb.Codigo_Item IN ('85018.01', '85018') AND sjb.Valor_Lab = '1') OR
	  sjb.Codigo_Item IN ('81000.02', '81002', '81007', '82044') OR 
	  sjb.Codigo_Item IN ('86593', '86780.01', '86592', '86318.01') OR
	  sjb.Codigo_Item = '87342')) OR 
	  (sjb.Codigo_Item IN ('Z3491', 'Z3591') AND sjb.Valor_Lab = '1') OR 
	  (sjb.Codigo_Item = '96150.01') OR
	  (sjb.Codigo_Item = '59401.06' AND sjb.Valor_Lab = '1')

-- Full DNI (denominador) -- los número de dni son todos diferentes
SELECT  * 
INTO #al_menos_una_atención_prenatal2  FROM tabla_San_Juan_Bautista AS sjb
WHERE sjb.Codigo_Item IN ('Z3491', 'Z3591') AND sjb.Valor_Lab = '1'


-- Una entrega de acido folico

SELECT sjb.Abrev_Tipo_Doc_Paciente, 
		sjb.Numero_Documento_Paciente AS numero_paciente_acido_folico, 
		sjb.Codigo_Item 
		INTO #Una_entrega_de_acido_folico1 
FROM tabla_San_Juan_Bautista AS sjb
WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND sjb.Codigo_Item  = '99199.18' AND sjb.Valor_Lab = '1'

-- 2 diagnostico tipo D

SELECT DISTINCT *
FROM tabla_San_Juan_Bautista AS sjb
WHERE (sjb.Abrev_Tipo_Doc_Paciente = 'DNI') AND (sjb.Tipo_Diagnostico = 'D')

	--HEMOGLOBINA 
	SELECT DISTINCT sjb_D.Numero_Documento_Paciente AS numero_paciente_D_hemogl
	INTO #numero_paciente_D_hemogl1
	FROM (SELECT DISTINCT *
			FROM tabla_San_Juan_Bautista AS sjb
			WHERE (sjb.Abrev_Tipo_Doc_Paciente = 'DNI') AND (sjb.Tipo_Diagnostico = 'D')) AS sjb_D	
	WHERE (sjb_D.Codigo_Item IN ('85018.01', '85018')) AND (sjb_D.Valor_Lab = '1')

	-- Examen de orina

	SELECT DISTINCT sjb.Numero_Documento_Paciente AS numero_paciente_D_hemogl_orina 
	INTO #numero_paciente_D_hemogl_orina 
	FROM tabla_San_Juan_Bautista AS sjb
	JOIN #numero_paciente_D_hemogl1 ON #numero_paciente_D_hemogl1.numero_paciente_D_hemogl = sjb.Numero_Documento_Paciente
	WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND sjb.Codigo_Item IN ('81000.02', '81002', '81007', '82044')


	-- descarte de sifilis

	SELECT DISTINCT sjb.Numero_Documento_Paciente AS numero_paciente_D_hemogl_orina_nosifilis
	INTO #numero_paciente_D_hemogl_orina_nosifilis
	FROM tabla_San_Juan_Bautista AS sjb
	JOIN  #numero_paciente_D_hemogl_orina ON  #numero_paciente_D_hemogl_orina.numero_paciente_D_hemogl_orina = sjb.Numero_Documento_Paciente
	WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND sjb.Codigo_Item IN ('86593', '86780.01', '86592', '86318.01')

		SELECT * FROM #numero_paciente_D_hemogl_orina_nosifilis

	-- descarte VIH
	SELECT DISTINCT sjb.Numero_Documento_Paciente AS numero_paciente_D_hemogl_orina_nosifilis_noVIH
	INTO #numero_paciente_D_hemogl_orina_nosifilis_noVIH1
	FROM tabla_San_Juan_Bautista AS sjb
	JOIN  #numero_paciente_D_hemogl_orina_nosifilis ON  #numero_paciente_D_hemogl_orina_nosifilis.numero_paciente_D_hemogl_orina_nosifilis = sjb.Numero_Documento_Paciente
	WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND sjb.Codigo_Item IN ('86703.01', '86703.02', '87389', '86318.01')
	
	SELECT * FROM #numero_paciente_D_hemogl_orina_nosifilis_noVIH1

	-- hepatitis B
	SELECT DISTINCT sjb.Numero_Documento_Paciente AS numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB
	INTO #numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB
	FROM tabla_San_Juan_Bautista AS sjb
	JOIN #numero_paciente_D_hemogl_orina_nosifilis_noVIH1 ON  #numero_paciente_D_hemogl_orina_nosifilis_noVIH1.numero_paciente_D_hemogl_orina_nosifilis_noVIH = sjb.Numero_Documento_Paciente
	WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND sjb.Codigo_Item = '87342'

-- 3.  Una atención prenatal
	SELECT  DISTINCT sjb.Numero_Documento_Paciente AS numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB_prenatal 
	INTO #numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB_prenatal 
	FROM tabla_San_Juan_Bautista AS sjb
	JOIN #numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB ON #numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB.numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB = sjb.Numero_Documento_Paciente
	WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND (sjb.Codigo_Item IN ('Z3491', 'Z3591') AND sjb.Valor_Lab = '1')

-- 4. tamizaje VIF
	SELECT  DISTINCT sjb.Numero_Documento_Paciente AS numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB_prenatal_tamizajeVIF 
	INTO #numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB_prenatal_tamizajeVIF
	FROM tabla_San_Juan_Bautista AS sjb
	JOIN #numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB_prenatal ON #numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB_prenatal.numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB_prenatal = sjb.Numero_Documento_Paciente	
	WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND sjb.Codigo_Item = '96150.01'

-- 5. Plan de parto
	
	SELECT  DISTINCT sjb.Numero_Documento_Paciente AS numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB_prenatal_tamizajeVIF_planparto  
	INTO #numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB_prenatal_tamizajeVIF_planparto
	FROM tabla_San_Juan_Bautista AS sjb
	JOIN  #numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB_prenatal_tamizajeVIF ON #numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB_prenatal_tamizajeVIF.numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB_prenatal_tamizajeVIF = sjb.Numero_Documento_Paciente	
	WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND (sjb.Codigo_Item = '59401.06' AND sjb.Valor_Lab = '1')


-- Unión acido folico

SELECT DISTINCT sjb.Numero_Documento_Paciente AS #numero_paciente_acidofolico_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB_prenatal_tamizajeVIF_planparto
INTO #numerador
FROM tabla_San_Juan_Bautista AS sjb
JOIN #numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB_prenatal_tamizajeVIF_planparto ON #numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB_prenatal_tamizajeVIF_planparto.numero_paciente_D_hemogl_orina_nosifilis_noVIH1_tamizajehepatitisB_prenatal_tamizajeVIF_planparto = sjb.Numero_Documento_Paciente
WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND sjb.Codigo_Item  = '99199.18' AND sjb.Valor_Lab = '1'



SELECT  DISTINCT sjb.Numero_Documento_Paciente FROM tabla_San_Juan_Bautista AS sjb
WHERE sjb.Codigo_Item IN ('Z3491', 'Z3591') AND sjb.Valor_Lab = '1'


SELECT CONCAT ((COUNT(*)/ (SELECT  COUNT(DISTINCT sjb.Numero_Documento_Paciente) FROM tabla_San_Juan_Bautista AS sjb
								WHERE sjb.Codigo_Item IN ('Z3491', 'Z3591') AND sjb.Valor_Lab = '1')) * 100 , '%') FROM #numerador


SELECT 'hola' / 4/2 
