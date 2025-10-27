# NYC Taxi Data Pipeline 🚕

<p align="justify">
This project is focused on designing a SQL-based data pipeline for DEC that ingests, transforms, and aggregate NYC Taxi data for the year 2024.
</p>


## About the data
The datasets are records of yellow taxi transactions in NYC. They were collected and provided to the NYC Taxi and Limousine Commission (TLC) by technology providers authorized under the Taxicab & Livery Passenger Enhancement Programs (TPEP/LPEP). 

The datasets has the following fields:

| **Field Name** | **Description** |
|----------------|-----------------|
| VendorID | A code indicating the TPEP provider that provided the record.<br>1 = Creative Mobile Technologies, LLC<br>2 = Curb Mobility, LLC<br>6 = Myle Technologies Inc<br>7 = Helix |
| tpep_pickup_datetime | The date and time when the meter was engaged. |
| tpep_dropoff_datetime | The date and time when the meter was disengaged. |
| passenger_count | The number of passengers in the vehicle. |
| trip_distance | The elapsed trip distance in miles reported by the taximeter. |
| RatecodeID | The final rate code in effect at the end of the trip.<br>1 = Standard rate<br>2 = JFK<br>3 = Newark<br>4 = Nassau or Westchester<br>5 = Negotiated fare<br>6 = Group ride<br>99 = Null/unknown |
| store_and_fwd_flag | This flag indicates whether the trip record was held in vehicle memory before sending to the vendor (“store and forward”), because the vehicle did not have a connection to the server.<br>Y = store and forward trip<br>N = not a store and forward trip |
| PULocationID | TLC Taxi Zone in which the taximeter was engaged. |
| DOLocationID | TLC Taxi Zone in which the taximeter was disengaged. |
| payment_type | A numeric code signifying how the passenger paid for the trip.<br>0 = Flex Fare trip<br>1 = Credit card<br>2 = Cash<br>3 = No charge<br>4 = Dispute<br>5 = Unknown<br>6 = Voided trip |
| fare_amount | The time-and-distance fare calculated by the meter. For more info, see [NYC Taxi Fare Information](https://www.nyc.gov/site/tlc/passengers/taxi-fare.page). |
| extra | Miscellaneous extras and surcharges. |
| mta_tax | Tax automatically triggered based on the metered rate in use. |
| tip_amount | Tip amount – automatically populated for credit card tips (cash tips not included). |
| tolls_amount | Total amount of all tolls paid in the trip. |
| improvement_surcharge | Improvement surcharge assessed at the flag drop (introduced in 2015). |
| total_amount | Total amount charged to passengers (excludes cash tips). |
| congestion_surcharge | Total amount collected in trip for NYS congestion surcharge. |
| airport_fee | For pickups only at LaGuardia and John F. Kennedy Airports. |


## Project requirements
- The clear architectural design
- Comprehensive documentation explaining design choices and approach
- The system requirements includes two data loading strategies; full and incremental loading.


![Pipeline Diagram](C:\Users\USER\Downloads\architecture design)



