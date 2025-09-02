-- Write your PostgreSQL query statement below

WITH cte1 AS (SELECT customer_id,
                     order_date,
                     customer_pref_delivery_date,
                     CASE WHEN MIN(order_date) OVER(PARTITION BY customer_id) = customer_pref_delivery_date THEN 'immediate'
                     ELSE 'scheduled' END AS status
             FROM delivery
             GROUP BY customer_id,order_date,customer_pref_delivery_date )

SELECT ROUND(SUM(CASE WHEN status= 'immediate' THEN 1 ELSE 0 END )*100.0 /COUNT(DISTINCT customer_id) , 2) AS immediate_percentage 
FROM cte1 
