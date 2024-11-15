-- open connection
USE CATAN_DB;

-- delete trigger
CREATE TRIGGER trgdel_acq_resvsn ON ACQ_RESVSN
AFTER DELETE
AS
    DECLARE @ticket_no SMALLINT, @sid SMALLINT, @sname VARCHAR(30);

	BEGIN
		SELECT 
			@ticket_no = d.ticket_no, 
			@sid = d.sid, 
			@sname = d.sname
		FROM DELETED d;
	END;

	BEGIN
		DELETE FROM CCS_ACQ_2024 WHERE sid = @sid;
	END;
GO