-- Baseline
SELECT id FROM title
WHERE id NOT IN (SELECT movie_id FROM aka_title);

-- Solution
SELECT id FROM title
EXCEPT
SELECT movie_id FROM aka_title;
