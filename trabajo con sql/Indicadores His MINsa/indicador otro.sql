-- Establecimiento San Juan Bautista

CREATE VIEW tabla_San_Juan_Bautista AS (
SELECT * FROM dbo.Hoja1$ AS dbtotal
WHERE dbtotal.Nombre_Establecimiento = 'SAN JUAN BAUTISTA'
);

SELECT * FROM tabla_San_Juan_Bautista




-- Denominador 
-- Total de Gestantes Captadas en el Primer Trimestre (menor a 14 semanas)
-- identificada con Z3491, Z3591 y Lab 1

SELECT  * FROM tabla_San_Juan_Bautista AS sjb
WHERE sjb.Codigo_Item IN ('Z3491', 'Z3591') AND sjb.Valor_Lab = '1'

-- Full DNI (denominador) -- los número de dni son todos diferentes
SELECT sjb.Abrev_Tipo_Doc_Paciente, 
		sjb.Numero_Documento_Paciente
INTO #denominador
FROM tabla_San_Juan_Bautista AS sjb
WHERE sjb.Codigo_Item IN ('Z3491', 'Z3591') AND sjb.Valor_Lab = '1'

-- Numerador


-- 1-- Una entrega de acido folico

SELECT sjb.Abrev_Tipo_Doc_Paciente, 
		sjb.Numero_Documento_Paciente AS numero_paciente_acido_folico, 
		sjb.Codigo_Item
INTO #deno_acidofolico
FROM tabla_San_Juan_Bautista AS sjb
JOIN #denominador dn ON dn.Numero_Documento_Paciente = sjb.Numero_Documento_Paciente 
WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND sjb.Codigo_Item  = '99199.18' AND sjb.Valor_Lab = '1'

-- 2 diagnostico tipo D

SELECT DISTINCT sjb.Numero_Documento_Paciente AS num_paciente_deno_acido_D
INTO #num_paciente_deno_acido_D
FROM tabla_San_Juan_Bautista AS sjb
JOIN #deno_acidofolico dnac ON dnac.numero_paciente_acido_folico = sjb.Numero_Documento_Paciente
WHERE (sjb.Abrev_Tipo_Doc_Paciente = 'DNI') AND (sjb.Tipo_Diagnostico = 'D')

	--HEMOGLOBINA 
	SELECT DISTINCT sjb.Numero_Documento_Paciente AS num_paciente_deno_acido_D_hemo
	INTO #num_paciente_deno_acido_D_hemo 
	FROM tabla_San_Juan_Bautista sjb
	JOIN #num_paciente_deno_acido_D npdad ON npdad.num_paciente_deno_acido_D = sjb.Numero_Documento_Paciente 
	WHERE (sjb.Codigo_Item IN ('85018.01', '85018')) AND (sjb.Valor_Lab = '1')

	-- Examen de orina

	SELECT DISTINCT sjb.Numero_Documento_Paciente AS num_paciente_deno_acido_D_hemo_ori
	INTO #num_paciente_deno_acido_D_hemo_ori
	FROM tabla_San_Juan_Bautista AS sjb
	JOIN #num_paciente_deno_acido_D_hemo npdaDh ON npdaDh.num_paciente_deno_acido_D_hemo =sjb.Numero_Documento_Paciente
	WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND sjb.Codigo_Item IN ('81000.02', '81002', '81007', '82044')


	-- descarte de sifilis

	SELECT DISTINCT sjb.Numero_Documento_Paciente AS num_paciente_deno_acido_D_hemo_ori_dessifilis	
	INTO #num_paciente_deno_acido_D_hemo_ori_dessifilis
	FROM tabla_San_Juan_Bautista AS sjb
	JOIN  #num_paciente_deno_acido_D_hemo_ori npdaDho ON  npdaDho.num_paciente_deno_acido_D_hemo_ori = sjb.Numero_Documento_Paciente
	WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND sjb.Codigo_Item IN ('86593', '86780.01', '86592', '86318.01')

	-- descarte VIH
	SELECT DISTINCT sjb.Numero_Documento_Paciente AS num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH
	INTO #num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH
	FROM tabla_San_Juan_Bautista AS sjb
	JOIN  #num_paciente_deno_acido_D_hemo_ori_dessifilis npdaDhofi   ON  npdaDhofi.num_paciente_deno_acido_D_hemo_ori_dessifilis = sjb.Numero_Documento_Paciente
	WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND sjb.Codigo_Item IN ('86703.01', '86703.02', '87389', '86318.01')
	
	-- hepatitis B
	SELECT DISTINCT sjb.Numero_Documento_Paciente AS num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB
	INTO #num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB
	FROM tabla_San_Juan_Bautista AS sjb
	JOIN #num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH npdaDhofivi  ON  npdaDhofivi.num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH =sjb.Numero_Documento_Paciente
	WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND sjb.Codigo_Item = '87342'


