-- Con cuantas 'Comedias' 
-- trabajamos en la empresa ?

SELECT * FROM film fl

SELECT * FROM category cat

SELECT * FROM film_category flc

SELECT flc.category_id, cat.name, COUNT(flc.film_id) AS 'Número de películas'  FROM film_category flc
JOIN category cat ON cat.category_id = flc.category_id
JOIN film fl ON fl.film_id = flc.film_id
WHERE cat.category_id = 5
GROUP BY flc.category_id, cat.name

-- ¿Cuál es el actor o actriz 
-- que más películas ha filmado ?

SELECT flac.actor_id, act.first_name, act.last_name FROM film_actor flac
JOIN film fl ON fl.film_id = flac.film_id
JOIN actor act ON act.actor_id = flac.actor_id
GROUP BY  flac.actor_id
ORDER BY COUNT(*) DESC
LIMIT 1

SELECT flac.actor_id, act.first_name, act.last_name, COUNT(*) AS nu_películas FROM film_actor flac
JOIN film fl ON fl.film_id = flac.film_id
JOIN actor act ON act.actor_id = flac.actor_id
GROUP BY  flac.actor_id
ORDER BY nu_películas DESC


-- ¿Qué empleado del staff ha alquilado 
-- más películas de la actriz del ejercicio 2 ?

SELECT * FROM staff st

SELECT * FROM store sto

SELECT * FROM inventory inv

SELECT * FROM customer cut

SELECT * FROM rental rt

SELECT sff.staff_id, sff.first_name, sff.last_name FROM film_actor flac
JOIN inventory inv ON inv.film_id = flac.film_id
JOIN rental rt ON rt.inventory_id = inv.inventory_id
JOIN customer cut ON rt.customer_idtablaejemplocontroldehorariocontroldehorario = cut.customer_id
JOIN store sto ON sto.store_id = cut.store_id
JOIN staff sff ON sff.staff_id = sto.manager_staff_id
WHERE flac.actor_id = 107
GROUP BY sff.staff_id
ORDER BY COUNT(*) DESC 


-- ¿cuántas películas con rating PG-13 que hay 
-- en el store nro 2 ha alquilado el mejor 
-- cliente de todos?

SELECT * FROM customer cut

SELECT fl.rating, COUNT(*) FROM film fl
GROUP BY fl.rating 


SELECT inv.film_id  FROM film fl
JOIN inventory inv  ON inv.film_id = fl.film_id
WHERE fl.rating = 'PG-13' AND inv.store_id =2
GROUP BY inv.film_id

-- CLiente que más alquila (renta)

SELECT rt.customer_id FROM rental rt
GROUP BY rt.customer_id
ORDER BY COUNT(rt.customer_id) desc
LIMIT 1

-- consulta final

SELECT COUNT(*) AS Peliculas 
FROM film fl
	JOIN inventory inv ON inv.film_id = fl.film_id
	JOIN rental rt ON inv.inventory_id = rt.inventory_id
WHERE fl.film_id IN (SELECT inv.film_id  FROM film fl
						  JOIN inventory inv  ON inv.film_id = fl.film_id
						  WHERE fl.rating = 'PG-13' AND inv.store_id =2
						  GROUP BY inv.film_id) AND 
	   rt.customer_id IN (SELECT ren.customer_id FROM( SELECT rt.customer_id FROM rental rt
								GROUP BY rt.customer_id
								ORDER BY COUNT(rt.customer_id) DESC
								LIMIT 1) AS ren) AND 
		inv.store_id =2

-- ----------------------------------------------------------------------

SELECT * FROM city ci
WHERE ci.country_id > 95
ORDER BY ci.country_id DESC
  controldehorario