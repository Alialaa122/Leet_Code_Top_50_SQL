-- Write your PostgreSQL query statement below
WITH c1 AS (SELECT player_id,MIN(event_date) AS first_login
            FROM activity
            GROUP BY player_id  ) , 


c2 AS (SELECT a.player_id,a.event_date,c1.first_login
       FROM activity AS a
         LEFT JOIN c1 
            ON c1.first_login+1=a.event_date
            AND c1.player_id = a.player_id )


SELECT ROUND(SUM(CASE WHEN first_login IS NOT NULL THEN 1 ELSE 0 END )*1.0 / COUNT(DISTINCT player_id) ,2) AS fraction

FROM c2

