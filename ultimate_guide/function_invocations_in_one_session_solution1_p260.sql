-- set search_path to postgres_air;

-- example 1:
SELECT DISTINCT b.booking_id, b.booking_ref, b.booking_name, b.email FROM
booking b
WHERE lower(email) like 'lawton52%'; -- 2.8s

-- example 2:
SELECT DISTINCT b.booking_id, b.booking_ref, b.booking_name, b.email FROM
booking b
JOIN booking_leg bl USING (booking_id)
WHERE lower(email) like 'lawton52%'
AND flight_id= 27191; -- 800ms

-- example 3:
SELECT DISTINCT b.booking_id, b.booking_ref, b.booking_name, b.email FROM
booking b
JOIN booking_leg bl USING (booking_id)
JOIN flight f USING (flight_id)
WHERE lower(email) like 'lawton52%'
AND departure_airport='ORD'
AND arrival_airport='JFK'; -- 0.8s

-- example 4:
SELECT DISTINCT b.booking_id, b.booking_ref, b.booking_name, b.email FROM
booking b
JOIN booking_leg bl USING (booking_id)
JOIN flight f USING (flight_id)
WHERE lower(email) like 'lawton52%'
AND departure_airport='ORD'
AND arrival_airport='JFK'
AND scheduled_departure BETWEEN '2020-07-30' AND '2020-07-31'; -- 0.8s

-- example 5:
SELECT DISTINCT b.booking_id, b.booking_ref, b.booking_name, b.email FROM
booking b
JOIN booking_leg bl USING (booking_id)
JOIN flight f USING (flight_id)
WHERE lower(email) like 'lawton52%'
AND scheduled_departure BETWEEN '2020-07-30' AND '2020-07-31'; -- 1s

-- example 6:
SELECT DISTINCT b.booking_id, b.booking_ref, b.booking_name, b.email FROM
booking b
JOIN booking_leg bl USING (booking_id)
WHERE flight_id= 27191; -- 0.7s


-- total: 9.2s
-- 2nd: 6.8s