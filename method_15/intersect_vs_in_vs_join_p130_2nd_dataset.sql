-- Baseline
SELECT id FROM title
WHERE id IN (SELECT movie_id FROM aka_title);

-- Solution
SELECT id FROM title
INTERSECT
SELECT movie_id FROM aka_title;









