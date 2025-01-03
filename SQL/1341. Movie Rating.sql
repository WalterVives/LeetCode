-- Write your MySQL query statement below
-- Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
-- Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

WITH merged_tables AS(
        SELECT m.movie_id,
               m.title,
               u.user_id,
               u.name,
               mr.rating,
               mr.created_at 
        FROM Movies m
        INNER JOIN MovieRating mr
        ON m.movie_id = mr.movie_id
        INNER JOIN Users u
        on mr.user_id = u.user_id
         )
#SELECT * FROM merged_tables
(SELECT
    name AS results
FROM merged_tables
GROUP BY user_id, name
ORDER BY COUNT(rating) DESC, name ASC 
LIMIT 1)
UNION ALL
(SELECT
    title AS results
FROM merged_tables
WHERE MONTH(created_at) = 2 AND YEAR(created_at) = 2020
GROUP BY movie_id
ORDER BY AVG(rating) DESC, title ASC
LIMIT 1)
