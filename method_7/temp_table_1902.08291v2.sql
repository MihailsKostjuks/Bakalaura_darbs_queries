-- Baseline
SELECT  MIN(n.name) AS member_in_charnamed_movie, MIN(n.name) AS a1
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t
WHERE k.keyword ='character-name-in-title'
AND n.name LIKE 'X%'
AND n.id = ci.person_id
AND ci.movie_id = t.id
AND t.id = mk.movie_id
AND mk.keyword_id = k.id
AND t.id = mc.movie_id
AND mc.company_id = cn.id
AND ci.movie_id = mc.movie_id
AND ci.movie_id = mk.movie_id
AND mc.movie_id = mk.movie_id;

-- Solution (Both temp table creation and executable query should be considered in result)
CREATE TEMP TABLE temp1 AS
SELECT mk.movie_id
FROM keyword AS k,
movie_keyword AS mk
WHERE mk.keyword_id = k.id
AND k.keyword ='character-name-in-title';

SELECT MIN(n.name) AS member_in_charnamed_movie, MIN(n.name) AS a1
FROM cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n,
title AS t,
temp1
WHERE n.name LIKE 'X%'
AND n.id = ci.person_id
AND ci.movie_id = t.id
AND t.id = temp1.movie_id
AND t.id = mc.movie_id
AND mc.company_id = cn.id
AND ci.movie_id = mc.movie_id
AND ci.movie_id = temp1.movie_id
AND mc.movie_id = temp1.movie_id;

-- https://github.com/gregrahn/join-order-benchmark/blob/master/17c.sql
