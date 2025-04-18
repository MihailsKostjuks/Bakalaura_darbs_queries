-- Baseline
SELECT * FROM account WHERE LOWER(last_name) LIKE 'johns%';
 
-- Solution 1
SELECT * FROM account WHERE (LOWER(last_name) >='johns' AND LOWER(last_name) < 'johnt');

-- Solution 2
CREATE INDEX IF NOT EXISTS account_last_name_lower_pattern ON account (LOWER(last_name) text_pattern_ops);
SELECT * FROM account WHERE LOWER(last_name) LIKE 'johns%';