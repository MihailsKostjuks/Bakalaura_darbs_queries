-- SET search_path TO postgres_air;


-- SELECT * FROM account
--  WHERE lower(last_name) like 'johns%'; -- 270ms (not using index):  B-tree indexes do not support searches with the “like” operator.

-- SELECT * FROM account
--  WHERE (lower(last_name) >='johns' and lower(last_name) < 'johnt'); -- 5ms (uses index)

-- CREATE INDEX account_last_name_lower_pattern
--  ON account (lower(last_name) text_pattern_ops); -- a pattern search index

SELECT * FROM account
 WHERE lower(last_name) like 'johns%'; -- 5ms (uses index) (takes advantage of pattern search index)