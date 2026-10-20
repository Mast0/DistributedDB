USE energy_monitoring;

CREATE INDEX IF NOT EXISTS station_type_idx ON power_stations (station_type);
CREATE INDEX IF NOT EXISTS station_region_idx ON power_stations (region);
CREATE INDEX IF NOT EXISTS station_status_idx ON power_stations (status);
CREATE INDEX IF NOT EXISTS alert_level_idx ON station_telemetry (alert_level);
CREATE INDEX IF NOT EXISTS station_alerts_severity_idx ON station_alerts (severity);

SELECT * FROM power_stations WHERE station_type = 'hydro';
