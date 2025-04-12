CREATE VIEW us_title_stats AS 
SELECT title.production_year as prod_year, title.id as title_id, COUNT(DISTINCT title.id) as amount_of_titles
FROM title
JOIN movie_companies ON title.id = movie_companies.movie_id
JOIN company_name ON company_name.id = movie_companies.company_id
WHERE company_name.country_code = '[us]'
GROUP BY 1, 2;

SELECT * FROM us_title_stats
JOIN (SELECT id FROM title WHERE production_year BETWEEN 2005 AND 2010) t
ON t.id = us_title_stats.title_id; -- 1.9s


SELECT title.production_year as prod_year, title.id as title_id, COUNT(DISTINCT title.id) as amount_of_titles
FROM title
JOIN movie_companies ON title.id = movie_companies.movie_id
JOIN company_name ON company_name.id = movie_companies.company_id
WHERE company_name.country_code = '[us]'
AND title.production_year BETWEEN 2005 AND 2010
GROUP BY 1, 2; -- 1.4s