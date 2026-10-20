USE energy_monitoring;

-- 1. Оновлення статусу станції
UPDATE power_stations
SET status = 'maintenance', updated_at = toTimestamp(now())
WHERE station_id = 323e4567-e89b-12d3-a456-426614174002;

SELECT station_name, status, updated_at FROM power_stations
WHERE station_id = 323e4567-e89b-12d3-a456-426614174002;

-- 2. Вирішення попередження (alert_id = now() не збігається з існуючим рядком)
UPDATE station_alerts
SET acknowledged = true, resolved = true
WHERE station_id = 123e4567-e89b-12d3-a456-426614174000
  AND alert_date = '2025-09-17'
  AND alert_id = now();

SELECT alert_id, acknowledged, resolved FROM station_alerts
WHERE station_id = 123e4567-e89b-12d3-a456-426614174000
  AND alert_date = '2025-09-17';

-- 3. Зміна параметрів таблиці телеметрії: TWCS + TTL 30 днів
ALTER TABLE station_telemetry
WITH compaction = {
    'class': 'TimeWindowCompactionStrategy',
    'compaction_window_unit': 'DAYS',
    'compaction_window_size': 1
}
AND default_time_to_live = 2592000;

-- 4. Інкремент лічильника попереджень
UPDATE hourly_alert_counts
SET alert_count = alert_count + 1
WHERE station_id = 123e4567-e89b-12d3-a456-426614174000
  AND date = '2025-09-17'
  AND hour = '2025-09-17 14:00:00';

SELECT * FROM hourly_alert_counts;
