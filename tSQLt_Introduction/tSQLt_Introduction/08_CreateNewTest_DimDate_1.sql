USE AdventureWorks2017;
GO
/*
    Author:     Roman Pijacek
    Date:       2020-01-05
    Execution:
                EXECUTE tsqlt.RunTestClass 
                    @TestClassName = N'[test_dbo_usp_PopulateDimDate]';

                EXECUTE tsqlt.Run 
                    @TestName = N'[test_dbo_usp_PopulateDimDate].[test 01 DimDateNotEmpty]'
*/
CREATE OR ALTER PROCEDURE [test_dbo_usp_PopulateDimDate].[test 01 DimDateNotEmpty]
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

    -- Assert 1:
    EXECUTE tSQLt.AssertObjectExists
        @ObjectName = N'dbo.DimDate',
        @Message = N'The table [dbo].[DimDate] does not exist!';

    -- Assert 2:
    DECLARE @hasData BIT = IIF(EXISTS(SELECT TOP(1) 1 FROM dbo.DimDate), 1, 0);

    EXECUTE tSQLt.AssertEquals
        @Expected = 1,
        @Actual = @hasData,
        @Message = N'The table [dbo].[DimDate] is not populated!';
END
