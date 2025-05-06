-- Baseline
DROP VIEW IF EXISTS movie_company_infos;
CREATE VIEW movie_company_infos AS 
SELECT t.id as title_id, t.title, t.production_year, mi.info
FROM title AS t
JOIN movie_info AS mi ON t.id = mi.movie_id
JOIN movie_companies AS mc ON t.id = mc.movie_id
JOIN company_type AS ct ON mc.company_type_id = ct.id;
SELECT title_id, info FROM movie_company_infos
WHERE production_year = 2000
GROUP BY 1,2
ORDER BY title_id;

-- Solution
SELECT t.id, mi.info
FROM title AS t
JOIN movie_info AS mi ON t.id = mi.movie_id
WHERE production_year = 2000
GROUP BY 1,2
ORDER BY t.id;
