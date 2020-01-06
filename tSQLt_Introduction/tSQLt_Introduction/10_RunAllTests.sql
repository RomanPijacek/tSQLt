USE AdventureWorks2017;
GO

---------------------------------------------------------------------------------------
-- Execute all Tests within the TestClass [test_dbo_usp_GetLongestServingEmployee]
---------------------------------------------------------------------------------------

EXECUTE tSQLt.RunTestClass 
    @TestClassName = N'[test_dbo_usp_GetLongestServingEmployee]';
GO

---------------------------------------------------------------------------------------
-- Execute all Tests within the TestClass [test_dbo_usp_PopulateDimDate]
---------------------------------------------------------------------------------------

EXECUTE tSQLt.RunTestClass 
    @TestClassName = N'[test_dbo_usp_PopulateDimDate]';
GO

---------------------------------------------------------------------------------------
-- Execute all Tests implemented in the current database
---------------------------------------------------------------------------------------

EXECUTE tsqlt.RunAll;
GO

---------------------------------------------------------------------------------------
-- EOF
---------------------------------------------------------------------------------------
