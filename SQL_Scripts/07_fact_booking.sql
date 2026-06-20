-- Create Fact Table

CREATE TABLE fact_booking
(
    booking_id int IDENTITY(1,1),
    customer_key int,
    route_key int,
    bus_key int,
    payment_key int,
    ticket_fare int
);

-- Load Fact Table

INSERT INTO fact_booking
(
    customer_key,
    route_key,
    bus_key,
    payment_key,
    ticket_fare
)
SELECT
    c.customer_key,
    r.route_key,
    b.bus_key,
    p.payment_key,
    s.ticket_fare
FROM s_redbus s

JOIN dim_customer c
    ON s.first_name = c.first_name
   AND s.last_name = c.last_name

JOIN dim_route r
    ON s.city_from = r.city_from
   AND s.city_to = r.city_to

JOIN dim_bus b
    ON s.bus_type = b.bus_type
   AND s.seat_type = b.seat_type

JOIN dim_payment p
    ON s.payment_method = p.payment_method
   AND s.booking_type = p.booking_type;

-- Verify Data

SELECT TOP 10 *
FROM fact_booking;
