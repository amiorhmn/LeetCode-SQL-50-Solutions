SELECT ROUND(SUM(order_date =  customer_pref_delivery_date)/COUNT(*)*100, 2) AS immediate_percentage
FROM Delivery d1
RIGHT JOIN (
    SELECT MIN(order_date) AS first_order, customer_id
    FROM Delivery
    GROUP BY customer_id
) d2
ON d1.customer_id = d2.customer_id
AND d1.order_date = d2.first_order