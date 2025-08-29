-- Write your PostgreSQL query statement below
--MY SOLUTION

WITH cte1 AS (SELECT p.product_id ,
                     CASE WHEN u.purchase_date BETWEEN p.start_date AND p.end_date THEN p.price * u.units
                     ELSE 0 END AS revenue ,
                      u.units
              FROM prices AS p
                LEFT JOIN unitssold AS u
                   ON p.product_id=u.product_id )

SELECT product_id,  
       COALESCE( ROUND(SUM(revenue) * 1.0 / NULLIF(SUM( DISTINCT units), 0), 2), 0) AS average_price
FROM cte1 
GROUP BY product_id
--------------------------------------------------------------------------------------------------
-- ANOTHER OPTIMAL solution 

-- WITH cte1 AS (SELECT p.product_id ,
--                      p.price*u.units AS revenue, -- i just removed CASE STATEMENT and add another join condition that filter 0 rows 
--                      u.units
--               FROM prices AS p
--                 LEFT JOIN unitssold AS u -- LEFT JOIN keeps all products from prices even if no sales exist.
--                    ON  p.product_id=u.product_id
--                    AND u.purchase_date BETWEEN p.start_date AND p .end_date )

-- SELECT product_id,   
--        COALESCE( ROUND(SUM(revenue) * 1.0 / NULLIF(SUM(units), 0), 2), 0) AS average_price -- Removed Akward Distinct units in the first solution 
-- FROM cte1
-- GROUP BY product_id
