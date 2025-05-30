-- Baseline
SELECT COUNT(*) FROM passenger;

-- Solution
SET max_parallel_workers_per_gather TO 10;
SELECT COUNT(*) FROM passenger;