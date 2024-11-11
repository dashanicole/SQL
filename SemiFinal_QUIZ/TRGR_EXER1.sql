-- open connection
USE CATAN_DB;

-- delete trigger
CREATE TRIGGER ad_mg_log ON CS_IMDbSys31_MG 
AFTER DELETE  
AS
    DECLARE @sid SMALLINT, @sname VARCHAR(30);

    SELECT @sid = c.sid, @sname = c.sname
    FROM DELETED c;

    INSERT INTO MTG_LOG(sid, sname, operation, log_date, log_by)
    VALUES (@sid, @sname, 'DELETE', GETDATE(), SUSER_NAME());
GO