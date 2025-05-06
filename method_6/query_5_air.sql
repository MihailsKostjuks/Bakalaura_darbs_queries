set search_path to postgres_air;

explain analyze select phone, phone_type, primary_phone from phone
where phone_type like 'mobile'
and length(phone) = 10
order by phone; -- 152ms

explain analyze select phone, phone_type, primary_phone from phone
where phone_type = 'mobile'
and length(phone) = 10
order by phone; -- 164ms