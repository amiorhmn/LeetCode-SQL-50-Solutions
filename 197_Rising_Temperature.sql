SELECT id
FROM Weather
JOIN (SELECT recordDate, temperature AS prev_temp FROM Weather) AS prev_table
ON TO_DAYS(Weather.recordDate) = TO_DAYS(prev_table.recordDate) + 1
WHERE temperature > prev_temp