-- open connection
USE CATAN_DB;

-- update trigger
CREATE TRIGGER trgupdt_acq_resvsn ON ACQ_RESVSN
AFTER UPDATE
AS
    DECLARE @ticket_no SMALLINT, @sid SMALLINT, @sname VARCHAR(30),
            @date_paid DATETIME, @amount DECIMAL(8, 2), @pymnt_type CHAR(4);

	BEGIN
		SELECT 
			@ticket_no = i.ticket_no, 
			@sid = i.sid, 
			@sname = i.sname, 
			@date_paid = i.date_paid, 
			@amount = i.amount,
			@pymnt_type = i.pymnt_type
		FROM INSERTED i;
	END;

	BEGIN
		UPDATE CCS_ACQ_2024
		SET sname = @sname
		WHERE sid = @sid;
	END;
GO