
-- create index aka_title_production_year on aka_title(production_year);

select * from aka_title where production_year = 2011; -- 100ms

select * from aka_title where production_year::text = '2011'; -- 250ms
