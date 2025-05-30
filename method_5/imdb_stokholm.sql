-- Baseline
SELECT DISTINCT name
FROM (
SELECT primary_title, original_title, crew.title_id, person_id, category
FROM crew
INNER JOIN titles ON titles.title_id = crew.title_id
WHERE primary_title LIKE 'Spider-Man %'
OR original_title LIKE 'Spider-Man %'
) AS a
INNER JOIN people ON a.person_id = people.person_id
WHERE a.category = 'actor'
OR a.category = 'actress';

-- Solution (both view and query considered in execution time)
DROP MATERIALIZED VIEW IF EXISTS q3;

CREATE MATERIALIZED VIEW q3
AS
SELECT primary_title, original_title, crew.title_id, person_id, category
FROM crew
INNER JOIN titles ON titles.title_id = crew.title_id
WHERE primary_title LIKE 'Spider-Man %'
OR original_title LIKE 'Spider-Man %';

SELECT DISTINCT name FROM people
INNER JOIN q3 ON q3.person_id = people.person_id
WHERE q3.category = 'actor'
OR q3.category = 'actress';