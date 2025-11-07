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
