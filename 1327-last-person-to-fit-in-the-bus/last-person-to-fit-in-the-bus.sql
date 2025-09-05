-- Write your PostgreSQL query statement below
WITH cte1 AS (SELECT turn , person_name, SUM(weight) OVER(ORDER BY turn 
                                                          RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
              FROM queue  ) , 

cte2 AS  (SELECT turn, CASE WHEN running_total <=1000 THEN person_name
             ELSE NULL END AS people_fit_in
        FROM cte1 ) ,

cte3 AS (SELECT turn,people_fit_in
         FROM cte2
         WHERE people_fit_in IS NOT NULL )

SELECT people_fit_in AS person_name
FROM cte3 
WHERE turn = (SELECT MAX(turn) FROM cte3 )

