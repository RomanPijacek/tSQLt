USE AdventureWorks2017;
GO
/*
    Author:     Roman Pijacek
    Date:       2020-01-05
    Execution:
                EXECUTE tsqlt.RunTestClass 
                    @TestClassName = N'[test_DBConfiguration]';

                EXECUTE tsqlt.Run 
                    @TestName = N'[test_DBConfiguration].[test 02 CheckDBStatistics]'
*/
CREATE OR ALTER PROCEDURE [test_DBConfiguration].[test 02 CheckDBStatistics]
AS
BEGIN
    SET NOCOUNT ON;

    ---------------------------------------------------------------------------------------
    -- 1.) Assemble
    ---------------------------------------------------------------------------------------

    DECLARE @assertMessage NVARCHAR(MAX);
    DECLARE @actualAutoCreateStats BIT;
    DECLARE @expectedAutoCreateStats BIT = 1;
    DECLARE @actualAutoUpdateStats BIT;
    DECLARE @expectedAutoUpdateStats BIT = 1;

    ---------------------------------------------------------------------------------------
    -- 2.) Act
    ---------------------------------------------------------------------------------------

    SET @actualAutoCreateStats = (SELECT CAST(DATABASEPROPERTYEX(DB_NAME(), 'IsAutoCreateStatistics') AS BIT));
    SET @actualAutoUpdateStats = (SELECT CAST(DATABASEPROPERTYEX(DB_NAME(), 'IsAutoUpdateStatistics') AS BIT));

    ---------------------------------------------------------------------------------------    
    -- 3.) Assert
    ---------------------------------------------------------------------------------------

    -- Assert 1:
    SET @assertMessage = N'Assert 1: AutoCreateStatistics should be set to 1';
    EXECUTE tSQLt.AssertEquals
        @Expected = @expectedAutoCreateStats,
        @Actual = @actualAutoCreateStats,
        @Message = @assertMessage;

    -- Assert 2:
    SET @assertMessage = N'Assert 2: AutoUpdateStatistics should be set to 1';
    EXECUTE tSQLt.AssertEquals
        @Expected = @expectedAutoUpdateStats,
        @Actual = @actualAutoUpdateStats,
        @Message = @assertMessage;
END
