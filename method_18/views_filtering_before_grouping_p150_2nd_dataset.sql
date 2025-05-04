-- Baseline
DROP VIEW IF EXISTS us_title_stats;
CREATE VIEW us_title_stats AS 
SELECT title.production_year AS prod_year, 
title.id AS title_id, 
COUNT(DISTINCT title.id) AS amount_of_titles
FROM title
JOIN movie_companies ON title.id = movie_companies.movie_id
JOIN company_name ON company_name.id = movie_companies.company_id
WHERE company_name.country_code = '[us]'
GROUP BY 1, 2;
SELECT * FROM us_title_stats
JOIN (SELECT id FROM title WHERE production_year BETWEEN 2005 AND 2010) t
ON t.id = us_title_stats.title_id;

-- Solution
SELECT title.production_year AS prod_year, title.id AS title_id, COUNT(DISTINCT title.id) AS amount_of_titles
FROM title
JOIN movie_companies ON title.id = movie_companies.movie_id
JOIN company_name ON company_name.id = movie_companies.company_id
WHERE company_name.country_code = '[us]'
AND title.production_year BETWEEN 2005 AND 2010
GROUP BY 1, 2;