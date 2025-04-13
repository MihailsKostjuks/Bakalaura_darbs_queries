-- Baseline
CREATE INDEX IF NOT EXISTS flight_actual_departure ON flight (actual_departure);
CREATE INDEX IF NOT EXISTS flight_scheduled_departure ON flight (scheduled_departure);
SELECT * FROM flight
WHERE COALESCE(actual_departure, scheduled_departure) BETWEEN '2020-08-17' AND '2020-08-18';

-- Solution
SELECT * FROM flight
WHERE (actual_departure BETWEEN '2020-08-17' AND '2020-08-18')
OR (
actual_departure IS NULL
AND scheduled_departure BETWEEN '2020-08-17' AND '2020-08-18'
);
