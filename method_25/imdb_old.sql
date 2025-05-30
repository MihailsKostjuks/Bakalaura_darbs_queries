-- Baseline
SELECT * FROM company_name ORDER BY name, country_code;

-- Solution
SET work_mem TO '1 GB';
SELECT * FROM company_name ORDER BY name, country_code;
