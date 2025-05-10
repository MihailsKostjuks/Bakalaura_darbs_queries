-- Baseline
SELECT phone, phone_type, primary_phone FROM phone
WHERE phone_type LIKE 'mobile'
AND LENGTH(phone) = 10
ORDER BY phone;

-- Solution
SELECT phone, phone_type, primary_phone FROM phone
WHERE phone_type = 'mobile'
AND LENGTH(phone) = 10
ORDER BY phone;