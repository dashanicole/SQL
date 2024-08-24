--Exercise 11--
SELECT empno, lname, salary, workdept 
FROM EMPLOYEE
WHERE workdept BETWEEN 'ADD' AND 'COI'
ORDER BY lname ASC, empno ASC;