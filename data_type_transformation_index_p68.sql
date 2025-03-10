-- SET search_path TO postgres_air, public;

-- CREATE INDEX flight_scheduled_departure ON postgres_air.flight
-- (scheduled_departure);

EXPLAIN ANALYZE SELECT * FROM flight
WHERE scheduled_departure
 BETWEEN '2024-07-01' AND '2024-07-31'; -- 14ms

 
-- EXPLAIN ANALYZE SELECT * FROM flight
-- WHERE scheduled_departure ::date
--  BETWEEN '2024-07-01' AND '2024-07-31'; -- 150ms (PostgreSQL does not recognize the indexed column anymore because the transformation changes the data format)