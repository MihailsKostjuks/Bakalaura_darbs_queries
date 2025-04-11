-- SET search_path TO postgres_air;

-- CREATE INDEX flight_actual_departure ON flight (actual_departure);

-- CREATE INDEX flight_scheduled_departure ON flight (scheduled_departure);



-- EXPLAIN ANALYZE SELECT * FROM flight
-- WHERE coalesce(actual_departure, scheduled_departure)
--  BETWEEN '2024-07-01' AND '2024-07-31'; -- 100ms (PostgreSQL does not recognize an indexed column inside a function, so it falls back to a sequential scan)


-- EXPLAIN ANALYZE SELECT * FROM flight
-- WHERE (actual_departure
--  BETWEEN '2024-07-01' AND '2024-07-31')
--  OR (actual_departure IS NULL
--  AND scheduled_departure BETWEEN '2024-07-01' AND '2024-07-31'); -- 25ms (rewriting without coalesce function makes query use both indexes)
