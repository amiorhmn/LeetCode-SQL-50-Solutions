SELECT
    c1.visited_on AS visited_on, 
    SUM(c2.amount) AS amount, 
    ROUND(SUM(c2.amount)/7, 2) AS average_amount
FROM 
    (
        SELECT 
            visited_on, 
            SUM(amount) AS amount 
        FROM Customer 
        GROUP BY visited_on
    ) c1
JOIN Customer c2
ON DATEDIFF(c1.visited_on, c2.visited_on) BETWEEN 0 AND 6
GROUP BY c1.visited_on
HAVING COUNT(DISTINCT c2.visited_on) >= 7
ORDER BY visited_on ASC