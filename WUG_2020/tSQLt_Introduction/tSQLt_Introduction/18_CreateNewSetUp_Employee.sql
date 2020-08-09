USE AdventureWorks2017;
GO

CREATE OR ALTER PROCEDURE [test_dbo_usp_GetLongestServingEmployee].[Setup]
AS
BEGIN
    SET NOCOUNT ON;

    ---------------------------------------------------------------------------------------
    -- Fake both tables used by the procedure dbo.usp_GetLongestServingEmployee
    ---------------------------------------------------------------------------------------
    
    EXECUTE tSQLt.FakeTable 
        @TableName = N'Employee', 
        @SchemaName = N'HumanResources',
        @Defaults = 1;
    
    EXECUTE tSQLt.FakeTable 
        @TableName = N'Person', 
        @SchemaName = N'Person',
        @Defaults = 1;
END
GO
