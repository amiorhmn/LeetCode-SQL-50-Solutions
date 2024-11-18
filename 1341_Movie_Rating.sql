(
    SELECT name AS results
    FROM MovieRating mr
    JOIN Users u
    ON mr.user_id = u.user_id
    GROUP BY mr.user_id
    ORDER BY COUNT(*) DESC, name ASC
    LIMIT 1
)
UNION ALL
(
    SELECT title AS results
    FROM MovieRating mr
    JOIN Movies m
    ON mr.movie_id = m.movie_id
    AND DATE_FORMAT(created_at, '%M %Y') <= 'February 2020'
    GROUP BY mr.movie_id
    ORDER BY AVG(rating) DESC, title ASC
    LIMIT 1
)