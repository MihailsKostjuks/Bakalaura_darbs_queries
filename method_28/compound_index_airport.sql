set search_path to postgres_air;

-- create index flight_status on flight (status);
-- create index flight_actual_departure on flight(actual_departure);

explain analyze select * from flight 
where status = 'Delayed'
and actual_departure between '2020-05-10' and '2020-10-15'; -- 27ms

-- drop index flight_status;
-- drop index flight_actual_departure;

-- create index flight_status_actual_departure on flight (status, actual_departure);

explain analyze select * from flight 
where status = 'Delayed'
and actual_departure between '2020-05-10' and '2020-10-15'; -- 22ms

-- drop index flight_status_actual_departure;


