/*
the script creates the bronze table and assigned appropriate data types to the expected data
*/


CREATE TABLE [bronze].[nyc_inc](
	[VendorID] [int] NULL,
	[tpep_pickup_datetime] [varchar](30) NULL,
	[tpep_dropoff_datetime] [varchar](30) NULL,
	[passenger_count] [float] NULL,
	[trip_distance] [float] NULL,
	[RatecodeID] [float] NULL,
	[store_and_fwd_lag] [char](10) NULL,
	[PULocationID] [int] NULL,
	[DOLocationID] [int] NULL,
	[payment_type] [int] NULL,
	[fare_amount] [float] NULL,
	[extra] [float] NULL,
	[mta_tax] [float] NULL,
	[tip_amount] [float] NULL,
	[tolls_amount] [float] NULL,
	[improvement_surcharge] [float] NULL,
	[total_amount] [float] NULL,
	[congestion_surcharge] [float] NULL,
	[airport_fee] [float] NULL
) 

/*
I created a trigger to the bronze table that automatically takes the INSERTED (the new data loaded), transform it and load to the silver layer incrementally 
without overwritting the existing data. No duplication allowed
*/

CREATE TRIGGER [bronze].[AfterInsert] ON [bronze].[nyc_inc]
AFTER INSERT
AS
BEGIN

IF TRIGGER_NESTLEVEL() > 1 RETURN;
SET NOCOUNT ON;

INSERT INTO silver.nyc_inc (VendorID, vendor_name, tpep_pickup_datetime, tpep_dropoff_datetime, passenger_count, trip_distance, fare_category, store_and_fwd_lag,
	PULocationID, DOLocationID,payment_type, fare_amount, extra, mta_tax, tip_amount, tolls_amount, improvement_surcharge, total_amount, congestion_surcharge, airport_fee,
	trip_status, load_datetime)

	SELECT
			VendorID,
			CASE 
				WHEN VendorID = 1 THEN 'Creative Mobility Technologies, LLC'
				WHEN VendorID = 2 THEN 'Curb Mobility, LLC'
				WHEN VendorID = 6 THEN 'Myle Technologies Inc'
				WHEN VendorID = 7 THEN 'Helix'
			END AS vendor_name,
			TRY_CONVERT(datetime2,TRIM(tpep_pickup_datetime),120) AS tpep_pickup_datetime,
			TRY_CONVERT(datetime2,TRIM(tpep_dropoff_datetime),120) AS tpep_dropoff_datetime,
			passenger_count,
			trip_distance,
			CASE 
				WHEN RatecodeID = 1.0 THEN 'Standard'
				WHEN RatecodeID = 2.0 THEN 'JFK'
				WHEN RatecodeID = 3.0 THEN 'Newark'
				WHEN RatecodeID = 4.0 THEN 'Nassau or Westchester'
				WHEN RatecodeID = 5.0 THEN 'Negotiated fare'
				WHEN RatecodeID = 6.0 THEN 'Group ride'
				WHEN RatecodeID = 99.0 THEN 'Unknown'
			END AS fare_category,
			CASE 
				WHEN TRIM(UPPER(store_and_fwd_lag)) = 'Y' THEN 'Yes'
				WHEN TRIM(UPPER(store_and_fwd_lag)) = 'N' THEN 'No'
			END AS store_and_fwd_lag,
			PULocationID,
			DOLocationID,
			CASE 
				WHEN payment_type = 0 THEN 'Flex fare trip'
				WHEN payment_type = 1 THEN 'Credit card'
				WHEN payment_type = 2 THEN  'Cash'
				WHEN payment_type = 3 THEN  'No charge'
				WHEN payment_type = 4 THEN  'Dispute'
				WHEN payment_type = 5 THEN  'Unknown'
				WHEN payment_type = 6 THEN  'Voided trip'
			END AS payment_type,
			CASE WHEN fare_amount < 0 THEN ABS(fare_amount) ELSE fare_amount END AS fare_amount,
			CASE WHEN  extra < 0 THEN ABS(extra)  ELSE extra END  AS extra,
			CASE WHEN mta_tax < 0 THEN ABS(mta_tax) ELSE mta_tax END AS mta_tax,
			CASE WHEN tip_amount < 0 THEN ABS(tip_amount) ELSE tip_amount END  AS tip_amount,
			CASE WHEN tolls_amount < 0  THEN ABS(tolls_amount) ELSE tolls_amount END AS tolls_amount,
			CASE WHEN improvement_surcharge < 0 THEN ABS(improvement_surcharge)  ELSE improvement_surcharge END AS improvement_surcharge,
			CASE WHEN total_amount< 0 THEN ABS(total_amount) ELSE total_amount END AS total_amount,
			CASE WHEN congestion_surcharge < 0 THEN ABS(congestion_surcharge) ELSE congestion_surcharge END AS congestion_surcharge,
			CASE WHEN airport_fee < 0 THEN ABS(airport_fee) ELSE airport_fee END AS airport_fee,
			CASE
				WHEN TRY_CONVERT(datetime,TRIM(tpep_dropoff_datetime),120) < TRY_CONVERT(datetime, TRIM(tpep_pickup_datetime),120) THEN 'Invalid'
				WHEN TRY_CONVERT(datetime,TRIM(tpep_dropoff_datetime),120) = TRY_CONVERT(datetime, TRIM(tpep_pickup_datetime),120)THEN 'Cancelled'
				ELSE 'Valid'
			END AS trip_status,
			GETDATE() AS load_datetime
	FROM INSERTED
END


/*
========= DATA LOADING POINT =========
Below is the script that loads the data into the bronze layer
The FIRE_TRIGGERS option is added to ensure the trigger works while using using the BULK INSERT approach, without it, the bronze layer will 
be populated but the  trigger will 'silenced' causing it not to fire at all.
*/


BULK INSERT bronze.nyc_inc
FROM 'C:\Users\USER\OneDrive\Desktop\NYC_ETL_PRROJECT FILE\yellow_tripdata_2024-01.csv' -- testing with january file
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK,
FIRE_TRIGGERS)






