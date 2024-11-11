-- open connection
USE CATAN_DB;

-- insert trigger
CREATE TRIGGER trgins_acq_resvsn ON ACQ_RESVSN
AFTER INSERT
AS
    DECLARE @ticket_no SMALLINT, @sid SMALLINT, @sname VARCHAR(30),
            @date_paid DATETIME, @amount DECIMAL(8, 2), @pymnt_type CHAR(4);

    SELECT 
        @ticket_no = i.ticket_no, 
        @sid = i.sid, 
        @sname = i.sname, 
        @date_paid = i.date_paid, 
        @amount = i.amount,
        @pymnt_type = i.pymnt_type
    FROM INSERTED i;

    IF NOT EXISTS (SELECT 1 FROM CCS_ACQ_2024 WHERE sid = @sid)
    BEGIN
        INSERT INTO CCS_ACQ_2024 (sid, sname, course, year)
        VALUES (@sid, @sname, 'N/A', 0); 
    END

	/*
    PRINT 'Reservation/Payment Made:';
    PRINT 'Ticket No: ' + CAST(@ticket_no AS VARCHAR);
    PRINT 'Date Paid: ' + CAST(@date_paid AS VARCHAR);
    PRINT 'Amount: ' + CAST(@amount AS VARCHAR);
    PRINT 'Organization: ' + @sname;
	*/
GO