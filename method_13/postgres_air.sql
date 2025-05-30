-- Baseline
DROP INDEX IF EXISTS flight_canceled;
SELECT * FROM flight 
WHERE scheduled_departure BETWEEN '2020-08-15' AND '2024-08-18'
AND status='Canceled';

-- Solution
CREATE INDEX IF NOT EXISTS flight_canceled ON flight(flight_id) WHERE status='Canceled';
SELECT * FROM flight 
WHERE scheduled_departure BETWEEN '2020-08-15' AND '2024-08-18'
AND status='Canceled';


