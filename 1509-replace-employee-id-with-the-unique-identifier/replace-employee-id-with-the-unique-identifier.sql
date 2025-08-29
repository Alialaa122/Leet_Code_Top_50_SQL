-- Write your PostgreSQL query statement below
SELECT unique_id,name
FROM employees
LEFT JOIN employeeuni
USING(id)