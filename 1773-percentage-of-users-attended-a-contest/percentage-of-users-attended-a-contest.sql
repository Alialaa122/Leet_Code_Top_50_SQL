-- Write your PostgreSQL query statement below
SELECT r.contest_id,ROUND(COUNT(r.user_id)*100.00/
                        (SELECT COUNT(u.user_id) 
                         FROM users AS u),2) AS percentage
FROM register AS r
GROUP BY contest_id
ORDER BY percentage DESC ,r.contest_id 
