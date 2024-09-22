-- open connection
USE CATAN_DB;

-- problem 1
SELECT e.lname, e.fname, d.deptname
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.workdept = d.deptno
ORDER BY 3, 1, 2;

-- problem 2
SELECT e.lname, e.fname, e.job, d.deptname
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.workdept = d.deptno
WHERE d.deptno BETWEEN 'A02' AND 'D22'
AND e.job != 'MANAGER'
ORDER BY 4, 3, 1, 2;

-- problem 3
SELECT d.deptname, m.lname, m.fname
FROM DEPARTMENT d
JOIN EMPLOYEE m ON d.mgrno = m.empno
ORDER BY 1;

-- problem 4
SELECT d.deptname, m.lname, m.fname
FROM EMPLOYEE m
JOIN DEPARTMENT d ON m.workdept = d.deptno
WHERE m.job = 'MANAGER'
ORDER BY 1;

-- problem 5
SELECT DISTINCT p.projno, p.projname, ea.actno
FROM EMP_ACT ea
JOIN PROJECT p ON ea.projno = p.projno
WHERE p.projno LIKE 'AD%' OR p.projno LIKE '%11'
ORDER BY 1, 3;

-- problem 6
SELECT DISTINCT p.projno, p.projname, e.empno, e.lname, ea.actno
FROM EMP_ACT ea
JOIN PROJECT p ON ea.projno = p.projno
JOIN EMPLOYEE e ON p.respemp = e.empno
WHERE p.projno IN ('AD3113', 'IF2000', 'MA2112', 'OP2012')
ORDER BY 1, 5;

-- problem 7
SELECT e.empno, p.projno, p.projname, ea.actno, p.prstdate
FROM EMP_ACT ea
JOIN PROJECT p ON ea.projno = p.projno
JOIN EMPLOYEE e ON p.respemp = e.empno
WHERE p.prstdate BETWEEN '2011-10-01' AND '2011-10-31'
ORDER BY 2, 1, 4; -- no cursor

-- problem 8
SELECT e.workdept, e.lname, p.projname, ea.actno
FROM EMP_ACT ea
JOIN PROJECT p ON ea.projno = p.projno
JOIN EMPLOYEE e ON p.respemp = e.empno
WHERE e.workdept = 'A00'
ORDER BY e.empno, 4;

-- problem 9
SELECT DISTINCT e.workdept, e.lname, p.projname, ea.actno
FROM EMP_ACT ea
JOIN PROJECT p ON ea.projno = p.projno
JOIN EMPLOYEE e ON p.respemp = e.empno
WHERE e.workdept BETWEEN 'A00' AND 'C01'
ORDER BY 1, 2, 4;

-- problem 10
SELECT ea.actno, d.mgrno, p.prstdate, p.projno, e.lname
FROM EMP_ACT ea
JOIN PROJECT p ON ea.projno = p.projno
JOIN DEPARTMENT d ON p.deptno = d.deptno
JOIN EMPLOYEE e ON ea.empno = e.empno
WHERE p.prstdate >= '2011-10-15'
ORDER BY 1, 3;

-- problem 11
SELECT d.deptno, m.lname, e.lname, m.hiredate, e.hiredate
FROM EMPLOYEE e
JOIN DEPARTMENT d ON e.workdept = d.deptno
JOIN EMPLOYEE m ON d.mgrno = m.empno
WHERE d.deptno IN ('A00', 'C01', 'D01', 'E01')
AND e.hiredate < m.hiredate
ORDER BY 3;

-- problems 12 to 15
-- FACULTY table
CREATE TABLE FACULTY (
    fid SMALLINT PRIMARY KEY,
    fname VARCHAR(50),
    gender CHAR(1) CHECK(gender IN ('M', 'F')),
    age SMALLINT,
    hiredate DATE,
    rank VARCHAR(10)
);

-- insert values into table
INSERT INTO FACULTY
VALUES 
(115, 'MELVIN NIÑAL', NULL, 30, '2009-06-01', 'DEAN'),
(110, 'BELL CAMPANILLA', 'M', 32, '2003-06-15', 'INST'),
(101, 'BEN ORDEÑIZA', 'M', 51, '1980-10-01', 'INST'),
(107, 'FRANZ CAMINADE', 'M', 38, '1997-06-15', 'INST'),
(105, 'JONATHAN ETCUBAN', NULL, 35, '2000-03-01', 'INST'),
(109, 'LEAH YBAÑEZ', 'F', 32, '1995-06-01', 'INST'),
(103, 'ROMEO DE LA VICTORIA', 'M', 46, '1986-03-15', 'INST'),
(217, 'YUVINIA PINO', 'F', 50, '1983-03-01', 'INST'),
(150, 'ROSE CASTILLO', 'F', 49, '1981-06-15', 'INST'),
(201, 'LEODIGARIO GATCHO', 'M', 43, '1988-06-01', 'INST'),
(210, 'CECELIO ESTOCINING', 'M', 52, '1983-03-15', 'INST'),
(152, 'MARCIAL TIU', NULL, 54, '1980-06-01', 'INST'),
(213, 'BEN VENTIC', 'M', 58, '1988-03-15', 'DEAN');

