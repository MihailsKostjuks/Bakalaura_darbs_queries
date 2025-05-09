-- Baseline (should be done within 1 session)
DROP FUNCTION IF EXISTS select_title;
DROP TYPE IF EXISTS title_info;
CREATE TYPE title_info AS
(
title_id int,
title character varying,
production_year int,
season_nr int,
episode_nr int,
series_years character varying
);

CREATE OR REPLACE FUNCTION select_title (
p_production_year int,
p_title character varying,
p_episode_nr int,
p_country_code text,
p_company_name text
)
RETURNS SETOF title_info
AS
$func$
BEGIN
RETURN QUERY
SELECT title.id, title, production_year, season_nr, episode_nr, series_years
FROM title
JOIN movie_companies ON title.id = movie_companies.movie_id
JOIN company_name ON company_name.id = movie_companies.company_id
WHERE (p_production_year IS NULL OR production_year = p_production_year)
AND (p_title IS NULL OR title ILIKE '%' || p_title || '%')
AND (p_episode_nr IS NULL OR episode_nr = p_episode_nr)
AND (p_country_code IS NULL OR country_code = p_country_code)
AND (p_company_name IS NULL OR name ILIKE '%' || p_company_name || '%');
END;
$func$ LANGUAGE plpgsql;

SELECT * FROM select_title(
2012,
'year',
1,
'[us]',
'a'
);

SELECT * FROM select_title(
2010,
NULL,
NULL,
NULL,
NULL
);

-- Solution

