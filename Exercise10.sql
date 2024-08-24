--Exercise 10--
SELECT empno, lname, salary, bonus 
FROM EMPLOYEE
WHERE bonus BETWEEN 800.00 AND 1000.00
ORDER BY empno, bonus;