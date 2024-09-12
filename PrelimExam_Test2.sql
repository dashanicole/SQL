-- 1
CREATE DATABASE PRELIM_DB;

-- 2
USE PRELIM_DB;

-- 3
CREATE TABLE patient (
	ptnt_id SMALLINT NOT NULL IDENTITY(100,1) PRIMARY KEY,
	ptnt_name VARCHAR(40) NOT NULL,
	ptnt_dob DATE,
	ptnt_gender CHAR(1) NOT NULL CHECK(ptnt_gender IN ('M','F')),
	ptnt_addr VARCHAR(50)
)

CREATE TABLE appointment (
	aptmnt_id SMALLINT NOT NULL PRIMARY KEY,
	ptnt_id SMALLINT NOT NULL,
	doc_id SMALLINT NOT NULL,
	aptmnt_date DATE
	FOREIGN KEY(ptnt_id) REFERENCES patient(ptnt_id)
)

-- 4
EXEC sp_help 'patient';
EXEC sp_help 'appointment';

-- 5
INSERT INTO patient 
VALUES 
	('Carla Espinosa', '1999-11-17', 'F', 'Cebu City'),
	('Robert Esguerra', '2003-03-25', 'M', 'Naga City'),
	('Juan Manuel', '2000-10-19', 'M', 'Talisay City')
;

SELECT * FROM patient;

-- 6
ALTER TABLE appointment 
	ADD aptmnt_time TIME, aptmnt_idea VARCHAR(10), aptmnt_status VARCHAR(20)
;

SELECT * FROM appointment;

-- 7
INSERT INTO appointment 
VALUES (1, 101, 3, '2024-09-10', '10:30:00', 'check-up', 'scheduled'),
	(2, 100, 2, '2024-09-12', '11:25:00', 'follow-up', 're-scheduled'),
	(3, 102, 3, '2024-09-15', '19:15:00', 'check-up', 'cancelled')
;

-- 8
EXEC sp_rename 'appointment.aptmnt_idea','aptmnt_reason';

-- 9
ALTER TABLE appointment
	ALTER COLUMN aptmnt_reason VARCHAR(50)
;

-- 10
UPDATE appointment
SET aptmnt_date = '2024-09-20', 
	aptmnt_time = '10:15:00',
	aptmnt_status = 'scheduled'
WHERE ptnt_id = 102; 

-- 11
DELETE FROM appointment
WHERE ptnt_id = 100;

-- 12
SELECT * INTO patient_bkup FROM patient; 
SELECT * INTO appointment_bkup FROM appointment;

SELECT * FROM patient_bkup;
SELECT * FROM appointment_bkup;