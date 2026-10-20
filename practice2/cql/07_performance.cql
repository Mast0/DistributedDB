USE energy_monitoring;

SELECT token(station_id), station_id, station_name FROM power_stations;

SELECT station_id, recorded_at, TTL(power_output_mw) FROM station_telemetry LIMIT 5;

DESCRIBE TABLE energy_monitoring.station_telemetry;
