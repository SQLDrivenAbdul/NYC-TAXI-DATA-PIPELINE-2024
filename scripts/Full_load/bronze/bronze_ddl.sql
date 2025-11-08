/*
This script creates the bronze layer table.
It ensures that an existing table with the same is dropped and another one created.
*/

 IF OBJECT_ID('bronze.yellow_taxi', 'U') IS NOT NULL
	DROP TABLE bronze.yellow_taxi;
CREATE TABLE [bronze].[yellow_taxi](
	[VendorID] [int] NULL,
	[tpep_pickup_datetime] [varchar](30) NULL,
	[tpep_dropoff_datetime] [varchar](30) NULL,
	[passenger_count] [float] NULL,
	[trip_distance] [float] NULL,
	[RatecodeID] [float] NULL,
	[store_and_fwd_lag] [char](10) NULL,
	[PULocationID] [int] NULL,
	[DULocationID] [int] NULL,
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
