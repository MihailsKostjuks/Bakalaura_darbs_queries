-- CREATE INDEX title_title ON title (title);

-- SELECT * FROM title WHERE lower(title)='pilot'; -- 1.1s

-- SELECT * FROM title 
-- WHERE title='Pilot'
--  OR title='PILOT'
--  OR title ='pilot'; -- 0.1s

-- CREATE INDEX title_title_lower
--  ON title (lower(title));

SELECT * FROM title WHERE lower(title)='pilot'; -- 0.1s