--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
-- 2.2 
-- O
-- Primera bateria de análisis/ entrega de resultados
SELECT DISTINCT sjb.Numero_Documento_Paciente AS num_pacintes_1bateria
INTO #num_pacintes_Unabateria
FROM tabla_San_Juan_Bautista sjb
JOIN #deno_acidofolico dnaci ON dnaci.numero_paciente_acido_folico = sjb.Numero_Documento_Paciente
WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND sjb.Codigo_Item = '80055.01'

-- tamizaje hepatitis B
SELECT DISTINCT sjb.Numero_Documento_Paciente AS num_pacintes_1bateria_hepaB
INTO #num_pacintes_1bateria_hepatitisB
FROM tabla_San_Juan_Bautista sjb
JOIN #num_pacintes_Unabateria dnacibate  ON dnacibate.num_pacintes_1bateria =sjb.Numero_Documento_Paciente
WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND (sjb.Codigo_Item = '87342' AND sjb.Tipo_Diagnostico = 'D')

-- Supervisión de embarazo para entrega de resultado

SELECT DISTINCT sjb.Numero_Documento_Paciente AS num_pacintes_1bateria_hepaB_D_entregaresultados
INTO #num_pacintes_1bateria_hepaB_D_supervisionembarazo 
FROM tabla_San_Juan_Bautista sjb
JOIN #num_pacintes_1bateria_hepatitisB dnacibatehepaB ON dnacibatehepaB.num_pacintes_1bateria_hepaB = sjb.Numero_Documento_Paciente
WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND sjb.Codigo_Item IN ('Z359', 'Z349')
--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

SELECT fef.num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB, fef1.num_pacintes_1bateria_hepaB_D_entregaresultados
FROM #num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB fef
FULL JOIN  #num_pacintes_1bateria_hepaB_D_supervisionembarazo fef1 ON fef1.num_pacintes_1bateria_hepaB_D_entregaresultados = fef.num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB
--------------------------------------------------------------------------
------------------------------------------------------------------------

-- 3.  Una atención prenatal
	SELECT  DISTINCT sjb.Numero_Documento_Paciente AS num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB_prenatal 
	INTO #num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB_prenatal
	FROM tabla_San_Juan_Bautista AS sjb
	JOIN #num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB npdaDheosivihhepab ON npdaDheosivihhepab.num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB = sjb.Numero_Documento_Paciente
	WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND (sjb.Codigo_Item IN ('Z3491', 'Z3591') AND sjb.Valor_Lab = '1')

-- 4. tamizaje VIF
	SELECT  DISTINCT sjb.Numero_Documento_Paciente AS num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB_prenatal_VIF  
	INTO #num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB_prenatal_VIF
	FROM tabla_San_Juan_Bautista AS sjb
	JOIN #num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB_prenatal npdaDheosivihhepabanata ON npdaDheosivihhepabanata.num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB_prenatal =sjb.Numero_Documento_Paciente 	
	WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND sjb.Codigo_Item = '96150.01'

-- 5. Plan de parto
	
	SELECT  DISTINCT sjb.Numero_Documento_Paciente AS num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB_prenatal_VIF_parto
	INTO #num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB_prenatal_VIF_parto
	FROM tabla_San_Juan_Bautista AS sjb
	JOIN  #num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB_prenatal_VIF ulti ON ulti.num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB_prenatal_VIF = sjb.Numero_Documento_Paciente	
	WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND (sjb.Codigo_Item = '59401.06' AND sjb.Valor_Lab = '1')

	SELECT * FROM #num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB_prenatal_VIF_parto

--
SELECT CONCAT ((COUNT(*)/ (SELECT  COUNT(*) FROM #denominador)) * 100 , '%') AS total_indicador FROM #num_paciente_deno_acido_D_hemo_ori_dessifilis_noVIH_hepaB_prenatal_VIF_parto



SELECT DISTINCT sjb.Numero_Documento_Paciente AS entregaresultados
FROM tabla_San_Juan_Bautista sjb
WHERE sjb.Abrev_Tipo_Doc_Paciente = 'DNI' AND sjb.Codigo_Item IN ('Z359', 'Z349')



