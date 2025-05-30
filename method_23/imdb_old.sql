-- Baseline (should be done within 1 session)
DROP FUNCTION IF EXISTS select_title;
DROP FUNCTION IF EXISTS select_title_dyn;
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
SELECT DISTINCT title.id, title, production_year, season_nr, episode_nr, series_years
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
CREATE OR REPLACE FUNCTION select_title_dyn (
p_production_year int,
p_title character varying,
p_episode_nr int,
p_country_code text,
p_company_name text
)
RETURNS SETOF title_info
AS
$func$
DECLARE
v_sql text := 'SELECT DISTINCT t.id, t.title, t.production_year, t.season_nr, t.episode_nr, t.series_years FROM title t';
v_where_title text;
v_where_movie_companies text;
v_where_company_name text;
BEGIN
IF p_production_year IS NOT NULL
THEN v_where_title := 'production_year = ' || p_production_year::text;
END IF;
IF p_title IS NOT NULL
THEN v_where_title := concat_ws(' AND ', v_where_title, 'title ILIKE ' || quote_literal('%' || p_title || '%'));
END IF;
IF p_episode_nr IS NOT NULL
THEN v_where_title := concat_ws(' AND ', v_where_title, 'episode_nr = ' || p_episode_nr::text);
END IF;
IF p_country_code IS NOT NULL
THEN v_where_movie_companies := 'country_code = ' || quote_literal(p_country_code);
END IF;
IF p_company_name IS NOT NULL
THEN v_where_company_name := 'name ILIKE ' || quote_literal('%' || p_company_name || '%');
END IF;
IF v_where_movie_companies IS NOT NULL OR v_where_company_name IS NOT NULL
THEN v_sql := v_sql || ' JOIN movie_companies mc ON t.id = mc.movie_id';
END IF;
IF v_where_company_name IS NOT NULL
THEN v_sql := v_sql || ' JOIN company_name cn ON cn.id = mc.company_id';
END IF;
v_sql := v_sql || ' WHERE ' || concat_ws(' AND ', v_where_title, v_where_movie_companies, v_where_company_name);
RETURN QUERY EXECUTE v_sql;
END;
$func$ LANGUAGE plpgsql;

SELECT * FROM select_title_dyn(
2012,
'year',
1,
'[us]',
'a'
);
SELECT * FROM select_title_dyn(
2010,
NULL,
NULL,
NULL,
NULL
);