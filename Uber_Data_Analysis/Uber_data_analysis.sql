-- ===================================================================
-- Title      : Uber Trip Data Analysis
-- Author     : Parag Kishor Badgujar
-- Description: SQL Views and Queries for analyzing Uber trip dataset
-- ===================================================================

USE uber;

-- =====================================================
-- Q1. Total Trips Made Each Day
-- =====================================================
CREATE VIEW daily_trip_summary AS
SELECT 
    DATE(START_DATE) AS trip_date, 
    COUNT(*) AS total_trips
FROM uber_dataset_clean
GROUP BY trip_date
ORDER BY trip_date;

SELECT * FROM daily_trip_summary;

-- =====================================================
-- Q2. Hour of the Day with Highest Number of Rides
-- =====================================================
CREATE VIEW highest_number_of_rides AS
SELECT 
    EXTRACT(HOUR FROM START_DATE) AS ride_hour,
    COUNT(*) AS total_rides
FROM uber_dataset_clean
GROUP BY ride_hour
ORDER BY total_rides DESC
LIMIT 1;

SELECT * FROM highest_number_of_rides;

-- =====================================================
-- Q3. Average Duration of All Trips
-- =====================================================
CREATE VIEW average_trip_duration AS
SELECT 
    AVG(DURATION_MIN) AS average_trip_duration
FROM uber_dataset_clean;

SELECT * FROM average_trip_duration;

-- =====================================================
-- Q4. Top 5 Most Common Pickup Locations
-- =====================================================
CREATE VIEW top_five_pickup_locations AS
SELECT 
    START, 
    COUNT(*) AS pickup_count
FROM uber_dataset_clean
GROUP BY START
ORDER BY pickup_count DESC
LIMIT 5;

SELECT * FROM top_five_pickup_locations;

-- =====================================================
-- Q5. Top 5 Most Frequently Used Routes (START to STOP)
-- =====================================================
CREATE VIEW top_five_routes AS
SELECT 
    START, 
    STOP, 
    COUNT(*) AS route_count
FROM uber_dataset_clean
GROUP BY START, STOP
ORDER BY route_count DESC
LIMIT 5;

SELECT * FROM top_five_routes;

-- =====================================================
-- Q6. Number of Trips for Each Purpose
-- =====================================================
CREATE VIEW trip_count_by_purpose AS 
SELECT 
    PURPOSE, 
    COUNT(*) AS trip_count
FROM uber_dataset_clean
GROUP BY PURPOSE;

SELECT * FROM trip_count_by_purpose;

-- =====================================================
-- Q7. Number of Trips by Category (Business vs Personal)
-- =====================================================
CREATE VIEW trip_count_by_category AS 
SELECT 
    Category, 
    COUNT(*) AS trip_count
FROM uber_dataset_clean
GROUP BY Category;

SELECT * FROM trip_count_by_category;

-- =====================================================
-- Q8. Total and Average Distance Traveled Each Day
-- =====================================================
SELECT 
    DATE(START_DATE) AS trip_date,
    SUM(MILES) AS total_distance,
    AVG(MILES) AS average_distance
FROM uber_dataset_clean
GROUP BY DATE(START_DATE)
ORDER BY trip_date;

-- =====================================================
-- Q9. Average Trip Duration for Each Day of the Week
-- =====================================================
SELECT 
    DAYNAME(Start_Date) AS day_of_week,
    AVG(TIMESTAMPDIFF(MINUTE, Start_Date, End_Date)) AS avg_duration_minutes
FROM uber_dataset_clean
GROUP BY day_of_week
ORDER BY FIELD(day_of_week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- =====================================================
-- Q10. Purpose with Longest Average Trip Duration
-- =====================================================
SELECT 
    Purpose,
    AVG(TIMESTAMPDIFF(MINUTE, Start_Date, End_Date)) AS avg_duration_minutes
FROM uber_dataset_clean
WHERE Purpose IS NOT NULL
GROUP BY Purpose
ORDER BY avg_duration_minutes DESC
LIMIT 1;

-- =====================================================
-- Q11. Monthly Trend in Number of Rides
-- =====================================================
SELECT 
    YEAR(Start_Date) AS year,
    MONTH(Start_Date) AS month,
    COUNT(*) AS ride_count
FROM uber_dataset_clean
GROUP BY YEAR(Start_Date), MONTH(Start_Date)
ORDER BY year, month;

-- =====================================================
-- Q12. Long Trips (More than 60 Minutes or 30 Miles)
-- =====================================================
SELECT *
FROM uber_dataset_clean
WHERE 
    TIMESTAMPDIFF(MINUTE, Start_Date, End_Date) > 60
    OR MILES > 30;

-- =====================================================
-- Q13. Trips that Started and Ended at the Same Location
-- =====================================================
SELECT 
    COUNT(*) AS same_location_trips
FROM uber_dataset_clean
WHERE START = STOP;

-- =====================================================
-- Q14. Average Trip Distance During Peak Hours (7-9 AM, 5-7 PM)
-- =====================================================
SELECT 
    AVG(MILES) AS avg_distance_peak_hours
FROM uber_dataset_clean
WHERE 
    (HOUR(Start_Date) BETWEEN 7 AND 8)   -- 7:00 to 8:59 AM
    OR 
    (HOUR(Start_Date) BETWEEN 17 AND 18);  -- 5:00 to 6:59 PM

-- End of SQL Script


