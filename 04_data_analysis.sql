-- total number of rides each month for casuals and members

SELECT  
  trip_month,
  COUNT(*) AS total_number_rides,
  COUNTIF(member_casual = 'casual') AS number_casual_rides,
  COUNTIF(member_casual = 'member') AS number_member_rides
  
FROM `cyclistic_case_study.cleaned_data`

GROUP BY trip_month

-- total number of rides by day of week for casuals and members
  
SELECT  
  day_of_week,
  COUNT(*) AS total_number_rides,
  COUNTIF(member_casual = 'casual') AS number_casual_rides,
  COUNTIF(member_casual = 'member') AS number_member_rides
  
FROM `cyclistic_case_study.cleaned_data`

GROUP BY day_of_week
  
-- top 10 start locations for casuals

SELECT  
  start_station_name,
  start_lat,
  start_lng,
  COUNTIF(member_casual = 'casual') AS number_casual_departures

FROM `cyclistic_case_study.cleaned_data` 

GROUP BY start_station_name, start_lat, start_lng
ORDER BY number_casual_departures DESC

LIMIT 10

-- top 10 end locations for casuals

SELECT  
  end_station_name,
  end_lat,
  end_lng,
  COUNTIF(member_casual = 'casual') AS number_casual_arrivals

FROM `cyclistic_case_study.cleaned_data` 

GROUP BY end_station_name, end_lat, end_lng
ORDER BY number_casual_arrivals DESC

LIMIT 10

-- top 10 start locations for members

SELECT  
  start_station_name,
  start_lat,
  start_lng,
  COUNTIF(member_casual = 'member') AS number_member_departures

FROM `cyclistic_case_study.cleaned_data` 

GROUP BY start_station_name, start_lat, start_lng
ORDER BY number_member_departures DESC

LIMIT 10

-- top 10 end locations for members

SELECT  
  end_station_name,
  end_lat,
  end_lng,
  COUNTIF(member_casual = 'member') AS number_member_arrivals

FROM `cyclistic_case_study.cleaned_data` 

GROUP BY end_station_name, end_lat, end_lng
ORDER BY number_member_arrivals DESC

LIMIT 10

-- trip_duration by month for casuals and members

SELECT  
  trip_month,
  AVG(CASE WHEN member_casual = 'casual' THEN trip_duration ELSE NULL END) AS avg_casual_duration,
  AVG(CASE WHEN member_casual = 'member' THEN trip_duration ELSE NULL END) AS avg_member_duration

FROM `cyclistic_case_study.cleaned_data`

GROUP BY trip_month

-- trip_duration by day of week for casuals and members

SELECT  
  day_of_week,
  AVG(CASE WHEN member_casual = 'casual' THEN trip_duration ELSE NULL END) 
    AS avg_casual_trip_duration,
  AVG(CASE WHEN member_casual = 'member' THEN trip_duration ELSE NULL END) 
    AS avg_member_trip_duration
FROM `cyclistic_case_study.cleaned_data`

GROUP BY day_of_week
  
-- breakdown of rideable_type

SELECT  
  rideable_type,
  COUNT(*) AS total_number_rides,
  COUNTIF(member_casual = 'casual') AS casual_rides,
  COUNTIF(member_casual = 'member') AS member_rides
  
FROM `cyclistic_case_study.cleaned_data`

GROUP BY rideable_type

-- number of trips by day of the week, with percentage breakdown

WITH total_trips AS
(
  SELECT
    COUNTIF(member_casual = 'casual') AS total_casual_trips,
    COUNTIF(member_casual = 'member') AS total_member_trips
  FROM `cyclistic_case_study.cleaned_data`  
),
daily_trips AS
(
  SELECT
    day_of_week,
    COUNT(*) AS total_number_rides,
    COUNTIF(member_casual = 'casual') AS number_casual_rides,
    COUNTIF(member_casual = 'member') AS number_member_rides
  FROM `cyclistic_case_study.cleaned_data`
  GROUP BY day_of_week
)
SELECT
  day_of_week,
  total_number_rides,
  number_casual_rides,
  ROUND((daily_trips.number_casual_rides / total_trips.total_casual_trips) * 100, 2) AS percentage_casual_rides,
  number_member_rides,
  ROUND((daily_trips.number_member_rides / total_trips.total_member_trips) * 100, 2) AS percentage_member_rides

FROM total_trips, daily_trips

-- what times do casuals and members generally start their trips?
SELECT  
  EXTRACT(HOUR FROM started_at) AS start_time,
  COUNT(*) AS total_trips,
  COUNTIF(member_casual = 'casual') AS number_casual_trips,
  COUNTIF(member_casual = 'member') AS number_member_trips

FROM `cyclistic_case_study.cleaned_data`

GROUP BY start_time
  
ORDER BY start_time ASC
