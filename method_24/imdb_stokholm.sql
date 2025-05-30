-- Baseline
SELECT
region,
premiered,
COUNT(*) AS people_count
FROM titles t
JOIN crew c ON t.title_id = c.title_id
JOIN akas ON akas.title_id = t.title_id
WHERE category IN ('actor', 'actress', 'director')
GROUP BY region, premiered
ORDER BY people_count DESC;

-- Solution
CREATE TABLE IF NOT EXISTS crew_part
(
    title_id character varying,
    person_id character varying,
    category character varying,
    job character varying
)
PARTITION BY LIST (category);

CREATE TABLE IF NOT EXISTS crew_part_director
PARTITION OF crew_part
FOR VALUES IN ('director');

CREATE TABLE IF NOT EXISTS crew_part_actor
PARTITION OF crew_part
FOR VALUES IN ('actor');

CREATE TABLE IF NOT EXISTS crew_part_actress
PARTITION OF crew_part
FOR VALUES IN ('actress');

CREATE TABLE IF NOT EXISTS crew_part_producer
PARTITION OF crew_part
FOR VALUES IN ('producer');

CREATE TABLE IF NOT EXISTS crew_part_self
PARTITION OF crew_part
FOR VALUES IN ('self');

CREATE TABLE IF NOT EXISTS crew_part_editor
PARTITION OF crew_part
FOR VALUES IN ('editor');

CREATE TABLE IF NOT EXISTS crew_part_other
PARTITION OF crew_part
DEFAULT;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM crew_part LIMIT 1) THEN
        INSERT INTO crew_part SELECT * FROM crew;
    END IF;
END$$;

SELECT
region,
premiered,
COUNT(*) AS people_count
FROM titles t
JOIN crew_part c ON t.title_id = c.title_id
JOIN akas ON akas.title_id = t.title_id
WHERE category IN ('actor', 'actress', 'director')
GROUP BY region, premiered
ORDER BY people_count DESC;
