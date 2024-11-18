SELECT *
FROM Users
WHERE mail REGEXP '^([a-z]|[A-Z])([[:alnum:]_.-])*@leetcode[.]com$'