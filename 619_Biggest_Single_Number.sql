SELECT MAX(num) AS num
FROM (
    SELECT num, COUNT(*) AS count
    FROM MyNumbers
    GROUP BY num
) t
WHERE count = 1 