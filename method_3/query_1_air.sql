-- Baseline
SELECT COUNT (DISTINCT phone_id) FROM phone 
WHERE phone_type IN ('home', 'work');

-- Solution
SELECT COUNT (phone_id) FROM phone 
WHERE phone_type IN ('home', 'work');