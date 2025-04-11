-- need to understand whether we index movie_id or not

-- SELECT id
-- FROM title
-- JOIN (
--     SELECT DISTINCT movie_id FROM aka_title
-- ) AS at ON title.id = at.movie_id; -- 0.6s

-- SELECT id FROM title
-- INTERSECT
-- SELECT movie_id FROM aka_title; -- 0.8s

-- SELECT id FROM title where id in
-- (SELECT movie_id FROM aka_title); -- 0.4s










