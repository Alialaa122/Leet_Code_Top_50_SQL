-- Write your PostgreSQL query statement below
SELECT class 
FROM(SELECT class,COUNT(student) AS student_count
     FROM courses
     GROUP BY class
     HAVING COUNT(student) >= 5)
     