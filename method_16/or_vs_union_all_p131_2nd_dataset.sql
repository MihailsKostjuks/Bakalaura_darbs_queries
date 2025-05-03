-- Baseline
SELECT 
CASE WHEN c.country_code = '[es]' THEN 'Old TV movies made by Spanish companies'
ELSE 'Modern TV movies made by Italian companies' END AS description, t.title, t.production_year
FROM title t
JOIN movie_companies mc ON t.id = mc.movie_id
JOIN company_name c ON mc.company_id = c.id
WHERE mc.note LIKE '%TV%'
AND (
(c.country_code = '[es]' AND t.production_year < 2000)
OR 
(c.country_code = '[it]' AND t.production_year > 2010)
);

-- Solution
SELECT 
'Old TV movies made by Spanish companies' AS description,
t.title,
t.production_year
FROM title t
JOIN movie_companies mc ON t.id = mc.movie_id
JOIN company_name c ON mc.company_id = c.id
WHERE mc.note LIKE '%TV%'
AND c.country_code = '[es]' 
AND t.production_year < 2000
UNION ALL
SELECT 
'Modern TV movies made by Italian companies' AS description, t.title, t.production_year
FROM title t
JOIN movie_companies mc ON t.id = mc.movie_id
JOIN company_name c ON mc.company_id = c.id
WHERE mc.note LIKE '%TV%'
AND c.country_code = '[it]' 
AND t.production_year > 2010;
