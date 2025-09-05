-- Write your PostgreSQL query statement below
-- SELECT DISTINCT visited_on,amount
-- FROM (SELECT visited_on, SUM(amount) OVER(ORDER BY visited_on  
--                                     RANGE BETWEEN INTERVAL '6 DAY' PRECEDING AND CURRENT ROW) AS amount
--       FROM customer )
-- ORDER BY visited_on

-- SELECT visited_on, SUM(amount) OVER(ORDER BY visited_on  
--                                     RANGE BETWEEN INTERVAL '6 DAY' PRECEDING AND CURRENT ROW) AS amount , 
--                     AVG(amount) OVER(ORDER BY visited_on  
--                                     RANGE BETWEEN INTERVAL '6 DAY' PRECEDING AND CURRENT ROW) AS average_amount 
-- FROM customer


WITH cte1 AS (SELECT visited_on, SUM(amount) AS amount
              FROM customer
              GROUP BY visited_on ) , 

cte2 AS (SELECT visited_on, amount , ROUND(average_amount,2) AS average_amount
         FROM (SELECT visited_on, SUM(amount) OVER(ORDER BY visited_on  
                                    RANGE BETWEEN INTERVAL '6 DAY' PRECEDING AND CURRENT ROW) AS amount , 
                    AVG(amount) OVER(ORDER BY visited_on  
                                    RANGE BETWEEN INTERVAL '6 DAY' PRECEDING AND CURRENT ROW) AS average_amount 
               FROM cte1 ) )

SELECT visited_on, amount, average_amount
FROM cte2 
WHERE visited_on >= (SELECT MIN(visited_on)+ INTERVAL '6 day' FROM cte1 )