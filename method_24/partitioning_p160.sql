-- Baseline
SELECT
city,
date_trunc('month', scheduled_departure),
SUM(passengers) passengers
FROM airport a
JOIN flight f ON airport_code = departure_airport
JOIN (
SELECT flight_id, COUNT(*) passengers
FROM booking_leg l
JOIN boarding_pass b USING (booking_leg_id)
WHERE boarding_time > '2020-07-15' AND boarding_time < '2020-07-31'
GROUP BY flight_id
) cnt
USING (flight_id)
GROUP BY 1,2
ORDER BY 3 DESC;

-- Solution
CREATE TABLE boarding_pass_part (
boarding_pass_id SERIAL,
passenger_id BIGINT,
booking_leg_id BIGINT,
seat TEXT,
boarding_time TIMESTAMPTZ,
precheck BOOLEAN,
update_ts TIMESTAMPTZ
)
PARTITION BY RANGE (boarding_time);

CREATE TABLE boarding_pass_may
PARTITION OF boarding_pass_part
FOR VALUES
FROM ('2020-05-01'::timestamptz)
TO ('2020-06-01'::timestamptz);

CREATE TABLE boarding_pass_june
PARTITION OF boarding_pass_part
FOR VALUES
FROM ('2020-06-01'::timestamptz)
TO ('2020-07-01'::timestamptz);
--
CREATE TABLE boarding_pass_july
PARTITION OF boarding_pass_part
FOR VALUES
FROM ('2020-07-01'::timestamptz)
TO ('2020-08-01'::timestamptz);
--
CREATE TABLE boarding_pass_aug
PARTITION OF boarding_pass_part
FOR VALUES
FROM ('2020-08-01'::timestamptz)
TO ('2020-09-01'::timestamptz);

INSERT INTO boarding_pass_part SELECT * from boarding_pass;

SELECT
city,
date_trunc('month', scheduled_departure),
SUM(passengers) passengers
FROM airport a
JOIN flight f ON airport_code = departure_airport
JOIN (
SELECT flight_id, COUNT(*) passengers
FROM booking_leg l
JOIN boarding_pass_part b USING (booking_leg_id)
WHERE boarding_time > '2020-07-15' AND boarding_time < '2020-07-31'
GROUP BY flight_id
) cnt
USING (flight_id)
GROUP BY 1,2
ORDER BY 3 DESC;
