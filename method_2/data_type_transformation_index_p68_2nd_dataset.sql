CREATE INDEX IF NOT EXISTS aka_title_production_year ON aka_title(production_year);

-- Baseline
SELECT * FROM aka_title WHERE production_year::text = '2011';

-- Solution
SELECT * FROM aka_title WHERE production_year = 2011;


