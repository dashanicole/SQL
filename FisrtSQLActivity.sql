--create database--
CREATE DATABASE CATAN_DB;

--use database--
USE CATAN_DB;

--create table--
CREATE TABLE DEPARTMENTs (
    DeptNum CHAR(3) PRIMARY KEY NOT NULL,
	DeptName VARCHAR(40) NOT NULL,
    MgrNum CHAR(6) NULL,
	AdmrDept CHAR(3) NOT NULL,
	Loc VARCHAR(50) NULL,
);
--alter table--
ALTER TABLE DEPARTMENTs
ADD
	CONSTRAINT FK_AdmrDept
	FOREIGN KEY(AdmrDept) 
	REFERENCES DEPARTMENTs(DeptNum),

	CONSTRAINT FK_MgrNum
	foreign key(MgrNum)
	references EMPLOYEEs(EmpNum)
;

--insert values into table--
INSERT INTO DEPARTMENTs (DeptNum, DeptName, MgrNum, AdmrDept, Loc)
VALUES
	('A00', 'SPIFFY COMPUTER SERVICE DIV.', '000010', 'A00', 'ADMIN BLDG. 1ST FLOOR'),
	('B01', 'PLANNING', '000020', 'A00', 'ADMIN BLDG. 2ND FLOOR'),
	('C01', 'INFORMATION CENTER', '000030', 'A00', 'ADMIN BLDG. GROUND FLOOR'),
	('D01', 'DEVELOPMENT CENTER', NULL, 'A00', 'DEV BLDG. GROUND AND 1ST FLOOR'),
	('D11', 'MANUFACTURING SYSTEMS', '000060', 'D01', 'DEV BLDG. 2ND, 3RD, AND 4TH FLOOR'),
	('D21', 'ADMINISTRATION SYSTEMS', '000070', 'D01', 'ADMIN BLDG. 1ST FLOOR NORTH-WING'),
	('E01', 'SUPPORT SERVICES', '000050', 'A00', 'ADMIN BLDG. 1ST FLOOR WEST-WING'),
	('E11', 'OPERATIONS', '000090', 'E01', NULL),
	('E21', 'SOFTWARE SUPPORT', '000100', 'E01', 'DEV BLDG. 5TH-7TH FLOOR'),
	('F22', 'BRANCH OFFICE F2', NULL, 'E01', NULL),
	('G22', 'BRANCH OFFICE G2', NULL, 'E01', NULL),
	('H22', 'BRANCH OFFICE H2', NULL, 'E01', NULL),
	('I22', 'BRANCH OFFICE I2', NULL, 'E01', NULL),
	('J22', 'BRANCH OFFICE J2', NULL, 'E01', NULL)
;

--show all values from table--
SELECT * FROM DEPARTMENTs;

--create table--
CREATE TABLE EMPLOYEEs (
    EmpNum CHAR(6) PRIMARY KEY NOT NULL,
	FName VARCHAR(20) NOT NULL,
    MInit CHAR(1) CHECK(MInit LIKE '[A-Z]') NULL,
	LName VARCHAR(15) NOT NULL,
	WorkDept CHAR(3) NOT NULL,
	PhoneNum CHAR(11) NOT NULL,
	HireDate DATE NOT NULL,
	Job CHAR(10) NOT NULL,
	EduLevel SMALLINT NOT NULL,
	Gender CHAR(1) CHECK(Gender LIKE '[FM]') NOT NULL,
	BDate DATE NOT NULL,
	Salary DECIMAL(10,2) NOT NULL,
	Bonus DECIMAL(9,2) NULL,
	Comm DECIMAL(9,2) NULL
);

--alter table--
ALTER TABLE EMPLOYEEs
ADD 
	CONSTRAINT FK_WorkDept
	FOREIGN KEY(WorkDept) 
	REFERENCES DEPARTMENTs(DeptNum)
;

