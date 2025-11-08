/*
This script drops silver.yellow_taxi table if it already exist and recreate another one.
*/
 IF OBJECT_ID('silver.yellow_taxi', 'U') IS NOT NULL
	DROP TABLE silver.yellow_taxi;
CREATE TABLE [silver].[yellow_taxi](
	[VendorID] [int] NULL,
	[vendor_name] [varchar](50) NULL,
	[tpep_pickup_datetime] [datetime] NULL,
	[tpep_dropoff_datetime] [datetime] NULL,
	[passenger_count] [float] NULL,
	[trip_distance] [float] NULL,
	[fare_category] [varchar](50) NULL,
	[store_and_fwd_flag] [char](10) NULL,
	[PULocationID] [int] NULL,
	[DOLocationID] [int] NULL,
	[payment_type] [varchar](50) NULL,
	[fare_amount] [float] NULL,
	[extra] [float] NULL,
	[mta_tax] [float] NULL,
	[tip_amount] [float] NULL,
	[tolls_amount] [float] NULL,
	[improvement_surcharge] [float] NULL,
	[total_amount] [float] NULL,
	[congestion_surcharge] [float] NULL,
	[airport_fee] [float] NULL,
	[trip_status] [varchar](50) NULL
)
