-- Baseline
SELECT bl.flight_id,
departure_airport,
COALESCE(actual_departure,
scheduled_departure)::date departure_date,
COUNT(DISTINCT passenger_id) AS num_passengers
FROM booking b
JOIN booking_leg bl USING (booking_id)
JOIN flight f USING (flight_id)
JOIN passenger p USING (booking_id)
WHERE (actual_departure BETWEEN '2020-08-01' AND '2020-08-02')
OR (actual_departure IS NULL AND scheduled_departure
BETWEEN '2020-08-02' AND '2020-08-02')
GROUP BY 1,2,3;

-- Solution
DROP MATERIALIZED VIEW IF EXISTS flight_departure_prev_day;
CREATE MATERIALIZED VIEW flight_departure_prev_day AS
SELECT bl.flight_id,
departure_airport,
COALESCE(actual_departure,
scheduled_departure)::date departure_date,
COUNT(DISTINCT passenger_id) AS num_passengers
FROM booking b
JOIN booking_leg bl USING (booking_id)
JOIN flight f USING (flight_id)
JOIN passenger p USING (booking_id)
WHERE (actual_departure BETWEEN '2020-08-01' AND '2020-08-02')
OR (actual_departure IS NULL AND scheduled_departure
BETWEEN '2020-08-02' AND '2020-08-02')
GROUP BY 1,2,3;
SELECT * FROM flight_departure_prev_day;
