--Exercise 15--
SELECT lname, fname, minit, salary
FROM (
  SELECT lname, fname, minit, salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
  FROM EMPLOYEE
  WHERE job NOT IN ('Manager', 'President')
) AS ranked_employees
WHERE rn <= 5;