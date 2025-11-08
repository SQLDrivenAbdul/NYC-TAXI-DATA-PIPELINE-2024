/*
created a view of the cleaned data from the silver layer, ensured clear easy-to-understand column names.
*/

CREATE VIEW 
gold.nyc_inc

AS
SELECT
	VendorID AS vendor_id,
	vendor_name,
	trip_status,
	tpep_pickup_datetime AS pickup_datetime,
	tpep_dropoff_datetime AS dropoff_datetime,
	passenger_count,
	trip_distance,
	PULocationID,
	DOLocationID,
	fare_category,
	payment_type,
	fare_amount,
	extra,
	mta_tax,
	tip_amount,
	tolls_amount,
	total_amount,
	store_and_fwd_lag AS store_and_forward_flag,
	improvement_surcharge,
	congestion_surcharge,
	airport_fee
FROM silver.nyc_inc
