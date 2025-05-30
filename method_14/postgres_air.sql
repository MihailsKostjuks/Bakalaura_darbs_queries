-- Baseline
SELECT flight_id FROM flight 
WHERE flight_id NOT IN (SELECT flight_id FROM booking_leg);

-- Solution
SELECT flight_id FROM flight f
EXCEPT
SELECT flight_id FROM booking_leg;