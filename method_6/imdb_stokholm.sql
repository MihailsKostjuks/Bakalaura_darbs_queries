-- Baseline
SELECT primary_title , premiered
FROM titles
WHERE type LIKE 'movie'
AND premiered BETWEEN 2000 AND 2010
ORDER BY premiered ASC;

-- Solution
SELECT primary_title , premiered
FROM titles
WHERE type = 'movie'
AND premiered BETWEEN 2000 AND 2010
ORDER BY premiered ASC;