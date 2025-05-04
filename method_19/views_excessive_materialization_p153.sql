-- Baseline
DROP VIEW IF EXISTS flight_departure;
CREATE VIEW flight_departure AS
SELECT bl.flight_id,
departure_airport,
COALESCE(actual_departure, scheduled_departure)::date AS departure_date,
COUNT(DISTINCT passenger_id) AS num_passengers
FROM booking b
JOIN booking_leg bl USING (booking_id)
JOIN flight f USING (flight_id)
JOIN passenger p USING (booking_id)
GROUP BY 1,2,3;
SELECT flight_id
FROM flight_departure
WHERE departure_airport='ORD'; -- 4s (materializing too much data in the view slows down the simple query, better use underlying tables)

-- Solution
SELECT flight_id FROM flight
WHERE departure_airport='ORD'
AND flight_id IN (SELECT flight_id FROM booking_leg); -- 2.5s



