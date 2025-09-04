-- Write your PostgreSQL query statement below

WITH movie_count AS (SELECT user_id ,COUNT(*) AS total_movies 
              FROM movierating
              GROUP BY user_id  ) , 

max_count AS(SELECT user_id ,total_movies
          FROM movie_count 
          WHERE total_movies = (SELECT MAX(total_movies) FROM movie_count)
          GROUP BY user_id,total_movies ) ,


movie_avg AS(SELECT movie_id , AVG(rating) AS average_rating
               FROM movierating
               WHERE created_at BETWEEN '2020-02-01' AND '2020-02-28' 
               GROUP BY movie_id ),

max_avg AS (SELECT movie_id ,average_rating
            FROM movie_avg
            WHERE average_rating=(SELECT MAX(average_rating) FROM movie_avg)
            GROUP BY  movie_id ,average_rating)



SELECT results 
FROM (SELECT name AS results
      FROM users
      WHERE user_id IN (SELECT user_id FROM max_count)
      ORDER BY name
      LIMIT 1 ) AS first_result 

UNION ALL


SELECT title AS results
FROM(SELECT title 
     FROM movies
     WHERE movie_id IN (SELECT movie_id FROM max_avg)
     ORDER BY title 
     LIMIT 1 ) AS second_result
