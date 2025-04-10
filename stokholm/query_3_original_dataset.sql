-- SELECT DISTINCT name
-- FROM ( SELECT primary_title , original_title ,
-- crew . title_id , person_id , category
-- FROM crew
-- INNER JOIN titles ON
-- titles . title_id = crew . title_id
-- WHERE primary_title
-- LIKE 'Spider-Man %'
-- OR original_title LIKE 'Spider-Man %') as a
-- INNER JOIN people ON
-- a . person_id = people . person_id
-- WHERE a . category = 'actor'
-- OR a . category = 'actress'; -- 0.77s

CREATE MATERIALIZED VIEW q3
AS
SELECT primary_title , original_title ,
crew . title_id , person_id , category
FROM crew
INNER JOIN titles ON
titles . title_id = crew . title_id
WHERE primary_title
LIKE 'Spider-Man %'
OR original_title LIKE 'Spider-Man %';
SELECT DISTINCT name FROM people
INNER JOIN q3 ON
q3 . person_id = people . person_id
WHERE q3 . category = 'actor'
OR q3 . category = 'actor'; -- 0.69s