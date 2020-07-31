USE AdventureWorks2017;
GO
/*
    Author:     Roman Pijacek
    Date:       2020-01-05
    Execution:
                EXECUTE tsqlt.RunTestClass 
                    @TestClassName = N'[test_dbo_usp_ArchiveSalesStore]';

                EXECUTE tsqlt.Run 
                    @TestName = N'[test_dbo_usp_ArchiveSalesStore].[test 01 ClosedStoresArchived]'
*/
CREATE OR ALTER PROCEDURE [test_dbo_usp_ArchiveSalesStore].[test 01 ClosedStoresArchived]
AS
BEGIN
    SET NOCOUNT ON;

    ---------------------------------------------------------------------------------------
    -- 1.) Assemble
    ---------------------------------------------------------------------------------------

    -- Populate some stores
    INSERT INTO [Sales].[Store]
    (
         [BusinessEntityID]
        ,[Name]
        ,[IsClosed]
    )
    VALUES 
        (1, 'Store_A', 1), -- Closed - should be archived
        (2, 'Store_B', 0), -- Open
        (3, 'Store_C', 1); -- Closed - should be archived

    -- Clean up the archive table
    TRUNCATE TABLE [Sales].[StoreArchive];

    ---------------------------------------------------------------------------------------
    -- 2.) Act
    ---------------------------------------------------------------------------------------

    EXECUTE [dbo].[usp_ArchiveSalesStore];
       
    ---------------------------------------------------------------------------------------    
    -- 3.) Assert
    ---------------------------------------------------------------------------------------

    DECLARE @actualCount INT;

    -- Assert 1 - Number of archived stores in Archive table

    SET @actualCount = (SELECT COUNT(1) FROM [Sales].[StoreArchive] WHERE [Name] IN ('Store_A', 'Store_C'));
    EXECUTE tSQLt.AssertEquals 
        @Expected = 2,
        @Actual = @actualCount,
        @Message = N'Incorrect number of stores in the [Sales].[StoreArchive] table!';

    -- Assert 2 - Number of opened stores in Store table

    SET @actualCount = (SELECT COUNT(1) FROM [Sales].[Store]);
    EXECUTE tSQLt.AssertEquals 
        @Expected = 1,
        @Actual = @actualCount,
        @Message = N'Incorrect number of open stores in the [Sales].[Store] table!';
END
GO
