-- Baseline
SELECT * FROM flight 
WHERE departure_airport = 'ATL' 
AND status = 'Delayed'
ORDER BY flight_id
LIMIT 50
OFFSET 1000;

-- Solution
SELECT * FROM flight 
WHERE departure_airport = 'ATL' 
AND status = 'Delayed'
AND flight_id > 160384
ORDER BY flight_id
LIMIT 50;