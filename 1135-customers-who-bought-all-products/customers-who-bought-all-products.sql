-- Write your PostgreSQL query statement below
SELECT customer_id
FROM customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) 
                                      FROM product)

-- SELECT customer_id , COUNT(DISTINCT product_key)
-- FROM customer
-- GROUP BY customer_id
