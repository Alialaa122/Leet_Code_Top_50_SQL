-- Write your PostgreSQL query statement below

WITH cte1 AS (SELECT DISTINCT product_id ,
                     MIN(year) OVER(PARTITION BY product_id 
                                    ORDER BY year) AS first_year  
              FROM sales )


SELECT s.product_id , c.first_year , s.quantity , s.price
FROM sales AS s
  JOIN cte1 AS c ON c.product_id = s.product_id
                 AND c.first_year = s.year
