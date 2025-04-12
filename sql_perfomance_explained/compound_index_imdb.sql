-- create index aka_title_production_year on aka_title(production_year);
-- create index aka_title_note_text_pattern ON aka_title(note text_pattern_ops);

-- explain analyze select * from aka_title
-- where production_year between 1980 and 2000
-- and note like '(Argentina%'; -- 1.3ms

-- drop index aka_title_production_year;
-- drop index aka_title_note_text_pattern;
-- create index aka_title_production_year_note_text_pattern on aka_title(production_year, note text_pattern_ops);

explain analyze select * from aka_title
where production_year between 1980 and 2000
and note like '(Argentina%'; -- 2.3ms