-- SELECT * FROM
--  (SELECT bl.flight_id,
--  departure_airport,
--  (avg(price))::numeric (7,2) AS avg_price,
--  count(DISTINCT passenger_id) AS num_passengers
--  FROM booking b
--  JOIN booking_leg bl USING (booking_id)
--  JOIN flight f USING (flight_id)
--  JOIN passenger p USING (booking_id)
--  GROUP BY 1,2) a
-- WHERE flight_id=222183; -- 2.5s

-- SELECT bl.flight_id,
--  departure_airport,
--  (avg(price))::numeric (7,2) AS avg_price,
--  count(DISTINCT passenger_id) AS num_passengers
-- FROM booking b
-- JOIN booking_leg bl USING (booking_id)
-- JOIN flight f USING (flight_id)
-- JOIN passenger p USING (booking_id)
-- WHERE flight_id=222183
-- GROUP BY 1,2; -- 2.5s

-- CREATE TEMP TABLE flights_totals AS
-- SELECT bl.flight_id,
--  departure_airport,
--  (avg(price))::numeric (7,2) AS avg_price,
--  count(DISTINCT passenger_id) AS num_passengers
-- FROM booking b
-- JOIN booking_leg bl USING (booking_id)
-- JOIN flight f USING (flight_id)
-- JOIN passenger p USING (booking_id)
-- GROUP BY 1,2; -- 2 min

-- SELECT flight_id,
-- avg_price,
-- num_passengers
-- FROM flights_totals
-- WHERE flight_id=222183; -- 0.1s

