/*
This script drops silver.yellow_taxi table if it already exist and recreate it
*/

-- creating the table structure
 IF OBJECT_ID('silver.yellow_taxi', 'U') IS NOT NULL
	DROP TABLE silver.yellow_taxi;
CREATE TABLE silver.yellow_taxi
(
VendorID INT,
vendor_name VARCHAR(50),
tpep_pickup_datetime DATETIME,
tpep_dropoff_datetime DATETIME,
passenger_count INT,
trip_distance FLOAT,
fare_category VARCHAR(50),
store_and_fwd_lag CHAR(10),
PULocationID INT,
DULocationID INT,
payment_type VARCHAR(50),
fare_amount FLOAT,
extra FLOAT,
mta_tax FLOAT,
tip_amount FLOAT,
tolls_amount FLOAT,
improvement_surcharge FLOAT,
total_amount FLOAT,
congestion_surcharge FLOAT,
airport_fee FLOAT,
trip_status VARCHAR(50)
