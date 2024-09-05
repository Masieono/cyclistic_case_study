-- check for min and max values of trip duration

SELECT
    member_casual,
    MIN(trip_duration) AS shortest_trip,
    MAX(trip_duration) AS longest_trip,
FROM `cyclistic_case_study.raw_data_added_columns`

GROUP BY member_casual;

-- check for null values

SELECT 
  COUNTIF(ride_id IS NULL) AS ride_id,
  COUNTIF(rideable_type IS NULL) AS rideable_type,
  COUNTIF(started_at IS NULL) AS started_at,
  COUNTIF(ended_at IS NULL) AS ended_at,
  COUNTIF(start_station_name IS NULL) AS start_station_name,
  COUNTIF(start_station_id IS NULL) AS start_station_id,
  COUNTIF(end_station_name IS NULL) AS end_station_name,
  COUNTIF(end_station_id IS NULL) AS end_station_id,
  COUNTIF(start_lat IS NULL) AS start_lat,
  COUNTIF(start_lng IS NULL) AS start_lng,
  COUNTIF(end_lat IS NULL) AS end_lat,
  COUNTIF(end_lng IS NULL) AS end_lng,
  COUNTIF(member_casual IS NULL) AS member_casual,
  COUNTIF(trip_duration IS NULL) AS trip_duration,
  COUNTIF(trip_month IS NULL) AS trip_month,
  COUNTIF(day_of_week IS NULL) AS day_of_week
 
FROM `cyclistic_case_study.raw_data_added_columns`;

-- total unique columns with nulls

SELECT COUNT(*)

FROM `cyclistic_case_study.raw_data_added_columns`

WHERE 
  start_station_name IS NULL OR
  start_station_id IS NULL OR
  end_station_name IS NULL OR
  end_station_id IS NULL OR
  end_lat IS NULL OR
  end_lng IS NULL;

-- check for duplicate trip IDs

SELECT 
  COUNT(*) AS total_trip_ids,
  COUNT(DISTINCT ride_id) AS unique_trip_ids,
  COUNT(*) - COUNT(DISTINCT ride_id) AS number_of_duplicate_ride_ids

FROM `cyclistic_case_study.raw_data_added_columns`;

-- view if these duplicate ride IDs are truly duplicate entries

SELECT *
FROM 
  (
    SELECT *,
    COUNT(1) OVER(PARTITION BY ride_id) duplicate_count
    FROM `cyclistic_case_study.raw_data_added_columns` 
  )

WHERE duplicate_count > 1;

-- check for all types of rideable_type

SELECT 
  rideable_type,
  COUNT(rideable_type) AS number_of_rides

FROM `cyclistic_case_study.raw_data_added_columns`

GROUP BY rideable_type;

-- check for all types of member_casual

SELECT 
  member_casual,
  COUNT(member_casual) AS number_of_rides

FROM `cyclistic_case_study.raw_data_added_columns`

GROUP BY member_casual;

-- see if there are any testing facilities as start or end points

SELECT *

FROM `cyclistic_case_study.raw_data_added_columns`

WHERE 
  start_station_name LIKE '%Warehouse%' OR
  start_station_name LIKE '%TEST%' OR
  start_station_name LIKE '%DIVVY%' OR
  start_station_name LIKE '%REPAIR%' OR

  start_station_id LIKE '%Warehouse%' OR
  start_station_id LIKE '%TEST%' OR
  start_station_id LIKE '%DIVVY%' OR
  start_station_id LIKE '%REPAIR%' OR

  end_station_name LIKE '%Warehouse%' OR
  end_station_name LIKE '%TEST%' OR
  end_station_name LIKE 'DIVVY%' OR
  end_station_name LIKE 'REPAIR%' OR

  end_station_id LIKE '%Warehouse%' OR
  end_station_id LIKE '%TEST%' OR
  end_station_id LIKE '%DIVVY%' OR
  end_station_id LIKE '%REPAIR%';
