SELECT DISTINCT l2.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2
ON l1.id = l2.id - 1
JOIN Logs l3
ON l3.id = l2.id + 1
WHERE l1.num = l2.num AND l2.num = l3.num