-- COLLEGE table
CREATE TABLE COLLEGE (
    colcode CHAR(5),
    colname VARCHAR(50),
    fid SMALLINT,
    FOREIGN KEY(fid) REFERENCES FACULTY(fid)
);

-- insert values into table
INSERT INTO COLLEGE 
VALUES 
('BSCOM', 'COLLEGE OF COMMERCE AND ACCOUNTANCY', NULL),
('BSCOE', 'COLLEGE OF COMPUTER ENGINEERING', 201),
('BSICS', 'COLLEGE OF INFO. AND COMP STUDIES', 115),
('BSICS', 'COLLEGE OF INFO. AND COMP STUDIES', 110),
('BSICS', 'COLLEGE OF INFO. AND COMP STUDIES', 101),
('BSICS', 'COLLEGE OF INFO. AND COMP STUDIES', 107),
('BSICS', 'COLLEGE OF INFO. AND COMP STUDIES', 105),
('BSICS', 'COLLEGE OF INFO. AND COMP STUDIES', 109),
('BSICS', 'COLLEGE OF INFO. AND COMP STUDIES', 103),
('BSENG', 'COLLEGE OF ALLIED ENGINEERING', NULL),
('BSEDU', 'COLLEGE OF EDUCATION', 217),
('BSCRM', 'COLLEGE OF CRIMINAL JUSTICE', NULL),
('BSCAD', 'COLLEGE OF CUSTOMS ADMINISTRATION', NULL);

-- FACULTY_LOAD table
CREATE TABLE FACULTY_LOAD (
    sbjcode CHAR(5) PRIMARY KEY,
    sbjtitle VARCHAR(50),
    units DECIMAL(2,1),
    fload SMALLINT,
    FOREIGN KEY(fload) REFERENCES FACULTY(fid)
);

-- insert values into table
INSERT INTO FACULTY_LOAD
VALUES 
('IT110', 'IT FUNDAMENTALS', 3.0, 110),
('IT121', 'INTERNET PROGRAMMING', 3.0, NULL),
('IT210', 'COMP PROGRAMMING', 3.0, 101),
('IT212', 'QUALITY CONCIOUSNESS', 3.0, NULL),
('IT220', 'FILE ORG & PROCESSING', 3.0, 101),
('IT223', 'SYSTEM ANALYSIS & DESIGN', 3.0, 105),
('IT312', 'DATABASE SYSTEMS', 4.0, 107),
('IT410', 'SOFTWARE ENGINEERING', 3.0, 105);

-- problem 12
SELECT f.fid, f.fname, fl.sbjcode, fl.sbjtitle, fl.units
FROM FACULTY f
RIGHT OUTER JOIN FACULTY_LOAD fl ON f.fid = fl.fload
JOIN COLLEGE c ON f.fid = c.fid
WHERE c.colname = 'COLLEGE OF INFO. AND COMP STUDIES'
AND fl.sbjcode LIKE 'IT%'
ORDER BY 3;

-- problem 13
SELECT f.fid, f.fname, f.rank, c.colcode, c.colname
FROM FACULTY f
FULL OUTER JOIN COLLEGE c ON f.fid = c.fid
ORDER BY 4;

-- problem 14
SELECT f.fid, f.fname, f.rank, fl.sbjcode, fl.sbjtitle
FROM FACULTY f
LEFT OUTER JOIN FACULTY_LOAD fl ON f.fid = fl.fload
WHERE f.fid < 210
AND f.rank != 'DEAN'
ORDER BY 1;

-- problem 15
SELECT f.fid, f.fname, f.rank, fl.sbjcode, fl.sbjtitle, c.colcode, c.colname
FROM FACULTY f
FULL OUTER JOIN FACULTY_LOAD fl ON f.fid = fl.fload
FULL OUTER JOIN COLLEGE c ON f.fid = c.fid
ORDER BY 4;




