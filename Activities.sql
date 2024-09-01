-- Database
USE CATAN_DB;

-- Tables
SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;
SELECT * FROM PROJECT;
SELECT * FROM EMP_ACT;

-- Activity 2
SELECT empno, lname, deptname, job, comm, 
	CASE job
		WHEN 'CLERK' THEN comm + 100.00
		WHEN 'OPERATOR' THEN comm + 75.00
		WHEN 'SALESREP' THEN comm + 60.00
		ELSE comm + 50.00
	END AS 'INC-COMM'
FROM EMPLOYEE
INNER JOIN DEPARTMENT ON EMPLOYEE.workdept = DEPARTMENT.deptno
WHERE job IN ('CLERK','OPERATOR','SALESREP','FIELDREP')
ORDER BY 4, 6 DESC; 

-- Activity 3
SELECT deptname, empno, lname, salary, 
	CASE
		WHEN salary > 40000.00 THEN 'Executive Mgt.'
		WHEN salary > 30000.00 THEN 'Middle Mgt.'
		WHEN salary > 20000.00 THEN 'First-Level Mgt.'
		ELSE 'Intermediate Level' 
	END AS joblvl
FROM EMPLOYEE
INNER JOIN DEPARTMENT ON EMPLOYEE.workdept = DEPARTMENT.deptno
ORDER BY 1, 2;

-- Activity 4
SELECT deptno, empno, lname, projno, prendate, 
	CASE 
		WHEN deptno = 'D11' AND prstaff > 3.00 THEN '2 Weeks'
		WHEN deptno = 'D11' AND prstaff > 2.00 THEN '2.5 Weeks'
		WHEN deptno = 'D11' THEN '3 Weeks'

		WHEN deptno = 'D21' AND prstaff > 2.00 THEN '1 Week'
		WHEN deptno = 'D21' AND prstaff > 1.00 THEN '2 Weeks'
		WHEN deptno = 'D21' THEN '2.5 Weeks'

		WHEN deptno = 'E21' AND prstaff > 1.00 THEN '2 Weeks'
		WHEN deptno = 'E21' THEN '2.5 Weeks'
	END AS 'PRJ-PRENDATE-EXT.'
FROM PROJECT
INNER JOIN EMPLOYEE ON PROJECT.respemp = EMPLOYEE.empno 
ORDER BY 1, 4, 2;

