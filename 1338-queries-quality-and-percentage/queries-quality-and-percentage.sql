-- Write your PostgreSQL query statement below

SELECT query_name,
       ROUND(SUM(rating *1.0 / position) / COUNT(*) , 2 ) AS quality,
       ROUND(COUNT(CASE WHEN rating < 3 THEN 1 END ) * 100.0 / COUNT(*) , 2 ) AS poor_query_percentage
FROM queries
GROUP BY query_name 

-- YOU CAN USE CASE STATEMENT IN AGGREGATE FUNCTIONS


 

 