--insert values into table--
INSERT INTO EMPLOYEEs (EmpNum, FName, MInit, LName, WorkDept, PhoneNum, HireDate, Job, EduLevel, Gender, BDate, Salary, Bonus, Comm)
VALUES
('000010', 'CHRISTINE', 'I', 'HAAS', 'A00', '08131233978', '1995-01-01', 'PRESIDENT', 18, 'F', '1963-08-24', 152750.00, 1000.00, 4220.00),
('000020', 'MICHAEL', 'L', 'THOMPSON', 'B01', '09082453476', '2003-10-10', 'MANAGER', 18, 'M', '1978-02-02', 94250.00, 800.00, 3300.00),
('000030', 'SALLY', 'A', 'KWAN', 'C01', '09112544738', '2005-04-05', 'MANAGER', 20, 'F', '1971-05-11', 98250.00, 800.00, 3060.00),
('000050', 'JOHN', 'B', 'GEYER', 'E01', '09136546789', '1979-08-17', 'MANAGER', 16, 'M', '1955-09-15', 80175.00, 800.00, 3214.00),
('000060', 'IRVING', 'F', 'STERN', 'D11', '09196576423', '2003-09-14', 'MANAGER', 16, 'M', '1975-07-07', 72250.00, 500.00, 2580.00),
('000070', 'EVA', 'D', 'PULASKI', 'D21', '09217857831', '2005-09-30', 'MANAGER', 16, 'F', '2003-05-26', 96170.00, 700.00, 2893.00),
('000090', 'EILEEN', 'W', 'HENDERSON', 'E11', '09286855498', '2000-08-15', 'MANAGER', 16, 'F', '1971-05-15', 89750.00, 600.00, 2380.00),
('000100', 'THEODORE', 'Q', 'SPENSER', 'E21', '09468740972', '2000-06-19', 'MANAGER', 14, 'M', '1980-12-18', 86150.00, 500.00, 2092.00),
('000110', 'VINCENZO', 'G', 'LUCCHESSI', 'A00', '09473653490', '1988-05-16', 'SALESREP', 19, 'M', '1959-11-05', 66500.00, 900.00, 3720.00),
('000120', 'SEAN', NULL, 'O''CONNELL', 'A00', '08173542167', '1993-12-05', 'CLERK', 14, 'M', '1972-10-18', 49250.00, 600.00, 2340.00),
('000130', 'DELORES', 'M', 'QUINTANA', 'C01', '09042574578', '2001-07-28', 'ANALYST', 16, 'F', '1955-09-15', 73800.00, NULL, 1904.00),
('000140', 'HEATHER', 'A', 'NICHOLLS', 'C01', '09157411793', '2006-12-15', 'ANALYST', 18, 'F', '1976-01-19', 68420.00, 600.00, 2274.00),
('000150', 'BRUCE', NULL, 'ADAMSON', 'D11', '09175244510', '2002-02-12', 'DESIGNER', 16, 'M', '1977-05-17', 55280.00, 500.00, 2022.00),
('000160', 'ELIZABETH', 'R', 'PIANKA', 'D11', '09365473782', '2006-10-11', 'DESIGNER', 17, 'F', '1980-04-12', 62250.00, 400.00, 1780.00),
('000170', 'MASATOS', 'J', 'YOSHIMURA', 'D11', '09542582890', '1999-09-15', 'DESIGNER', 16, 'M', '1981-01-05', 44680.00, 500.00, 1974.00),
('000180', 'MARILYN', 'S', 'SCOUTTEN', 'D11', '90552141682', '2003-07-07', 'DESIGNER', 17, 'F', '1979-02-21', 51340.00, 500.00, 1707.00),
('000190', 'JAMES', 'H', 'WALKER', 'D11', '09765482986', '2004-07-26', 'DESIGNER', 16, 'M', '1982-06-25', 50450.00, 400.00, 1636.00),
('000200', 'DAVID', NULL, 'BROWN', 'D11', '08982144501', '2002-03-03', 'DESIGNER', 16, 'M', '1971-05-29', 57740.00, 600.00, 2217.00),
('000210', 'WILLIAM', 'T', 'JONES', 'D11', '08974570942', '1998-04-11', 'DESIGNER', 17, 'M', '2003-02-23', 68270.00, 400.00, 1462.00),
('000220', 'JENNIFER', 'K', 'LUTZ', 'D11', '09921480672', '1998-08-29', 'DESIGNER', 18, 'F', '1978-03-19', 49840.00, 600.00, 2387.00),
('000230', 'JAMES', 'J', 'JEFFERSON', 'D21', '09942502094', '1996-11-21', 'CLERK', 14, 'M', '1980-05-30', 42180.00, 400.00, 1774.00),
('000240', 'SALVATO', 'M', 'MARINO', 'D21', '09075843780', '2004-12-05', 'CLERK', 17, 'M', '2002-03-31', 48760.00, 600.00, 2301.00),
('000250', 'DANIEL', 'S', 'SMITH', 'D21', '09102540961', '1999-10-30', 'CLERK', 15, 'M', '1969-11-12', 49180.00, 400.00, 1534.00),
('000260', 'SYBIL', 'P', 'JOHNSON', 'D21', '09918368953', '2005-09-11', 'CLERK', 16, 'F', '1976-10-05', 47250.00, 300.00, 1380.00),
('000270', 'MARIA', 'L', 'PEREZ', 'D21', '09301239001', '2006-09-30', 'CLERK', 15, 'F', '2003-05-26', 37380.00, 500.00, 2190.00),
('000280', 'ETHEL', 'R', 'SCHNEIDER', 'E11', '09386178997', '1997-03-24', 'OPERATOR', 17, 'F', '1976-03-28', 36250.00, 500.00, 2100.00),
('000290', 'JOHN', 'R', 'PARKER', 'E11', '09468124502', '2006-05-30', 'OPERATOR', 12, 'M', '1985-07-09', 35340.00, 300.00, 1227.00),
('000300', 'PHILIP', 'X', 'SMITH', 'E11', '09486572095', '2002-06-19', 'OPERATOR', 14, 'M', '1976-10-27', 37750.00, 400.00, NULL),
('000310', 'MAUDE', 'F', 'SETRIGHT', 'E11', '09502343332', '1994-09-12', 'OPERATOR', 12, 'F', '1961-04-21', 35900.00, 300.00, 1272.00),
('000320', 'RAMLAL', 'V', 'MEHTA', 'E21', '09635479990', '1995-07-07', 'FIELDREP', 16, 'M', '1962-08-11', 39950.00, 400.00, 1596.00),
('000330', 'WING', NULL, 'LEE', 'E21', '09895742103', '2006-02-23', 'FIELDREP', 14, 'M', '1971-07-18', 45370.00, 500.00, 2030.00),
('000340', 'JASON', 'R', 'GOUNOT', 'E21', '09987525698', '1977-05-05', 'FIELDREP', 16, 'M', '1956-05-17', 43840.00, 500.00, 1907.00),
('200010', 'DIAN', 'J', 'HEMMINGER', 'A00', '09051423978', '1995-01-01', 'SALESREP', 18, 'F', '1973-08-14', 46500.00, 1000.00, 4220.00),
('200120', 'GREG', NULL, 'ORLANDO', 'A00', '09112582167', '2002-05-05', 'CLERK', 14, 'M', '1972-10-18', 39250.00, 600.00, 2340.00),
('200140', 'KIM', 'N', 'NATZ', 'C01', '09175321793', '2006-12-15', 'ANALYST', 18, 'F', '1976-01-19', 68420.00, NULL, 2274.00),
('200170', 'KIYOSHI', NULL, 'YAMAMOTO', 'D11', '09548722890', '2005-09-15', 'DESIGNER', 16, 'M', '1981-01-05', 64680.00, 500.00, 1974.00),
('200220', 'REBA', 'K', 'JOHN', 'D11', '09284570672', '2005-08-29', 'DESIGNER', 18, 'F', '1978-03-19', 69840.00, 600.00, 2387.00),
('200240', 'ROBERT', 'M', 'MONTEVER', 'D21', '09244783780', '2004-12-05', 'CLERK', 17, 'M', '1984-03-31', 37760.00, 600.00, 2301.00),
('200280', 'EILEEN', 'R', 'SCHWARTZ', 'E11', '09892148997', '1997-03-24', 'OPERATOR', 17, 'F', '1966-03-28', 46250.00, 500.00, 2100.00),
('200310', 'MICHELLE', 'F', 'SPRINGER', 'E11', '09375483332', '1994-09-12', 'OPERATOR', 12, 'F', '1961-04-21', 35900.00, 300.00, NULL),
('200330', 'HELENA', NULL, 'WONG', 'E21', '09094522103', '2006-02-23', 'FIELDREP', 14, 'F', '1971-07-18', 35370.00, 500.00, 2030.00),
('200340', 'ROY', 'R', 'ALONZO', 'E21', '09152475698', '1997-07-05', 'FIELDREP', 16, 'M', '1956-05-17', 31840.00, 500.00, 1907.00)
;

