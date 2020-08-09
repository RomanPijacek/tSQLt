USE AdventureWorks2017;
GO

EXECUTE tSQLt.RunTestClass 
    @TestClassName = N'[test_dbo_usp_GetLongestServingEmployee]';
GO

EXECUTE tSQLt.Run 
    @TestName = N'[test_dbo_usp_GetLongestServingEmployee].[test 01 NoExEmployeesSelected]';
GO
