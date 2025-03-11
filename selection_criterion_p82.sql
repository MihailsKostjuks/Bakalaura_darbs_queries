-- SET search_path TO postgres_air;

-- SELECT bp.update_ts Boarding_pass_issued,
--  scheduled_departure,
--  actual_departure,
--  status
-- FROM flight f
-- JOIN booking_leg bl USING (flight_id)
-- JOIN boarding_pass bp USING (booking_leg_id)
-- WHERE bp.update_ts > scheduled_departure + interval '30 minutes'
-- AND f.update_ts >=scheduled_departure -interval '1 hour'; -- 6s



-- CREATE INDEX boarding_pass_update_ts ON postgres_air.boarding_pass (update_ts);

-- SELECT bp.update_ts Boarding_pass_issued,
--  scheduled_departure,
--  actual_departure,
--  status
-- FROM flight f
-- JOIN booking_leg bl USING (flight_id)
-- JOIN boarding_pass bp USING (booking_leg_id)
-- WHERE bp.update_ts > scheduled_departure + interval '30 minutes'
-- AND f.update_ts >=scheduled_departure -interval '1 hour'
-- AND bp.update_ts >='2024-05-29' AND bp.update_ts< '2024-05-31'; -- 2s (adding selection criterion reduces row amount before joining tables)

