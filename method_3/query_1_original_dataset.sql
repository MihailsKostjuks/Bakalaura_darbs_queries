-- SELECT COUNT ( DISTINCT title_id )
-- FROM titles
-- WHERE type IN ('movie', 'video'); -- 1.1s

-- 1. not using distinct (unnecessary)
-- 2. using OR instead of IN
-- SELECT COUNT ( title_id )
-- FROM titles
-- WHERE type = 'movie' OR type = 'video'; -- 0.25s