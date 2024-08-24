--Exercise 6--
SELECT lname, salary, comm
FROM (
  SELECT lname, salary, comm, ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
  FROM EMPLOYEE
  WHERE salary > 20000.00 AND hiredate > '2001-12-31'
) AS ranked_employees
WHERE rn <= 10;