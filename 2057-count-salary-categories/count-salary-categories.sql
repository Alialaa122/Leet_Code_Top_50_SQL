-- Write your PostgreSQL query statement below

-- WITH cte1 AS (SELECT account_id,
--                      income, 
--                      CASE WHEN income < 20000 THEN 'Low Salary'
--                           WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
--                           WHEN income > 50000 THEN 'High Salary'
--                      ELSE NULL END AS category 
--                FROM accounts  )

-- SELECT category,COUNT(*)
-- FROM cte1
-- WHERE category = 'Low Salary'
-- GROUP BY category


SELECT 'Low Salary' AS category , SUM(CASE WHEN income < 20000 THEN 1 ELSE 0 END) AS accounts_count
FROM accounts

UNION 

SELECT 'Average Salary' AS category , SUM(CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END) AS accounts_count
FROM accounts

UNION 

SELECT 'High Salary' AS category , SUM(CASE WHEN income > 50000 THEN 1 ELSE 0 END) AS accounts_count
FROM accounts



