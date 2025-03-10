-- CREATE INDEX account_last_name
--  ON account (last_name);

-- SELECT * FROM account WHERE lower(last_name)='daniels'; -- 0.35 s (does not take advantage of the index)

-- SELECT * FROM account 
-- WHERE last_name='daniels'
--  OR last_name='Daniels'
--  OR last_name ='DANIELS'; -- 0.08s (takes advantage of the index BUT NOT SUSTAINABLE, hard to cover all the cases)

-- CREATE INDEX account_last_name_lower
--  ON account (lower(last_name));

-- SELECT * FROM account WHERE lower(last_name)='daniels'; -- 0.08 s (best: functional index)