-- Baseline (should be done within 1 session)
DROP FUNCTION IF EXISTS select_booking;
DROP FUNCTION IF EXISTS select_booking_dyn;
DROP FUNCTION IF EXISTS select_booking_email_departure;
DROP TYPE IF EXISTS booking_record_basic;
CREATE TYPE booking_record_basic AS
(booking_id bigint,
booking_ref text,
booking_name text ,
account_id integer,
email text );

CREATE OR REPLACE FUNCTION select_booking (p_email text,
p_dep_airport text,
p_arr_airport text,
p_dep_date date,
p_flight_id int)
RETURNS SETOF booking_record_basic
AS
$func$
BEGIN
RETURN QUERY
SELECT DISTINCT b.booking_id, b.booking_ref,
booking_name, account_id, email
FROM booking b 
JOIN booking_leg bl USING (booking_id)
JOIN flight f USING (flight_id)
WHERE (p_email IS NULL OR lower(email) LIKE p_email||'%')
AND (p_dep_airport IS NULL OR departure_airport=p_dep_airport)
AND (p_arr_airport IS NULL OR arrival_airport=p_arr_airport)
AND (p_dep_date IS NULL OR scheduled_departure BETWEEN p_dep_date AND p_dep_date + 1)
AND (p_flight_id IS NULL OR bl.flight_id=p_flight_id);
END;
$func$ LANGUAGE plpgsql;

SELECT * FROM select_booking ('lawton52',
'ORD',
'JFK',
'2020-07-30',
27191
);
SELECT * FROM select_booking ('lawton52',
NULL,
NULL,
NULL,
NULL
);

-- Solution
CREATE OR REPLACE FUNCTION select_booking_dyn (p_email text,
p_dep_airport text,
p_arr_airport text,
p_dep_date date,
p_flight_id int)
RETURNS SETOF booking_record_basic
AS
$func$
DECLARE
v_sql text:='SELECT DISTINCT b.booking_id, b.booking_ref, booking_name,
account_id, email
FROM booking b ';
v_where_booking text;
v_where_booking_leg text;
v_where_flight text;
BEGIN
IF p_email IS NOT NULL then v_where_booking :=$$ LOWER(email) LIKE $$
||quote_literal(p_email||'%'); END IF;
IF p_flight_id IS NOT NULL then v_where_booking_leg:= $$ flight_id=$$||p_flight_id::text;
END IF;
IF p_dep_airport IS NOT NULL
THEN v_where_flight:=concat_ws($$ AND $$, v_where_flight, $$departure_airport=$$||
quote_literal(p_dep_airport));
END IF;
IF p_arr_airport IS NOT NULL
THEN v_where_flight:=concat_ws($$ AND $$,v_where_flight,
$$arrival_airport=$$||quote_literal(p_arr_airport));
END IF;
IF p_dep_date IS NOT NULL
THEN v_where_flight:=concat_ws($$ AND $$,v_where_flight,
$$scheduled_departure BETWEEN $$||
quote_literal(p_dep_date)||$$::date AND $$||quote_literal(p_dep_date)||$$::date+1$$);
END IF;
IF v_where_flight IS NOT NULL OR v_where_booking_leg IS NOT NULL
THEN v_sql:=v_sql||$$ JOIN booking_leg bl USING (booking_id) $$;
END IF;
IF v_where_flight IS NOT NULL THEN
v_sql:=v_sql ||$$ JOIN flight f USING (flight_id) $$;
END IF;
v_sql:=v_sql ||$$ WHERE $$||
concat_ws($$ AND $$,v_where_booking, v_where_booking_leg, v_where_flight);
return query EXECUTE (v_sql);
END;
$func$ LANGUAGE plpgsql;

SELECT * FROM select_booking_dyn ('lawton52',
'ORD',
'JFK',
'2020-07-30',
27191
);
SELECT * FROM select_booking_dyn ('lawton52',
NULL,
NULL,
NULL,
NULL
);
