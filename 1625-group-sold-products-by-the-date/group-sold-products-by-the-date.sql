-- Write your PostgreSQL query statement below
SELECT sell_date,
       COUNT( DISTINCT product) AS num_sold,
       STRING_AGG( DISTINCT product,',' ORDER BY product) AS products
FROM Activities
GROUP BY sell_date 
ORDER BY sell_date

-- STRING_AGG STRING_AGG(expression, delimiter [ORDER BY expression])
/* Takes multiple row values (from a group or a query),

Concatenates them into a single string,

Places a delimiter (like , ) between each value,

Can sort the values before joining them */