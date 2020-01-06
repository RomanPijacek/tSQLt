USE AdventureWorks2017;
GO

CREATE OR ALTER PROCEDURE [test_dbo_usp_PopulateDimDate].[Setup]
AS
BEGIN
    SET NOCOUNT ON;

    ---------------------------------------------------------------------------------------
    -- Fake table referenced in the procedure dbo.usp_PopulateDimDate
    ---------------------------------------------------------------------------------------
    
    EXECUTE tsqlt.FakeTable 
        @TableName = N'DimDate', 
        @SchemaName = N'dbo';
END
GO
