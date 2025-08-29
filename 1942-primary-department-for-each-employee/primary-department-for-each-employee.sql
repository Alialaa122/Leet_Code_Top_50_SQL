-- Write your PostgreSQL query statement below
SELECT employee_id,department_id
FROM employee
-- Condition if they picked which department is primary
WHERE primary_flag='Y' 
-- Sub query for condition for those employee who appeared once in the table
   OR  employee_id IN (SELECT employee_id 
       FROM employee
       GROUP BY  employee_id
       HAVING COUNT(*) = 1 )

 







-- if they have a one then flag = N
-- IF they have more than one then they need to decide which one is the primary with flag='Y' 