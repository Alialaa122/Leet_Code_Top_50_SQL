-- Write your PostgreSQL query statement below

-- WITH cte1 AS (SELECT product_id , new_price , change_date 
--               FROM products
--               WHERE change_date <= '2019-08-16' ) , 

-- cte2 AS (SELECT *
--          FROM products
--          LEFT JOIN cte1 ON cte1.change_date=products.change_date 
--                         AND cte1.product_id=products.product_id )


-- SELECT products.product_id , CASE WHEN change_date IS NULL THEN 10 

WITH cte1 AS (SELECT product_id , new_price , ROW_NUMBER()OVER(PARTITION BY product_id
                                                 ORDER BY change_date DESC ) AS rank
              FROM products
              WHERE change_date <= '2019-08-16' )  


SELECT product_id , new_price AS price
FROM cte1 
WHERE rank = 1 


UNION 

SELECT product_id ,CASE WHEN change_date > '2019-08-16' THEN 10 END AS price 
FROM products 
WHERE product_id NOT IN (SELECT product_id FROM cte1)  


