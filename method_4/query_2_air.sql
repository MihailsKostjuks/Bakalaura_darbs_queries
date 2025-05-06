-- Baseline
SELECT level, COUNT(*) FROM frequent_flyer
GROUP BY level
ORDER BY level ASC;

-- Solution
SELECT level, COUNT(frequent_flyer_id) FROM frequent_flyer
GROUP BY level
ORDER BY level ASC;
