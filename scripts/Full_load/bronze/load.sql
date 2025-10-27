/*
The stored procedure pulls data from the source file into the defined table.

To execute it, you simply run  EXEC bronze.load_nycbronze;

In situations where the procedure fails to load the data, the scripts information about the error encountered.
*/
EXEC bronze.load_nycbronze;


CREATE OR ALTER PROCEDURE bronze.load_nycbronze AS
BEGIN
BEGIN TRY
DECLARE @load_start_time DATETIME , @load_end_time DATETIME


SET @load_start_time = GETDATE() -- get the exact time the file starts loading

-- loading the bronze layer
BULK INSERT bronze.yellow_taxi
FROM 'C:\Users\USER\OneDrive\Desktop\NYC_ETL_PRROJECT FILE\combined_full_load.csv'
WITH 
( 
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
)
SET @load_end_time = GETDATE(); -- when it's done 

PRINT '---------------------------------------------------------------'
PRINT 'Load time: ' + CAST(DATEDIFF(SECOND,@load_start_time,@load_end_time) AS VARCHAR) + ' seconds'
PRINT '---------------------------------------------------------------'
END TRY

BEGIN CATCH
PRINT '---------------------------------------------------------------'
PRINT 'Error message: ' + CAST(ERROR_MESSAGE() AS VARCHAR)
PRINT 'Error message: ' + CAST(ERROR_STATE() AS VARCHAR)
PRINT 'Error message: ' + CAST(ERROR_NUMBER() AS VARCHAR)
PRINT '---------------------------------------------------------------'
END CATCH


END

