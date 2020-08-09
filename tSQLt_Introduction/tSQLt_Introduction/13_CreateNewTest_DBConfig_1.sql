USE AdventureWorks2017;
GO
/*
    Author:     Roman Pijacek
    Date:       2020-01-05
    Execution:
                EXECUTE tsqlt.RunTestClass 
                    @TestClassName = N'[test_DBConfiguration]';

                EXECUTE tsqlt.Run 
                    @TestName = N'[test_DBConfiguration].[test 01 CheckDBRecoveryModel]'
*/
CREATE OR ALTER PROCEDURE [test_DBConfiguration].[test 01 CheckDBRecoveryModel]
AS
BEGIN
    SET NOCOUNT ON;

    ---------------------------------------------------------------------------------------
    -- 1.) Assemble
    ---------------------------------------------------------------------------------------

    DECLARE @assertMessage NVARCHAR(MAX);
    DECLARE @actualDbRecoveryModel VARCHAR(255);
    DECLARE @expectedDbRecoveryModel VARCHAR(255) = 'SIMPLE';    

    ---------------------------------------------------------------------------------------
    -- 2.) Act
    ---------------------------------------------------------------------------------------

    SET @actualDbRecoveryModel = 
    (
        SELECT 
            recovery_model_desc 
        FROM 
            sys.databases 
        WHERE 
            [name] = DB_NAME()
    );
      
    ---------------------------------------------------------------------------------------    
    -- 3.) Assert
    ---------------------------------------------------------------------------------------

    SET @assertMessage = N'Assert 1: DB Recovery model has to be set to Simple';

    EXECUTE tSQLt.AssertEquals
        @Expected = @expectedDbRecoveryModel,
        @Actual = @actualDbRecoveryModel,
        @Message = @assertMessage;
END
