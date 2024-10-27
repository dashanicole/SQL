USE CATAN_DB;

CREATE TABLE department1 (
    deptno CHAR(3) PRIMARY KEY NOT NULL,
    deptname VARCHAR(50) NOT NULL
);

CREATE TABLE employee1 (
    empno CHAR(6) PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    workdept CHAR(3) NOT NULL,
    edlevel SMALLINT NOT NULL,
    job CHAR(10) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (workdept) REFERENCES department(deptno)
);

INSERT INTO department1 (deptno, deptname) VALUES ('A00', 'Administration'),
	('B01', 'Human Resources'), ('C01', 'Purchasing'), ('D01', 'Accounting'), 
	('E01', 'Property Custodian');

SELECT * FROM department1;

INSERT INTO employee1 (empno, name, workdept, edlevel, job, salary) VALUES 
	('000010', 'CHRISTINE HAAS', 'A00', 18, 'PRESIDENT', 52750.00),
	('000020', 'MICHAEL THOMPSON', 'B01', 16, 'MANAGER', 41250.00),
	('000030', 'SALLY KWAN', 'C01', 16, 'MANAGER', 38250.00),
	('000050', 'JOHN GEYER', 'D01', 17, 'MANAGER', 40175.00),
	('000060', 'IRVING STERN', 'E01', 15, 'MANAGER', 32250.00),
	('000130', 'DOLORES QUINTANA', 'A00', 15, 'ANALYST', 25800.00),
	('000230', 'JAMES JEFFERSON', 'B01', 14, 'DESIGNER', 23850.00),
	('000270', 'RAMLAL METHA', 'C01', 12, 'OPERATOR', 15340.00),
	('000320', 'JAMES WALKER', 'D01', 13, 'CLERK', 16350.00),
	('000350', 'SYBIL PIANKA', 'E01', 14, 'ANALYST', 23875.00);

SELECT * FROM employee1;

-- Assignment Number 1 (Intersect)
SELECT d.deptname, e.empno, e.name, e.edlevel, e.job
FROM department1 d JOIN employee1 e
ON d.deptno = e.workdept
WHERE CAST(e.empno AS INT) / 3 * 3 = CAST(e.empno AS INT)

INTERSECT

SELECT d.deptname, e.empno, e.name, e.edlevel, e.job
FROM department1 d JOIN employee1 e
ON d.deptno = e.workdept
WHERE e.edlevel BETWEEN 16 AND 18;

-- Assignment Number 2 (Except)
SELECT e.workdept AS DEPTNO, d.deptname, e.name, e.job, e.salary
FROM department1 d JOIN employee1 e
ON d.deptno = e.workdept
WHERE e.salary >= 20000.00 AND e.salary <= 35000.00

EXCEPT

SELECT d.deptname, e.empno, e.name, e.edlevel, e.job
FROM department1 d JOIN employee1 e
ON d.deptno = e.workdept
WHERE e.edlevel BETWEEN 14 AND 16;