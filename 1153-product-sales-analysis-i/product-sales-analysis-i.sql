-- Write your PostgreSQL query statement below
SELECT product_name,year,price
FROM product 
INNER JOIN sales 
USING(product_id)