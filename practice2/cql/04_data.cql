USE energy_monitoring;

INSERT INTO power_stations (station_id, station_name, station_type, location, region,
    max_capacity_mw, commissioned_date, status, coordinates, created_at, updated_at)
VALUES (123e4567-e89b-12d3-a456-426614174000, 'Київська ТЕС', 'thermal', 'Київ', 'Центральний',
    1200.0, '2010-05-15', 'active', {'lat': 50.4501, 'lon': 30.5234}, toTimestamp(now()), toTimestamp(now()));

INSERT INTO power_stations (station_id, station_name, station_type, location, region,
    max_capacity_mw, commissioned_date, status, coordinates, created_at, updated_at)
VALUES (223e4567-e89b-12d3-a456-426614174001, 'Дніпровська ГЕС', 'hydro', 'Запоріжжя', 'Південний',
    1548.0, '1932-10-10', 'active', {'lat': 47.8388, 'lon': 35.1396}, toTimestamp(now()), toTimestamp(now()));

INSERT INTO power_stations (station_id, station_name, station_type, location, region,
    max_capacity_mw, commissioned_date, status, coordinates, created_at, updated_at)
VALUES (323e4567-e89b-12d3-a456-426614174002, 'Сонячна станція Нікополь', 'solar', 'Нікополь', 'Південний',
    246.0, '2019-12-01', 'active', {'lat': 47.5659, 'lon': 34.3975}, toTimestamp(now()), toTimestamp(now()));

INSERT INTO station_telemetry (station_id, time_bucket, recorded_at, power_output_mw,
    voltage_kv, frequency_hz, temperature_c, efficiency_percent, fuel_consumption_rate, status, alert_level)
VALUES (123e4567-e89b-12d3-a456-426614174000, '2025-09-17 14:00:00', '2025-09-17 14:15:30',
    1150.5, 220.1, 50.01, 75.2, 87.5, 2.8, 'online', 0);

INSERT INTO station_telemetry (station_id, time_bucket, recorded_at, power_output_mw,
    voltage_kv, frequency_hz, temperature_c, efficiency_percent, fuel_consumption_rate, status, alert_level)
VALUES (123e4567-e89b-12d3-a456-426614174000, '2025-09-17 14:00:00', '2025-09-17 14:16:30',
    1145.8, 219.8, 49.99, 76.1, 87.2, 2.9, 'online', 0);

INSERT INTO station_telemetry (station_id, time_bucket, recorded_at, power_output_mw,
    voltage_kv, frequency_hz, temperature_c, efficiency_percent, status, alert_level)
VALUES (223e4567-e89b-12d3-a456-426614174001, '2025-09-17 14:00:00', '2025-09-17 14:15:45',
    800.2, 400.5, 50.00, 22.3, 92.1, 'online', 0);

INSERT INTO station_alerts (station_id, alert_date, alert_id, alert_timestamp,
    severity, alert_type, message, current_value, threshold_value, acknowledged, resolved)
VALUES (123e4567-e89b-12d3-a456-426614174000, '2025-09-17', now(), toTimestamp(now()),
    'warning', 'temperature', 'Температура перевищує норму', 78.5, 75.0, false, false);

SELECT * FROM power_stations;

SELECT station_id, station_name, station_type, region, status
FROM power_stations
WHERE station_id = 123e4567-e89b-12d3-a456-426614174000;

SELECT * FROM station_telemetry
WHERE station_id = 123e4567-e89b-12d3-a456-426614174000
  AND time_bucket = '2025-09-17 14:00:00';

SELECT * FROM station_telemetry
WHERE station_id = 223e4567-e89b-12d3-a456-426614174001
  AND time_bucket = '2025-09-17 14:00:00';

SELECT * FROM station_alerts
WHERE station_id = 123e4567-e89b-12d3-a456-426614174000
  AND alert_date = '2025-09-17';

SELECT COUNT(*) FROM power_stations;
SELECT COUNT(*) FROM station_telemetry;
SELECT COUNT(*) FROM station_alerts;

SELECT * FROM station_telemetry
WHERE station_id = 123e4567-e89b-12d3-a456-426614174000
  AND time_bucket = '2025-09-17 14:00:00'
LIMIT 5;
