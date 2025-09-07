-- Write your PostgreSQL query statement below

WITH cte1 AS (SELECT id,num, CASE WHEN num= lead(num,1) OVER(ORDER BY id) THEN num
               ELSE NULL END AS first_second 
              FROM logs ) , 

cte2 AS (SELECT id,num,first_second, CASE WHEN first_second = lead(num,2)OVER(ORDER BY id) THEN num
                                     ELSE NULL END AS second_third
         FROM cte1 )

SELECT DISTINCT second_third AS ConsecutiveNums 
FROM cte2 
WHERE second_third IS NOT NULL


