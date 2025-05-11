-- Baseline
SELECT passenger_id FROM
booking bk
JOIN booking_leg bl USING (booking_id)
JOIN flight f USING (flight_id)
JOIN account a USING (account_id)
JOIN frequent_flyer USING (frequent_flyer_id)
JOIN passenger ps ON ps.booking_id=bk.booking_id
WHERE level = 4
AND leg_num = 3
AND is_returning IS true
AND departure_airport = 'ABV'
AND scheduled_departure BETWEEN '2020-07-01' AND '2020-07-08'
ORDER BY 1;

-- Solution (Both temp table creation and executable query should be considered in result)
CREATE TEMP TABLE temp_leg_flights AS
SELECT 
booking_id,
leg_num,
is_returning,
booking_leg.flight_id AS bl_flight_id,
flight.flight_id AS flight_flight_id,
departure_airport,
scheduled_departure,
arrival_airport
FROM booking_leg
JOIN flight USING (flight_id)
WHERE leg_num = 3
AND is_returning IS true
AND departure_airport = 'ABV'
AND scheduled_departure BETWEEN '2020-07-01' AND '2020-07-08';

SELECT ps.passenger_id
FROM booking
JOIN temp_leg_flights USING (booking_id)
JOIN account USING (account_id)
JOIN frequent_flyer USING (frequent_flyer_id)
JOIN passenger ps ON ps.booking_id = booking.booking_id
WHERE level = 4
ORDER BY 1;