/*
This scripts drops gold.yellow_taxi view if it already exit 
and create another one that houses all columns selected in the query. 
*/


IF OBJECT_ID('gold.yellow_taxi', 'V') IS NOT NULL
    DROP VIEW gold.yellow_taxi;
GO
CREATE VIEW gold.yellow_taxi AS 
(
SELECT 
VendorID AS vendorID,
vendor_name,
tpep_pickup_datetime  AS pickup_datetime ,
tpep_dropoff_datetime AS dropoff_datetime,
trip_status,
passenger_count,
trip_distance,
fare_category,
store_and_fwd_lag,
PULocationID ,
DOLocationID ,
payment_type ,
fare_amount ,
extra,
mta_tax,
tip_amount,
tolls_amount,
improvement_surcharge,
total_amount,
congestion_surcharge,
airport_fee
FROM silver.yellow_taxi)
