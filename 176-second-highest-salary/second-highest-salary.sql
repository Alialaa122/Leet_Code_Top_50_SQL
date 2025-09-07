-- Write your PostgreSQL query statement below
WITH cte1 AS (SELECT id,salary, DENSE_RANK()OVER(ORDER BY salary DESC)  AS rank
              FROM employee ) 

-- USING MAX() will return null if the value doesnot exist 
SELECT MAX(DISTINCT salary) AS SecondHighestSalary 
FROM cte1 
WHERE rank = 2 
