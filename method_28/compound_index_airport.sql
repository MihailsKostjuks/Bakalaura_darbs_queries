-- Baseline
DROP INDEX IF EXISTS flight_status_actual_departure;
CREATE INDEX IF NOT EXISTS flight_status ON flight (status);
CREATE INDEX IF NOT EXISTS flight_actual_departure ON flight(actual_departure);

SELECT * FROM flight 
WHERE status = 'Delayed'
AND actual_departure BETWEEN '2020-05-10' AND '2020-10-15';

-- Solution
DROP INDEX IF EXISTS flight_status;
DROP INDEX IF EXISTS flight_actual_departure;
CREATE INDEX IF NOT EXISTS flight_status_actual_departure on flight (status, actual_departure);

SELECT * FROM flight 
WHERE status = 'Delayed'
AND actual_departure BETWEEN '2020-05-10' AND '2020-10-15';
