CREATE SCHEMA proj_hoteldata;

USE proj_hoteldata;

-- inspect tables

SELECT * FROM yr2018;
SELECT * FROM yr2019;
SELECT * FROM yr2020;

DESCRIBE yr2018;
DESCRIBE yr2019;
DESCRIBE yr2020;

-- fix column names and types

ALTER TABLE yr2020
CHANGE COLUMN ï»¿hotel hotel_type VARCHAR(20) NULL;

ALTER TABLE yr2018
MODIFY COLUMN agent INT;

-- combine tables via UNION

SELECT * FROM yr2018
UNION
SELECT * FROM yr2019
UNION
SELECT * FROM yr2020;

-- try adding new columns

WITH hotels AS (
SELECT * FROM yr2018
UNION
SELECT * FROM yr2019
UNION
SELECT * FROM yr2020)

SELECT 
	arrival_date_year,
    arrival_date_month,
	SUM(stays_in_weekend_nights + stays_in_week_nights) as total_room_nights
FROM hotels
WHERE reservation_status = 'Check-Out'
GROUP BY arrival_date_year, arrival_date_month;


WITH hotels AS (
SELECT * FROM yr2018
UNION
SELECT * FROM yr2019
UNION
SELECT * FROM yr2020)

SELECT 
	arrival_date_year,
    SUM(stays_in_weekend_nights + stays_in_week_nights) as total_room_nights
FROM hotels
WHERE reservation_status = 'Check-Out'
GROUP BY arrival_date_year;


WITH hotels AS (
SELECT * FROM yr2018
UNION
SELECT * FROM yr2019
UNION
SELECT * FROM yr2020)

SELECT 
	arrival_date_year,
    arrival_date_month,
	total_room_nights,
    ROUND((total_revenue / total_room_nights), 2) as total_adr,
    total_revenue
FROM (
	SELECT
    arrival_date_year,
    arrival_date_month,
	ROUND(SUM(stays_in_weekend_nights + stays_in_week_nights), 2) as total_room_nights,
    ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights)*adr)) as total_revenue
    FROM hotels
    WHERE reservation_status = 'Check-Out'
    GROUP BY arrival_date_year, arrival_date_month
    ) AS subquery;

-- prepare for export, add market_segment and meal_cost tables

WITH hotels AS (
SELECT * FROM yr2018
UNION
SELECT * FROM yr2019
UNION
SELECT * FROM yr2020)

SELECT *
FROM hotels
	LEFT JOIN market_segment
		ON hotels.market_segment = market_segment.market_segment
	LEFT JOIN meal_cost
		ON hotels.meal = meal_cost.meal;
