-- Write your PostgreSQL query statement below
WITH cte1 AS (SELECT machine_id, 
                    SUM(CASE WHEN activity_type  = 'end' THEN timestamp END) - SUM(CASE WHEN activity_type  = 'start' THEN timestamp END) AS time_to_complete_process,
             COUNT(DISTINCT process_id) AS total_processes
             FROM activity
             GROUP BY machine_id )

SELECT machine_id , ROUND((time_to_complete_process/total_processes)::numeric,3) AS processing_time 
FROM cte1
GROUP BY machine_id,time_to_complete_process,total_processes

