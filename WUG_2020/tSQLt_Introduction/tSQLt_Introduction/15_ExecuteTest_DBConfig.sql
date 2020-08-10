USE AdventureWorks2017;
GO

EXECUTE tSQLt.Run 
    @TestName = N'[test_DBConfiguration].[test 01 CheckDBRecoveryModel]';
GO

EXECUTE tSQLt.Run 
    @TestName = N'[test_DBConfiguration].[test 02 CheckDBStatistics]';
GO

EXECUTE tSQLt.RunTestClass 
    @TestClassName = N'[test_DBConfiguration]';
GO
