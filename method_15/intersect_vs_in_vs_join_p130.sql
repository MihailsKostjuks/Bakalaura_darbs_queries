-- Baseline
SELECT flight_id FROM flight
WHERE flight_id IN (SELECT flight_id FROM booking_leg);

-- Solution
SELECT flight_id FROM flight f
INTERSECT
SELECT flight_id FROM booking_leg;
 