--show all values from table--
SELECT * FROM EMPLOYEEs;

--create table--
CREATE TABLE PROJECTs (
    ProjNum CHAR(6) PRIMARY KEY NOT NULL,
	ProjName VARCHAR(40) NOT NULL,
    DeptNum CHAR(3) NOT NULL,
    ResPemp CHAR(6) NOT NULL,
	PrStaff DECIMAL(5,2) NOT NULL,
	PrSTDate DATE NOT NULL,
	PrENDate DATE NOT NULL,
	MajProj CHAR(6) NULL
);

--alter table--
ALTER TABLE PROJECTs
ADD 
	CONSTRAINT FK_DeptNum
	FOREIGN KEY(DeptNum) 
	REFERENCES DEPARTMENTs(DeptNum),

	CONSTRAINT FK_ResPemp
	FOREIGN KEY(ResPemp) 
	REFERENCES EMPLOYEEs(EmpNum)
;

--insert values into table--
INSERT INTO PROJECTs (ProjNum, ProjName, DeptNum, ResPemp, PrStaff, PrSTDate, PrENDate, MajProj)
VALUES
('AD3100', 'ADMIN SERVICES', 'D01', '000010', 6.50, '2021-01-01', '2023-02-01', NULL),
('AD3110', 'GENERAL ADMIN SYSTEMS', 'D21', '000070', 6.00, '2019-05-01', '2022-02-01', 'AD3100'),
('AD3111', 'PAYROLL PROGRAMMING', 'D21', '000230', 2.00, '2020-03-01', '2022-02-01', 'AD3110'),
('AD3112', 'PERSONNEL PROGRAMMING', 'D21', '000250', 1.00, '2018-04-01', '2021-02-01', 'AD3110'),
('AD3113', 'ACCOUNT PROGRAMMING', 'D21', '000270', 2.00, '2018-06-01', '2022-02-01', 'AD3110'),
('IF1000', 'QUERY SERVICES', 'C01', '000030', 2.00, '2020-01-01', '2021-02-01', NULL),
('IF2000', 'USER EDUCATION', 'C01', '000030', 1.00, '2020-04-01', '2021-02-01', NULL),
('MA2100', 'WELD LINE AUTOMATION', 'D01', '000010', 12.00, '2021-10-01', '2023-02-01', NULL),
('MA2110', 'W L PROGRAMMING', 'D11', '000060', 9.00, '2018-08-01', '2020-02-01', 'MA2100'),
('MA2111', 'W L PROGRAM DESIGN', 'D11', '000220', 2.00, '2019-01-01', '2020-12-01', 'MA2110'),
('MA2112', 'W L ROBOT DESIGN', 'D11', '000150', 3.00, '2020-01-01', '2021-12-01', 'MA2110'),
('MA2113', 'W L PROD CONT PROGS', 'D11', '000160', 3.00, '2017-02-15', '2019-12-01', 'MA2110'),
('OP1000', 'OPERATION SUPPORT', 'E01', '000050', 6.00, '2019-01-01', '2020-02-01', NULL),
('OP1010', 'OPERATION', 'E11', '000090', 5.00, '2020-04-01', '2021-02-01', 'OP1000'),
('OP2000', 'GEN SYSTEMS SERVICES', 'E01', '000050', 5.00, '2017-01-01', '2019-02-01', NULL),
('OP2010', 'SYSTEMS SUPPORT', 'E21', '000100', 4.00, '2020-05-01', '2021-02-01', 'OP2000'),
('OP2011', 'SCP SYSTEMS SUPPORT', 'E21', '000320', 1.00, '2018-07-01', '2020-02-01', 'OP2010'),
('OP2012', 'APPLICATIONS SUPPORT', 'E21', '000330', 1.00, '2018-09-01', '2021-02-01', 'OP2010'),
('OP2013', 'DB/DC SUPPORT', 'E21', '000340', 1.00, '2020-02-01', '2022-02-01', 'OP2010'),
('PL2100', 'WELD LINE PLANNING', 'B01', '000020', 1.00, '2017-07-01', '2020-09-15', 'MA2100')
;

