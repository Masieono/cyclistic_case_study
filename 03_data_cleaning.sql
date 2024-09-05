-- delete entries that contain null values

DELETE FROM 
  `cyclistic_case_study.cleaned.data`
WHERE
  start_station_name IS NULL OR
  start_station_id IS NULL OR
  end_station_name IS NULL OR
  end_station_id IS NULL OR
  end_lat IS NULL OR
  end_lng IS NULL; --removed 1,006,761 rows

-- delete entries with negative time deltas

DELETE FROM 
  `cyclistic_case_study.cleaned.data`
WHERE
  trip_duration < MAKE_INTERVAL(0); -- removed 116 rows

-- filter out entries with trips over 24 hours long

DELETE FROM 
  `cyclistic_case_study.cleaned.data`
WHERE
  trip_duration > MAKE_INTERVAL(0, 0, 0, 24, 0, 0); -- removed 1,275 rows

-- filter out entries with trips involving a testing station

DELETE FROM 
  `cyclistic_case_study.cleaned.data`
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
  end_station_id LIKE '%REPAIR%'; -- removed 589 rows
