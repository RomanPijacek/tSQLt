USE AdventureWorks2017;
GO

---------------------------------------------------------------------------------------
-- 1.) Let's review and understand the procedure we are going to cover by tSQLt Tests
---------------------------------------------------------------------------------------

EXECUTE dbo.usp_GetLongestServingEmployee;

---------------------------------------------------------------------------------------
-- 2.) Create the new test class
---------------------------------------------------------------------------------------

EXECUTE tsqlt.NewTestClass @ClassName = N'test_dbo_usp_GetLongestServingEmployee';

---------------------------------------------------------------------------------------
-- 3.) Review the new TestClass = DB schema
---------------------------------------------------------------------------------------

-- Security ---> Schemas ---> 'test_dbo_usp_GetLongestServingEmployee'

---------------------------------------------------------------------------------------
-- 4.) Try to run new TestClass, but no tests defined yet
---------------------------------------------------------------------------------------

EXECUTE tsqlt.RunTestClass @TestClassName = N'test_dbo_usp_GetLongestServingEmployee';

---------------------------------------------------------------------------------------
-- EOF
---------------------------------------------------------------------------------------
