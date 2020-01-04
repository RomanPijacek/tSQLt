USE master;
GO

---------------------------------------------------------------------------------------
-- Restore AdventureWorks2017 database from the backup file
---------------------------------------------------------------------------------------

IF DB_ID('AdventureWorks2017') IS NOT NULL
BEGIN
	ALTER DATABASE AdventureWorks2017 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
END
GO

RESTORE DATABASE AdventureWorks2017 FROM
	DISK = N'C:\DB_BAK\AdventureWorks2017.bak' WITH FILE = 1,  
	MOVE N'AdventureWorks2017' TO N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSRVDEV2019\MSSQL\DATA\AdventureWorks2017.mdf',  
	MOVE N'AdventureWorks2017_log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSRVDEV2019\MSSQL\DATA\AdventureWorks2017_log.ldf',  
	NOUNLOAD, REPLACE, STATS = 5;
GO

ALTER DATABASE AdventureWorks2017 SET MULTI_USER;
GO

USE AdventureWorks2017;
GO

EXEC sp_changedbowner 'sa';
GO

---------------------------------------------------------------------------------------
-- EOF
---------------------------------------------------------------------------------------
