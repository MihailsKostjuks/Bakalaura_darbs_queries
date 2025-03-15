-- SET search_path TO postgres_air;

-- CREATE INDEX booking_leg_flight_id ON booking_leg (flight_id);


-- SELECT flight_id
-- FROM flight f
-- JOIN (select distinct flight_id FROM booking_leg) bl USING (flight_id); -- 1.3s

-- SELECT flight_id FROM flight f
--  INTERSECT
--  SELECT flight_id FROM booking_leg; -- 6.5s


-- SELECT flight_id FROM flight WHERE flight_id IN
--  (SELECT flight_id FROM booking_leg); -- 0.7s

-- This one kinda tricky because MY results dont coincide with BOOK (seconds nor order)
 