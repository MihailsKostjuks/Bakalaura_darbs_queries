-- SELECT * FROM title WHERE lower(title) like 'the best%'; -- 1.1s (not using index)

-- SELECT * FROM title
--  WHERE (lower(title) >='the best' and lower(title) < 'the besu'); -- 100ms (uses index)

-- CREATE INDEX title_title_lower_pattern
--  ON title (lower(title) text_pattern_ops); -- a pattern search index

-- SELECT * FROM title WHERE lower(title) like 'the best%'; -- 100ms (uses pattern search index)
 