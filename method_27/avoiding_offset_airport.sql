-- set search_path to postgres_air;

explain analyze SELECT * FROM flight 
WHERE departure_airport = 'ATL' 
AND status = 'Delayed'
ORDER BY flight_id
LIMIT 50
OFFSET 1000; -- 12ms

explain analyze SELECT * FROM flight 
WHERE departure_airport = 'ATL' 
AND status = 'Delayed'
AND flight_id > 160384
ORDER BY flight_id
FETCH FIRST 50 ROWS ONLY; -- 4ms