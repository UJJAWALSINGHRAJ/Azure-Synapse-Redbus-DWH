-- Create Payment Dimension Table

CREATE TABLE dim_payment
(
    payment_key int IDENTITY(1,1),
    payment_method varchar(100),
    booking_type varchar(100)
);

-- Load Payment Data

INSERT INTO dim_payment
(
    payment_method,
    booking_type
)
SELECT DISTINCT
    payment_method,
    booking_type
FROM s_redbus;

-- Verify Data

SELECT TOP 10 *
FROM dim_payment;
