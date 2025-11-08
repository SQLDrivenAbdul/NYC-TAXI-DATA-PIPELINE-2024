/*
The stored procedure is designed to load all of 2024 data at once into the raw table.
To use the procedure, run EXEC bronze.load_nycbronze in your management system.
*/
CREATE PROCEDURE bronze.load_nycbronze
AS
BEGIN
	DECLARE @load_start_time DATETIME , @load_end_time DATETIME

SET @load_start_time = GETDATE()

PRINT 'January data'
BULK INSERT bronze.yellow_taxi
FROM 'C:\Users\USER\OneDrive\Desktop\NYC_ETL_PRROJECT FILE\yellow_tripdata_2024-01.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

PRINT 'February data'
BULK INSERT bronze.yellow_taxi
FROM 'C:\Users\USER\OneDrive\Desktop\NYC_ETL_PRROJECT FILE\yellow_tripdata_2024-02.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

PRINT 'March data'
BULK INSERT bronze.yellow_taxi
FROM 'C:\Users\USER\OneDrive\Desktop\NYC_ETL_PRROJECT FILE\yellow_tripdata_2024-03.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

PRINT 'April data'
BULK INSERT bronze.yellow_taxi
FROM 'C:\Users\USER\OneDrive\Desktop\NYC_ETL_PRROJECT FILE\yellow_tripdata_2024-04.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

PRINT 'May data'
BULK INSERT bronze.yellow_taxi
FROM 'C:\Users\USER\OneDrive\Desktop\NYC_ETL_PRROJECT FILE\yellow_tripdata_2024-05.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

PRINT 'June data'
BULK INSERT bronze.yellow_taxi
FROM 'C:\Users\USER\OneDrive\Desktop\NYC_ETL_PRROJECT FILE\yellow_tripdata_2024-06.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

PRINT 'July data'
BULK INSERT bronze.yellow_taxi
FROM 'C:\Users\USER\OneDrive\Desktop\NYC_ETL_PRROJECT FILE\yellow_tripdata_2024-07.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

PRINT 'August data'
BULK INSERT bronze.yellow_taxi
FROM 'C:\Users\USER\OneDrive\Desktop\NYC_ETL_PRROJECT FILE\yellow_tripdata_2024-08.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

PRINT 'September data'
BULK INSERT bronze.yellow_taxi
FROM 'C:\Users\USER\OneDrive\Desktop\NYC_ETL_PRROJECT FILE\yellow_tripdata_2024-09.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

PRINT 'October data'
BULK INSERT bronze.yellow_taxi
FROM 'C:\Users\USER\OneDrive\Desktop\NYC_ETL_PRROJECT FILE\yellow_tripdata_2024-10.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

PRINT 'November data'
BULK INSERT bronze.yellow_taxi
FROM 'C:\Users\USER\OneDrive\Desktop\NYC_ETL_PRROJECT FILE\yellow_tripdata_2024-11.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

PRINT 'December data'
BULK INSERT bronze.yellow_taxi
FROM 'C:\Users\USER\OneDrive\Desktop\NYC_ETL_PRROJECT FILE\yellow_tripdata_2024-12.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
)
END

SET @load_end_time = GETDATE()

PRINT 'Load_time: ' + CAST(DATEDIFF(SECOND,@load_end_time,@load_start_time)AS VARCHAR) + 'seconds'
