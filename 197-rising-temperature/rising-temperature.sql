-- Write your PostgreSQL query statement below
WITH cte1 AS (SELECT id , 
              LAG(recorddate,1)OVER(ORDER BY recorddate) AS yesterday,
              LAG(temperature,1)OVER(ORDER BY recorddate) AS yesterday_temp , 
              recorddate AS today,
              temperature AS today_temp  
              FROM weather )


SELECT id
FROM cte1
WHERE today_temp > yesterday_temp 
  AND today = yesterday + 1 

