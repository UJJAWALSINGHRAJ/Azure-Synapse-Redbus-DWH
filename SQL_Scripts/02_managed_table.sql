-- Create Managed Table

CREATE TABLE s_redbus
(
    first_name varchar(100),
    last_name varchar(100),
    age int,
    city_from varchar(100),
    city_to varchar(100),
    bus_type varchar(100),
    seat_type varchar(100),
    booking_type varchar(100),
    payment_method varchar(100),
    ticket_fare int
);

-- Load Data from External Table

INSERT INTO s_redbus
SELECT *
FROM ext_redbus;

-- Verify Data

SELECT TOP 10 *
FROM s_redbus;