--show all values from table--
SELECT * FROM PROJECTs;

--create table--
CREATE TABLE EMP_ACTs (
    EmpNum CHAR(6) NOT NULL,
    ProjNum CHAR(6) NOT NULL,
	ActNum CHAR(5) NOT NULL,
	EmpTime DECIMAL(5,2) NOT NULL,
	EmSTDate DATE NOT NULL,
	EmENDate DATE NOT NULL
);

--alter table--
ALTER TABLE EMP_ACTs
ADD 
	CONSTRAINT FK_EmpNum
	FOREIGN KEY(EmpNum) 
	REFERENCES EMPLOYEEs(EmpNum),

	CONSTRAINT FK_ProjNum
	FOREIGN KEY(ProjNum) 
	REFERENCES PROJECTs(ProjNum)
;

--insert values into table--
INSERT INTO EMP_ACTs (EmpNum, ProjNum, ActNum, EmpTime, EmSTDate, EmENDate)
VALUES
('000010', 'AD3100', 10, 0.50, '2021-01-05', '2023-01-29'),
('000070', 'AD3110', 10, 1.00, '2019-05-15', '2022-02-20'),
('000230', 'AD3111', 60, 1.00, '2020-03-10', '2022-01-15'),
('000230', 'AD3111', 60, 0.50, '2020-03-15', '2022-01-15'),
('000230', 'AD3111', 70, 0.50, '2020-03-15', '2022-01-20'),
('000230', 'AD3111', 80, 0.50, '2020-03-15', '2022-01-20'),
('000230', 'AD3111', 180, 0.50, '2020-03-15', '2022-01-15'),
('000240', 'AD3111', 70, 1.00, '2020-04-15', '2022-01-25'),
('000240', 'AD3111', 80, 1.00, '2020-04-15', '2022-01-25'),
('000250', 'AD3112', 60, 1.00, '2018-04-04', '2021-02-01'),
('000250', 'AD3112', 60, 0.50, '2018-04-10', '2021-03-15'),
('000250', 'AD3112', 60, 1.00, '2018-04-01', '2021-02-01'),
('000250', 'AD3112', 70, 0.50, '2018-05-01', '2021-03-15'),
('000250', 'AD3112', 70, 1.00, '2018-05-15', '2021-08-15'),
('000250', 'AD3112', 70, 0.25, '2018-05-15', '2021-09-15'),
('000250', 'AD3112', 80, 0.25, '2018-05-15', '2021-08-15'),
('000250', 'AD3112', 80, 0.50, '2018-05-15', '2021-10-01'),
('000250', 'AD3112', 180, 0.50, '2018-05-20', '2021-03-01'),
('000260', 'AD3113', 70, 0.50, '2018-06-15', '2022-07-01'),
('000260', 'AD3113', 70, 1.00, '2018-07-01', '2022-02-01'),
('000260', 'AD3113', 80, 1.00, '2018-06-10', '2022-03-01'),
('000260', 'AD3113', 80, 0.50, '2018-07-01', '2022-04-15'),
('000260', 'AD3113', 180, 0.50, '2018-08-01', '2022-04-15'),
('000260', 'AD3113', 180, 1.00, '2018-08-15', '2022-06-01'),
('000260', 'AD3113', 180, 1.00, '2018-08-01', '2022-07-01'),
('000270', 'AD3113', 60, 0.50, '2018-07-01', '2022-04-01'),
('000270', 'AD3113', 60, 1.00, '2018-07-10', '2022-09-01'),
('000270', 'AD3113', 60, 0.25, '2018-09-01', '2022-10-15'),
('000270', 'AD3113', 70, 0.75, '2018-09-01', '2022-10-15'),
('000270', 'AD3113', 70, 1.00, '2018-10-15', '2022-02-01'),
('000270', 'AD3113', 80, 1.00, '2018-10-01', '2022-03-01'),
('000270', 'AD3113', 80, 0.50, '2018-10-01', '2022-04-01'),
('000030', 'IF1000', 10, 0.50, '2020-01-15', '2021-01-30'),
('000130', 'IF1000', 90, 1.00, '2020-01-15', '2021-01-25'),
('000130', 'IF1000', 100, 0.50, '2020-02-01', '2021-01-30'),
('000140', 'IF1000', 90, 0.50, '2020-02-01', '2021-01-25'),
('000030', 'IF2000', 10, 0.50, '2020-01-10', '2021-01-15'),
('000140', 'IF2000', 100, 1.00, '2020-01-10', '2021-01-15'),
('000140', 'IF2000', 100, 0.50, '2020-03-01', '2021-01-25'),
('000140', 'IF2000', 110, 0.50, '2020-03-01', '2021-01-30'),
('000140', 'IF2000', 110, 0.50, '2020-02-01', '2021-01-30'),
('000010', 'MA2100', 10, 0.50, '2021-10-10', '2023-01-15'),
('000110', 'MA2100', 20, 1.00, '2021-10-15', '2023-01-25'),
('000010', 'MA2110', 10, 1.00, '2018-08-10', '2020-02-10'),
('000200', 'MA2111', 50, 1.00, '2019-01-01', '2020-12-15'),
('000200', 'MA2111', 60, 1.00, '2019-01-15', '2020-12-10'),
('000150', 'MA2112', 60, 1.00, '2020-01-01', '2021-12-01'),
('000170', 'MA2112', 60, 1.00, '2020-01-01', '2021-11-20'),
('000170', 'MA2112', 70, 1.00, '2020-02-01', '2021-12-15'),
('000190', 'MA2112', 70, 1.00, '2020-02-15', '2021-12-01'),
('000190', 'MA2112', 80, 1.00, '2020-02-25', '2021-12-25'),
('000160', 'MA2113', 60, 1.00, '2017-02-15', '2020-02-01'),
('000170', 'MA2113', 80, 1.00, '2017-02-20', '2019-12-20'),
('000180', 'MA2113', 70, 1.00, '2017-03-01', '2019-12-15'),
('000210', 'MA2113', 80, 0.50, '2017-02-15', '2019-12-01'),
('000210', 'MA2113', 180, 0.50, '2017-03-01', '2020-02-01'),
('000050', 'OP1000', 10, 0.25, '2019-01-10', '2020-03-01'),
('000090', 'OP1010', 10, 1.00, '2020-04-01', '2021-12-15'),
('000280', 'OP1010', 130, 1.00, '2020-04-10', '2021-12-01'),
('000290', 'OP1010', 130, 1.00, '2020-05-01', '2022-01-01'),
('000300', 'OP1010', 130, 1.00, '2020-05-01', '2022-02-01'),
('000310', 'OP1010', 130, 1.00, '2020-04-01', '2021-12-01'),
('000050', 'OP2010', 10, 0.75, '2020-05-01', '2021-02-01'),
('000100', 'OP2010', 10, 1.00, '2020-05-05', '2021-02-01'),
('000320', 'OP2011', 140, 0.75, '2018-07-10', '2020-02-25'),
('000320', 'OP2011', 150, 0.25, '2018-07-10', '2020-02-25'),
('000330', 'OP2012', 140, 0.25, '2018-09-01', '2021-02-01'),
('000340', 'OP2013', 140, 0.50, '2020-02-10', '2022-02-01'),
('000340', 'OP2013', 170, 0.50, '2020-02-15', '2022-02-20'),
('000020', 'PL2100', 30, 1.00, '2017-07-15', '2020-12-15')
;

--show all values from table--
SELECT * FROM EMP_ACTs;