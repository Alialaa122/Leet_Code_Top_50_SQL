-- Write your PostgreSQL query statement below
SELECT name,bonus
FROM employee
LEFT JOIN bonus
USING(empid)
WHERE bonus<1000
   OR bonus IS NULL