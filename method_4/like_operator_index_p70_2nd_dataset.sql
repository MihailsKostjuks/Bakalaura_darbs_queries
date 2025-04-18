-- Baseline
SELECT * FROM title WHERE LOWER(title) LIKE 'the best%';
 
-- Solution 1
SELECT * FROM title WHERE (LOWER(title) >='the best' AND LOWER(title) < 'the besu');

-- Solution 2
CREATE INDEX IF NOT EXISTS title_title_lower_pattern ON title (LOWER(title) text_pattern_ops);
SELECT * FROM title WHERE LOWER(title) LIKE 'the best%';
 