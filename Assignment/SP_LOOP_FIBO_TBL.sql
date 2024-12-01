-- open connection
USE CATAN_DB;

-- create the SP_LOOP_FIBO_TBL procedure
CREATE PROCEDURE SP_LOOP_FIBO_TBL @num INT
AS
BEGIN
	IF EXISTS (SELECT * FROM sysobjects WHERE name = 'FIBO_TABLE' AND xtype = 'U')
	-- clear existing data from the table
	BEGIN
		TRUNCATE TABLE FIBO_TABLE;
	END;
	ELSE
	-- create the table if it does not exist
	BEGIN
		CREATE TABLE FIBO_TABLE (
			"Fibo Nos." BIGINT
		);
	END;

    -- initialize variables
    DECLARE @a BIGINT = 1;
    DECLARE @b BIGINT = 1;
    DECLARE @counter INT = 1;
    DECLARE @result NVARCHAR(MAX) = '';

    -- loop to generate fibonacci series
    WHILE @counter <= @num
    BEGIN
        --append current fibonacci number to the result string
        IF @result = ''
            SET @result = CAST(@a AS NVARCHAR);
        ELSE
            SET @result = @result + ' ' + CAST(@a AS NVARCHAR);

        -- insert current fibonacci number into the table
        INSERT INTO FIBO_TABLE ("Fibo Nos.") VALUES (@a);

        -- update variables for next fibonacci number
        DECLARE @temp BIGINT = @a;
        SET @a = @b;
        SET @b = @temp + @b;

        -- increment counter
        SET @counter = @counter + 1;
    END;

    -- print the result string
    PRINT 'The first ' + CAST(@num AS NVARCHAR) + ' Fibonacci number series are: ' + @result;
END;
GO

-- test the procedure
EXEC SP_LOOP_FIBO_TBL @num = 10;

-- display the FIBO_TABLE table
SELECT * FROM FIBO_TABLE;