USE AdventureWorks2017;
GO

EXECUTE tSQLt.RunTestClass 
    @TestClassName = N'[test_dbo_usp_ArchiveSalesStore]';
GO

EXECUTE tSQLt.Run 
    @TestName = N'[test_dbo_usp_ArchiveSalesStore].[test 01 ClosedStoresArchived]';
GO