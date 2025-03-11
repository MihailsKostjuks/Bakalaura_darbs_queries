-- SET search_path TO postgres_air;


-- SELECT * FROM account
--  WHERE lower(last_name) like 'johns%'; -- 270ms (not using index):  B-tree indexes do not support searches with the “like” operator.

-- SELECT * FROM account
--  WHERE (lower(last_name) >='johns' and lower(last_name) < 'johnt'); -- 5ms (uses index)