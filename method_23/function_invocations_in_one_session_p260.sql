-- set search_path to postgres_air;

-- CREATE TYPE booking_record_basic AS
-- (booking_id bigint,
-- booking_ref text,
--  booking_name text ,
--  account_id integer,
--  email text );

-- CREATE OR REPLACE FUNCTION select_booking (p_email text,
-- p_dep_airport text,
-- p_arr_airport text,
-- p_dep_date date,
-- p_flight_id int)
-- RETURNS SETOF booking_record_basic
-- AS
-- $func$
-- BEGIN
-- RETURN QUERY
-- SELECT DISTINCT b.booking_id, b.booking_ref,
-- booking_name, account_id, email
-- FROM booking b JOIN
-- booking_leg bl USING (booking_id)
-- JOIN flight f USING (flight_id)
-- WHERE (p_email IS NULL OR lower(email) LIKE p_email||'%')
-- AND (p_dep_airport IS NULL OR departure_airport=p_dep_airport)
-- AND (p_arr_airport IS NULL OR arrival_airport=p_arr_airport)
-- AND (p_dep_date IS NULL OR scheduled_departure BETWEEN p_dep_date AND p_dep_date + 1)
-- AND (p_flight_id IS NULL OR bl.flight_id=p_flight_id);
-- END;
-- $func$ LANGUAGE plpgsql;

-- example 1:

SELECT * FROM select_booking ('lawton52',
NULL,
NULL,
NULL,
NULL
); -- 3.6s, BUT after invoking the function with other arguments (therefore another plan) it executed for over 1 min.

-- -- example 2:

SELECT * FROM select_booking ('lawton52',
NULL,
NULL,
NULL,
27191
); -- 800ms

-- -- example 3:

SELECT * FROM select_booking ('lawton52',
'ORD',
'JFK',
NULL,
NULL
); -- 0.8s

-- -- example 4:

SELECT * FROM select_booking ('lawton52',
'ORD',
'JFK',
'2020-07-30',
NULL
); -- 0.7s;

-- -- example 5:

SELECT * FROM select_booking ('lawton52',
NULL,
NULL,
'2020-07-30',
NULL
); -- 1.5s

-- -- example 6:

SELECT * FROM select_booking (NULL,
NULL,
NULL,
NULL,
27191
); -- 1s

-- total 1st: 8.1s
-- total 2nd: 1 min 20 s
-- total 3rd: 1 min 8 s

