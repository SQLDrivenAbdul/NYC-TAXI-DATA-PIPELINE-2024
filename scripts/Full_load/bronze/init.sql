/*

This script creates the database and schema objects for the three layers of the ETL process.
If there is any database with the name,it deletes it and create another one.
*/


IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Nyc_DataWarehouse')
BEGIN
    ALTER DATABASE Nyc_DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Nyc_DataWarehouse;
END;

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
