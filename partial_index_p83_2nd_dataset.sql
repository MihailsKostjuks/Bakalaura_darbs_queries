-- explain analyze select * from company_name where country_code = '[en]'; -- 70ms

-- create index company_name_en on company_name(id) where country_code = '[en]';

-- explain analyze select * from company_name where country_code = '[en]'; -- 40ms (execution time difference in analyze is 1000 fold)
