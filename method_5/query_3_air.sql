-- Baseline
SELECT DISTINCT ff.first_name, ff.last_name, booking_with_account.price
FROM (
SELECT b.booking_id, b.account_id, b.price, a.frequent_flyer_id
FROM booking b
INNER JOIN account a ON b.account_id = a.account_id
WHERE b.price > 300
) AS booking_with_account
INNER JOIN frequent_flyer ff ON booking_with_account.frequent_flyer_id = ff.frequent_flyer_id
WHERE ff.first_name LIKE 'J%';

-- Solution
DROP MATERIALIZED VIEW IF EXISTS booking_with_account_mv;

CREATE MATERIALIZED VIEW booking_with_account_mv
AS 
SELECT b.booking_id, b.account_id, b.price, a.frequent_flyer_id
FROM booking b
INNER JOIN account a ON b.account_id = a.account_id
WHERE b.price > 300;

SELECT DISTINCT ff.first_name, ff.last_name, booking_with_account_mv.price
FROM booking_with_account_mv
INNER JOIN frequent_flyer ff ON booking_with_account_mv.frequent_flyer_id = ff.frequent_flyer_id
WHERE ff.first_name LIKE 'J%';
