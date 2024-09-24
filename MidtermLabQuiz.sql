-- open connection
USE CATAN_DB;

-- problem 1
SELECT d.deptno,
       CONCAT(d.deptname, '-', COUNT(e.empno)) AS "DEPT-EMPLOYEES"
FROM DEPARTMENT d 
INNER JOIN EMPLOYEE e ON d.deptno = e.workdept
GROUP BY d.deptno, d.deptname;

-- problem 2
SELECT d.deptno, 
       CONCAT(d.deptname, '-', d.mgrno) AS "DEPT-NAME-MGRNO",
       FORMAT(CAST(SUM(e.salary) AS DECIMAL(18, 2)), 'N2') AS "SUM-SALARY-DEPT"
FROM DEPARTMENT d 
INNER JOIN EMPLOYEE e ON d.deptno = e.workdept
GROUP BY d.deptno, d.deptname, d.mgrno;

-- problem 3
SELECT d.deptno, d.deptname,
       COUNT(e.empno) AS "No. EMP",
       FORMAT(AVG(e.salary + e.bonus + e.comm), 'N2') AS "DEPT-AVG-INCOME"
FROM EMPLOYEE e 
INNER JOIN DEPARTMENT d ON e.workdept = d.deptno
GROUP BY d.deptno, d.deptname
HAVING COUNT(e.empno) >= 4
ORDER BY 4 DESC;

-- problem 4
SELECT d.deptno, d.deptname, e.job, COUNT(*) AS "No. Analyst",
       CASE
           WHEN ROUND(AVG(e.edulvl), 0) = 12 THEN 'Twelve'
           WHEN ROUND(AVG(e.edulvl), 0) = 13 THEN 'Thirteen'
           WHEN ROUND(AVG(e.edulvl), 0) = 14 THEN 'Fourteen'
           WHEN ROUND(AVG(e.edulvl), 0) = 15 THEN 'Fifteen'
           WHEN ROUND(AVG(e.edulvl), 0) = 16 THEN 'Sixteen'
           WHEN ROUND(AVG(e.edulvl), 0) = 17 THEN 'Seventeen'
           WHEN ROUND(AVG(e.edulvl), 0) = 18 THEN 'Eighteen'
           WHEN ROUND(AVG(e.edulvl), 0) = 19 THEN 'Nineteen'
           ELSE 'Twenty'
       END AS "AVG-EDLEVEL",
       FORMAT(AVG(e.salary + e.bonus + e.comm), 'N2') AS "DEPT-AVG-INCOME"
FROM DEPARTMENT d
INNER JOIN EMPLOYEE e ON d.deptno = e.workdept
WHERE e.job = 'ANALYST'
GROUP BY d.deptno, d.deptname, e.job;

-- problem 5
SELECT e.workdept, d.deptname AS "Workdept Name", e.gender AS Gender,
       FORMAT(AVG(e.salary), 'N2') AS "AVG-SALARY",
       FORMAT(AVG(e.bonus), 'N2') AS "AVG-BONUS",
       FORMAT(AVG(e.comm), 'N2') AS "AVG-COMM",
       COUNT(e.empno) AS "No. of EMP"
FROM EMPLOYEE e 
INNER JOIN DEPARTMENT d ON e.workdept = d.deptno
WHERE e.workdept LIKE '_1_'
GROUP BY e.workdept, d.deptname, e.gender
HAVING COUNT(e.empno) >= 3
ORDER BY 3;