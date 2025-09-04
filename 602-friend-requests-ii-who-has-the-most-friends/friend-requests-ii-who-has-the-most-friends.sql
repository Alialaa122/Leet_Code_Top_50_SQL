-- Write your PostgreSQL query statement below

-- MY SOLUTION 

WITH c1 AS (SELECT requester_id AS user_id ,COUNT(*) AS friends1
              FROM RequestAccepted 
              GROUP BY requester_id ),

c2 AS(SELECT accepter_id AS user_id  ,COUNT(*) AS friends2
        FROM RequestAccepted 
        GROUP BY accepter_id )

SELECT COALESCE(c1.user_id,c2.user_id,0) AS id,
       COALESCE(c1.friends1,0) + COALESCE(c2.friends2,0) AS num 
FROM c1
FULL OUTER JOIN c2 on c1.user_id=c2.user_id 
ORDER BY num DESC
LIMIT 1  




-- WITH cte1 AS (SELECT requester_id AS id 
--            FROM RequestAccepted

--            UNION ALL

--            SELECT accepter_id AS id 
--            FROM RequestAccepted   )

-- SELECT id , COUNT(*) AS num
-- FROM cte1 
-- GROUP BY id 
-- ORDER BY num DESC
-- LIMIT 1 
