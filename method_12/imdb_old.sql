-- Baseline
SELECT *
FROM title
JOIN movie_companies ON title.id = movie_companies.movie_id
JOIN company_name ON company_name.id = movie_companies.company_id
WHERE company_name.country_code = '[us]';

-- Solution
CREATE INDEX IF NOT EXISTS title_production_year ON title(production_year);
SELECT *
FROM title
JOIN movie_companies ON title.id = movie_companies.movie_id
JOIN company_name ON company_name.id = movie_companies.company_id
WHERE company_name.country_code = '[us]'
AND title.production_year = 2010;