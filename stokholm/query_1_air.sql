set search_path to postgres_air;

explain analyze SELECT COUNT(DISTINCT phone_id) from phone 
where phone_type IN ('home', 'work'); -- 95ms

explain analyze SELECT COUNT(phone_id) from phone 
where phone_type = 'home' or phone_type = 'work'; -- 1.6 ms