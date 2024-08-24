--Exercise 7--
SELECT fname, lname, salary, bonus, comm  
FROM EMPLOYEE
WHERE (salary > 22000 AND bonus = 400) OR (bonus = 500 AND comm < 1900)
ORDER BY lname;