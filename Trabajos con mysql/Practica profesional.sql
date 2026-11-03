-- Deseamos conocer
-- Con cuantas (COUNT) 'Comedias' trabajamos en la empresa?

SELECT * FROM film_category fc;

SELECT * FROM category cat
WHERE cat.Name= 'Comedy';

SELECT * FROM film AS film;

SELECT COUNT(*) AS Comedia FROM film_category fc
	JOIN category cat ON cat.category_id = fc.category_id
	JOIN film film ON film.film_id = fc.film_id
WHERE cat.Name= 'Comedy';


SELECT COUNT(fc.film_id) FROM film_category fc
WHERE fc.category_id = 5;

-- ¿Cuál es el actor o actriz 
-- más películas ha filmado? 


SELECT act.actor_id, act.first_name, act.last_name AS Nombre , COUNT(fl.film_id) AS Conteo_de_películas FROM film_actor flac
	JOIN actor act ON flac.actor_id = act.actor_id
	JOIN film fl ON fl.film_id = flac.film_id
GROUP BY act.actor_id, act.first_name, act.last_name 
ORDER BY Conteo_de_películas DESC

-- ---------------------------------------------------------------------------------------------
SELECT act.actor_id, act.first_name, act.last_name AS Nombre FROM film_actor flac
	JOIN actor act ON flac.actor_id = act.actor_id
GROUP BY act.actor_id, act.first_name, act.last_name 
ORDER BY COUNT(*) DESC
LIMIT 1

-- -------------------------------------------------------------------------------------
-- ¿Qué empleado del staff ha alquilado más 
-- películas de la actriz del ejercicio 2?

SELECT * FROM staff st

SELECT * FROM store sto

SELECT * FROM rental rt 

SELECT * FROM inventory invent

SELECT * FROM film_actor flac



SELECT st.staff_id AS ID, st.first_name AS NOMBRE, st.last_name AS APELLIDO FROM inventory invent
	JOIN rental rt ON rt.inventory_id = invent.inventory_id
	JOIN staff st ON st.staff_id = rt.staff_id
	JOIN film fl ON fl.film_id = invent.film_id
	JOIN film_actor flac ON flac.film_id = fl.film_id
WHERE flac.actor_id = 107
GROUP BY ID, NOMBRE, APELLIDO
ORDER BY COUNT(*) DESC
LIMIT 1

-- ------------------------------------------------------------------------------------------------

-- ¿Cuántas películas con rating PG-13 que hay en el store nro 2
-- ha alquilado el mejor cliente de todos?



