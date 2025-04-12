-- SELECT t.title AS movie_title, MAX(mi_idx.info) AS max_rating, t.id AS title_id
-- FROM info_type it
-- JOIN movie_info_idx mi_idx ON it.id = mi_idx.info_type_id
-- JOIN title t ON t.id = mi_idx.movie_id
-- WHERE it.info = 'rating'
-- AND t.id = 1088622
-- GROUP BY movie_title, t.id; -- 0.15ms

-- SELECT * FROM (
-- SELECT t.title AS movie_title, MAX(mi_idx.info) AS max_rating, t.id AS title_id
-- FROM info_type it
-- JOIN movie_info_idx mi_idx ON it.id = mi_idx.info_type_id
-- JOIN title t ON t.id = mi_idx.movie_id
-- WHERE it.info = 'rating'
-- GROUP BY movie_title, t.id
-- ) ratings
-- WHERE title_id = 1088622; -- 0.15ms

-- CREATE TEMP TABLE ratings AS 
-- SELECT t.title AS movie_title, MAX(mi_idx.info) AS max_rating, t.id AS title_id
-- FROM info_type it
-- JOIN movie_info_idx mi_idx ON it.id = mi_idx.info_type_id
-- JOIN title t ON t.id = mi_idx.movie_id
-- WHERE it.info = 'rating'
-- GROUP BY movie_title, t.id;

EXPLAIN ANALYZE SELECT * FROM ratings WHERE title_id = 1088622; -- 50ms




