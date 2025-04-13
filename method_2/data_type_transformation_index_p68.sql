-- Baseline
CREATE INDEX IF NOT EXISTS flight_scheduled_departure ON flight(scheduled_departure);
SELECT * FROM flight
WHERE scheduled_departure ::date BETWEEN '2020-08-17' AND '2020-08-18';

-- Solution
SELECT * FROM flight
WHERE scheduled_departure BETWEEN '2020-08-17' AND '2020-08-19';