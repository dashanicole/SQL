-- open connection
USE CATAN_DB;

-- problem 1
SELECT lname, salary, ROUND(salary * 1.05, 2) AS 'INC-Y-SALARY', 
    ROUND((salary * 1.05) / 12, 2) AS 'INC-M-SALARY'
FROM EMPLOYEE
WHERE salary * 1.05 <= 60000
ORDER BY 2;

-- problem 2
SELECT CONCAT(fname, ' ', minit, '. ', lname) AS 'EMPLOYEE NAME', 
    CASE edulvl 
        WHEN 18 THEN 'Eighteen' 
		WHEN 20 THEN 'Twenty'
    END AS edulvl,
    ROUND(salary + 1800, 2) AS 'NEW-SALARY', 
    ROUND(bonus / 2.0, 2) AS 'NEW-BONUS' -- it doesn't work
FROM EMPLOYEE
WHERE edulvl IN (18, 20)
ORDER BY 2 DESC, salary;

-- problem 3
SELECT d.deptno, d.deptname, e.lname, e.salary, 
	ROUND(salary - 1000, 2) AS 'DECR-SALARY'
FROM EMPLOYEE e
	INNER JOIN DEPARTMENT d ON e.workdept = d.deptno
WHERE d.deptno = 'D11' 
	AND (e.salary BETWEEN 0.8 * 50000 AND 1.2 * 50000)
ORDER BY 4;

-- problem 4
SELECT d.deptname, 
    CONCAT(LEFT(e.fname, 1), '.', e.minit, '.', e.lname) AS 'EMP-NAME', 
    (e.salary + COALESCE(e.comm, 0) + COALESCE(e.bonus, 0)) AS income
FROM EMPLOYEE e
	INNER JOIN DEPARTMENT d ON e.workdept = d.deptno
WHERE d.deptno = 'D11' 
	AND (e.salary + COALESCE(e.comm, 0) + COALESCE(e.bonus, 0) > e.salary * 1.10)
ORDER BY 3 DESC; -- no cursor

-- problem 5
SELECT deptno, deptname, 
    COALESCE(mgrno, 'UNKNOWN MANAGER') AS MGRNO
FROM DEPARTMENT
WHERE mgrno IS NULL
ORDER BY 1;

-- problem 6
SELECT p.projno, 
    COALESCE(p.majproj, 'MAIN PROJECT') AS majproj, 
    CONCAT(UPPER(LEFT(e.fname, 1)), LOWER(SUBSTRING(e.fname, 2, LEN(e.fname))), ' ', 
           UPPER(LEFT(e.lname, 1)), LOWER(SUBSTRING(e.lname, 2, LEN(e.lname)))) AS 'EMP-NAME', 
    DATENAME(WEEKDAY, p.prstdate) AS 'PRJ-START-DAY', p.prstdate
FROM PROJECT p
	INNER JOIN EMPLOYEE e ON p.respemp = e.empno
WHERE p.projno LIKE 'MA%'
ORDER BY 1;

-- problem 7
SELECT e.empno, 
    CONCAT(e.fname, ' ', e.minit, '. ', e.lname) AS name, 
    d.deptname, DATEDIFF(YEAR, e.bdate, e.hiredate) AS AGE
FROM EMPLOYEE e
	INNER JOIN DEPARTMENT d ON e.workdept = d.deptno 
WHERE DATEDIFF(YEAR, e.bdate, e.hiredate) < 25
ORDER BY 4, 1;

-- problem 8
SELECT YEAR(p.prstdate) AS YEAR, 
	MONTH(p.prstdate) AS MONTH, 
    p.projno
FROM PROJECT p
	INNER JOIN EMP_ACT ea ON p.projno = ea.projno
WHERE prendate = '2002-12-01'
ORDER BY 3, ea.actno; -- no cursor

-- problem 9
SELECT projno, projname, 
    ROUND(CAST(DATEDIFF(DAY, prstdate, prendate) AS FLOAT) / 7.0, 1) AS 'DURATION IN WEEKS'
FROM PROJECT
WHERE projno LIKE 'MA%' OR projno LIKE 'OP%'
ORDER BY 1;

-- problem 10
SELECT p.projno, CONCAT(e.fname, ' ', e.minit, '. ', e.lname) AS 'employee name', 
    d.deptname, p.prendate AS ESTIMATED, 
    DATEADD(DAY, DATEDIFF(DAY, p.prstdate, p.prendate) * 0.10, p.prendate) AS EXPECTED
FROM PROJECT p
	INNER JOIN EMPLOYEE e ON p.respemp = e.empno
	INNER JOIN DEPARTMENT d ON e.workdept = d.deptno 
WHERE p.projno NOT LIKE 'MA%'
ORDER BY 1;
