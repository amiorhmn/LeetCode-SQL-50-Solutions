SELECT 
    d.name AS Department, 
    e.name AS Employee, 
    salary AS Salary
FROM 
    (
        SELECT
        *, 
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS earn_order
        FROM Employee
    ) e
JOIN Department d
ON e.departmentId = d.id
AND e.earn_order <= 3