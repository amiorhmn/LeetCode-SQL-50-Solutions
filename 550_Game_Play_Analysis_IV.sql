SELECT ROUND(COUNT(first_event)/COUNT(DISTINCT a1.player_id), 2) AS fraction
FROM Activity a1
LEFT JOIN (
    SELECT player_id, MIN(event_date) AS first_event
    FROM Activity
    GROUP BY player_id
) a2
ON a1.player_id = a2.player_id
AND DATEDIFF(a1.event_date, a2.first_event) = 1