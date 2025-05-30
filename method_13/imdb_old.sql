-- Baseline
DROP INDEX IF EXISTS company_name_en;
SELECT * FROM company_name WHERE country_code = '[en]';

-- Solution
CREATE INDEX IF NOT EXISTS company_name_en ON company_name(id) WHERE country_code = '[en]';
SELECT * FROM company_name WHERE country_code = '[en]';
