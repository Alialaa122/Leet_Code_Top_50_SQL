-- Write your PostgreSQL query statement below


SELECT activity_date AS day ,COUNT(user_id) AS active_users 
FROM(SELECT user_id , activity_date , DATE '2019-07-27'-activity_date + 1  AS activity_period
     FROM activity
     GROUP BY user_id , activity_date )
WHERE activity_period >0 AND activity_period <=30  
GROUP BY activity_date



