-- Baseline
SELECT * FROM flight
JOIN aircraft ON aircraft_code = code
JOIN airport ON departure_airport = airport_code
JOIN booking_leg USING (flight_id)
JOIN booking USING (booking_id)
WHERE range BETWEEN 3000 AND 7000 
AND airport.continent = 'AS'
AND booking.price < 300
AND status = 'Delayed';

-- Solution
SET enable_seqscan = OFF;
SELECT * FROM flight
JOIN aircraft ON aircraft_code = code
JOIN airport ON departure_airport = airport_code
JOIN booking_leg USING (flight_id)
JOIN booking USING (booking_id)
WHERE range BETWEEN 3000 AND 7000 
AND airport.continent = 'AS'
AND booking.price < 300
AND status = 'Delayed';
