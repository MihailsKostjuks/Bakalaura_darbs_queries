-- set search_path to postgres_air;

-- CREATE OR REPLACE FUNCTION age_category (p_age int)
-- RETURNS TEXT language plpgsql AS
-- $body$
-- BEGIN
--  RETURN (case
--  WHEN p_age <= 2 then 'Infant'
--  WHEN p_age <=12 then 'Child'
--  WHEN p_age < 65 then 'Adult'
--  ELSE 'Senior' END);
-- END; $body$;


--  SELECT passenger_id, age_category(age) FROM passenger
-- LIMIT 5000000; -- 4.6s


-- SELECT passenger_id,
--  CASE
--  WHEN age <= 2 then 'Infant'
--  WHEN age <=12 then 'Child'
--  WHEN age < 65 then 'Adult'
--  ELSE 'Senior'
--  END from passenger LIMIT 5000000; -- 2s


 