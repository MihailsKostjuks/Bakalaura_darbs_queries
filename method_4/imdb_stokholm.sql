-- Baseline
SELECT type , COUNT(*)
FROM titles
GROUP BY (type)
ORDER BY (type) ASC;

-- Solution
SELECT type , COUNT(title_id)
FROM titles
GROUP BY (type)
ORDER BY (type) ASC;