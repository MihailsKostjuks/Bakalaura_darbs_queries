-- Baseline
CREATE OR REPLACE FUNCTION num_passengers(p_flight_id int) RETURNS integer
AS
$$BEGIN
RETURN (
SELECT COUNT(*) FROM booking_leg bl
JOIN booking b USING (booking_id)
JOIN passenger p USING (booking_id)
WHERE flight_id=p_flight_id);
END;
$$ LANGUAGE plpgsql;
SELECT flight_id, num_passengers(flight_id) AS num_pass
FROM flight f
WHERE departure_airport='ORD'
AND scheduled_departure BETWEEN '2020-07-05' AND '2020-07-13';

-- Solution
SELECT f.flight_id, COUNT(*) AS num_pass
FROM booking_leg bl
JOIN booking b USING (booking_id)
JOIN passenger p USING (booking_id)
JOIN flight f USING (flight_id)
WHERE departure_airport='ORD'
AND scheduled_departure BETWEEN '2020-07-05' AND '2020-07-13'
GROUP BY 1;
