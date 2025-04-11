-- create index company_name_name_pcode_nf on company_name(name_pcode_nf);
-- create index company_name_name_pcode_sf on company_name(name_pcode_sf);


-- explain analyze select * from company_name where coalesce(name_pcode_nf, name_pcode_sf) = 'A253'; -- 170ms

-- explain analyze select * from company_name where (name_pcode_nf = 'A253') or (name_pcode_nf IS NULL and name_pcode_sf = 'A253'); -- 40ms