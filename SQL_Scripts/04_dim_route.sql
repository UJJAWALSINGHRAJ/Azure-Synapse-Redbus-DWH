-- Create Route Dimension Table

CREATE TABLE dim_route
(
    route_key int IDENTITY(1,1),
    city_from varchar(100),
    city_to varchar(100)
);

-- Load Route Data

INSERT INTO dim_route
(
    city_from,
    city_to
)
SELECT DISTINCT
    city_from,
    city_to
FROM s_redbus;

-- Verify Data

SELECT TOP 10 *
FROM dim_route;
