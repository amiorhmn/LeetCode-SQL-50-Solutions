SELECT s.machine_id, ROUND(SUM(e.timestamp - s.timestamp)/COUNT(s.process_id), 3) AS processing_time
FROM (
    SELECT machine_id, process_id, activity_type, timestamp
    FROM Activity
    WHERE activity_type = 'start'
) s
JOIN (
    SELECT machine_id, process_id, activity_type, timestamp
    FROM Activity
    WHERE activity_type = 'end'
) e
ON s.machine_id = e.machine_id AND s.process_id = e.process_id
GROUP BY s.machine_id