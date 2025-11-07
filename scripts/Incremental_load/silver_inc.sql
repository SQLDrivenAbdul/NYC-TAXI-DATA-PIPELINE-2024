/*
created the silver layer table with data types to fit the transformed data coming from the bronze layer
*/

CREATE TABLE [silver].[nyc_inc](
	[VendorID] [int] NULL,
	[vendor_name] [varchar](50) NULL,
	[tpep_pickup_datetime] [datetime2](7) NULL,
	[tpep_dropoff_datetime] [datetime2](7) NULL,
	[passenger_count] [int] NULL,
	[trip_distance] [float] NULL,
	[fare_category] [varchar](50) NULL,
	[store_and_fwd_lag] [char](10) NULL,
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
	[trip_status] [varchar](50) NULL,
	[load_datetime] [datetime] NULL
)
