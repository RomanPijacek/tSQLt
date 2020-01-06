USE AdventureWorks2017;
GO

---------------------------------------------------------------------------------------
-- Remove both Tests clases we implemented
---------------------------------------------------------------------------------------

EXECUTE tSQLt.DropClass
    @ClassName = N'[test_dbo_usp_GetLongestServingEmployee]';
GO

EXECUTE tSQLt.DropClass 
    @ClassName = N'[test_dbo_usp_PopulateDimDate]';
GO

---------------------------------------------------------------------------------------
-- EOF
---------------------------------------------------------------------------------------

-- Cleanup Script for tSQLt procedures:

SELECT 
    * 
FROM 
    sys.schemas AS s
    INNER JOIN sys.extended_properties AS p ON p.major_id = s.schema_id 
WHERE
    p.[name] = 'tSQLt.TestClass' 
    AND p.[value] = 1   
