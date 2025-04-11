-- SELECT id FROM title
-- EXCEPT
-- SELECT movie_id FROM aka_title; -- 2s

-- SELECT id FROM title WHERE id NOT IN
--  (SELECT movie_id FROM aka_title); -- over 1 min