-- Create Bus Dimension Table

CREATE TABLE dim_bus
(
    bus_key int IDENTITY(1,1),
    bus_type varchar(100),
    seat_type varchar(100)
);

-- Load Bus Data

INSERT INTO dim_bus
(
    bus_type,
    seat_type
)
SELECT DISTINCT
    bus_type,
    seat_type
FROM s_redbus;

-- Verify Data

SELECT TOP 10 *
FROM dim_bus;
