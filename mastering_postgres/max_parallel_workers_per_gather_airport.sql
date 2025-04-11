-- 2 workers vs 5 workers
set search_path to postgres_air;
explain analyze select count(*) from passenger; -- 605ms

set max_parallel_workers_per_gather to 5;
explain analyze select count(*) from passenger; -- 550ms
