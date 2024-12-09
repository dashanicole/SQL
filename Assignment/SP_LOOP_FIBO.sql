-- open connection
USE CATAN_DB;

-- create the SP_LOOP_FIBO procedure
CREATE PROCEDURE SP_LOOP_FIBO
    @input INT
AS
BEGIN
    DECLARE @counter INT = 1;
    DECLARE @firstValue INT = 1;
    DECLARE @secondValue INT = 1;
    DECLARE @sumValue INT = 0;
    
    -- Variables to store all Fibonacci numbers, odd and even
    DECLARE @output VARCHAR(MAX) = '';
    DECLARE @oddNumbers VARCHAR(MAX) = '';
    DECLARE @evenNumbers VARCHAR(MAX) = '';

    -- Edge case check
    IF @input < 1
    BEGIN
        PRINT 'Please enter a positive integer greater than 0.';
        RETURN;
    END

    -- Handle the first two values separately and print them
    SET @output = CONCAT(@output, @firstValue, ' ', @secondValue);  -- Add first two numbers to output
    IF @firstValue % 2 = 1
        SET @oddNumbers = CONCAT(@oddNumbers, @firstValue, CHAR(13));  -- Odd number
    ELSE
        SET @evenNumbers = CONCAT(@evenNumbers, @firstValue, CHAR(13)); -- Even number

    IF @secondValue % 2 = 1
        SET @oddNumbers = CONCAT(@oddNumbers, @secondValue, CHAR(13));  -- Odd number
    ELSE
        SET @evenNumbers = CONCAT(@evenNumbers, @secondValue, CHAR(13)); -- Even number

    -- Loop to calculate Fibonacci numbers
    WHILE @counter < @input - 1
    BEGIN
        SET @sumValue = @firstValue + @secondValue;
        SET @firstValue = @secondValue;
        SET @secondValue = @sumValue;

        -- Append Fibonacci number to the output string
        SET @output = CONCAT(@output, ' ', @secondValue);

        -- Check if the Fibonacci number is odd or even
        IF @secondValue % 2 = 1
            SET @oddNumbers = CONCAT(@oddNumbers, @secondValue, CHAR(13));  -- Odd number
        ELSE
            SET @evenNumbers = CONCAT(@evenNumbers, @secondValue, CHAR(13)); -- Even number

        SET @counter = @counter + 1;
    END

    -- Print Fibonacci sequence horizontally
    PRINT 'Fibonacci Sequence: ' + @output;

    -- Print odd and even Fibonacci numbers vertically (in columns)
    PRINT 'Odd Numbers:';
    PRINT @oddNumbers;

    PRINT 'Even Numbers:';
    PRINT @evenNumbers;
END
GO

-- test the procedure
EXEC SP_LOOP_FIBO @input = 10;