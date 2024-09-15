-- open connection
USE CATAN_DB;

-- example 1
SELECT deptno, deptname, empno, fname, lname
FROM DEPARTMENT, EMPLOYEE
WHERE deptno = workdept
ORDER BY 1, 3;

-- example 2
SELECT empno, fname, lname, job, projno, projname
FROM EMPLOYEE, PROJECT
WHERE empno = respemp AND projname LIKE '%PROGRAMMING%'
ORDER BY 1;

-- example 3
SELECT e.empno, e.lname, e.job, d.deptno, d.deptname
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON e.empno = d.mgrno
WHERE d.mgrno IS NOT NULL
ORDER BY 4;

-- example 4
SELECT e.empno, e.fname, e.lname, e.hiredate, e.job, p.projno, p.projname, p.prstdate
FROM EMPLOYEE e
INNER JOIN PROJECT p ON  e.empno = p.respemp
WHERE e.job NOT IN ('PRESIDENT', 'MANAGER')
ORDER BY 8, 1;

-- example 5 (SELF JOIN)
SELECT e.workdept, e.lname AS EMPLOYEE, e.bdate AS 'EMP-BDATE', m.lname AS MANAGER, m.bdate AS 'MGR-BDATE'
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON e.workdept = d.deptno
INNER JOIN EMPLOYEE m ON d.mgrno = m.empno
WHERE e.bdate < m.bdate
ORDER BY 1, 3;

-- CROSS JOIN, must be avoided
-- LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN

-- problem 1
SELECT e.lname, e.fname, d.deptname
FROM EMPLOYEE e 
JOIN DEPARTMENT d ON e.workdept = d.deptno
ORDER BY 3, 1, 2;
