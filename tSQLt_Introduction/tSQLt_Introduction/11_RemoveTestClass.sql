USE AdventureWorks2017;
GO

---------------------------------------------------------------------------------------
-- Try to Remove both Tests clases we implemented
---------------------------------------------------------------------------------------

EXECUTE tSQLt.DropClass
    @ClassName = N'[test_dbo_usp_GetLongestServingEmployee]';
GO

EXECUTE tSQLt.DropClass 
    @ClassName = N'[test_dbo_usp_PopulateDimDate]';
GO

---------------------------------------------------------------------------------------
-- Cleanup Script for tSQLt procedures:
---------------------------------------------------------------------------------------

DROP TABLE IF EXISTS #tSQLtProcedures;
GO

SELECT 
    p.[name] AS ProcedureName,
    s.[name] AS SchemaName,
    s.[schema_id] AS SchemaId
INTO
    #tSQLtProcedures
FROM 
    sys.procedures AS p
    INNER JOIN sys.schemas AS s ON s.[schema_id] = p.[schema_id]
    INNER JOIN sys.extended_properties AS ep ON ep.[major_id] = s.[schema_id] 
WHERE
    ep.[name] = 'tSQLt.TestClass' 
    AND ep.[value] = 1;

---------------------------------------------------------------------------------------
-- Generate DROP commands for procedures
---------------------------------------------------------------------------------------

SELECT 
    CONCAT('DROP PROCEDURE IF EXISTS ',  QUOTENAME(SchemaName), '.', QUOTENAME(ProcedureName), ';') AS ProcDropCommands
FROM 
    #tSQLtProcedures;

---------------------------------------------------------------------------------------
-- Generate tSQLt.DropClass commands
---------------------------------------------------------------------------------------

SELECT DISTINCT
    CONCAT('EXECUTE tSQLt.DropClass @ClassName = N''',  QUOTENAME(SchemaName), ''';') AS ProcDropCommands
FROM 
    #tSQLtProcedures;

---------------------------------------------------------------------------------------
-- OEF
---------------------------------------------------------------------------------------
