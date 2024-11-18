SELECT
    CASE
        WHEN COUNT(*) != 2 THEN NULL
        ELSE MIN(salary)
    END AS SecondHighestSalary
FROM
    (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 2
    ) e