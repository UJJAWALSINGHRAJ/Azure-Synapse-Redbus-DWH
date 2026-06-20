-- Create Master Key
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Redbus@123';

-- Create Database Scoped Credential
CREATE DATABASE SCOPED CREDENTIAL RedbusCredential
WITH IDENTITY = 'Managed Identity';

-- Create External Data Source
CREATE EXTERNAL DATA SOURCE RedbusDataSource
WITH
(
    TYPE = HADOOP,
    LOCATION = 'abfss://redbus@redbusstorageujjawal.dfs.core.windows.net',
    CREDENTIAL = RedbusCredential
);

-- Create External File Format
CREATE EXTERNAL FILE FORMAT RedbusCsvFormat
WITH
(
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS
    (
        FIELD_TERMINATOR = ',',
        STRING_DELIMITER = '"',
        FIRST_ROW = 2,
        USE_TYPE_DEFAULT = TRUE
    )
);

-- Create External Table
CREATE EXTERNAL TABLE ext_redbus
(
    First_Name varchar(100),
    Last_Name varchar(100),
    Age int,
    City_From varchar(100),
    City_To varchar(100),
    Bus_Type varchar(100),
    Seat_Type varchar(100),
    Booking_Type varchar(100),
    Payment_Method varchar(100),
    Ticket_Fare int
)
WITH
(
    LOCATION = '/REDBUS_CLEAN.csv',
    DATA_SOURCE = RedbusDataSource,
    FILE_FORMAT = RedbusCsvFormat
);

-- Verify Data
SELECT TOP 10 * 
FROM ext_redbus;
