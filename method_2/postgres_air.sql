-- Baseline
SELECT * FROM flight
JOIN aircraft ON aircraft_code = code
JOIN airport ON departure_airport = airport_code
JOIN booking_leg USING (flight_id)
JOIN booking USING (booking_id)
JOIN passenger USING (booking_id)
JOIN account ON passenger.account_id = account.account_id
WHERE price BETWEEN 500 AND 1000
AND continent = 'EU'
AND LOWER(account.first_name) LIKE 'john%';

-- Solution
SET enable_hashjoin = OFF;
SELECT * FROM flight
JOIN aircraft ON aircraft_code = code
JOIN airport ON departure_airport = airport_code
JOIN booking_leg USING (flight_id)
JOIN booking USING (booking_id)
JOIN passenger USING (booking_id)
JOIN account ON passenger.account_id = account.account_id
WHERE price BETWEEN 500 AND 1000
AND continent = 'EU'
AND LOWER(account.first_name) LIKE 'john%';
