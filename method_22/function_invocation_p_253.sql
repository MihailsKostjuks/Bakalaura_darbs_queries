-- Baseline
CREATE OR REPLACE FUNCTION age_category (p_age int)
RETURNS TEXT language plpgsql AS
$body$
BEGIN
RETURN (CASE
WHEN p_age <= 2 THEN 'Infant'
WHEN p_age <= 12 THEN 'Child'
WHEN p_age < 65 THEN 'Adult'
ELSE 'Senior' END);
END; $body$;
SELECT passenger_id, age_category(age)
FROM passenger
LIMIT 5000000;

-- Solution
SELECT passenger_id,
CASE
WHEN age <= 2 THEN 'Infant'
WHEN age <= 12 THEN 'Child'
WHEN age < 65 THEN 'Adult'
ELSE 'Senior'
END FROM passenger LIMIT 5000000;
