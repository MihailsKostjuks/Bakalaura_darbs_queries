-- Baseline
CREATE INDEX account_last_name ON account (last_name);
SELECT * FROM account WHERE lower(last_name)='daniels';

 -- Solution 1
SELECT * FROM account 
WHERE last_name='daniels'
OR last_name='Daniels'
OR last_name ='DANIELS';

-- Solution 2
CREATE INDEX account_last_name_lower ON account (lower(last_name));
SELECT * FROM account WHERE lower(last_name)='daniels';