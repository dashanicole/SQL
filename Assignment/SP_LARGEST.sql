-- open connection
USE CATAN_DB;

-- create SP_LARGEST procedure 
CREATE PROCEDURE SP_LARGEST 
    @a INT, 
    @b INT, 
    @c INT, 
    @largest INT OUTPUT
AS
BEGIN
    IF (@a >= @b AND @a >= @c)
        SET @largest = @a;
    ELSE IF (@b >= @c)
        SET @largest = @b;
    ELSE
        SET @largest = @c;
END;

-- test the procedure
DECLARE @result INT;
EXEC SP_LARGEST 15, 30, 25, @result OUTPUT;
PRINT 'The largest number is: ' + CAST(@result AS VARCHAR);