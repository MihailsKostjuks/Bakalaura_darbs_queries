-- Baseline
SELECT * FROM account ORDER BY first_name, last_name;

-- Solution
SET work_mem TO '1 GB';
SELECT * FROM account ORDER BY first_name, last_name;
