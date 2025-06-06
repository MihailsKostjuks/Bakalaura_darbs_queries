-- Baseline
DROP VIEW IF EXISTS flight_stats;
CREATE VIEW flight_stats AS
SELECT bl.flight_id,
departure_airport,
(AVG(price))::numeric (7,2) AS avg_price,
COUNT(DISTINCT passenger_id) AS num_passengers
FROM booking b
JOIN booking_leg bl USING (booking_id)
JOIN flight f USING (flight_id)
JOIN passenger p USING (booking_id)
GROUP BY 1,2;
SELECT * FROM flight_stats fs
JOIN (SELECT flight_id FROM flight f
WHERE actual_departure BETWEEN '2020-08-01' AND '2020-08-16') fl
ON fl.flight_id=fs.flight_id;

-- Solution
SELECT 
bl.flight_id,
departure_airport,
(AVG(price))::numeric (7,2) AS avg_price,
COUNT(DISTINCT passenger_id) AS num_passengers
FROM booking b
JOIN booking_leg bl USING (booking_id)
JOIN flight f USING (flight_id)
JOIN passenger p USING (booking_id)
WHERE actual_departure BETWEEN '2020-08-01' AND '2020-08-16'
GROUP BY 1,2;
