SELECT
    p3.product_id, 
    CASE
        WHEN new_price IS NULL THEN 10
        ELSE new_price
    END AS price
FROM (SELECT DISTINCT product_id FROM Products) p3
LEFT JOIN (
    SELECT p1.product_id, new_price
    FROM Products p1
    JOIN (
        SELECT product_id, MAX(change_date) AS latest_change
        FROM Products
        WHERE change_date <= '2019-08-16'
        GROUP BY product_id
    ) p2
    ON p1.product_id = p2.product_id
    AND p1.change_date = p2.latest_change
) p4
ON p3.product_id = p4.product_id