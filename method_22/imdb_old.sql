-- Baseline
CREATE OR REPLACE FUNCTION company_from (p_country_code text)
RETURNS TEXT language plpgsql AS
$body$
BEGIN
RETURN (CASE
WHEN p_country_code = '[null]' THEN 'Unknown'
WHEN p_country_code = '[en]' THEN 'USA'
WHEN p_country_code = '[gb]' THEN 'Great Britain'
WHEN p_country_code = '[de]' THEN 'Germany'
WHEN p_country_code = '[sp]' THEN 'Spain'
WHEN p_country_code = '[it]' THEN 'Italy'
WHEN p_country_code = '[fr]' THEN 'France'
WHEN p_country_code = '[ca]' THEN 'Canada'
WHEN p_country_code = '[jp]' THEN 'Japan'
ELSE 'Other' END);
END; $body$;
SELECT id, name, company_from(country_code)
FROM company_name;

-- Solution
SELECT id, name, 
CASE
WHEN country_code = '[null]' THEN 'Unknown'
WHEN country_code = '[en]' THEN 'USA'
WHEN country_code = '[gb]' THEN 'Great Britain'
WHEN country_code = '[de]' THEN 'Germany'
WHEN country_code = '[sp]' THEN 'Spain'
WHEN country_code = '[it]' THEN 'Italy'
WHEN country_code = '[fr]' THEN 'France'
WHEN country_code = '[ca]' THEN 'Canada'
WHEN country_code = '[jp]' THEN 'Japan'
ELSE 'Other' END 
FROM company_name;
