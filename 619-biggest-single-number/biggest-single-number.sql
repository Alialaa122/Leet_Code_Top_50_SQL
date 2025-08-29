-- Write your PostgreSQL query statement below
SELECT MAX(num) AS num
FROM (SELECT num
      FROM mynumbers
      GROUP BY num
      HAVING COUNT(*)=1)





-- SELECT from the table single numbers :-- if there is a single numbers then get the maximum
                                         -- if there is not then null
