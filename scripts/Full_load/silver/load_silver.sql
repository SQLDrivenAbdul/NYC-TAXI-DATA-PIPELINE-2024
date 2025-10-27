/*
This scripts loads the transformed that into the silver layer. 
The code wrapped in a stored procedure  AS  silver.load_nycsilver for easy execution/run.
*/





EXEC silver.load_nycsilver;

CREATE OR ALTER PROCEDURE silver.load_nycsilver AS
BEGIN

BEGIN TRY

	DECLARE @load_start_time DATETIME , @load_end_time DATETIME


SET @load_start_time = GETDATE(); -- get the exact time the file starts loading

TRUNCATE TABLE silver.yellow_taxi;
INSERT INTO silver.yellow_taxi
( 
VendorID,
vendor_name,
tpep_pickup_datetime,
tpep_dropoff_datetime,
passenger_count,
trip_distance,
fare_category,
store_and_fwd_lag,
PULocationID,
DULocationID,
payment_type,
fare_amount,
extra,
mta_tax,
tip_amount,
tolls_amount,
improvement_surcharge,
total_amount,
congestion_surcharge,
airport_fee,
trip_status
)

SELECT 
	*,
	CASE 
		WHEN tpep_dropoff_datetime < tpep_pickup_datetime THEN 'Invalid' 
		WHEN tpep_dropoff_datetime = tpep_pickup_datetime THEN 'Cancelled'
		ELSE 'Valid'
	END trip_status	
FROM 
(
SELECT
	VendorID,
	CASE 
		WHEN VendorID = 1 THEN 'Creative Mobility Technologies, LLC'
		WHEN VendorID = 2 THEN 'Curb Mobility, LLC'
	END AS vendor_name,
	CONVERT(DATETIME,tpep_pickup_datetime,103) AS tpep_pickup_datetime ,
	CONVERT(DATETIME,tpep_dropoff_datetime,103) AS tpep_dropoff_datetime,
	passenger_count,
	trip_distance,
	CASE 
		WHEN RatecodeID = 1 THEN 'Standard'
		WHEN RatecodeID = 2 THEN 'JFK'
		WHEN RatecodeID = 3 THEN 'Newark'
		WHEN RatecodeID = 4 THEN 'Nassau or Westchester'
		WHEN RatecodeID = 5 THEN 'Negotiated fare'
		WHEN RatecodeID = 6 THEN 'Group ride'
		WHEN RatecodeID = 99 THEN 'Unknown'
	END AS fare_category,
	CASE 
		WHEN  TRIM(UPPER(store_and_fwd_lag))  = 'Y' THEN 'Yes'
		WHEN  TRIM(UPPER(store_and_fwd_lag))  = 'N' THEN 'No'
	END AS store_and_fwd_lag,
	PULocationID,
	DULocationID,
	CASE 
		WHEN payment_type = 1 THEN 'Credit card'
		WHEN payment_type = 2 THEN  'Cash'
		WHEN payment_type = 3 THEN  'No charge'
		WHEN payment_type = 4 THEN  'Dispute'
	END AS payment_type,
	ABS(fare_amount) AS fare_amount,
	ABS(extra)  AS extra,
	ABS(mta_tax) AS mta_tax,
	ABS(tip_amount)  AS tip_amount,
	ABS(tolls_amount) AS tolls_amount,
	ABS(improvement_surcharge) AS improvement_surcharge,
	ABS(total_amount) AS total_amount,
	ABS(congestion_surcharge) AS congestion_surcharge,
	ABS(airport_fee) AS airport_fee
FROM bronze.yellow_taxi) AS sub


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




