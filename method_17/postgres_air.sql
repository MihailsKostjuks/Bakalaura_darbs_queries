-- Baseline
CREATE TEMP TABLE flights_totals AS
SELECT
bl.flight_id,
departure_airport,
(AVG(price))::numeric (7,2) AS avg_price,
COUNT(DISTINCT passenger_id) AS num_passengers
FROM booking b
JOIN booking_leg bl USING (booking_id)
JOIN flight f USING (flight_id)
JOIN passenger p USING (booking_id)
GROUP BY 1,2;
SELECT flight_id,
avg_price,
num_passengers
FROM flights_totals
WHERE flight_id=222183;

-- Solution
SELECT * FROM
(SELECT 
bl.flight_id,
departure_airport,
(AVG(price))::numeric (7,2) AS avg_price,
COUNT(DISTINCT passenger_id) AS num_passengers
FROM booking b
JOIN booking_leg bl USING (booking_id)
JOIN flight f USING (flight_id)
JOIN passenger p USING (booking_id)
GROUP BY 1,2) a
WHERE flight_id=222183;
