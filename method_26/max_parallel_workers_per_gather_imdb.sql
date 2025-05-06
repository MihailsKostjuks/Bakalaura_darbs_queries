-- set max_parallel_workers_per_gather to DEFAULT;

explain analyze select count(*) from name; -- 193 ms

-- set max_parallel_workers_per_gather to 5;

explain analyze select count(*) from name; -- 245 ms
