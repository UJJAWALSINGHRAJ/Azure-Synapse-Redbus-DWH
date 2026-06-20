-- View Complete Booking Report

SELECT
    c.first_name,
    c.last_name,
    r.city_from,
    r.city_to,
    b.bus_type,
    b.seat_type,
    p.booking_type,
    p.payment_method,
    f.ticket_fare
FROM fact_booking f

JOIN dim_customer c
    ON f.customer_key = c.customer_key

JOIN dim_route r
    ON f.route_key = r.route_key

JOIN dim_bus b
    ON f.bus_key = b.bus_key

JOIN dim_payment p
    ON f.payment_key = p.payment_key;


-- Total Bookings by City

SELECT
    city_from,
    COUNT(*) AS total_bookings
FROM s_redbus
GROUP BY city_from
ORDER BY total_bookings DESC;


-- Total Revenue by Route

SELECT
    city_from,
    city_to,
    SUM(ticket_fare) AS total_revenue
FROM s_redbus
GROUP BY city_from, city_to
ORDER BY total_revenue DESC;


-- Total Revenue by Bus Type

SELECT
    bus_type,
    SUM(ticket_fare) AS total_revenue
FROM s_redbus
GROUP BY bus_type
ORDER BY total_revenue DESC;


-- Total Bookings by Payment Method

SELECT
    payment_method,
    COUNT(*) AS total_bookings
FROM s_redbus
GROUP BY payment_method
ORDER BY total_bookings DESC;


-- Average Ticket Fare

SELECT
    AVG(ticket_fare) AS average_ticket_fare
FROM s_redbus;
