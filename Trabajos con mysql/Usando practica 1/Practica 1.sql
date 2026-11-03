SELECT *  FROM customers cu

-- ---------------------------------

SELECT * FROM orders orda
WHERE orda.amount >1000

-- --------------------------------

SELECT *  FROM customers cu
WHERE cu.last_name = 'Luna'

-- ---------------------------------

SELECT * FROM customers cu
WHERE cu.last_name != 'Luna'
ORDER BY cu.age ASC

-- ----------------------------------

SELECT * FROM orders orda
WHERE orda.order_id =4

-- ---------------------------------

SELECT * FROM orders AS ods
WHERE ods.amount BETWEEN 100  AND 500

-- -------------------------------------

SELECT * FROM customers cu
ORDER BY cu.first_name -- lo ordena en forma alfabética

-- ---------------------------------------

SELECT * FROM customers cu
ORDER BY cu.first_name, cu.country

-- -----------------------------------------

SELECT * FROM shippings ship
WHERE ship.shipping_id IN (3,4)practica_sqlheidi1 

-- --------------------------------------------

-- Funciones agregadas y títulos de columnas

SELECT UPPER(cu.first_name), LOWER(cu.last_name) FROM customers cu

-- -------------------

SELECT * FROM customers;
SELECT cu.first_name, SUBSTR(cu.last_name,1,2) FROM customers cu;

-- -----------------------

SELECT cu.first_name, cu.last_name FROM customers cu
WHERE cu.age  = (SELECT  MAX(cu.age) FROM customers cu)
-- the customer who is the maximum age.
 
-- ------------------------

SELECT ords.amount,  ords.amount*0.13, ords.amount - (ords.amount*0.13) FROM orders  ords

SELECT * FROM orders ords

SELECT COUNT(ords.item) FROM orders ords
WHERE ords.item = 'Mousepad'

-- -------------------------------

SELECT SUM(ords.amount) AS 'Cantidad Total' FROM orders ords

SELECT COUNT(ords.amount) FROM orders ords


SELECT MIN(ords.amount) FROM orders ords

-- -------------------------------------------

-- Función LIKE

SELECT * FROM orders ords
WHERE ords.item LIKE 'M%'

SELECT * FROM customers cu
WHERE cu.country LIKE '%A'

SELECT * FROM shippings ship
WHERE ship.status LIKE 'D%'

-- ---------------------------------------------------------

-- Unión de tablas

SELECT cu.customer_id, cu.first_name, cu.last_name, ords.item, ords.amount, (ords.amount * 0.13) AS 'Impuestos', ship.status FROM customers cu, orders ords, shippings ship
WHERE cu.customer_id = ords.customer_id  
AND ship.customer_id = cu.customer_id
AND ship.`status` = 'Delivered'

-- ------------------------------

SELECT cu.customer_id, cu.first_name, cu.last_name, ords.order_id, ords.item FROM customers cu
JOIN orders ords ON cu.customer_id = ords.customer_id
WHERE cu.customer_id = 4

-- -------------------------

SELECT cu.customer_id, cu.first_name, cu.last_name, ords.amount, ship.status FROM customers cu
JOIN orders ords ON ords.customer_id = cu.customer_id
JOIN shippings ship ON ship.customer_id = cu.customer_id
WHERE ship.status = 'delivered'  AND  ords.amount > 500



-- -------------------------

SELECT * FROM customers cu
WHERE cu.last_name !=  'Luna'

-- -----------------------------

-- Cuantos registros de ordenes tienen montos 
-- mayores a 300

SELECT * FROM orders ords
WHERE ords.amount>300 
 
-- ----------------------------

SELECT MIN(ship.shipping_id) FROM shippings ship
WHERE ship.status = 'Pending'

-- ------------------------------

SELECT * FROM customers cu;
SELECT * FROM orders ords;

SELECT ords.order_id AS 'ID del orden', cu.first_name FROM orders ords
RIGHT JOIN customers cu ON cu.customer_id = ords.customer_id
 
SELECT customer_id ,B.order_id,A.first_name FROM customers A 
RIGHT JOIN orders B ON A.customer_id=B.customer_id

-- --------------------------------------

SELECT * FROM orders ords;
SELECT * FROM customers cu;

SELECT COUNT(1) FROM orders ords, customers cu

-- ---------------------------------------

-- Cual es la sentencia sql para 
-- devolver todos los country en minuscula

SELECT LOWER(cu.country) FROM customers cu, orders ords

-- ---------------------------------------------

-- Select count(1),country from customers 
-- group by country
-- Cual es el country que menos registros 
-- tiene

SELECT cu.country, COUNT(*) FROM customers cu
GROUP BY cu.country

-- --------------------------------------

-- Conteo de las ordenes

SELECT cu.customer_id, cu.first_name, cu.last_name, COUNT(ords.order_id)  FROM customers cu
JOIN orders ords ON ords.customer_id = cu.customer_id
GROUP BY cu.customer_id

-- Suma de la cantidad ordenada

SELECT cu.customer_id, cu.first_name, cu.last_name,SUM(ords.amount) FROM orders ords
JOIN customers cu ON cu.customer_id = ords.customer_id
GROUP BY cu.customer_id

-- la suma de las cantidada que fueron entregadas a los clientes
SELECT * FROM shippings

SELECT cu.customer_id,cu.first_name, cu.last_name, SUM(ords.amount) FROM shippings ship
LEFT JOIN customers cu ON cu.customer_id = ship.customer_id
LEFT JOIN orders ords ON ords.customer_id = cu.customer_id
WHERE ship.status = 'Delivered'
GROUP BY cu.customer_id

-- Conocer el nombre y la cantidad de ordenes 
-- solicitadas por un Customer

SELECT cu.first_name, cu.last_name ,COUNT(*) AS 'la cantidad de ordenes' FROM customers cu
JOIN orders ords ON ords.customer_id = cu.customer_id
GROUP BY cu.first_name, cu.last_name

 


