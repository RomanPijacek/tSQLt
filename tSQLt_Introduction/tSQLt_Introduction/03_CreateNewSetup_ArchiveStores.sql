USE AdventureWorks2017;
GO

CREATE OR ALTER PROCEDURE [test_dbo_usp_ArchiveSalesStore].[Setup]
AS
BEGIN
    SET NOCOUNT ON;

    ---------------------------------------------------------------------------------------
    -- Fake both tables used by the procedure [dbo].[usp_ArchiveSalesStore]
    ---------------------------------------------------------------------------------------

    EXECUTE tsqlt.FakeTable 
        @TableName = N'Store', 
        @SchemaName = N'Sales',
        @Defaults = 1;
    
    EXECUTE tsqlt.FakeTable 
        @TableName = N'StoreArchive', 
        @SchemaName = N'Sales',
        @Defaults = 1;
END
GO
