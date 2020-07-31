USE AdventureWorks2017;
GO

---------------------------------------------------------------------------------------
-- 1.) Let's review and understand the procedure we are going to cover by tSQLt Tests
---------------------------------------------------------------------------------------

EXECUTE [dbo].[usp_ArchiveSalesStore];
GO

SELECT * FROM Sales.Store WHERE IsClosed = 1;
SELECT * FROM Sales.StoreArchive;

---------------------------------------------------------------------------------------
-- 2.) Create the new test class
---------------------------------------------------------------------------------------

EXECUTE tSQLt.NewTestClass 
    @ClassName = N'test_dbo_usp_ArchiveSalesStore';

---------------------------------------------------------------------------------------
-- 3.) Review the new TestClass = DB schema
---------------------------------------------------------------------------------------

-- Security ---> Schemas ---> 'test_dbo_usp_ArchiveSalesStore'

---------------------------------------------------------------------------------------
-- 4.) Try to run new TestClass, but no tests defined yet
---------------------------------------------------------------------------------------

EXECUTE tSQLt.RunTestClass 
    @TestClassName = N'test_dbo_usp_ArchiveSalesStore';

---------------------------------------------------------------------------------------
-- EOF
---------------------------------------------------------------------------------------
