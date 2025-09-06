-- Write your PostgreSQL query statement below

WITH new_table AS (SELECT pid , tiv_2015, tiv_2016, CONCAT('(',lat,',',lon,')') AS lat_and_lon
                   FROM insurance ) ,


duplicate_city AS (SELECT lat_and_lon, COUNT(*)
                     FROM new_table
                     GROUP BY lat_and_lon
                     HAVING COUNT(*) > 1 ) ,

duplicate_invest AS (SELECT tiv_2015,COUNT(*)
                     FROM new_table
                     GROUP BY tiv_2015
                     HAVING COUNT(*) > 1  ) , 

total_investment AS (SELECT SUM(tiv_2016)::decimal AS total
                     FROM new_table
                     WHERE tiv_2015 IN (SELECT tiv_2015 FROM duplicate_invest )
                     AND lat_and_lon NOT IN (SELECT lat_and_lon FROM duplicate_city) )

SELECT ROUND(total,2) AS tiv_2016 
FROM total_investment        



-- cte3 AS (SELECT SUM(t1.tiv_2016)::decimal AS tiv_2016
-- FROM new_table AS t1
-- JOIN new_table AS t2 
--     ON t1.tiv_2015 = t2.tiv_2015
--     AND t1.lat_and_lon != t2.lat_and_lon
--     AND t1.pid != t2.pid 
-- WHERE t1.lat_and_lon NOT IN (SELECT lat_and_lon FROM duplicate_city )
--   AND t2.lat_and_lon NOT IN (SELECT lat_and_lon FROM duplicate_city )  )

-- SELECT ROUND(tiv_2016*1.0,2) AS tiv_2016 FROM cte3



