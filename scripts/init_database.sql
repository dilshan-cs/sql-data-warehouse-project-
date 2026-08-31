/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/



use master;
GO

-- drop and recreate datawarehouse database
IF exists(
    select 1 from sys.databases
    where name = 'datawarehouse'
)
begin 
    alter database datawarehouse set single_user with rollback immediate;
    drop database datawarehouse;

end
GO

-- create the database
create database datawarehouse;
GO

use datawarehouse;
GO

create schema bronze;
GO

create schema silver;
GO

create schema gold;
GO
    