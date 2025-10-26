/*

This script creates the database and schema objects for the three layers of the ETL process.
*/
CREATE DATABASE Nyc_DataWarehouse;
GO


USE Nyc_DataWarehouse;
GO


CREATE SCHEMA bronze;
GO



CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
