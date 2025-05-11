-- Baseline
SELECT COUNT(*) FROM name;

-- Solution
SET max_parallel_workers_per_gather TO 10;
SELECT COUNT(*) FROM name;
