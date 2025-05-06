SET work_mem TO default; -- 4 MB
explain analyze select * from company_name order by name, country_code; -- 1560ms.

SET work_mem to '1 GB';
explain analyze select * from company_name order by name, country_code; -- 1460ms.