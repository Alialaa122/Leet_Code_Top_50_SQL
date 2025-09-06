-- Write your PostgreSQL query statement below

WITH cte1 AS (SELECT d.name AS department ,
                     e.name AS employee ,
                     e.salary ,
                     DENSE_RANK() OVER(PARTITION BY d.name 
                                 ORDER BY salary DESC) AS rank
              FROM employee AS e
               JOIN department AS d 
                  ON e.departmentid=d.id )

SELECT department,employee,salary
FROM cte1
WHERE rank <= 3 

