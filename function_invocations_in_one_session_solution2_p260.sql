-- set search_path to postgres_air;


-- CREATE OR REPLACE FUNCTION select_booking_dyn (p_email text,
-- p_dep_airport text,
-- p_arr_airport text,
-- p_dep_date date,
-- p_flight_id int)
-- returns setof booking_record_basic
-- as
-- $func$
-- DECLARE
-- v_sql text:='SELECT DISTINCT b.booking_id, b.booking_ref, booking_name,
-- account_id, email
-- FROM booking b ';
-- v_where_booking text;
-- v_where_booking_leg text;
-- v_where_flight text;
-- BEGIN
-- IF p_email IS NOT NULL then v_where_booking :=$$ lower(email) like $$
-- ||quote_literal(p_email||'%'); END IF;
-- IF p_flight_id IS NOT NULL then v_where_booking_leg:= $$ flight_id=$$||p_flight_id::text;
-- END IF;
-- IF p_dep_airport IS NOT NULL
-- THEN v_where_flight:=concat_ws($$ AND $$, v_where_flight, $$departure_airport=$$||
-- quote_literal(p_dep_airport));
-- END IF;
-- IF p_arr_airport IS NOT NULL
-- THEN v_where_flight:=concat_ws($$ AND $$,v_where_flight,
-- $$arrival_airport=$$||quote_literal(p_arr_airport));
-- END IF;
-- IF p_dep_date IS NOT NULL
-- THEN v_where_flight:=concat_ws($$ AND $$,v_where_flight,
-- $$scheduled_departure BETWEEN $$||
-- quote_literal(p_dep_date)||$$::date AND $$||quote_literal(p_dep_date)||$$::date+1$$);
-- END IF;
-- IF v_where_flight IS NOT NULL OR v_where_booking_leg IS NOT NULL
-- THEN v_sql:=v_sql||$$ JOIN booking_leg bl USING (booking_id) $$;
-- END IF;
-- IF v_where_flight IS NOT NULL THEN
-- v_sql:=v_sql ||$$ JOIN flight f USING (flight_id) $$;
-- END IF;
-- v_sql:=v_sql ||$$ WHERE $$||
-- concat_ws($$ AND $$,v_where_booking, v_where_booking_leg, v_where_flight);
-- return query EXECUTE (v_sql);
-- END;
-- $func$ LANGUAGE plpgsql;



SELECT * FROM select_booking_dyn ('lawton52',
NULL,
NULL,
NULL,
NULL
); -- 3.6s, BUT after invoking the function with other arguments (therefore another plan) it executed for over 1 min.

-- -- example 2:

SELECT * FROM select_booking_dyn ('lawton52',
NULL,
NULL,
NULL,
27191
); -- 800ms

-- -- example 3:

SELECT * FROM select_booking_dyn ('lawton52',
'ORD',
'JFK',
NULL,
NULL
); -- 0.8s

-- -- example 4:

SELECT * FROM select_booking_dyn ('lawton52',
'ORD',
'JFK',
'2020-07-30',
NULL
); -- 0.7s;

-- -- example 5:

SELECT * FROM select_booking_dyn ('lawton52',
NULL,
NULL,
'2020-07-30',
NULL
); -- 1.5s

-- -- example 6:

SELECT * FROM select_booking_dyn (NULL,
NULL,
NULL,
NULL,
27191
); -- 1s

-- total 1st: 6.6s
-- total 2nd: 6.9s
-- total 3rd: 6.8s