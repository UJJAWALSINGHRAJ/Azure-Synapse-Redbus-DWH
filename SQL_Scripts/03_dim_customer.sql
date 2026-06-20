-- Create Customer Dimension Table

CREATE TABLE dim_customer
(
    customer_key int IDENTITY(1,1),
    first_name varchar(100),
    last_name varchar(100),
    age int
);

-- Load Customer Data

INSERT INTO dim_customer
(
    first_name,
    last_name,
    age
)
SELECT DISTINCT
    first_name,
    last_name,
    age
FROM s_redbus;

-- Verify Data

SELECT TOP 10 *
FROM dim_customer;
