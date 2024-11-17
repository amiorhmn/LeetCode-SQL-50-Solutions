SELECT person_name
FROM Queue
WHERE turn = (
    SELECT MAX(turn)
    FROM (
        SELECT *, SUM(weight) OVER (ORDER BY turn) AS total_weight
        FROM Queue
        ) q
    WHERE total_weight <= 1000
    )