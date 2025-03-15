-- SET search_path TO postgres_air;


-- SELECT flight_id FROM flight WHERE flight_id NOT IN
--  (SELECT flight_id FROM booking_leg); -- not done within 7min

-- SELECT flight_id FROM flight f
-- EXCEPT
-- SELECT flight_id FROM booking_leg; -- finished in 12s
