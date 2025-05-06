-- Baseline
SELECT COUNT (DISTINCT title_id) FROM titles
WHERE type IN ('movie', 'video');

-- Solution
SELECT COUNT (title_id) FROM titles
WHERE type IN ('movie', 'video');