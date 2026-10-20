USE energy_monitoring;

CREATE TABLE IF NOT EXISTS power_stations (
    station_id UUID PRIMARY KEY,
    station_name TEXT,
    station_type TEXT,
    location TEXT,
    region TEXT,
    max_capacity_mw DOUBLE,
    commissioned_date DATE,
    status TEXT,
    coordinates MAP<TEXT, DOUBLE>,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS station_telemetry (
    station_id UUID,
    time_bucket TIMESTAMP,
    recorded_at TIMESTAMP,
    power_output_mw DOUBLE,
    voltage_kv DOUBLE,
    frequency_hz DOUBLE,
    temperature_c DOUBLE,
    efficiency_percent DOUBLE,
    fuel_consumption_rate DOUBLE,
    status TEXT,
    alert_level INT,
    PRIMARY KEY ((station_id, time_bucket), recorded_at)
) WITH CLUSTERING ORDER BY (recorded_at DESC)
  AND default_time_to_live = 604800;

CREATE TABLE IF NOT EXISTS station_alerts (
    station_id UUID,
    alert_date DATE,
    alert_id TIMEUUID,
    alert_timestamp TIMESTAMP,
    severity TEXT,
    alert_type TEXT,
    message TEXT,
    current_value DOUBLE,
    threshold_value DOUBLE,
    acknowledged BOOLEAN,
    resolved BOOLEAN,
    PRIMARY KEY ((station_id, alert_date), alert_id)
) WITH CLUSTERING ORDER BY (alert_id DESC);

CREATE TABLE IF NOT EXISTS hourly_alert_counts (
    station_id UUID,
    date DATE,
    hour TIMESTAMP,
    alert_count COUNTER,
    PRIMARY KEY ((station_id, date), hour)
);

CREATE TABLE IF NOT EXISTS hourly_statistics (
    station_id UUID,
    date DATE,
    hour TIMESTAMP,
    avg_power_mw DOUBLE,
    max_power_mw DOUBLE,
    min_power_mw DOUBLE,
    total_energy_mwh DOUBLE,
    avg_efficiency_percent DOUBLE,
    uptime_minutes INT,
    PRIMARY KEY ((station_id, date), hour)
) WITH CLUSTERING ORDER BY (hour DESC);

DESCRIBE TABLES;
