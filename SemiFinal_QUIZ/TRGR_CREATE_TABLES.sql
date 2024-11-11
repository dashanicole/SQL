-- open connection
USE CATAN_DB;

-- create the CCS_ACQ_2024 table
CREATE TABLE CCS_ACQ_2024 (
    sid SMALLINT NOT NULL PRIMARY KEY,
    sname VARCHAR(30) NOT NULL,
    course CHAR(4) NOT NULL,
    year SMALLINT
);

-- create the ACQ_RESVSN table
CREATE TABLE ACQ_RESVSN (
    ticket_no SMALLINT IDENTITY(001, 1),
    sid SMALLINT,
    sname VARCHAR(30),
    date_paid DATETIME,
    amount DECIMAL(8, 2),
    pymnt_type CHAR(4) CHECK (pymnt_type IN ('CASH', 'EPAY'))
);

/*
INSERT INTO ACQ_RESVSN (sid, sname, date_paid, amount, pymnt_type)
VALUES (101, 'Dit Cat', GETDATE(), 500.00, 'CASH');

UPDATE ACQ_RESVSN
SET date_paid = '2024-11-15', amount = 550.00, pymnt_type = 'EPAY'
WHERE ticket_no = 1; 

UPDATE CCS_ACQ_2024
SET course = 'BSCS', year = 3
WHERE sid = 101; 

DELETE FROM ACQ_RESVSN WHERE ticket_no = 1; 

SELECT * FROM CCS_ACQ_2024;
SELECT * FROM ACQ_RESVSN;

DROP TABLE CCS_ACQ_2024;
DROP TABLE ACQ_RESVSN;
DROP TRIGGER trgins_acq_resvsn;
*/

