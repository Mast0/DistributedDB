CREATE KEYSPACE IF NOT EXISTS energy_monitoring
WITH replication = {
    'class': 'SimpleStrategy',
    'replication_factor': 1
};

DESCRIBE KEYSPACES;
DESCRIBE KEYSPACE energy_monitoring;
