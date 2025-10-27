/*
At every run of this script, the table is dropped and recreated.
*/


-- creating the table structure
 IF OBJECT_ID('bronze.yellow_taxi', 'U') IS NOT NULL
	DROP TABLE bronze.yellow_taxi;
CREATE TABLE bronze.yellow_taxi
(
VendorID INT,
tpep_pickup_datetime VARCHAR(30),
tpep_dropoff_datetime VARCHAR(30),
passenger_count INT,
trip_distance FLOAT,
RatecodeID INT,
store_and_fwd_lag CHAR(10),
PULocationID INT,
DULocationID INT,
payment_type INT,
fare_amount FLOAT,
extra FLOAT,
mta_tax FLOAT,
tip_amount FLOAT,
tolls_amount FLOAT,
improvement_surcharge FLOAT,
total_amount FLOAT,
congestion_surcharge FLOAT,
airport_fee FLOAT
)
