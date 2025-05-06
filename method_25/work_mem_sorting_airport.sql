set search_path to postgres_air;
SET work_mem TO default; -- 4 MB
explain analyze select * from account order by first_name, last_name; -- 1550ms.

SET work_mem TO '1 GB';
explain analyze select * from account order by first_name, last_name; -- 1490ms.

