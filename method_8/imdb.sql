-- Baseline
CREATE INDEX title_title ON title (title);
SELECT * FROM title WHERE lower(title)='pilot';

-- Solution 1
SELECT * FROM title 
WHERE title='Pilot'
OR title='PILOT'
OR title ='pilot';

-- Solution 2
CREATE INDEX title_title_lower ON title (lower(title));
SELECT * FROM title WHERE lower(title)='pilot';
