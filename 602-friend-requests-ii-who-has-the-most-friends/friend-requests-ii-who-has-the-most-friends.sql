-- Write your PostgreSQL query statement below


-- WITH cte1 AS (SELECT requester_id ,COUNT(*) AS friends1
--               FROM RequestAccepted 
--               GROUP BY requester_id ),

-- cte2 AS(SELECT accepter_id ,COUNT(*) AS friends2
--         FROM RequestAccepted 
--         GROUP BY accepter_id )

-- select cte1.requester_id AS id , SUM(cte1.friends1+cte2.friends2) AS num 
-- FROM cte1
-- JOIN cte2 on cte1.requester_id=cte2.accepter_id
-- GROUP BY cte1.requester_id
-- ORDER BY num DESC 
-- LIMIT 1 


WITH cte1 AS (SELECT requester_id AS id 
           FROM RequestAccepted

           UNION ALL

           SELECT accepter_id AS id 
           FROM RequestAccepted   )

SELECT id , COUNT(*) AS num
FROM cte1 
GROUP BY id 
ORDER BY num DESC
LIMIT 1 
