CREATE MATERIALIZED VIEW max_title_rating_2012 AS
SELECT t.title AS movie_title, MAX(mi_idx.info) AS max_rating, t.id AS title_id, t.production_year
FROM info_type it
JOIN movie_info_idx mi_idx ON it.id = mi_idx.info_type_id
JOIN title t ON t.id = mi_idx.movie_id
WHERE it.info = 'rating'
AND t.production_year = 2012
GROUP BY movie_title, t.id;

EXPLAIN ANALYZE SELECT * FROM max_title_rating_2012; -- 1.5ms

EXPLAIN ANALYZE SELECT t.title AS movie_title, MAX(mi_idx.info) AS max_rating, t.id AS title_id, t.production_year
FROM info_type it
JOIN movie_info_idx mi_idx ON it.id = mi_idx.info_type_id
JOIN title t ON t.id = mi_idx.movie_id
WHERE it.info = 'rating'
AND t.production_year = 2012
GROUP BY movie_title, t.id; -- 680ms