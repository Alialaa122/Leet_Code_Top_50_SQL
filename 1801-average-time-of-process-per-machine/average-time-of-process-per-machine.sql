-- Write your PostgreSQL query statement below
-- THIS is my solution but has bad time complexity 
-- WITH cte1 AS (SELECT machine_id, 
--                     SUM(CASE WHEN activity_type  = 'end' THEN timestamp END) - SUM(CASE WHEN activity_type  = 'start' THEN timestamp END) AS time_to_complete_process,
--              COUNT(DISTINCT process_id) AS total_processes
--              FROM activity
--              GROUP BY machine_id )

-- SELECT machine_id , ROUND((time_to_complete_process/total_processes)::numeric,3) AS processing_time 
-- FROM cte1
-- GROUP BY machine_id,time_to_complete_process,total_processes

-- ANOTHER ONE 
SELECT a1.machine_id , ROUND(AVG(a2.timestamp-a1.timestamp)::numeric,3) AS processing_time  
FROM activity AS a1 
   JOIN activity AS a2 
      ON  a1.machine_id=a2.machine_id
      AND a1.process_id=a2.process_id
      AND a1.activity_type='start'
      AND a2.activity_type='end'
GROUP BY a1.machine_id


