-- SET search_path TO postgres_air;

-- CREATE INDEX flight_canceled ON flight(flight_id)
-- WHERE status='Canceled'; -- partial index (WHERE inside index)

-- EXPLAIN ANALYZE SELECT * FROM flight WHERE
--  scheduled_departure between '2020-08-15' AND '2024-08-18'
--  AND status='Canceled'; -- 0.1ms vs 700ms with / without index
