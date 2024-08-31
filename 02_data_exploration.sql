-- check for min and max values of trip duration

SELECT
    member_casual,
    MIN(trip_duration) AS shortest_trip,
    MAX(trip_duration) AS longest_trip,
FROM `cyclistic_case_study.raw_combined_data_added_columns`

GROUP BY member_casual

-- check for null values








-- check for duplicate trip IDs

-- check for all types of rideable_type

-- list all start and end destinations (looking for any that weren't real or testing facility)