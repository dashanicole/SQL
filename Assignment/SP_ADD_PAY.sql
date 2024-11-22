-- open connection
USE CATAN_DB;

-- create SP_ADD_PAY procedure 
CREATE PROCEDURE SP_ADD_PAY 
    @emp_no CHAR(6), 
    @add_pay DECIMAL(10,2) OUTPUT, 
    @new_salary DECIMAL(10,2) OUTPUT
AS
BEGIN
    DECLARE @job VARCHAR(50), @salary DECIMAL(10,2);

    SELECT @job = job, @salary = salary
    FROM employee
    WHERE empno = @emp_no;

    IF (@job = 'ANALYST')
        SET @add_pay = 500.00;
    ELSE IF (@job = 'DESIGNER')
        SET @add_pay = 400.00;
    ELSE IF (@job = 'CLERK')
        SET @add_pay = 300.00;
    ELSE
        SET @add_pay = 200.00;

    SET @new_salary = @salary + @add_pay;
END;

-- test the procedure
DECLARE @additional DECIMAL(10,2), @final_salary DECIMAL(10,2);
EXEC SP_ADD_PAY '000010', @additional OUTPUT, @final_salary OUTPUT;
PRINT 'Additional Pay: ' + CAST(@additional AS VARCHAR);
PRINT 'New Salary: ' + CAST(@final_salary AS VARCHAR);