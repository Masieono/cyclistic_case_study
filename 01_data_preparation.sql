-- Combining all tables into one

CREATE TABLE cyclistic_case_study.raw_data AS
(
    SELECT * FROM 'cyclistic_case_study.01_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.02_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.03_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.04_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.05_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.06_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.07_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.08_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.09_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.10_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.11_2021'
    UNION ALL

    SELECT * FROM 'cyclistic_case_study.12_2021'
);

-- Counting up the entries within the combined table

SELECT COUNT (*)

FROM `cyclistic_case_study.raw_data`;

-- add column for time delta, day of week, and month

CREATE TABLE cyclistic_case_study.raw_data_added_columns AS
(
    SELECT
        ride_id,
        rideable_type,
        started_at,
        ended_at,
        start_station_name,
        start_station_id,
        end_station_name,
        end_station_id,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        member_casual,
        (ended_at - started_at) AS trip_duration,
        CAST(EXTRACT(MONTH from started_at) AS STRING) AS trip_month,
        CAST(EXTRACT(DAYOFWEEK from started_at) AS STRING) AS day_of_week

    FROM `cyclistic_case_study.raw_data`;
)

-- convert month from a number to a string

UPDATE `cyclistic_case_study.raw_data_added_columns`

SET trip_month = 
    CASE
        WHEN trip_month = '1' THEN 'January'
        WHEN trip_month = '2' THEN 'February'
        WHEN trip_month = '3' THEN 'March'
        WHEN trip_month = '4' THEN 'April'
        WHEN trip_month = '5' THEN 'May'
        WHEN trip_month = '6' THEN 'June'
        WHEN trip_month = '7' THEN 'July'
        WHEN trip_month = '8' THEN 'August'
        WHEN trip_month = '9' THEN 'September'
        WHEN trip_month = '10' THEN 'October'
        WHEN trip_month = '11' THEN 'November'
        WHEN trip_month = '12' THEN 'December'
    END 

WHERE day_of_week IN ('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12');

-- convert day_of_week from a number to a string

UPDATE `cyclistic_case_study.raw_data_added_columns`

SET day_of_week = 
    CASE
        WHEN day_of_week = '1' THEN 'Sunday'
        WHEN day_of_week = '2' THEN 'Monday'
        WHEN day_of_week = '3' THEN 'Tuesday'
        WHEN day_of_week = '4' THEN 'Wednesday'
        WHEN day_of_week = '5' THEN 'Thursday'
        WHEN day_of_week = '6' THEN 'Friday'
        WHEN day_of_week = '7' THEN 'Saturday'
    END 

WHERE day_of_week IN ('1', '2', '3', '4', '5', '6', '7');
