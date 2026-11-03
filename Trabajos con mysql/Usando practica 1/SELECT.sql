SELECT * FROM customers

-- -------------------------
SELECT * FROM orders
WHERE amount > 1000

-- -----------------------------

SELECT * FROM customers cu
WHERE cu.age = 22
-- ----------------------------

SELECT * FROM customers cu
WHERE cu.country = 'UAE'
-- -----------------------------

SELECT * FROM customers cu
ORDER BY cu.age ASC

-- -----------------------------

SELECT * FROM customers cu
WHERE cu.age BETWEEN 22 AND 28



