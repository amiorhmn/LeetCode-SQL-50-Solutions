SELECT p.product_id, year AS first_year, quantity, price
FROM Sales s
JOIN Product p
ON s.product_id = p.product_id
JOIN (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) y
ON p.product_id = y.product_id
AND s.year = y.first_year