/*

This script creates the database and schema objects for the three layers of the ETL process.
If there is any database with the name,it deletes it and create another one.
*/



CREATE DATABASE Nyc_Inc;
GO


USE Nyc_Inc;
GO


CREATE SCHEMA bronze;
GO



CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
