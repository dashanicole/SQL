USE CATAN_DB;

--Exercise 1--
SELECT empno, lname, bdate, salary 
FROM EMPLOYEE
WHERE salary > 30000.00
ORDER BY salary DESC;

--Exercise 2--
SELECT lname, fname, workdept 
FROM EMPLOYEE
ORDER BY workdept DESC, lname DESC;

--Exercise 3--
SELECT DISTINCT edulvl 
FROM EMPLOYEE
ORDER BY edulvl DESC;

--Exercise 4--
SELECT DISTINCT empno, projno 
FROM EMP_ACT
WHERE empno <= 100
ORDER BY empno;

--Exercise 5--
SELECT lname, salary, bonus 
FROM EMPLOYEE
WHERE gender = 'M' AND bdate < '1980-01-01';

--Exercise 6--
SELECT lname, salary, comm
FROM (
  SELECT lname, salary, comm, ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
  FROM EMPLOYEE
  WHERE salary > 20000.00 AND hiredate > '2001-12-31'
) AS ranked_employees
WHERE rn <= 10;

--Exercise 7--
SELECT fname, lname, salary, bonus, comm  
FROM EMPLOYEE
WHERE (salary > 22000 AND bonus = 400) OR (bonus = 500 AND comm < 1900)
ORDER BY lname;

--Exercise 8--
SELECT projno, actno, emstdate, emendate
FROM EMP_ACT
WHERE projno LIKE 'AD%' AND actno IN (10, 80, 180)
ORDER BY projno, actno;

--Exercise 9--
SELECT mgrno, deptno   
FROM DEPARTMENT
WHERE mgrno IS NOT NULL
ORDER BY mgrno;

--Exercise 10--
SELECT empno, lname, salary, bonus 
FROM EMPLOYEE
WHERE bonus BETWEEN 800.00 AND 1000.00
ORDER BY empno, bonus;

--Exercise 11--
SELECT empno, lname, salary, workdept 
FROM EMPLOYEE
WHERE workdept BETWEEN 'ADD' AND 'COI'
ORDER BY lname ASC, empno ASC;

--Exercise 12--
SELECT projno, projname, prstdate, prendate
FROM PROJECT
WHERE majproj IS NULL
ORDER BY projno;

--Exercise 13--
SELECT *		  
FROM PROJECT
WHERE projname LIKE '%SUPPORT%'
ORDER BY projno DESC;

--Exercise 14--
SELECT *
FROM DEPARTMENT
WHERE
    CASE WHEN LEN(deptno) = 1 THEN deptno ELSE SUBSTRING(deptno, CEILING(LEN(deptno) / 2), 1) END = '1'
ORDER BY deptno;

--Exercise 15--
SELECT lname, fname, minit, salary
FROM (
  SELECT lname, fname, minit, salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
  FROM EMPLOYEE
  WHERE job NOT IN ('Manager', 'President')
) AS ranked_employees
WHERE rn <= 5;