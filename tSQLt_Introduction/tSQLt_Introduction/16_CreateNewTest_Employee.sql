USE AdventureWorks2017;
GO
/*
    Author:     Roman Pijacek
    Date:       2020-01-05
    Execution:
                EXECUTE tsqlt.RunTestClass 
                    @TestClassName = N'[test_dbo_usp_GetLongestServingEmployee]';

                EXECUTE tsqlt.Run 
                    @TestName = N'[test_dbo_usp_GetLongestServingEmployee].[test 01 NoExEmployeesSelected]'
*/
CREATE OR ALTER PROCEDURE [test_dbo_usp_GetLongestServingEmployee].[test 01 NoExEmployeesSelected]
AS
BEGIN
    SET NOCOUNT ON;

    ---------------------------------------------------------------------------------------
    -- 1.) Assemble
    ---------------------------------------------------------------------------------------

    INSERT INTO Person.Person
    (
        BusinessEntityID, FirstName, LastName
    )
    VALUES
        (1, N'Adam', N'Clain'),
        (2, N'Stephanie', N'McCluskey'),
        (3, N'Jack', N'Stephens');

    INSERT INTO HumanResources.Employee
    (
        BusinessEntityID, LoginID, JobTitle, HireDate, CurrentFlag -- Important - all set to False
    )
    VALUES
        (1, N'domain\Clain', 'SW Engineer', '2010-01-01', 0),
        (2, N'domain\McCluskey', 'Senior DBA', '2010-02-01', 0),
        (3, N'domain\Stephens', 'DevOps Engineer', '2010-03-01', 0);

    ---------------------------------------------------------------------------------------
    -- 2.) Act
    ---------------------------------------------------------------------------------------

    EXECUTE dbo.usp_GetLongestServingEmployee;

    DECLARE @returnedRowCount INT = @@ROWCOUNT;
       
    ---------------------------------------------------------------------------------------    
    -- 3.) Assert
    ---------------------------------------------------------------------------------------

    EXECUTE tSQLt.AssertEquals 
        @Expected = 0,
        @Actual = @returnedRowCount,
        @Message = N'Returned incorrect number of longest serving employees!';
END
GO
