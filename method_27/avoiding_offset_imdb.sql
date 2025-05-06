explain analyze select * from title
where season_nr = 1
and production_year between 2002 and 2008
order by id 
limit 100 offset 5000; -- 228 ms

explain analyze select * from title
where season_nr = 1
and production_year between 2002 and 2008
and id > 54352
order by id 
FETCH FIRST 100 ROWS ONLY; -- 205 ms