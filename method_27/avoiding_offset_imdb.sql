-- Baseline
SELECT * FROM title
WHERE season_nr = 1
AND production_year BETWEEN 2002 AND 2008
ORDER BY id 
LIMIT 100
OFFSET 5000;

-- Solution
SELECT * FROM title
WHERE season_nr = 1
AND production_year BETWEEN 2002 AND 2008
AND id > 54352
ORDER BY id 
LIMIT 100;
