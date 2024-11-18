SELECT product_name, SUM(unit) AS unit
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
AND DATE_FORMAT(order_date, '%M %Y') <= 'February 2020'
GROUP BY product_name
HAVING SUM(unit) >= 100