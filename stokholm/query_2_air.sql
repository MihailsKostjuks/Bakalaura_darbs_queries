set search_path to postgres_air;

explain analyze select level, count(*) from frequent_flyer
group by level
order by level ASC; -- 29ms 

explain analyze select level, count(frequent_flyer_id) from frequent_flyer
group by level
order by level ASC; -- 30ms 
