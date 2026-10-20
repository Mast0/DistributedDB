USE energy_monitoring;

-- 1. Активні станції
SELECT station_name, station_type, max_capacity_mw, location
FROM power_stations
WHERE status = 'active';

-- 2. Останні показники станції
SELECT recorded_at, power_output_mw, voltage_kv, efficiency_percent
FROM station_telemetry
WHERE station_id = 123e4567-e89b-12d3-a456-426614174000
  AND time_bucket = '2025-09-17 14:00:00'
ORDER BY recorded_at DESC
LIMIT 10;

-- 3. Середні показники за годину
SELECT station_id, time_bucket,
       AVG(power_output_mw) AS avg_power,
       AVG(efficiency_percent) AS avg_efficiency,
       COUNT(*) AS measurements_count
FROM station_telemetry
WHERE station_id = 123e4567-e89b-12d3-a456-426614174000
  AND time_bucket = '2025-09-17 14:00:00'
GROUP BY station_id, time_bucket;

-- 4. Критичні попередження
SELECT station_id, alert_id, alert_timestamp, alert_type, message, current_value
FROM station_alerts
WHERE station_id = 123e4567-e89b-12d3-a456-426614174000
  AND alert_date = '2025-09-17'
  AND severity = 'critical'
ALLOW FILTERING;

-- 5. Станції з найвищою потужністю
SELECT station_name, station_type, max_capacity_mw
FROM power_stations
WHERE status = 'active'
LIMIT 5
ALLOW FILTERING;

-- 6. Станції в регіоні
SELECT station_name, location, max_capacity_mw
FROM power_stations
WHERE region = 'Південний';

-- 7. Станції з проблемами
SELECT station_id, time_bucket, alert_level
FROM station_telemetry
WHERE alert_level > 0 ALLOW FILTERING;
