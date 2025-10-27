/*


At every run, the bronze.yellow_taxi table is truncated and reloaded

For easy execution, the code is wrapped in a stored procedure AS bronze.load_nycbronze.
To use the stored procedure, you simply run  ``EXEC bronze.load_nycbronze`` in your management system.

Case when the procedure fails to load the data, the script has been designed to  report  some important information about the error encountered for easy debugging.
*/
EXEC bronze.load_nycbronze;


CREATE OR ALTER PROCEDURE bronze.load_nycbronze AS
BEGIN
  
BEGIN TRY
DECLARE @load_start_time DATETIME , @load_end_time DATETIME


SET @load_start_time = GETDATE() -- get the exact time the file starts loading

-- truncates table
TRUNCATE TABLE bronze.yellow_taxi;

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

