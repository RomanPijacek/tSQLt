USE AdventureWorks2017;
GO
/*
    Author:     Roman Pijacek
    Date:       2020-01-05
    Execution:
                EXECUTE tsqlt.RunTestClass 
                    @TestClassName = N'[test_dbo_usp_PopulateDimDate]';

                EXECUTE tsqlt.Run 
                    @TestName = N'[test_dbo_usp_PopulateDimDate].[test 02 DimDatePopulatedCorrectly]'
*/
CREATE OR ALTER PROCEDURE [test_dbo_usp_PopulateDimDate].[test 02 DimDatePopulatedCorrectly]
AS
BEGIN
    SET NOCOUNT ON;

    ---------------------------------------------------------------------------------------
    -- 1.) Assemble
    ---------------------------------------------------------------------------------------

    DECLARE @from DATE = CAST('2020-01-01' AS DATE);
    DECLARE @to DATE = CAST('2021-12-31' AS DATE);

    ---------------------------------------------------------------------------------------
    -- 2.) Act
    ---------------------------------------------------------------------------------------

    EXECUTE dbo.usp_PopulateDimDate
        @StartDate = @from,
        @EndDate = @to;
      
    ---------------------------------------------------------------------------------------    
    -- 3.) Assert
    ---------------------------------------------------------------------------------------

    DECLARE @actualDate DATE;
    DECLARE @actualNrOfRecords INT;
    DECLARE @expectedNrOfRecords INT;

    -- Assert 1:

    SET @actualDate = (SELECT MIN([Date]) FROM dbo.DimDate);
    
    EXECUTE tSQLt.AssertEquals
        @Expected = @from,
        @Actual = @actualDate,
        @Message = N'The MIN() Date is not correct in dbo.DimDate table!';

    -- Assert 2:

    SET @actualDate = (SELECT MAX([Date]) FROM dbo.DimDate);
    
    EXECUTE tSQLt.AssertEquals
        @Expected = @to,
        @Actual = @actualDate,
        @Message = N'The MAX() Date is not correct in dbo.DimDate table!';

    -- Assert 3:

    SET @expectedNrOfRecords = (SELECT DATEDIFF(day, @from, @to) + 1);
    SET @actualNrOfRecords = (SELECT COUNT(1) FROM dbo.DimDate);

    EXECUTE tSQLt.AssertEquals
        @Expected = @expectedNrOfRecords,
        @Actual = @actualNrOfRecords,
        @Message = N'The number of generated records in dbo.DimDate table is not correct!';
END
