SELECT 
    reports_to AS employee_id, 
    m.name AS name, 
    COUNT(e.employee_id) AS reports_count, 
    ROUND(AVG(age)) AS average_age
FROM Employees e
JOIN (SELECT
        name, 
        employee_id 
    FROM Employees) m
ON e.reports_to = m.employee_id
GROUP BY reports_to
ORDER BY employee_id