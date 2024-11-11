-- open connection
USE CATAN_DB;

CREATE TABLE CS_IMDbSys31_MG (
    sid SMALLINT NOT NULL PRIMARY KEY,
    sname VARCHAR(30) NOT NULL,
    mgrade DECIMAL(2, 1) NOT NULL,
    remarks VARCHAR(20)
);

CREATE TABLE MTG_LOG (
    log_id SMALLINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    sid SMALLINT NOT NULL,
    sname VARCHAR(30) NOT NULL,
    operation VARCHAR(30),
    log_date DATETIME,
    log_by VARCHAR(100)
);

CREATE TRIGGER ai_mg_log ON CS_IMDbSys31_MG 
AFTER INSERT
AS 
	INSERT INTO MTG_LOG(sid,sname,operation,log_date,log_by)
	SELECT sid, sname, 'INSERT', GETDATE(), SUSER_NAME()
	FROM CS_IMDbSys31_MG;
GO

CREATE TRIGGER au_mg_log ON CS_IMDbSys31_MG 
AFTER UPDATE 
AS 
	DECLARE @sid SMALLINT, @sname VARCHAR(30);

	SELECT  @sid = c.sid, @sname = c.sname
	FROM CS_IMDbSys31_MG c;
	 
	IF UPDATE(mgrade)
		INSERT INTO MTG_LOG(sid,sname,operation,log_date,log_by)
		VALUES(@sid, @sname, 'UPDATE', GETDATE(), SUSER_NAME());
GO

CREATE TRIGGER ad_mg_log ON CS_IMDbSys31_MG 
AFTER DELETE  
AS
    DECLARE @sid SMALLINT, @sname VARCHAR(30);

    SELECT @sid = c.sid, @sname = c.sname
    FROM DELETED c;

    INSERT INTO MTG_LOG(sid, sname, operation, log_date, log_by)
    VALUES (@sid, @sname, 'DELETE', GETDATE(), SUSER_NAME());
GO

INSERT INTO CS_IMDbSys31_MG (sid, sname, mgrade, remarks) 
VALUES (100, 'Dietcan', 1.9, 'Passed'),
    (140, 'Norhpar', 2.2, 'Passed'),
    (180, 'Vinyam', 3.2, 'Failed');

UPDATE CS_IMDbSys31_MG
SET mgrade = 3.0, remarks = 'Passed'
WHERE sid = 180;

DELETE FROM CS_IMDbSys31_MG where sid = 180;

/*
SELECT * from CS_IMDbSys31_MG;
SELECT * from MTG_LOG;
DELETE FROM CS_IMDbSys31_MG;
DELETE FROM MTG_LOG;
DROP TRIGGER ad_mg_log;
*/