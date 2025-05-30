-- Baseline
DROP INDEX IF EXISTS aka_title_production_year_note_text_pattern;
CREATE INDEX IF NOT EXISTS aka_title_production_year ON aka_title(production_year);
CREATE INDEX IF NOT EXISTS aka_title_note_text_pattern ON aka_title(note text_pattern_ops);

SELECT * FROM aka_title
WHERE production_year BETWEEN 1980 AND 2000
AND note LIKE '(Argentina%';

-- Solution
DROP INDEX IF EXISTS aka_title_production_year;
DROP INDEX IF EXISTS aka_title_note_text_pattern;
CREATE INDEX IF NOT EXISTS aka_title_production_year_note_text_pattern on aka_title(production_year, note text_pattern_ops);

SELECT * FROM aka_title
WHERE production_year BETWEEN 1980 AND 2000
AND note LIKE '(Argentina%';
